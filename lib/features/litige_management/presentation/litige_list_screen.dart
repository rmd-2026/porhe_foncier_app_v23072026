import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/features/litige_management/data/litige_repository.dart';
import 'package:porhe_foncier_app_23072026/features/litige_management/presentation/litige_detail_screen.dart';
import 'package:porhe_foncier_app_23072026/features/litige_management/presentation/litige_providers.dart';

class LitigeListScreen extends ConsumerStatefulWidget {
  const LitigeListScreen({super.key});

  @override
  ConsumerState<LitigeListScreen> createState() => _LitigeListScreenState();
}

class _LitigeListScreenState extends ConsumerState<LitigeListScreen> {
  bool _loading = true;
  String? _errorText;
  List<LitigeSummary> _litiges = [];
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
    final result = await ref.read(litigeRepositoryProvider).listerTous();
    result.match(
      (f) => setState(() => _errorText = f.message),
      (liste) => setState(() => _litiges = liste),
    );
    setState(() => _loading = false);
  }

  Future<void> _signaler() async {
    final parcelleIdController = TextEditingController();
    final plaignantIdController = TextEditingController();
    final motifController = TextEditingController();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Signaler un litige'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: parcelleIdController,
                decoration: const InputDecoration(labelText: 'ID Parcelle'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: plaignantIdController,
                decoration: const InputDecoration(labelText: 'ID Plaignant (utilisateur)'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: motifController,
                decoration: const InputDecoration(labelText: 'Motif'),
                maxLines: 3,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              if (parcelleIdController.text.trim().isEmpty ||
                  plaignantIdController.text.trim().isEmpty ||
                  motifController.text.trim().isEmpty) {
                return;
              }
              Navigator.of(dialogContext).pop(true);
            },
            child: const Text('Signaler'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;
    final parcelleId = int.tryParse(parcelleIdController.text.trim());
    final plaignantId = int.tryParse(plaignantIdController.text.trim());
    if (parcelleId == null || plaignantId == null) return;

    setState(() => _saving = true);
    final result = await ref.read(litigeRepositoryProvider).signaler(
          parcelleId: parcelleId,
          plaignantId: plaignantId,
          motif: motifController.text.trim(),
        );

    result.match(
      (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(f.message))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Litige signalé.')));
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Future<void> _passerEnExamen(LitigeSummary l) async {
    setState(() => _saving = true);
    final result = await ref.read(litigeRepositoryProvider).passerEnExamen(id: l.id);
    result.match(
      (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(f.message))),
      (_) => _charger(),
    );
    setState(() => _saving = false);
  }

  Future<void> _resoudreOuRejeter(LitigeSummary l, {required bool resoudre}) async {
    final resolutionController = TextEditingController();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(resoudre ? 'Résoudre ce litige' : 'Rejeter ce litige'),
        content: TextField(
          controller: resolutionController,
          decoration: InputDecoration(
            labelText: resoudre ? 'Résolution' : 'Motif de rejet',
            hintText: 'Obligatoire',
          ),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              if (resolutionController.text.trim().isEmpty) return;
              Navigator.of(dialogContext).pop(true);
            },
            child: Text(resoudre ? 'Résoudre' : 'Rejeter'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    setState(() => _saving = true);
    final repository = ref.read(litigeRepositoryProvider);
    final result = resoudre
        ? await repository.resoudre(id: l.id, resolution: resolutionController.text.trim())
        : await repository.rejeter(id: l.id, motifRejet: resolutionController.text.trim());

    result.match(
      (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(f.message))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(resoudre ? 'Litige résolu.' : 'Litige rejeté.')),
        );
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Future<void> _supprimer(LitigeSummary l) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Supprimer définitivement ce litige ?'),
        content: const Text('Cette action est irréversible.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Retour'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Supprimer définitivement', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    setState(() => _saving = true);
    final result = await ref.read(litigeRepositoryProvider).supprimer(id: l.id);
    result.match(
      (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(f.message))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Litige supprimé.')));
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Color _statutColor(String statut) {
    switch (statut) {
      case 'RESOLU':
        return Colors.green;
      case 'REJETE':
        return Colors.red;
      case 'EN_COURS_EXAMEN':
        return Colors.blue;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des litiges'),
        actions: [IconButton(icon: const Icon(Icons.refresh), onPressed: _loading ? null : _charger)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saving ? null : _signaler,
        child: const Icon(Icons.add),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _errorText != null
              ? Center(child: Text(_errorText!, style: const TextStyle(color: Colors.red)))
              : _litiges.isEmpty
                  ? const Center(child: Text('Aucun litige trouvé.'))
                  : RefreshIndicator(
                      onRefresh: _charger,
                      child: ListView.separated(
                        itemCount: _litiges.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final l = _litiges[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: _statutColor(l.statut).withOpacity(0.15),
                              child: Icon(Icons.gavel, color: _statutColor(l.statut)),
                            ),
                            title: Text('Parcelle #${l.parcelleId ?? '?'} — Plaignant #${l.plaignantId ?? '?'}'),
                            subtitle: Text(libelleStatutLitige(l.statut)),
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => LitigeDetailScreen(id: l.id)),
                            ),
                            trailing: PopupMenuButton<String>(
                              enabled: !_saving,
                              onSelected: (action) {
                                switch (action) {
                                  case 'examen':
                                    _passerEnExamen(l);
                                    break;
                                  case 'resoudre':
                                    _resoudreOuRejeter(l, resoudre: true);
                                    break;
                                  case 'rejeter':
                                    _resoudreOuRejeter(l, resoudre: false);
                                    break;
                                  case 'supprimer':
                                    _supprimer(l);
                                    break;
                                }
                              },
                              itemBuilder: (context) => [
                                if (l.statut == 'OUVERT')
                                  const PopupMenuItem(value: 'examen', child: Text('Passer en examen')),
                                if (l.statut == 'OUVERT' || l.statut == 'EN_COURS_EXAMEN')
                                  const PopupMenuItem(value: 'resoudre', child: Text('Résoudre')),
                                if (l.statut == 'OUVERT' || l.statut == 'EN_COURS_EXAMEN')
                                  const PopupMenuItem(value: 'rejeter', child: Text('Rejeter')),
                                const PopupMenuDivider(),
                                const PopupMenuItem(
                                  value: 'supprimer',
                                  child: Text('Supprimer définitivement', style: TextStyle(color: Colors.red)),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
    );
  }
}
