import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/features/paiement_management/data/paiement_repository.dart';
import 'package:porhe_foncier_app_23072026/features/paiement_management/presentation/paiement_providers.dart';

const List<String> _methodes = ['ORANGE_MONEY', 'MTN_MOMO', 'AUTRE'];

class PaiementListScreen extends ConsumerStatefulWidget {
  const PaiementListScreen({super.key});

  @override
  ConsumerState<PaiementListScreen> createState() => _PaiementListScreenState();
}

class _PaiementListScreenState extends ConsumerState<PaiementListScreen> {
  bool _loading = true;
  String? _errorText;
  List<PaiementSummary> _paiements = [];
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

    final repository = ref.read(paiementRepositoryProvider);
    final result = await repository.listerTous();

    result.match(
      (failure) => setState(() => _errorText = failure.message),
      (liste) => setState(() => _paiements = liste),
    );

    setState(() => _loading = false);
  }

  Future<void> _enregistrer() async {
    final utilisateurIdController = TextEditingController();
    final montantController = TextEditingController();
    final referenceController = TextEditingController();
    final taxeIdController = TextEditingController();
    final abonnementIdController = TextEditingController();
    final fraisIdController = TextEditingController();
    String methode = 'ORANGE_MONEY';
    String lien = 'AUCUN';

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Enregistrer un paiement'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: utilisateurIdController,
                  decoration: const InputDecoration(labelText: 'ID Utilisateur'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 12),
                InputDecorator(
                  decoration: const InputDecoration(labelText: 'Méthode de paiement'),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: methode,
                      items: _methodes
                          .map((m) => DropdownMenuItem(value: m, child: Text(libelleMethodePaiement(m))))
                          .toList(),
                      onChanged: (v) => setDialogState(() => methode = v!),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: montantController,
                  decoration: const InputDecoration(labelText: 'Montant (GNF)'),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: referenceController,
                  decoration: const InputDecoration(labelText: 'Référence transaction (optionnel)'),
                ),
                const SizedBox(height: 16),
                const Text('Lié à (optionnel, un seul choix) :', style: TextStyle(fontSize: 12)),
                const SizedBox(height: 8),
                InputDecorator(
                  decoration: const InputDecoration(labelText: 'Type de lien'),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: lien,
                      items: const [
                        DropdownMenuItem(value: 'AUCUN', child: Text('Aucun')),
                        DropdownMenuItem(value: 'TAXE', child: Text('Taxe foncière')),
                        DropdownMenuItem(value: 'ABONNEMENT', child: Text('Abonnement')),
                        DropdownMenuItem(value: 'FRAIS', child: Text('Frais d\'enregistrement')),
                      ],
                      onChanged: (v) => setDialogState(() => lien = v!),
                    ),
                  ),
                ),
                if (lien == 'TAXE') ...[
                  const SizedBox(height: 8),
                  TextField(
                    controller: taxeIdController,
                    decoration: const InputDecoration(labelText: 'ID Taxe foncière'),
                    keyboardType: TextInputType.number,
                  ),
                ],
                if (lien == 'ABONNEMENT') ...[
                  const SizedBox(height: 8),
                  TextField(
                    controller: abonnementIdController,
                    decoration: const InputDecoration(labelText: 'ID Abonnement'),
                    keyboardType: TextInputType.number,
                  ),
                ],
                if (lien == 'FRAIS') ...[
                  const SizedBox(height: 8),
                  TextField(
                    controller: fraisIdController,
                    decoration: const InputDecoration(labelText: 'ID Frais d\'enregistrement'),
                    keyboardType: TextInputType.number,
                  ),
                ],
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
                if (utilisateurIdController.text.trim().isEmpty ||
                    montantController.text.trim().isEmpty) {
                  return;
                }
                Navigator.of(dialogContext).pop(true);
              },
              child: const Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );

    if (confirmed != true) return;

    final utilisateurId = int.tryParse(utilisateurIdController.text.trim());
    final montant = double.tryParse(montantController.text.trim());
    if (utilisateurId == null || montant == null) return;

    setState(() => _saving = true);
    final repository = ref.read(paiementRepositoryProvider);
    final result = await repository.enregistrer(
      utilisateurId: utilisateurId,
      methodePaiement: methode,
      montant: montant,
      referenceTransaction:
          referenceController.text.trim().isEmpty ? null : referenceController.text.trim(),
      taxeFonciereId: lien == 'TAXE' ? int.tryParse(taxeIdController.text.trim()) : null,
      abonnementId: lien == 'ABONNEMENT' ? int.tryParse(abonnementIdController.text.trim()) : null,
      fraisEnregistrementId: lien == 'FRAIS' ? int.tryParse(fraisIdController.text.trim()) : null,
    );

    result.match(
      (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(f.message))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Paiement enregistré.')));
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Future<void> _confirmer(PaiementSummary paiement) async {
    final avertissementFrais = paiement.typeLien == 'FRAIS';
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Confirmer ce paiement ?'),
        content: Text(
          avertissementFrais
              ? 'Le paiement passera à Payé. Note : le frais d\'enregistrement lié ne sera '
                  'PAS automatiquement marqué payé (aucune mutation ne couvre ce lien) — '
                  'pensez à le mettre à jour séparément.'
              : 'Le paiement de ${paiement.montant.toStringAsFixed(0)} GNF passera à Payé'
                  '${paiement.typeLien != 'AUCUN' ? ', et l\'élément lié sera mis à jour automatiquement.' : '.'}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Confirmer'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    setState(() => _saving = true);
    final result = await ref.read(paiementRepositoryProvider).confirmerAdapte(paiement);

    result.match(
      (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(f.message))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Paiement confirmé.')));
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Future<void> _annuler(PaiementSummary paiement) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Annuler ce paiement ?'),
        content: Text('Le paiement de ${paiement.montant.toStringAsFixed(0)} GNF passera à Annulé.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Retour'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Annuler le paiement'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    setState(() => _saving = true);
    final result = await ref.read(paiementRepositoryProvider).annuler(id: paiement.id);

    result.match(
      (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(f.message))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Paiement annulé.')));
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
      case 'ANNULE':
        return Colors.grey;
      default:
        return Colors.orange;
    }
  }

  String _libelleLien(PaiementSummary p) {
    switch (p.typeLien) {
      case 'TAXE':
        return 'Taxe #${p.taxeFonciereId}';
      case 'ABONNEMENT':
        return 'Abonnement #${p.abonnementId}';
      case 'FRAIS':
        return 'Frais #${p.fraisEnregistrementId}';
      default:
        return 'Aucun lien';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des paiements'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _loading ? null : _charger),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saving ? null : _enregistrer,
        child: const Icon(Icons.add),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _errorText != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(_errorText!, style: const TextStyle(color: Colors.red)),
                  ),
                )
              : _paiements.isEmpty
                  ? const Center(child: Text('Aucun paiement trouvé.'))
                  : RefreshIndicator(
                      onRefresh: _charger,
                      child: ListView.separated(
                        itemCount: _paiements.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final p = _paiements[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: _statutColor(p.statut).withOpacity(0.15),
                              child: Icon(Icons.payments, color: _statutColor(p.statut)),
                            ),
                            title: Text(
                              '${libelleMethodePaiement(p.methodePaiement)} — ${p.montant.toStringAsFixed(0)} GNF',
                            ),
                            subtitle: Text(_libelleLien(p)),
                            trailing: PopupMenuButton<String>(
                              enabled: !_saving,
                              onSelected: (action) {
                                if (action == 'confirmer') _confirmer(p);
                                if (action == 'annuler') _annuler(p);
                              },
                              itemBuilder: (context) => [
                                if (p.statut == 'EN_ATTENTE' || p.statut == 'EN_RETARD')
                                  const PopupMenuItem(value: 'confirmer', child: Text('Confirmer le paiement')),
                                if (p.statut != 'ANNULE' && p.statut != 'PAYE')
                                  const PopupMenuItem(value: 'annuler', child: Text('Annuler')),
                              ],
                              child: Chip(
                                label: Text(libelleStatutPaiement(p.statut), style: const TextStyle(fontSize: 11)),
                                backgroundColor: _statutColor(p.statut).withOpacity(0.15),
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
    );
  }
}
