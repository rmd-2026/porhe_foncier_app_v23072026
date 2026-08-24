import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/features/suivi_visuel_management/data/suivi_visuel_repository.dart';
import 'package:porhe_foncier_app_23072026/features/suivi_visuel_management/presentation/suivi_visuel_providers.dart';

const List<String> _typesMedia = ['PHOTO', 'VIDEO'];

/// Cadence check happens BEFORE this dialog even opens (see
/// SuiviVisuelGalleryScreen) — by the time we're here, peutTelverser
/// has already been confirmed true. This dialog itself never needs to
/// re-check the quota, only perform the upload.
class AjouterSuiviVisuelDialog extends ConsumerStatefulWidget {
  const AjouterSuiviVisuelDialog({super.key, required this.parcelleId});
  final int parcelleId;

  @override
  ConsumerState<AjouterSuiviVisuelDialog> createState() => _AjouterSuiviVisuelDialogState();
}

class _AjouterSuiviVisuelDialogState extends ConsumerState<AjouterSuiviVisuelDialog> {
  String _typeMedia = 'PHOTO';
  PlatformFile? _fichierChoisi;
  bool _uploading = false;
  String? _errorText;

  Future<void> _choisirFichier() async {
    final extensions = _typeMedia == 'PHOTO'
        ? ['jpg', 'jpeg', 'png']
        : ['mp4', 'mov'];
    final fichiers = await FilePicker.pickFiles(type: FileType.custom, allowedExtensions: extensions);
    if (fichiers.isEmpty) return;
    setState(() {
      _fichierChoisi = fichiers.first;
      _errorText = null;
    });
  }

  Future<void> _soumettre() async {
    if (_fichierChoisi == null) {
      setState(() => _errorText = 'Sélectionnez un fichier.');
      return;
    }

    setState(() {
      _uploading = true;
      _errorText = null;
    });

    bool succes = false;
    String? messageErreur;

    try {
      final bytes = await _fichierChoisi!.readAsBytes();
      final result = await ref.read(suiviVisuelRepositoryProvider).ajouter(
            parcelleId: widget.parcelleId,
            typeMedia: _typeMedia,
            nomFichier: '${widget.parcelleId}_${DateTime.now().millisecondsSinceEpoch}_${_fichierChoisi!.name}',
            bytes: bytes,
          );
      result.match(
        (f) => messageErreur = f.message,
        (_) => succes = true,
      );
    } catch (e) {
      messageErreur = 'Erreur inattendue : $e';
    } finally {
      if (mounted) setState(() => _uploading = false);
    }

    if (!mounted) return;
    if (succes) {
      Navigator.of(context).pop(true);
    } else {
      setState(() => _errorText = messageErreur ?? 'Erreur inconnue.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Ajouter un suivi visuel'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputDecorator(
              decoration: const InputDecoration(labelText: 'Type de média'),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _typeMedia,
                  items: _typesMedia
                      .map((t) => DropdownMenuItem(
                            value: t,
                            child: Text(t == 'PHOTO' ? 'Photo' : 'Vidéo'),
                          ))
                      .toList(),
                  onChanged: _uploading
                      ? null
                      : (v) => setState(() {
                            _typeMedia = v!;
                            _fichierChoisi = null;
                          }),
                ),
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: _uploading ? null : _choisirFichier,
              icon: const Icon(Icons.attach_file),
              label: Text(_fichierChoisi == null ? 'Choisir un fichier' : 'Changer de fichier'),
            ),
            if (_fichierChoisi != null) ...[
              const SizedBox(height: 8),
              Text(_fichierChoisi!.name,
                  style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 13),
                  overflow: TextOverflow.ellipsis),
            ],
            if (_errorText != null) ...[
              const SizedBox(height: 12),
              Text(_errorText!, style: const TextStyle(color: Colors.red, fontSize: 13)),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _uploading ? null : () => Navigator.of(context).pop(false),
          child: const Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: _uploading ? null : _soumettre,
          child: _uploading
              ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2))
              : const Text('Téléverser'),
        ),
      ],
    );
  }
}
