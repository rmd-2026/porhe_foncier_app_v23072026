import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/features/taxe_management/data/taxe_repository.dart';
import 'package:porhe_foncier_app_23072026/features/taxe_management/presentation/taxe_providers.dart';

class TaxeListScreen extends ConsumerStatefulWidget {
  const TaxeListScreen({super.key, required this.parcelleId});
  final int parcelleId;

  @override
  ConsumerState<TaxeListScreen> createState() => _TaxeListScreenState();
}

class _TaxeListScreenState extends ConsumerState<TaxeListScreen> {
  bool _loading = true;
  String? _errorText;
  List<TaxeSummary> _taxes = [];
  int? _communeId;
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

    final repository = ref.read(taxeRepositoryProvider);
    final result = await repository.listerParParcelle(widget.parcelleId);

    result.match(
      (failure) => setState(() => _errorText = failure.message),
      (liste) => setState(() => _taxes = liste),
    );

    setState(() => _loading = false);

    try {
      final parcelleResult = await PorheFoncier23072026Connector.instance
          .obtenirParcelleParId(id: widget.parcelleId)
          .execute();
      final p = parcelleResult.data.parcelle;
      if (p != null) setState(() => _communeId = p.communeId);
    } catch (_) {
      // Actions stay disabled if this fails.
    }
  }

  /// Shared by "Créer" and "Modifier" — [taxeExistante] pre-fills the
  /// form and switches the submit action to update instead of create.
  Future<void> _ouvrirFormulaire({TaxeSummary? taxeExistante}) async {
    final anneeController = TextEditingController(
      text: (taxeExistante?.anneeFiscale ?? DateTime.now().year).toString(),
    );
    final montantController = TextEditingController(
      text: taxeExistante?.montantDu.toStringAsFixed(0) ?? '',
    );
    DateTime? dateEcheance =
        taxeExistante == null ? null : DateTime.tryParse(taxeExistante.dateEcheance);

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text(taxeExistante == null ? 'Créer une taxe foncière' : 'Modifier la taxe'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: anneeController,
                  decoration: const InputDecoration(labelText: 'Année fiscale'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: montantController,
                  decoration: const InputDecoration(labelText: 'Montant dû (GNF)'),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: () async {
                    final now = DateTime.now();
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: dateEcheance ?? DateTime(now.year, 12, 31),
                      firstDate: DateTime(now.year - 1),
                      lastDate: DateTime(now.year + 5),
                    );
                    if (picked != null) setDialogState(() => dateEcheance = picked);
                  },
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Date d\'échéance',
                      suffixIcon: Icon(Icons.calendar_today, size: 18),
                    ),
                    child: Text(
                      dateEcheance == null
                          ? 'Sélectionner une date'
                          : '${dateEcheance!.year}-${dateEcheance!.month.toString().padLeft(2, '0')}-${dateEcheance!.day.toString().padLeft(2, '0')}',
                    ),
                  ),
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
                if (anneeController.text.trim().isEmpty ||
                    montantController.text.trim().isEmpty ||
                    dateEcheance == null) {
                  return;
                }
                Navigator.of(dialogContext).pop(true);
              },
              child: Text(taxeExistante == null ? 'Créer' : 'Enregistrer'),
            ),
          ],
        ),
      ),
    );

    if (confirmed != true || _communeId == null) return;

    final annee = int.tryParse(anneeController.text.trim());
    final montant = double.tryParse(montantController.text.trim());
    if (annee == null || montant == null || dateEcheance == null) return;

    setState(() => _saving = true);
    final repository = ref.read(taxeRepositoryProvider);

    final result = taxeExistante == null
        ? await repository.creer(
            parcelleId: widget.parcelleId,
            anneeFiscale: annee,
            montantDu: montant,
            dateEcheance: dateEcheance!,
            communeId: _communeId!,
          )
        : await repository.modifier(
            id: taxeExistante.id,
            communeId: _communeId!,
            anneeFiscale: annee,
            montantDu: montant,
            dateEcheance: dateEcheance!,
          );

    result.match(
      (failure) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(failure.message))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(taxeExistante == null ? 'Taxe créée.' : 'Taxe modifiée.')),
        );
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Future<void> _marquerPayee(TaxeSummary taxe) async {
    if (_communeId == null) return;
    setState(() => _saving = true);
    final result =
        await ref.read(taxeRepositoryProvider).marquerPayee(id: taxe.id, communeId: _communeId!);
    result.match(
      (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(f.message))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Taxe marquée payée.')));
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Future<void> _marquerEnRetard(TaxeSummary taxe) async {
    if (_communeId == null) return;
    setState(() => _saving = true);
    final result = await ref
        .read(taxeRepositoryProvider)
        .marquerEnRetard(id: taxe.id, communeId: _communeId!);
    result.match(
      (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(f.message))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Taxe marquée en retard.')));
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Future<void> _annuler(TaxeSummary taxe) async {
    if (_communeId == null) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Annuler cette taxe ?'),
        content: Text(
          'La taxe de l\'exercice ${taxe.anneeFiscale} passera au statut Annulée. '
          'Elle reste consultable dans l\'historique.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Retour'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Annuler la taxe'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    setState(() => _saving = true);
    final result =
        await ref.read(taxeRepositoryProvider).annuler(id: taxe.id, communeId: _communeId!);
    result.match(
      (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(f.message))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Taxe annulée.')));
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  /// Deliberately a separate, more strongly-worded confirmation than
  /// _annuler() — this is a permanent hard delete with no recovery
  /// path beyond JournalAudit, reserved for genuine data-entry
  /// mistakes rather than "this tax no longer applies" (use Annuler
  /// for that instead).
  Future<void> _supprimer(TaxeSummary taxe) async {
    if (_communeId == null) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Supprimer définitivement cette taxe ?'),
        content: Text(
          'Cette action est irréversible : la taxe de l\'exercice ${taxe.anneeFiscale} '
          '(${taxe.montantDu.toStringAsFixed(0)} GNF) sera supprimée sans aucune possibilité '
          'de récupération. Préférez "Annuler" si la taxe ne s\'applique simplement plus.',
        ),
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
    final result =
        await ref.read(taxeRepositoryProvider).supprimer(id: taxe.id, communeId: _communeId!);
    result.match(
      (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(f.message))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Taxe supprimée.')));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taxes — Parcelle #${widget.parcelleId}'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _loading ? null : _charger),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (_saving || _communeId == null) ? null : () => _ouvrirFormulaire(),
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
              : _taxes.isEmpty
                  ? const Center(child: Text('Aucune taxe pour cette parcelle.'))
                  : RefreshIndicator(
                      onRefresh: _charger,
                      child: ListView.separated(
                        itemCount: _taxes.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final t = _taxes[index];
                          final peutModifier = t.statut != 'ANNULE';
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: _statutColor(t.statut).withOpacity(0.15),
                              child: Icon(Icons.account_balance, color: _statutColor(t.statut)),
                            ),
                            title: Text('Exercice ${t.anneeFiscale} — ${t.montantDu.toStringAsFixed(0)} GNF'),
                            subtitle: Text(
                              'Échéance : ${t.dateEcheance.split('T').first} — ${libelleStatutTaxe(t.statut)}',
                            ),
                            trailing: PopupMenuButton<String>(
                              enabled: !_saving && _communeId != null,
                              onSelected: (action) {
                                switch (action) {
                                  case 'modifier':
                                    _ouvrirFormulaire(taxeExistante: t);
                                    break;
                                  case 'payee':
                                    _marquerPayee(t);
                                    break;
                                  case 'retard':
                                    _marquerEnRetard(t);
                                    break;
                                  case 'annuler':
                                    _annuler(t);
                                    break;
                                  case 'supprimer':
                                    _supprimer(t);
                                    break;
                                }
                              },
                              itemBuilder: (context) => [
                                if (peutModifier)
                                  const PopupMenuItem(value: 'modifier', child: Text('Modifier')),
                                if (t.statut != 'PAYE' && t.statut != 'ANNULE')
                                  const PopupMenuItem(value: 'payee', child: Text('Marquer payée')),
                                if (t.statut != 'EN_RETARD' && t.statut != 'PAYE' && t.statut != 'ANNULE')
                                  const PopupMenuItem(value: 'retard', child: Text('Marquer en retard')),
                                if (t.statut != 'ANNULE' && t.statut != 'PAYE')
                                  const PopupMenuItem(value: 'annuler', child: Text('Annuler')),
                                const PopupMenuDivider(),
                                const PopupMenuItem(
                                  value: 'supprimer',
                                  child: Text('Supprimer définitivement',
                                      style: TextStyle(color: Colors.red)),
                                ),
                              ],
                              child: Icon(Icons.more_vert, color: _statutColor(t.statut)),
                            ),
                          );
                        },
                      ),
                    ),
    );
  }
}
