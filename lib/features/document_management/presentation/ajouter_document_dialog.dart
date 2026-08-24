import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/features/document_management/data/document_repository.dart';
import 'package:porhe_foncier_app_23072026/features/document_management/presentation/document_providers.dart';
/// Returns true if a document was successfully added, so the caller
/// knows to refresh its list. The user never types a filename or URL —
/// both are derived entirely from the file they pick.
///
/// Uses file_picker v12's API: FilePicker.pickFiles() returns
/// List<PlatformFile> directly (no FilePickerResult wrapper), and
/// bytes are read on demand via PlatformFile.readAsBytes() rather than
/// relying on the deprecated withData flag.
class AjouterDocumentDialog extends ConsumerStatefulWidget {
  const AjouterDocumentDialog({super.key, required this.parcelleId});
  final int parcelleId;

  @override
  ConsumerState<AjouterDocumentDialog> createState() => _AjouterDocumentDialogState();
}

class _AjouterDocumentDialogState extends ConsumerState<AjouterDocumentDialog> {
  String? _typeDocument;
  PlatformFile? _fichierChoisi;
  bool _uploading = false;
  String? _errorText;

  Future<void> _choisirFichier() async {
    final fichiers = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png', 'doc', 'docx'],
    );
    if (fichiers.isEmpty) return;
    setState(() {
      _fichierChoisi = fichiers.first;
      _errorText = null;
    });
  }

  Future<void> _soumettre() async {
    if (_typeDocument == null) {
      setState(() => _errorText = 'Sélectionnez un type de document.');
      return;
    }
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

      final repository = ref.read(documentRepositoryProvider);
      final result = await repository.ajouter(
        parcelleId: widget.parcelleId,
        typeDocument: _typeDocument!,
        nomFichierOriginal: _fichierChoisi!.name,
        bytes: bytes,
      );

      result.match(
            (failure) => messageErreur = failure.message,
            (_) => succes = true,
      );
    } catch (e) {
      messageErreur = 'Erreur inattendue : $e';
    } finally {
      // Guaranteed to run no matter what threw above — the spinner can
      // never get stuck regardless of which step failed.
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
      title: const Text('Ajouter un document'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputDecorator(
              decoration: const InputDecoration(labelText: 'Type de document'),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _typeDocument,
                  hint: const Text('Sélectionner'),
                  items: typesDocument
                      .map((t) => DropdownMenuItem(value: t, child: Text(libelleTypeDocument(t))))
                      .toList(),
                  onChanged: _uploading ? null : (v) => setState(() => _typeDocument = v),
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
              Text(
                _fichierChoisi!.name,
                style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 13),
                overflow: TextOverflow.ellipsis,
              ),
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
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Téléverser'),
        ),
      ],
    );
  }
}
