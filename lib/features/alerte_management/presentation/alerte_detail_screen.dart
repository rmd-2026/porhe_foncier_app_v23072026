import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/features/alerte_management/data/alerte_repository.dart';
import 'package:porhe_foncier_app_23072026/features/alerte_management/presentation/alerte_providers.dart';

/// Real fetch via obtenirAlerteParId — replaces the earlier version
/// that reused list-screen data and could never show message.
class AlerteDetailScreen extends ConsumerStatefulWidget {
  const AlerteDetailScreen({super.key, required this.id});
  final int id;

  @override
  ConsumerState<AlerteDetailScreen> createState() => _AlerteDetailScreenState();
}

class _AlerteDetailScreenState extends ConsumerState<AlerteDetailScreen> {
  bool _loading = true;
  String? _errorText;
  AlerteDetail? _detail;

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
    final result = await ref.read(alerteRepositoryProvider).obtenirDetail(widget.id);
    result.match(
      (f) => setState(() => _errorText = f.message),
      (d) => setState(() => _detail = d),
    );
    setState(() => _loading = false);
  }

  Future<void> _marquerLue() async {
    if (_detail == null) return;
    final result = await ref.read(alerteRepositoryProvider).marquerLue(id: _detail!.id);
    result.match(
      (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(f.message))),
      (_) => _charger(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Détail de l\'alerte')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _errorText != null
              ? Center(child: Text(_errorText!, style: const TextStyle(color: Colors.red)))
              : _detail == null
                  ? const Center(child: Text('Alerte introuvable.'))
                  : Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                _detail!.lue ? Icons.notifications_none : Icons.notifications_active,
                                color: _detail!.lue ? Colors.grey : Colors.orange,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _detail!.lue ? 'Lue' : 'Non lue',
                                style: TextStyle(
                                  color: _detail!.lue ? Colors.grey : Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(libelleTypeAlerte(_detail!.typeAlerte),
                              style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(height: 8),
                          Text('Utilisateur : #${_detail!.utilisateurId}'),
                          if (_detail!.parcelleId != null) Text('Parcelle : #${_detail!.parcelleId}'),
                          const SizedBox(height: 16),
                          const Text('Message', style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text(_detail!.message),
                          const SizedBox(height: 16),
                          Text(
                            'Créée le ${_detail!.createdAt.split('T').first}',
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          if (!_detail!.lue) ...[
                            const SizedBox(height: 24),
                            ElevatedButton.icon(
                              onPressed: _marquerLue,
                              icon: const Icon(Icons.check),
                              label: const Text('Marquer lue'),
                            ),
                          ],
                        ],
                      ),
                    ),
    );
  }
}
