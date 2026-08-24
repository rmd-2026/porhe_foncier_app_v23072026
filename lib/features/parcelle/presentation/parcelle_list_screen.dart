import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/features/parcelle/data/parcelle_repository.dart';
import 'package:porhe_foncier_app_23072026/features/parcelle/presentation/parcelle_detail_screen.dart';
import 'package:porhe_foncier_app_23072026/features/parcelle/presentation/parcelle_providers.dart';

/// Owner-scoped list -- shows only the signed-in user's own parcels
/// via listerParcellesParUtilisateur. The Admin equivalent
/// (commune-scoped, with validate/reject bulk visibility) is a
/// separate screen deliberately not built in this part.
class ParcelleListScreen extends ConsumerStatefulWidget {
  const ParcelleListScreen({super.key});

  @override
  ConsumerState<ParcelleListScreen> createState() => _ParcelleListScreenState();
}

class _ParcelleListScreenState extends ConsumerState<ParcelleListScreen> {
  bool _loading = true;
  String? _errorText;
  List<ParcelleResume> _parcelles = [];

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

    final result = await ref.read(parcelleRepositoryProvider).listerMesParcelles();

    result.match(
      (f) => setState(() => _errorText = f.message),
      (parcelles) => setState(() => _parcelles = parcelles),
    );

    setState(() => _loading = false);
  }

  Color _couleurStatut(String statut) {
    switch (statut) {
      case 'VALIDEE':
        return Colors.green;
      case 'REJETEE':
        return Colors.red;
      case 'ENATTENTEVALIDATION':
      default:
        return Colors.orange;
    }
  }

  String _libelleStatut(String statut) {
    switch (statut) {
      case 'VALIDEE':
        return 'Validée';
      case 'REJETEE':
        return 'Rejetée';
      case 'ENATTENTEVALIDATION':
      default:
        return 'En attente';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mes parcelles')),
      body: RefreshIndicator(
        onRefresh: _charger,
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : _errorText != null
                ? Center(child: Text(_errorText!, style: const TextStyle(color: Colors.red)))
                : _parcelles.isEmpty
                    ? ListView(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(32),
                            child: Text(
                              'Aucune parcelle enregistrée pour le moment.',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )
                    : ListView.builder(
                        itemCount: _parcelles.length,
                        itemBuilder: (context, index) {
                          final p = _parcelles[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: _couleurStatut(p.statut).withOpacity(0.15),
                              child: Icon(Icons.map_outlined, color: _couleurStatut(p.statut)),
                            ),
                            title: Text(p.codeParcelle),
                            subtitle: Text(
                              '${p.superficieM2 != null ? '${p.superficieM2} m²' : 'Superficie non renseignée'} — ${_libelleStatut(p.statut)}',
                            ),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () async {
                              await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => ParcelleDetailScreen(parcelleId: p.id),
                                ),
                              );
                              _charger();
                            },
                          );
                        },
                      ),
      ),
    );
  }
}
