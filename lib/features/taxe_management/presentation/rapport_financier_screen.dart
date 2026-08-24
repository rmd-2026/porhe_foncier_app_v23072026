import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/core/reference_dropdowns.dart';
import 'package:porhe_foncier_app_23072026/features/taxe_management/data/taxe_repository.dart';
import 'package:porhe_foncier_app_23072026/features/taxe_management/presentation/taxe_providers.dart';

class RapportFinancierScreen extends ConsumerStatefulWidget {
  const RapportFinancierScreen({super.key});

  @override
  ConsumerState<RapportFinancierScreen> createState() => _RapportFinancierScreenState();
}

class _RapportFinancierScreenState extends ConsumerState<RapportFinancierScreen> {
  int? _communeId;
  bool _loading = false;
  String? _errorText;
  RapportFinancier? _rapport;

  Future<void> _charger() async {
    if (_communeId == null) return;
    setState(() {
      _loading = true;
      _errorText = null;
    });

    final repository = ref.read(taxeRepositoryProvider);
    final result = await repository.obtenirRapportFinancier(_communeId!);

    result.match(
      (failure) => setState(() => _errorText = failure.message),
      (rapport) => setState(() => _rapport = rapport),
    );

    setState(() => _loading = false);
  }

  Widget _carteMontant(String label, double montant, Color couleur) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: couleur.withOpacity(0.08),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: couleur.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(fontSize: 11, color: couleur)),
            const SizedBox(height: 4),
            Text(
              '${montant.toStringAsFixed(0)} GNF',
              style: TextStyle(fontWeight: FontWeight.bold, color: couleur, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rapport financier')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CommuneDropdown(
              label: 'Commune',
              initialValue: _communeId,
              onChanged: (id) {
                setState(() {
                  _communeId = id;
                  _rapport = null;
                });
                _charger();
              },
            ),
            const SizedBox(height: 24),
            if (_loading) const Center(child: CircularProgressIndicator()),
            if (_errorText != null)
              Text(_errorText!, style: const TextStyle(color: Colors.red)),
            if (_rapport != null) ...[
              Text(
                '${_rapport!.nombreTaxes} taxe(s) au total',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  _carteMontant('Total dû', _rapport!.totalDu, Colors.blueGrey),
                  _carteMontant('Payé', _rapport!.totalPaye, Colors.green),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _carteMontant('En attente', _rapport!.totalEnAttente, Colors.orange),
                  _carteMontant('En retard', _rapport!.totalEnRetard, Colors.red),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
