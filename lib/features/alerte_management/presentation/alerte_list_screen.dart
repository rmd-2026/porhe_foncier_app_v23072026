import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/features/alerte_management/data/alerte_repository.dart';
import 'package:porhe_foncier_app_23072026/features/alerte_management/presentation/alerte_providers.dart';

import 'alerte_detail_screen.dart';

const List<String> _typesAlerte = [
  'ACTIVITE_SUSPECTE',
  'ECHEANCE_TAXE',
  'NOUVELLE_TRANSACTION',
  'SUIVI_VISUEL',
  'AUTRE',
];

class AlerteListScreen extends ConsumerStatefulWidget {
  const AlerteListScreen({super.key});

  @override
  ConsumerState<AlerteListScreen> createState() => _AlerteListScreenState();
}

class _AlerteListScreenState extends ConsumerState<AlerteListScreen> {
  bool _loading = true;
  String? _errorText;
  List<AlerteSummary> _alertes = [];
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
    final result = await ref.read(alerteRepositoryProvider).listerToutes();
    result.match(
      (f) => setState(() => _errorText = f.message),
      (liste) => setState(() => _alertes = liste),
    );
    setState(() => _loading = false);
  }

  Future<void> _creer() async {
    final utilisateurIdController = TextEditingController();
    final parcelleIdController = TextEditingController();
    final messageController = TextEditingController();
    String type = 'AUTRE';

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Créer une alerte'),
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
                TextField(
                  controller: parcelleIdController,
                  decoration: const InputDecoration(labelText: 'ID Parcelle (optionnel)'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 12),
                InputDecorator(
                  decoration: const InputDecoration(labelText: 'Type'),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: type,
                      items: _typesAlerte
                          .map((t) => DropdownMenuItem(value: t, child: Text(libelleTypeAlerte(t))))
                          .toList(),
                      onChanged: (v) => setDialogState(() => type = v!),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: messageController,
                  decoration: const InputDecoration(labelText: 'Message'),
                  maxLines: 2,
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
                if (utilisateurIdController.text.trim().isEmpty ||
                    messageController.text.trim().isEmpty) {
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
    final utilisateurId = int.tryParse(utilisateurIdController.text.trim());
    if (utilisateurId == null) return;

    setState(() => _saving = true);
    final result = await ref.read(alerteRepositoryProvider).creer(
          utilisateurId: utilisateurId,
          parcelleId: int.tryParse(parcelleIdController.text.trim()),
          typeAlerte: type,
          message: messageController.text.trim(),
        );

    result.match(
      (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(f.message))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Alerte créée.')));
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Future<void> _marquerLue(AlerteSummary a) async {
    setState(() => _saving = true);
    final result = await ref.read(alerteRepositoryProvider).marquerLue(id: a.id);
    result.match(
      (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(f.message))),
      (_) => _charger(),
    );
    setState(() => _saving = false);
  }

  Future<void> _supprimer(AlerteSummary a) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Supprimer cette alerte ?'),
        content: const Text('Cette action est irréversible.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Retour'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Supprimer', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    setState(() => _saving = true);
    final result = await ref.read(alerteRepositoryProvider).supprimer(id: a.id);
    result.match(
      (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(f.message))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Alerte supprimée.')));
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des alertes'),
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
              : _alertes.isEmpty
                  ? const Center(child: Text('Aucune alerte trouvée.'))
                  : RefreshIndicator(
                      onRefresh: _charger,
                      child: ListView.separated(
                        itemCount: _alertes.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final a = _alertes[index];
                          return ListTile(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => AlerteDetailScreen(id: a.id)),
                            ),
                            leading: Icon(
                              a.lue ? Icons.notifications_none : Icons.notifications_active,
                              color: a.lue ? Colors.grey : Colors.orange,
                            ),
                            title: Text(libelleTypeAlerte(a.typeAlerte)),
                            subtitle: Text(
                              'Utilisateur #${a.utilisateurId ?? '?'}'
                              '${a.parcelleId != null ? ' — Parcelle #${a.parcelleId}' : ''}',
                            ),
                            trailing: PopupMenuButton<String>(
                              enabled: !_saving,
                              onSelected: (action) {
                                if (action == 'lue') _marquerLue(a);
                                if (action == 'supprimer') _supprimer(a);
                              },
                              itemBuilder: (context) => [
                                if (!a.lue)
                                  const PopupMenuItem(value: 'lue', child: Text('Marquer lue')),
                                const PopupMenuItem(
                                  value: 'supprimer',
                                  child: Text('Supprimer', style: TextStyle(color: Colors.red)),
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
