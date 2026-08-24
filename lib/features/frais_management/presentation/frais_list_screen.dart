import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/features/frais_management/data/frais_repository.dart';
import 'package:porhe_foncier_app_23072026/features/frais_management/presentation/frais_detail_screen.dart';
import 'package:porhe_foncier_app_23072026/features/frais_management/presentation/frais_providers.dart';

const List<String> _typesFrais = ['INSCRIPTION_PARCELLE', 'DUPLICATA_DOCUMENT', 'AUTRE'];

class FraisListScreen extends ConsumerStatefulWidget {
  const FraisListScreen({super.key});

  @override
  ConsumerState<FraisListScreen> createState() => _FraisListScreenState();
}

class _FraisListScreenState extends ConsumerState<FraisListScreen> {
  bool _loading = true;
  String? _errorText;
  List<FraisSummary> _frais = [];
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
    final result = await ref.read(fraisRepositoryProvider).listerTous();
    result.match(
      (f) => setState(() => _errorText = f.message),
      (liste) => setState(() => _frais = liste),
    );
    setState(() => _loading = false);
  }

  Future<void> _creer() async {
    final parcelleIdController = TextEditingController();
    final montantController = TextEditingController();
    String type = 'INSCRIPTION_PARCELLE';

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Créer un frais d\'enregistrement'),
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
                InputDecorator(
                  decoration: const InputDecoration(labelText: 'Type de frais'),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: type,
                      items: _typesFrais
                          .map((t) => DropdownMenuItem(value: t, child: Text(libelleTypeFrais(t))))
                          .toList(),
                      onChanged: (v) => setDialogState(() => type = v!),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: montantController,
                  decoration: const InputDecoration(labelText: 'Montant (GNF)'),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
                    montantController.text.trim().isEmpty) {
                  return;
                }
                Navigator.of(dialogContext).pop(true);
              },
              child: const Text('Créer'),
            ),
          ],
        ),
      ),
    );

    if (confirmed != true) return;
    final parcelleId = int.tryParse(parcelleIdController.text.trim());
    final montant = double.tryParse(montantController.text.trim());
    if (parcelleId == null || montant == null) return;

    setState(() => _saving = true);
    final result = await ref
        .read(fraisRepositoryProvider)
        .creer(parcelleId: parcelleId, typeFrais: type, montant: montant);

    result.match(
      (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(f.message))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Frais créé.')));
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Future<void> _marquerPaye(FraisSummary f) async {
    setState(() => _saving = true);
    final result = await ref.read(fraisRepositoryProvider).marquerPaye(id: f.id);
    result.match(
      (fail) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(fail.message))),
      (_) => _charger(),
    );
    setState(() => _saving = false);
  }

  Future<String?> _demanderMotif(String titre) async {
    final controller = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(titre),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Motif', hintText: 'Obligatoire'),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.trim().isEmpty) return;
              Navigator.of(dialogContext).pop(controller.text.trim());
            },
            child: const Text('Confirmer'),
          ),
        ],
      ),
    );
  }

  Future<void> _annuler(FraisSummary f) async {
    final motif = await _demanderMotif('Annuler ce frais — motif');
    if (motif == null || motif.isEmpty) return;

    setState(() => _saving = true);
    final result = await ref.read(fraisRepositoryProvider).annuler(id: f.id, motifRejet: motif);
    result.match(
      (fail) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(fail.message))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Frais annulé.')));
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Future<void> _rejeter(FraisSummary f) async {
    final motif = await _demanderMotif('Rejeter ce frais — motif de rejet');
    if (motif == null || motif.isEmpty) return;

    setState(() => _saving = true);
    final result = await ref.read(fraisRepositoryProvider).rejeter(id: f.id, motifRejet: motif);
    result.match(
      (fail) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(fail.message))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Frais rejeté.')));
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Future<void> _supprimer(FraisSummary f) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Supprimer définitivement ce frais ?'),
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
    final result = await ref.read(fraisRepositoryProvider).supprimer(id: f.id);
    result.match(
      (fail) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(fail.message))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Frais supprimé.')));
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Color _statutColor(String statut) {
    switch (statut) {
      case 'PAYE':
        return Colors.green;
      case 'EN_RETARD':
        return Colors.red;
      case 'REJETE':
        return Colors.deepOrange;
      case 'ANNULE':
        return Colors.grey;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des frais d\'enregistrement'),
        actions: [IconButton(icon: const Icon(Icons.refresh), onPressed: _loading ? null : _charger)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saving ? null : _creer,
        child: const Icon(Icons.add),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _errorText != null
              ? Center(child: Text(_errorText!, style: const TextStyle(color: Colors.red)))
              : _frais.isEmpty
                  ? const Center(child: Text('Aucun frais trouvé.'))
                  : RefreshIndicator(
                      onRefresh: _charger,
                      child: ListView.separated(
                        itemCount: _frais.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final f = _frais[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: _statutColor(f.statut).withOpacity(0.15),
                              child: Icon(Icons.receipt, color: _statutColor(f.statut)),
                            ),
                            title: Text('${libelleTypeFrais(f.typeFrais)} — ${f.montant.toStringAsFixed(0)} GNF'),
                            subtitle: Text('Parcelle #${f.parcelleId ?? '?'} — ${libelleStatutFrais(f.statut)}'),
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => FraisDetailScreen(id: f.id)),
                            ),
                            trailing: PopupMenuButton<String>(
                              enabled: !_saving,
                              onSelected: (action) {
                                switch (action) {
                                  case 'paye':
                                    _marquerPaye(f);
                                    break;
                                  case 'annuler':
                                    _annuler(f);
                                    break;
                                  case 'rejeter':
                                    _rejeter(f);
                                    break;
                                  case 'supprimer':
                                    _supprimer(f);
                                    break;
                                }
                              },
                              itemBuilder: (context) => [
                                if (f.statut == 'EN_ATTENTE' || f.statut == 'EN_RETARD')
                                  const PopupMenuItem(value: 'paye', child: Text('Marquer payé')),
                                if (f.statut == 'EN_ATTENTE' || f.statut == 'EN_RETARD')
                                  const PopupMenuItem(value: 'annuler', child: Text('Annuler')),
                                if (f.statut == 'EN_ATTENTE' || f.statut == 'EN_RETARD')
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
