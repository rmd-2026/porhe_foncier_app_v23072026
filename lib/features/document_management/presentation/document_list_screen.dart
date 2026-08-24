import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:porhe_foncier_app_23072026/features/document_management/data/document_repository.dart';
import 'package:porhe_foncier_app_23072026/features/document_management/presentation/ajouter_document_dialog.dart';
import 'package:porhe_foncier_app_23072026/features/document_management/presentation/document_providers.dart';

/// Documents are always viewed scoped to a single parcelle — there is
/// no listerTousDocuments-driven "all documents" screen here, mirroring
/// how documents only make sense in the context of the parcelle they
/// belong to (matches the schema: DocumentParcelle.parcelleId is
/// required, non-nullable).
class DocumentListScreen extends ConsumerStatefulWidget {
  const DocumentListScreen({super.key, required this.parcelleId});
  final int parcelleId;

  @override
  ConsumerState<DocumentListScreen> createState() => _DocumentListScreenState();
}

class _DocumentListScreenState extends ConsumerState<DocumentListScreen> {
  bool _loading = true;
  String? _errorText;
  List<DocumentSummary> _documents = [];

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

    final repository = ref.read(documentRepositoryProvider);
    final result = await repository.listerParParcelle(widget.parcelleId);

    result.match(
      (failure) => setState(() => _errorText = failure.message),
      (liste) => setState(() => _documents = liste),
    );

    setState(() => _loading = false);
  }

  Future<void> _ajouter() async {
    final added = await showDialog<bool>(
      context: context,
      builder: (_) => AjouterDocumentDialog(parcelleId: widget.parcelleId),
    );
    if (added == true) _charger();
  }

  Future<void> _telecharger(DocumentSummary doc) async {
    final uri = Uri.tryParse(doc.urlStockage);
    if (uri == null || !await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Impossible d\'ouvrir ce document.')),
        );
      }
    }
  }

  Future<void> _supprimer(DocumentSummary doc) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Supprimer ce document ?'),
        content: Text('${doc.nomFichier} sera définitivement supprimé.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Supprimer', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    final repository = ref.read(documentRepositoryProvider);
    final result = await repository.supprimer(
      id: doc.id,
      parcelleId: widget.parcelleId,
      urlStockage: doc.urlStockage,
    );

    result.match(
      (failure) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(failure.message)),
      ),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Document supprimé.')),
        );
        _charger();
      },
    );
  }

  IconData _iconePourType(String type) {
    switch (type) {
      case 'TITRE_FONCIER':
        return Icons.article;
      case 'ACTE_VENTE':
        return Icons.receipt;
      case 'CERTIFICAT_HERITAGE':
        return Icons.family_restroom;
      case 'PLAN_CADASTRAL':
        return Icons.map;
      default:
        return Icons.insert_drive_file;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Documents — Parcelle #${widget.parcelleId}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loading ? null : _charger,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _ajouter,
        child: const Icon(Icons.add),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _errorText != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      _errorText!,
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : _documents.isEmpty
                  ? const Center(child: Text('Aucun document pour cette parcelle.'))
                  : RefreshIndicator(
                      onRefresh: _charger,
                      child: ListView.separated(
                        itemCount: _documents.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final doc = _documents[index];
                          return ListTile(
                            leading: Icon(_iconePourType(doc.typeDocument)),
                            title: Text(doc.nomFichier),
                            subtitle: Text(libelleTypeDocument(doc.typeDocument)),
                            onTap: () => _telecharger(doc),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_outline, color: Colors.red),
                              onPressed: () => _supprimer(doc),
                            ),
                          );
                        },
                      ),
                    ),
    );
  }
}
