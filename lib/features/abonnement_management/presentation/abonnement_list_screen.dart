import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/features/abonnement_management/data/abonnement_repository.dart';
import 'package:porhe_foncier_app_23072026/features/abonnement_management/presentation/abonnement_providers.dart';

const List<String> _niveaux = ['BASIQUE', 'STANDARD', 'PREMIUM'];

class AbonnementListScreen extends ConsumerStatefulWidget {
  const AbonnementListScreen({super.key});

  @override
  ConsumerState<AbonnementListScreen> createState() => _AbonnementListScreenState();
}

class _AbonnementListScreenState extends ConsumerState<AbonnementListScreen> {
  bool _loading = true;
  String? _errorText;
  List<AbonnementSummary> _abonnements = [];
  bool _actifsSeulement = false;
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

    final repository = ref.read(abonnementRepositoryProvider);
    final result = _actifsSeulement
        ? await repository.listerActifsToutes()
        : await repository.listerTous();

    result.match(
      (failure) => setState(() => _errorText = failure.message),
      (liste) => setState(() => _abonnements = liste),
    );

    setState(() => _loading = false);
  }

  /// Shared by "Créer" and "Modifier" — [abonnementExistant] pre-fills
  /// the form and switches the submit action to update instead of
  /// create. The utilisateurId field is only shown/editable on create
  /// (utilisateurId isn't part of mettreAJourAbonnement's parameters —
  /// ownership of a subscription can't be reassigned via that mutation).
  Future<void> _ouvrirFormulaire({AbonnementSummary? abonnementExistant}) async {
    final utilisateurIdController = TextEditingController();
    String niveau = abonnementExistant?.niveau ?? 'BASIQUE';
    DateTime dateDebut = abonnementExistant != null
        ? DateTime.tryParse(abonnementExistant.dateDebut) ?? DateTime.now()
        : DateTime.now();
    DateTime dateFin = abonnementExistant != null
        ? DateTime.tryParse(abonnementExistant.dateFin) ?? DateTime.now().add(const Duration(days: 30))
        : DateTime.now().add(const Duration(days: 30));

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text(abonnementExistant == null ? 'Créer un abonnement' : 'Modifier l\'abonnement'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (abonnementExistant == null) ...[
                  TextField(
                    controller: utilisateurIdController,
                    decoration: const InputDecoration(labelText: 'ID Utilisateur'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 12),
                ],
                InputDecorator(
                  decoration: const InputDecoration(labelText: 'Niveau'),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: niveau,
                      items: _niveaux
                          .map((n) => DropdownMenuItem(value: n, child: Text(libelleNiveau(n))))
                          .toList(),
                      onChanged: (v) => setDialogState(() => niveau = v!),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: dateDebut,
                      firstDate: DateTime.now().subtract(const Duration(days: 365)),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (picked != null) setDialogState(() => dateDebut = picked);
                  },
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Date de début',
                      suffixIcon: Icon(Icons.calendar_today, size: 18),
                    ),
                    child: Text(
                      '${dateDebut.year}-${dateDebut.month.toString().padLeft(2, '0')}-${dateDebut.day.toString().padLeft(2, '0')}',
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: dateFin,
                      firstDate: dateDebut,
                      lastDate: DateTime.now().add(const Duration(days: 1825)),
                    );
                    if (picked != null) setDialogState(() => dateFin = picked);
                  },
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Date de fin',
                      suffixIcon: Icon(Icons.calendar_today, size: 18),
                    ),
                    child: Text(
                      '${dateFin.year}-${dateFin.month.toString().padLeft(2, '0')}-${dateFin.day.toString().padLeft(2, '0')}',
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
                if (abonnementExistant == null && utilisateurIdController.text.trim().isEmpty) return;
                Navigator.of(dialogContext).pop(true);
              },
              child: Text(abonnementExistant == null ? 'Créer' : 'Enregistrer'),
            ),
          ],
        ),
      ),
    );

    if (confirmed != true) return;

    setState(() => _saving = true);
    final repository = ref.read(abonnementRepositoryProvider);

    final result = abonnementExistant == null
        ? await repository.creer(
            utilisateurId: int.tryParse(utilisateurIdController.text.trim()) ?? 0,
            niveau: niveau,
            dateDebut: dateDebut,
            dateFin: dateFin,
          )
        : await repository.modifier(
            id: abonnementExistant.id,
            niveau: niveau,
            dateDebut: dateDebut,
            dateFin: dateFin,
          );

    result.match(
      (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(f.message))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(abonnementExistant == null ? 'Abonnement créé.' : 'Abonnement modifié.')),
        );
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Future<void> _renouveler(AbonnementSummary abo) async {
    DateTime nouvelleDateFin = DateTime.tryParse(abo.dateFin)?.add(const Duration(days: 30)) ??
        DateTime.now().add(const Duration(days: 30));

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Renouveler l\'abonnement'),
          content: InkWell(
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: nouvelleDateFin,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 1825)),
              );
              if (picked != null) setDialogState(() => nouvelleDateFin = picked);
            },
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Nouvelle date de fin',
                suffixIcon: Icon(Icons.calendar_today, size: 18),
              ),
              child: Text(
                '${nouvelleDateFin.year}-${nouvelleDateFin.month.toString().padLeft(2, '0')}-${nouvelleDateFin.day.toString().padLeft(2, '0')}',
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: const Text('Renouveler'),
            ),
          ],
        ),
      ),
    );

    if (confirmed != true) return;

    setState(() => _saving = true);
    final result = await ref
        .read(abonnementRepositoryProvider)
        .renouveler(id: abo.id, nouvelleDateFin: nouvelleDateFin);

    result.match(
      (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(f.message))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Abonnement renouvelé.')));
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Future<void> _annuler(AbonnementSummary abo) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Annuler cet abonnement ?'),
        content: Text('L\'abonnement ${libelleNiveau(abo.niveau)} passera au statut Annulé.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Retour'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Annuler l\'abonnement'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    setState(() => _saving = true);
    final result = await ref.read(abonnementRepositoryProvider).annuler(id: abo.id);

    result.match(
      (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(f.message))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Abonnement annulé.')));
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  /// Deliberately separate, more strongly-worded confirmation than
  /// _annuler() — permanent hard delete, no recovery path beyond
  /// JournalAudit. Same precedent as Taxe's supprimer().
  Future<void> _supprimer(AbonnementSummary abo) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Supprimer définitivement cet abonnement ?'),
        content: Text(
          'Cette action est irréversible : l\'abonnement ${libelleNiveau(abo.niveau)} sera '
          'supprimé sans aucune possibilité de récupération. Préférez "Annuler" si '
          'l\'abonnement ne s\'applique simplement plus.',
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
    final result = await ref.read(abonnementRepositoryProvider).supprimer(id: abo.id);

    result.match(
      (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(f.message))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Abonnement supprimé.')));
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Color _statutColor(AbonnementSummary abo) {
    if (abo.statut == 'ANNULE') return Colors.grey;
    if (abo.statut == 'ACTIF' && abo.estExpireParDate) return Colors.red;
    if (abo.statut == 'ACTIF') return Colors.green;
    return Colors.orange;
  }

  String _statutAffiche(AbonnementSummary abo) {
    if (abo.statut == 'ACTIF' && abo.estExpireParDate) {
      return 'Expiré (date dépassée)';
    }
    return libelleStatutAbonnement(abo.statut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des abonnements'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _loading ? null : _charger),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saving ? null : () => _ouvrirFormulaire(),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                ChoiceChip(
                  label: const Text('Tous'),
                  selected: !_actifsSeulement,
                  onSelected: (_) {
                    setState(() => _actifsSeulement = false);
                    _charger();
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Actifs seulement'),
                  selected: _actifsSeulement,
                  selectedColor: Colors.green.withOpacity(0.2),
                  onSelected: (_) {
                    setState(() => _actifsSeulement = true);
                    _charger();
                  },
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : _errorText != null
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Text(_errorText!, style: const TextStyle(color: Colors.red)),
                        ),
                      )
                    : _abonnements.isEmpty
                        ? const Center(child: Text('Aucun abonnement trouvé.'))
                        : RefreshIndicator(
                            onRefresh: _charger,
                            child: ListView.separated(
                              itemCount: _abonnements.length,
                              separatorBuilder: (_, __) => const Divider(height: 1),
                              itemBuilder: (context, index) {
                                final abo = _abonnements[index];
                                final peutModifier = abo.statut != 'ANNULE';
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: _statutColor(abo).withOpacity(0.15),
                                    child: Icon(Icons.card_membership, color: _statutColor(abo)),
                                  ),
                                  title: Text(
                                    '${libelleNiveau(abo.niveau)}'
                                    '${abo.utilisateurId != null ? ' — Utilisateur #${abo.utilisateurId}' : ''}',
                                  ),
                                  subtitle: Text(
                                    '${abo.dateDebut.split('T').first} → ${abo.dateFin.split('T').first} — ${_statutAffiche(abo)}',
                                  ),
                                  trailing: PopupMenuButton<String>(
                                    enabled: !_saving,
                                    onSelected: (action) {
                                      switch (action) {
                                        case 'modifier':
                                          _ouvrirFormulaire(abonnementExistant: abo);
                                          break;
                                        case 'renouveler':
                                          _renouveler(abo);
                                          break;
                                        case 'annuler':
                                          _annuler(abo);
                                          break;
                                        case 'supprimer':
                                          _supprimer(abo);
                                          break;
                                      }
                                    },
                                    itemBuilder: (context) => [
                                      if (peutModifier)
                                        const PopupMenuItem(value: 'modifier', child: Text('Modifier')),
                                      if (abo.statut != 'ANNULE')
                                        const PopupMenuItem(value: 'renouveler', child: Text('Renouveler')),
                                      if (abo.statut != 'ANNULE')
                                        const PopupMenuItem(value: 'annuler', child: Text('Annuler')),
                                      const PopupMenuDivider(),
                                      const PopupMenuItem(
                                        value: 'supprimer',
                                        child: Text('Supprimer définitivement',
                                            style: TextStyle(color: Colors.red)),
                                      ),
                                    ],
                                    child: Icon(Icons.more_vert, color: _statutColor(abo)),
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
