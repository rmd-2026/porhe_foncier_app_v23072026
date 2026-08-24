import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/core/reference_dropdowns.dart';
import 'package:porhe_foncier_app_23072026/features/transaction_management/data/transaction_repository.dart';
import 'package:porhe_foncier_app_23072026/features/transaction_management/presentation/transaction_detail_screen.dart';
import 'package:porhe_foncier_app_23072026/features/transaction_management/presentation/transaction_providers.dart';

class TransactionListScreen extends ConsumerStatefulWidget {
  const TransactionListScreen({super.key});

  @override
  ConsumerState<TransactionListScreen> createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends ConsumerState<TransactionListScreen> {
  bool _loading = true;
  String? _errorText;
  List<TransactionSummary> _transactions = [];

  // listerTransactionsEnAttenteParCommune / listerTransactionsRejeteesParCommune
  // both require a communeId — there is no unfiltered-by-commune statut
  // filter, same constraint as Parcelle's equivalent screen.
  int? _communeFiltre;
  String? _statutFiltre;

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

    final repository = ref.read(transactionRepositoryProvider);
    final result = (_communeFiltre == null || _statutFiltre == null)
        ? await repository.listerToutes()
        : _statutFiltre == 'EN_ATTENTE_VALIDATION'
            ? await repository.listerEnAttenteParCommune(_communeFiltre!)
            : await repository.listerRejeteesParCommune(_communeFiltre!);

    result.match(
      (failure) => setState(() => _errorText = failure.message),
      (liste) => setState(() => _transactions = liste),
    );

    setState(() => _loading = false);
  }

  Color _statutColor(String statut) {
    switch (statut) {
      case 'VALIDEE':
        return Colors.green;
      case 'REJETEE':
        return Colors.red;
      default:
        return Colors.orange;
    }
  }

  String _statutLabel(String statut) {
    switch (statut) {
      case 'VALIDEE':
        return 'Validée';
      case 'REJETEE':
        return 'Rejetée';
      default:
        return 'En attente';
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des transactions'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loading ? null : _charger,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CommuneDropdown(
                  label: 'Filtrer par commune (requis pour filtrer par statut)',
                  initialValue: _communeFiltre,
                  onChanged: (id) {
                    setState(() {
                      _communeFiltre = id;
                      _statutFiltre = null;
                    });
                    _charger();
                  },
                ),
                const SizedBox(height: 8),
                if (_communeFiltre != null)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ChoiceChip(
                          label: const Text('Toutes'),
                          selected: _statutFiltre == null,
                          onSelected: (_) {
                            setState(() => _statutFiltre = null);
                            _charger();
                          },
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text('En attente'),
                          selected: _statutFiltre == 'EN_ATTENTE_VALIDATION',
                          selectedColor: Colors.orange.withOpacity(0.2),
                          onSelected: (_) {
                            setState(() => _statutFiltre = 'EN_ATTENTE_VALIDATION');
                            _charger();
                          },
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text('Rejetées'),
                          selected: _statutFiltre == 'REJETEE',
                          selectedColor: Colors.red.withOpacity(0.2),
                          onSelected: (_) {
                            setState(() => _statutFiltre = 'REJETEE');
                            _charger();
                          },
                        ),
                      ],
                    ),
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
                          child: Text(
                            _errorText!,
                            style: const TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : _transactions.isEmpty
                        ? const Center(child: Text('Aucune transaction trouvée.'))
                        : RefreshIndicator(
                            onRefresh: _charger,
                            child: ListView.separated(
                              itemCount: _transactions.length,
                              separatorBuilder: (_, __) => const Divider(height: 1),
                              itemBuilder: (context, index) {
                                final t = _transactions[index];
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: _statutColor(t.statut).withOpacity(0.15),
                                    child: Icon(Icons.receipt_long, color: _statutColor(t.statut)),
                                  ),
                                  title: Text('${_typeLabel(t.typeTransaction)} — Parcelle #${t.parcelleId}'),
                                  subtitle: Text(
                                    t.montant != null
                                        ? '${t.montant!.toStringAsFixed(0)} GNF'
                                        : 'Montant non renseigné',
                                  ),
                                  trailing: Chip(
                                    label: Text(
                                      _statutLabel(t.statut),
                                      style: const TextStyle(fontSize: 11),
                                    ),
                                    backgroundColor: _statutColor(t.statut).withOpacity(0.15),
                                    padding: EdgeInsets.zero,
                                  ),
                                  onTap: () async {
                                    final changed = await Navigator.of(context).push<bool>(
                                      MaterialPageRoute(
                                        builder: (_) => TransactionDetailScreen(id: t.id),
                                      ),
                                    );
                                    if (changed == true) _charger();
                                  },
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
