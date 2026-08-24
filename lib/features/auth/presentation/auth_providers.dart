import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/features/auth/data/auth_repository.dart';

final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    FirebaseAuth.instance,
    PorheFoncier23072026Connector.instance,
    GoogleSignIn(),
  );
});
