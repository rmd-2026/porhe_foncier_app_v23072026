import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:porhe_foncier_app_23072026/features/profil/presentation/profil_screen.dart';

import '../../parcelle_management/presentation/parcelle_list_screen.dart';

/// Empty shell for the owner portal (Propriétaire role), now with a
/// "Profil" entry point wired per Phase 7 -- on-demand access only,
/// no automatic nudge toward profile completion. Parcel view/
/// history/visual-monitoring/subscription screens still belong to
/// later phases.
class OwnerShellScreen extends StatelessWidget {
  const OwnerShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Porhe Foncier — Espace propriétaire'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            tooltip: 'Mon profil',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ProfilScreen()),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.map_outlined),
            tooltip: 'Mes parcelles',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ParcelleListScreen()),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (context.mounted) {
                Navigator.of(context).popUntil((route) => route.isFirst);
              }
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Espace propriétaire — à construire dans les phases suivantes.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
