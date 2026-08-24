import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:porhe_foncier_app_23072026/features/dev_dashboard/presentation/dev_dashboard_screen.dart';
import 'package:porhe_foncier_app_23072026/features/parcelle_management/presentation/parcelle_list_screen.dart';
import 'package:porhe_foncier_app_23072026/features/utilisateur_management/presentation/utilisateur_list_screen.dart';

import '../../abonnement_management/presentation/abonnement_list_screen.dart';
import '../../alerte_management/presentation/alerte_list_screen.dart';
import '../../frais_management/presentation/frais_list_screen.dart';
import '../../litige_management/presentation/litige_list_screen.dart';
import '../../paiement_management/presentation/paiement_list_screen.dart';
import '../../taxe_management/presentation/rapport_financier_screen.dart';
import '../../transaction_management/presentation/transaction_list_screen.dart';

/// Real product-feature entry point — lists management modules
/// (Utilisateurs, Parcelles, and future modules) as they're built.
/// This is the screen a real Admin shell will eventually route to;
/// the raw 102-endpoint Dev Dashboard is reachable from here too, but
/// only as a diagnostic/testing tool, never the other way around.
///
/// CHANGE: now receives nomRole ('ADMIN_COMMUNE' or 'ADMIN_GLOBAL')
/// and communeId (null for ADMIN_GLOBAL, set for ADMIN_COMMUNE) from
/// RoleRouter's already-verified role resolution. Every management
/// tile still routes both roles to the same list screen for now --
/// the actual write-action gating (Valider/Rejeter/Transférer) is
/// closed inside ParcelleDetailScreen in this pass, with the other
/// management screens (Utilisateur, Transaction, etc.) flagged as
/// needing the identical treatment in a following pass, not silently
/// treated as already covered.
class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key, required this.nomRole, this.communeId});

  final String nomRole;
  final int? communeId;

  Future<void> _seDeconnecter(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (context.mounted) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Administration — Porhe Foncier'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Se déconnecter',
            onPressed: () => _seDeconnecter(context),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              nomRole == 'ADMIN_GLOBAL' ? 'Administrateur global' : 'Administrateur commune',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Text(
              'Gestion',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.people, color: Colors.purple),
            title: const Text('Gestion des utilisateurs'),
            subtitle: const Text('Valider, désactiver, modifier un profil'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const UtilisateurListScreen()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.map, color: Colors.teal),
            title: const Text('Gestion des parcelles'),
            subtitle: const Text('Valider, rejeter, modifier une parcelle'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ParcelleListScreen()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.receipt_long, color: Colors.indigo),
            title: const Text('Gestion des transactions'),
            subtitle: const Text('Valider, rejeter une transaction foncière'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const TransactionListScreen()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.bar_chart, color: Colors.teal),
            title: const Text('Rapport financier'),
            subtitle: const Text('Totaux de taxes par commune'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const RapportFinancierScreen()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.card_membership, color: Colors.deepPurple),
            title: const Text('Gestion des abonnements'),
            subtitle: const Text('Créer, renouveler, annuler un abonnement'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AbonnementListScreen()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.payments, color: Colors.green),
            title: const Text('Gestion des paiements'),
            subtitle: const Text('Enregistrer, confirmer, annuler un paiement'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const PaiementListScreen()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.amber),
            title: const Text('Gestion des alertes'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AlerteListScreen()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.gavel, color: Colors.brown),
            title: const Text('Gestion des litiges'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const LitigeListScreen()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.receipt, color: Colors.cyan),
            title: const Text('Gestion des frais'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const FraisListScreen()),
            ),
          ),
          if (nomRole == 'ADMIN_GLOBAL') ...[
            const Divider(height: 32),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text(
                'Outils de développement',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.build, color: Colors.grey),
              title: const Text('Tableau de bord API (dev)'),
              subtitle: const Text('Test brut des 102 endpoints Data Connect'),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const DevDashboardScreen()),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
