import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/features/transaction_management/data/transaction_repository.dart';
import 'package:porhe_foncier_app_23072026/features/transaction_management/presentation/transaction_providers.dart';

class TransactionDetailScreen extends ConsumerStatefulWidget {
  const TransactionDetailScreen({super.key, required this.id});
  final int id;

  @override
  ConsumerState<TransactionDetailScreen> createState() => _TransactionDetailScreenState();
}

class _TransactionDetailScreenState extends ConsumerState<TransactionDetailScreen> {
  bool _loading = true;
  bool _saving = false;
  String? _errorText;
  bool _dataChanged = false;

  TransactionDetail? _detail;
  PersonneInfo? _vendeur;
  PersonneInfo? _acheteur;
  int? _communeId;
  String? _communeErreur;

  @override
  void initState() {
    super.initState();
    _charger();
  }

  Future<void> _charger() async {
    setState(() {
      _loading = true;
      _errorText = null;
      _communeErreur = null;
    });

    final repository = ref.read(transactionRepositoryProvider);
    final result = await repository.obtenirDetail(widget.id);

    result.match(
      (failure) => setState(() => _errorText = failure.message),
      (detail) => setState(() => _detail = detail),
    );

    setState(() => _loading = false);
    if (_detail == null) return;

    final vendeurResult = await repository.obtenirPersonne(_detail!.vendeurId);
    vendeurResult.match(
      (_) {},
      (p) => setState(() => _vendeur = p),
    );

    final acheteurResult = await repository.obtenirPersonne(_detail!.acheteurId);
    acheteurResult.match(
      (_) {},
      (p) => setState(() => _acheteur = p),
    );

    // TransactionFonciere has no communeId column — it's only
    // reachable via its parcelle. Fetched directly here rather than
    // pulling in ParcelleRepository, to keep feature modules
    // independent per the Simplification Rules.
    try {
      final parcelleResult = await PorheFoncier23072026Connector.instance
          .obtenirParcelleParId(id: _detail!.parcelleId)
          .execute();
      final p = parcelleResult.data.parcelle;
      if (p == null) {
        setState(() => _communeErreur = 'Parcelle introuvable.');
      } else {
        setState(() => _communeId = p.communeId);
      }
    } catch (e) {
      setState(() => _communeErreur = 'Erreur lors du chargement de la commune : $e');
    }
  }

  Future<void> _valider() async {
    if (_detail == null || _communeId == null) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Valider cette transaction ?'),
        content: Text(
          'La parcelle #${_detail!.parcelleId} sera transférée à '
          '${_acheteur?.nomAffiche ?? 'l\'acheteur #${_detail!.acheteurId}'}.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Valider'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    setState(() => _saving = true);
    final repository = ref.read(transactionRepositoryProvider);
    final result = await repository.valider(
      id: widget.id,
      parcelleId: _detail!.parcelleId,
      nouveauUtilisateurId: _detail!.acheteurId,
      communeId: _communeId!,
    );

    result.match(
      (failure) => setState(() => _errorText = failure.message),
      (_) {
        _dataChanged = true;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Transaction validée — propriété transférée.')),
        );
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Future<void> _rejeter() async {
    if (_detail == null || _communeId == null) return;
    final motifController = TextEditingController();

    final motif = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Rejeter cette transaction ?'),
        content: TextField(
          controller: motifController,
          decoration: const InputDecoration(
            labelText: 'Motif du rejet',
            hintText: 'Obligatoire',
          ),
          maxLines: 3,
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
            child: const Text('Rejeter'),
          ),
        ],
      ),
    );
    if (motif == null || motif.isEmpty) return;

    setState(() => _saving = true);
    final repository = ref.read(transactionRepositoryProvider);
    final result = await repository.rejeter(
      id: widget.id,
      communeId: _communeId!,
      motif: motif,
    );

    result.match(
      (failure) => setState(() => _errorText = failure.message),
      (_) {
        _dataChanged = true;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Transaction rejetée.')),
        );
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Future<void> _resoumettre() async {
    if (_detail == null || _communeId == null) return;
    setState(() => _saving = true);
    final repository = ref.read(transactionRepositoryProvider);
    final result = await repository.resoumettre(id: widget.id, communeId: _communeId!);

    result.match(
      (failure) => setState(() => _errorText = failure.message),
      (_) {
        _dataChanged = true;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Transaction resoumise.')),
        );
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  String _typeLabel(String type) {
    switch (type) {
      case 'VENTE':
        return 'Vente';
      case 'HERITAGE':
        return 'Héritage';
      case 'DONATION':
        return 'Donation';
      case 'ECHANGE':
        return 'Échange';
      default:
        return type;
    }
  }

  Widget _statutBanner() {
    if (_detail == null) return const SizedBox.shrink();
    final statut = _detail!.statut;
    final Color color;
    final String label;
    switch (statut) {
      case 'VALIDEE':
        color = Colors.green;
        label = 'Validée — propriété transférée';
        break;
      case 'REJETEE':
        color = Colors.red;
        label = 'Rejetée';
        break;
      default:
        color = Colors.orange;
        label = 'En attente de validation';
    }

    final canAct = _communeId != null;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.circle, size: 10, color: color),
              const SizedBox(width: 8),
              Text('Statut : $label',
                  style: TextStyle(color: color, fontWeight: FontWeight.bold)),
            ],
          ),
          if (_detail!.motifRejet != null) ...[
            const SizedBox(height: 4),
            Text('Motif du rejet : ${_detail!.motifRejet}'),
          ],
          if (_communeErreur != null) ...[
            const SizedBox(height: 8),
            Text(
              'Actions indisponibles : $_communeErreur',
              style: const TextStyle(fontSize: 12, color: Colors.orange),
            ),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              if (statut != 'VALIDEE')
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: (!canAct || _saving) ? null : _valider,
                    icon: const Icon(Icons.check_circle_outline, size: 18),
                    label: const Text('Valider'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              if (statut != 'VALIDEE') const SizedBox(width: 8),
              if (statut != 'REJETEE' && statut != 'VALIDEE')
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: (!canAct || _saving) ? null : _rejeter,
                    icon: const Icon(Icons.block, size: 18),
                    label: const Text('Rejeter'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          if (statut == 'REJETEE') ...[
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: (!canAct || _saving) ? null : _resoumettre,
                icon: const Icon(Icons.replay, size: 18),
                label: const Text('Resoumettre'),
              ),
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) Navigator.of(context).pop(_dataChanged);
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Détail transaction')),
        body: _loading
            ? const Center(child: CircularProgressIndicator())
            : _detail == null
                ? Center(child: Text(_errorText ?? 'Transaction introuvable.'))
                : SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 48),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _statutBanner(),
                        if (_errorText != null) ...[
                          Text(_errorText!, style: const TextStyle(color: Colors.red)),
                          const SizedBox(height: 12),
                        ],
                        Text('Type : ${_typeLabel(_detail!.typeTransaction)}',
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 4),
                        Text('Parcelle : #${_detail!.parcelleId}'),
                        Text('Date de transaction : ${_detail!.dateTransaction}'),
                        if (_detail!.montant != null)
                          Text('Montant : ${_detail!.montant!.toStringAsFixed(0)} GNF'),
                        const SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.purple.withOpacity(0.06),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Parties', style: TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              Text('Vendeur : ${_vendeur?.nomAffiche ?? '#${_detail!.vendeurId}'}'),
                              Text('Acheteur : ${_acheteur?.nomAffiche ?? '#${_detail!.acheteurId}'}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
