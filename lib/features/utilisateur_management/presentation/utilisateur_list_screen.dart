import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/features/utilisateur_management/data/utilisateur_repository.dart';
import 'package:porhe_foncier_app_23072026/features/utilisateur_management/presentation/utilisateur_detail_screen.dart';
import 'package:porhe_foncier_app_23072026/features/utilisateur_management/presentation/utilisateur_providers.dart';

const List<String> _statutOptions = ['NON_VERIFIE', 'ACTIF', 'DESACTIVE'];

class UtilisateurListScreen extends ConsumerStatefulWidget {
  const UtilisateurListScreen({super.key});

  @override
  ConsumerState<UtilisateurListScreen> createState() =>
      _UtilisateurListScreenState();
}

class _UtilisateurListScreenState extends ConsumerState<UtilisateurListScreen> {
  bool _loading = true;
  String? _errorText;
  List<UtilisateurSummary> _utilisateurs = [];

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

    final repository = ref.read(utilisateurRepositoryProvider);
    final statutFiltre = ref.read(statutFiltreProvider);

    final result = statutFiltre == null
        ? await repository.listerTous()
        : await repository.listerParStatut(statutFiltre);

    result.match(
      (failure) => setState(() => _errorText = failure.message),
      (liste) => setState(() => _utilisateurs = liste),
    );

    setState(() => _loading = false);
  }

  Color _statutColor(String statut) {
    switch (statut) {
      case 'ACTIF':
        return Colors.green;
      case 'DESACTIVE':
        return Colors.red;
      case 'NON_VERIFIE':
      default:
        return Colors.orange;
    }
  }

  String _statutLabel(String statut) {
    switch (statut) {
      case 'ACTIF':
        return 'Actif';
      case 'DESACTIVE':
        return 'Désactivé';
      case 'NON_VERIFIE':
      default:
        return 'Non vérifié';
    }
  }

  @override
  Widget build(BuildContext context) {
    final statutFiltre = ref.watch(statutFiltreProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des utilisateurs'),
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
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ChoiceChip(
                    label: const Text('Tous'),
                    selected: statutFiltre == null,
                    onSelected: (_) {
                      ref.read(statutFiltreProvider.notifier).state = null;
                      _charger();
                    },
                  ),
                  const SizedBox(width: 8),
                  ..._statutOptions.map(
                    (statut) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(_statutLabel(statut)),
                        selected: statutFiltre == statut,
                        selectedColor: _statutColor(statut).withOpacity(0.2),
                        onSelected: (_) {
                          ref.read(statutFiltreProvider.notifier).state = statut;
                          _charger();
                        },
                      ),
                    ),
                  ),
                ],
              ),
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
                    : _utilisateurs.isEmpty
                        ? const Center(child: Text('Aucun utilisateur trouvé.'))
                        : RefreshIndicator(
                            onRefresh: _charger,
                            child: ListView.separated(
                              itemCount: _utilisateurs.length,
                              separatorBuilder: (_, __) => const Divider(height: 1),
                              itemBuilder: (context, index) {
                                final u = _utilisateurs[index];
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor:
                                        _statutColor(u.statutCompte).withOpacity(0.15),
                                    child: Icon(Icons.person,
                                        color: _statutColor(u.statutCompte)),
                                  ),
                                  title: Text(u.nomAffiche),
                                  subtitle: Text(u.email ?? u.telephone ?? 'Aucun contact'),
                                  trailing: Chip(
                                    label: Text(
                                      _statutLabel(u.statutCompte),
                                      style: const TextStyle(fontSize: 11),
                                    ),
                                    backgroundColor:
                                        _statutColor(u.statutCompte).withOpacity(0.15),
                                    padding: EdgeInsets.zero,
                                  ),
                                  onTap: () async {
                                    final changed = await Navigator.of(context).push<bool>(
                                      MaterialPageRoute(
                                        builder: (_) => UtilisateurDetailScreen(
                                          firebaseUid: u.firebaseUid,
                                        ),
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
