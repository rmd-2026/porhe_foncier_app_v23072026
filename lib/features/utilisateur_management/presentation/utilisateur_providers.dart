import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/features/utilisateur_management/data/utilisateur_repository.dart';

final utilisateurRepositoryProvider = Provider<UtilisateurRepository>((ref) {
  return UtilisateurRepository(
    PorheFoncier23072026Connector.instance,
    FirebaseAuth.instance,
  );
});

/// Currently selected statut filter on the list screen. `null` means
/// "tous" (no filter, uses listerTousUtilisateurs).
final statutFiltreProvider = StateProvider<String?>((ref) => null);
