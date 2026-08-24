import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/features/litige_management/data/litige_repository.dart';
import 'package:porhe_foncier_app_23072026/features/litige_management/presentation/litige_providers.dart';

/// Unlike Frais/Alerte, obtenirLitigeParId genuinely exists and
/// selects every field this screen needs — a real fetch, not data
/// reused from the list screen.
class LitigeDetailScreen extends ConsumerStatefulWidget {
  const LitigeDetailScreen({super.key, required this.id});
  final int id;

  @override
  ConsumerState<LitigeDetailScreen> createState() => _LitigeDetailScreenState();
}

class _LitigeDetailScreenState extends ConsumerState<LitigeDetailScreen> {
  bool _loading = true;
  String? _errorText;
  LitigeDetail? _detail;

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
    final result = await ref.read(litigeRepositoryProvider).obtenirDetail(widget.id);
    result.match(
      (f) => setState(() => _errorText = f.message),
      (d) => setState(() => _detail = d),
    );
    setState(() => _loading = false);
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
      appBar: AppBar(title: const Text('Détail du litige')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _errorText != null
              ? Center(child: Text(_errorText!, style: const TextStyle(color: Colors.red)))
              : _detail == null
                  ? const Center(child: Text('Litige introuvable.'))
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
                                libelleStatutLitige(_detail!.statut),
                                style: TextStyle(
                                  color: _statutColor(_detail!.statut),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text('Parcelle : #${_detail!.parcelleId}'),
                          Text('Plaignant : #${_detail!.plaignantId}'),
                          if (_detail!.transactionFonciereId != null)
                            Text('Transaction liée : #${_detail!.transactionFonciereId}'),
                          const SizedBox(height: 16),
                          const Text('Motif', style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text(_detail!.motif),
                          if (_detail!.resolution != null) ...[
                            const SizedBox(height: 16),
                            Text(
                              _detail!.statut == 'REJETE' ? 'Motif de rejet' : 'Résolution',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(_detail!.resolution!),
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
