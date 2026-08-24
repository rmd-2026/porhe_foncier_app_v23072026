import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:porhe_foncier_app_23072026/features/suivi_visuel_management/data/suivi_visuel_repository.dart';
import 'package:porhe_foncier_app_23072026/features/suivi_visuel_management/presentation/ajouter_suivi_visuel_dialog.dart';
import 'package:porhe_foncier_app_23072026/features/suivi_visuel_management/presentation/suivi_visuel_providers.dart';

/// Chronological gallery scoped to a parcelle, gated by the owner's
/// subscription tier per CadencePolicy (BASIQUE 1/30j, STANDARD
/// 4/30j, PREMIUM illimité). The quota is checked BEFORE the upload
/// dialog opens, so the block is visible as a disabled button +
/// explanatory banner rather than discovered only after attempting
/// an upload.
class SuiviVisuelGalleryScreen extends ConsumerStatefulWidget {
  const SuiviVisuelGalleryScreen({
    super.key,
    required this.parcelleId,
    required this.utilisateurId,
  });
  final int parcelleId;
  final int utilisateurId;

  @override
  ConsumerState<SuiviVisuelGalleryScreen> createState() => _SuiviVisuelGalleryScreenState();
}

class _SuiviVisuelGalleryScreenState extends ConsumerState<SuiviVisuelGalleryScreen> {
  bool _loading = true;
  String? _errorText;
  List<SuiviVisuelSummary> _media = [];
  ContexteAcces? _contexte;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _charger();
  }

  Future<void> _charger() async {
    setState(() {
      _loading = true;
      _errorText = null;
    });

    final repository = ref.read(suiviVisuelRepositoryProvider);
    final mediaResult = await repository.listerComplet(widget.parcelleId);
    final contexteResult = await repository.obtenirContexteAcces(
      parcelleId: widget.parcelleId,
      utilisateurId: widget.utilisateurId,
    );

    mediaResult.match(
      (f) => setState(() => _errorText = f.message),
      (liste) => setState(() => _media = liste),
    );
    contexteResult.match(
      (f) => setState(() => _errorText ??= f.message),
      (c) => setState(() => _contexte = c),
    );

    setState(() => _loading = false);
  }

  Future<void> _ajouter() async {
    final added = await showDialog<bool>(
      context: context,
      builder: (_) => AjouterSuiviVisuelDialog(parcelleId: widget.parcelleId),
    );
    if (added == true) _charger();
  }

  Future<void> _ouvrir(SuiviVisuelSummary media) async {
    final uri = Uri.tryParse(media.urlStockage);
    if (uri == null || !await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Impossible d\'ouvrir ce média.')));
      }
    }
  }

  /// Now requires a motif — captured for the JournalAudit entry only
  /// (SuiviVisuel has no motif column of its own; the reason survives
  /// solely in the audit trail after the row is deleted).
  Future<void> _supprimer(SuiviVisuelSummary media) async {
    final motifController = TextEditingController();

    final motif = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Supprimer ce média ?'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cette action est irréversible.',
              style: TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: motifController,
              decoration: const InputDecoration(
                labelText: 'Motif de suppression',
                hintText: 'Obligatoire',
              ),
              maxLines: 2,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              if (motifController.text.trim().isEmpty) return;
              Navigator.of(dialogContext).pop(motifController.text.trim());
            },
            child: const Text('Supprimer', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (motif == null || motif.isEmpty) return;

    setState(() => _saving = true);
    final result = await ref.read(suiviVisuelRepositoryProvider).supprimer(
          id: media.id,
          parcelleId: widget.parcelleId,
          urlStockage: media.urlStockage,
          motif: motif,
        );
    result.match(
      (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(f.message))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Média supprimé.')));
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Widget _banniereQuota() {
    final c = _contexte;
    if (c == null) return const SizedBox.shrink();

    final niveauLabel = c.niveau == null
        ? 'Aucun abonnement actif'
        : c.niveau == 'BASIQUE'
            ? 'Basique'
            : c.niveau == 'STANDARD'
                ? 'Standard'
                : 'Premium';

    final texte = c.limite == null
        ? '$niveauLabel — téléversements illimités'
        : '$niveauLabel — ${c.uploadsRestants} téléversement(s) restant(s) sur ${c.limite} '
            '(fenêtre de 30 jours)';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: c.peutTelverser ? Colors.blue.withOpacity(0.08) : Colors.red.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(texte, style: const TextStyle(fontSize: 13)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final peutTelverser = _contexte?.peutTelverser ?? false;

    return Scaffold(
      appBar: AppBar(
        title: Text('Suivi visuel — Parcelle #${widget.parcelleId}'),
        actions: [IconButton(icon: const Icon(Icons.refresh), onPressed: _loading ? null : _charger)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (_saving || _loading || !peutTelverser) ? null : _ajouter,
        backgroundColor: peutTelverser ? null : Colors.grey,
        child: const Icon(Icons.add_a_photo),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _errorText != null
              ? Center(child: Text(_errorText!, style: const TextStyle(color: Colors.red)))
              : Column(
                  children: [
                    _banniereQuota(),
                    Expanded(
                      child: _media.isEmpty
                          ? const Center(child: Text('Aucun suivi visuel pour cette parcelle.'))
                          : RefreshIndicator(
                              onRefresh: _charger,
                              child: GridView.builder(
                                padding: const EdgeInsets.all(12),
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                ),
                                itemCount: _media.length,
                                itemBuilder: (context, index) {
                                  final m = _media[index];
                                  return GestureDetector(
                                    onTap: () => _ouvrir(m),
                                    onLongPress: () => _supprimer(m),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            m.typeMedia == 'VIDEO' ? Icons.videocam : Icons.image,
                                            size: 40,
                                            color: Colors.blueGrey,
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            m.createdAt.split('T').first,
                                            style: const TextStyle(fontSize: 11),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                    ),
                  ],
                ),
    );
  }
}
