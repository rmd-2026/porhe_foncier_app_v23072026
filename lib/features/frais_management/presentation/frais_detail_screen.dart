import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/features/frais_management/data/frais_repository.dart';
import 'package:porhe_foncier_app_23072026/features/frais_management/presentation/frais_providers.dart';

/// Real fetch via obtenirFraisParId — replaces the earlier version
/// that reused list-screen data and could never show motifRejet.
class FraisDetailScreen extends ConsumerStatefulWidget {
  const FraisDetailScreen({super.key, required this.id});
  final int id;

  @override
  ConsumerState<FraisDetailScreen> createState() => _FraisDetailScreenState();
}

class _FraisDetailScreenState extends ConsumerState<FraisDetailScreen> {
  bool _loading = true;
  String? _errorText;
  FraisDetail? _detail;

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
    final result = await ref.read(fraisRepositoryProvider).obtenirDetail(widget.id);
    result.match(
      (f) => setState(() => _errorText = f.message),
      (d) => setState(() => _detail = d),
    );
    setState(() => _loading = false);
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
      appBar: AppBar(title: const Text('Détail du frais')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _errorText != null
              ? Center(child: Text(_errorText!, style: const TextStyle(color: Colors.red)))
              : _detail == null
                  ? const Center(child: Text('Frais introuvable.'))
                  : Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.circle, size: 10, color: _statutColor(_detail!.statut)),
                              const SizedBox(width: 8),
                              Text(
                                libelleStatutFrais(_detail!.statut),
                                style: TextStyle(
                                  color: _statutColor(_detail!.statut),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(libelleTypeFrais(_detail!.typeFrais),
                              style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(height: 8),
                          Text('Montant : ${_detail!.montant.toStringAsFixed(0)} GNF'),
                          Text('Parcelle : #${_detail!.parcelleId}'),
                          if (_detail!.motifRejet != null) ...[
                            const SizedBox(height: 16),
                            Text(
                              _detail!.statut == 'REJETE' ? 'Motif de rejet' : 'Motif d\'annulation',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(_detail!.motifRejet!),
                          ],
                          const SizedBox(height: 16),
                          Text(
                            'Créé le ${_detail!.createdAt.split('T').first} — '
                            'Mis à jour le ${_detail!.updatedAt.split('T').first}',
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
    );
  }
}
