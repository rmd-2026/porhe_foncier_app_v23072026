import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/core/reference_dropdowns.dart';
import 'package:porhe_foncier_app_23072026/features/parcelle_management/data/parcelle_repository.dart';
import 'package:porhe_foncier_app_23072026/features/parcelle_management/presentation/parcelle_detail_screen.dart';
import 'package:porhe_foncier_app_23072026/features/parcelle_management/presentation/parcelle_providers.dart';

const List<String> _statutOptions = ['EN_ATTENTE_VALIDATION', 'VALIDEE', 'REJETEE'];

class ParcelleListScreen extends ConsumerStatefulWidget {
  const ParcelleListScreen({super.key});

  @override
  ConsumerState<ParcelleListScreen> createState() => _ParcelleListScreenState();
}

class _ParcelleListScreenState extends ConsumerState<ParcelleListScreen> {
  bool _loading = true;
  String? _errorText;
  List<ParcelleSummary> _parcelles = [];

  // Statut filtering requires a commune (listerParcellesParStatut has
  // no unfiltered-by-commune variant) — null means "toutes les
  // communes, aucun filtre de statut" via listerToutesParcelles.
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

    final repository = ref.read(parcelleRepositoryProvider);
    final result = (_communeFiltre != null && _statutFiltre != null)
        ? await repository.listerParStatut(
            communeId: _communeFiltre!,
            statut: _statutFiltre!,
          )
        : await repository.listerToutes();

    result.match(
      (failure) => setState(() => _errorText = failure.message),
      (liste) => setState(() => _parcelles = liste),
    );

    setState(() => _loading = false);
  }

  Color _statutColor(String statut) {
    switch (statut) {
      case 'VALIDEE':
        return Colors.green;
      case 'REJETEE':
        return Colors.red;
      case 'EN_ATTENTE_VALIDATION':
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
      case 'EN_ATTENTE_VALIDATION':
      default:
        return 'En attente';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des parcelles'),
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
                          label: const Text('Tous statuts'),
                          selected: _statutFiltre == null,
                          onSelected: (_) {
                            setState(() => _statutFiltre = null);
                            _charger();
                          },
                        ),
                        const SizedBox(width: 8),
                        ..._statutOptions.map(
                          (statut) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ChoiceChip(
                              label: Text(_statutLabel(statut)),
                              selected: _statutFiltre == statut,
                              selectedColor: _statutColor(statut).withOpacity(0.2),
                              onSelected: (_) {
                                setState(() => _statutFiltre = statut);
                                _charger();
                              },
                            ),
                          ),
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
                    : _parcelles.isEmpty
                        ? const Center(child: Text('Aucune parcelle trouvée.'))
                        : RefreshIndicator(
                            onRefresh: _charger,
                            child: ListView.separated(
                              itemCount: _parcelles.length,
                              separatorBuilder: (_, __) => const Divider(height: 1),
                              itemBuilder: (context, index) {
                                final p = _parcelles[index];
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: _statutColor(p.statut).withOpacity(0.15),
                                    child: Icon(Icons.map, color: _statutColor(p.statut)),
                                  ),
                                  title: Text(p.codeParcelle),
                                  subtitle: Text('ID Utilisateur : ${p.utilisateurId}'),
                                  trailing: Chip(
                                    label: Text(
                                      _statutLabel(p.statut),
                                      style: const TextStyle(fontSize: 11),
                                    ),
                                    backgroundColor: _statutColor(p.statut).withOpacity(0.15),
                                    padding: EdgeInsets.zero,
                                  ),
                                  onTap: () async {
                                    final changed = await Navigator.of(context).push<bool>(
                                      MaterialPageRoute(
                                        builder: (_) => ParcelleDetailScreen(id: p.id),
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
