import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/features/admin/presentation/admin_home_screen.dart';
import 'package:porhe_foncier_app_23072026/features/app_shell/presentation/agent_shell_screen.dart';
import 'package:porhe_foncier_app_23072026/features/app_shell/presentation/owner_shell_screen.dart';
import 'package:porhe_foncier_app_23072026/features/app_shell/presentation/splash_screen.dart';
import 'package:porhe_foncier_app_23072026/features/auth/presentation/correction_nom_screen.dart';

/// Implements the Authentication & Profile Lifecycle Rules' login
/// sequence: upsertUtilisateurParFirebaseUid -> obtenirProfilParFirebaseUid
/// -> obtenirRoleParUtilisateurId -> route by NomRole.
///
/// CONFIRMED against schema.gql: NomRole carries the underscore --
/// AGENT, ADMIN_COMMUNE, ADMIN_GLOBAL, PROPRIETAIRE.
///
/// CHANGE: AdminHomeScreen now receives the resolved NomRole string
/// as a constructor parameter, instead of being a bare const
/// widget. This closes the RBAC gap where every management screen
/// reachable from AdminHomeScreen (Parcelle, Utilisateur,
/// Transaction, etc.) had no idea what role the viewer actually had
/// -- RoleRouter already does this exact resolution to decide to
/// route here at all, so passing it down avoids a duplicate
/// obtenirRoleParUtilisateurId call and gives every downstream
/// screen a single, already-verified source of truth.
class RoleRouter extends ConsumerStatefulWidget {
  const RoleRouter({super.key, required this.user});
  final User user;

  @override
  ConsumerState<RoleRouter> createState() => _RoleRouterState();
}

class _RoleRouterState extends ConsumerState<RoleRouter> {
  String? _errorText;
  Widget? _destination;

  @override
  void initState() {
    super.initState();
    _resoudre();
  }

  Future<void> _resoudre() async {
    final connector = PorheFoncier23072026Connector.instance;

    try {
      await connector
          .upsertUtilisateurParFirebaseUid(firebaseUid: widget.user.uid)
          .execute();

      final profilResult =
          await connector.obtenirProfilParFirebaseUid(firebaseUid: widget.user.uid).execute();
      final profil = profilResult.data.utilisateur;
      if (profil == null) {
        setState(() => _errorText = 'Profil introuvable après création.');
        return;
      }

      final nomVide = (profil.nom ?? '').trim().isEmpty;
      final prenomVide = (profil.prenom ?? '').trim().isEmpty;

      final roleResult =
          await connector.obtenirRoleParUtilisateurId(utilisateurId: profil.id).execute();
      final role = roleResult.data.utilisateurRole;

      final estPremierTouchePhone = nomVide && prenomVide && role == null;

      if ((nomVide != prenomVide) || estPremierTouchePhone) {
        setState(() {
          _destination = CorrectionNomScreen(
            prenomInitial: profil.prenom ?? '',
            onTermine: () {
              setState(() => _destination = null);
              _resoudre();
            },
          );
        });
        return;
      }

      if (role == null) {
        await connector
            .assignerRoleUtilisateurParDefaut(utilisateurId: profil.id)
            .execute();
        setState(() => _destination = const OwnerShellScreen());
        return;
      }

      final nomRole = role.nomRole.stringValue;
      switch (nomRole) {
        case 'AGENT':
          setState(() => _destination = const AgentShellScreen());
          break;
        case 'ADMIN_COMMUNE':
        case 'ADMIN_GLOBAL':
          setState(() => _destination = AdminHomeScreen(
                nomRole: nomRole,
                communeId: role.communeId,
              ));
          break;
        case 'PROPRIETAIRE':
        default:
          setState(() => _destination = const OwnerShellScreen());
      }
    } catch (e) {
      setState(() => _errorText = 'Erreur lors de la résolution du profil : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_errorText != null) {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(_errorText!, style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() => _errorText = null);
                    _resoudre();
                  },
                  child: const Text('Réessayer'),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return _destination ?? const SplashScreen();
  }
}
