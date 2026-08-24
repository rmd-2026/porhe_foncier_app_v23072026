import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

import 'features/auth/presentation/connexion_screen.dart';
import 'firebase_options.dart';
import 'core/app_theme.dart';
import 'features/app_shell/presentation/dev_menu_screen.dart';
import 'features/app_shell/presentation/role_router.dart';
import 'features/app_shell/presentation/splash_screen.dart';
import 'features/auth/presentation/auth_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );

  runApp(const ProviderScope(child: PorheFoncierApp()));
}

class PorheFoncierApp extends ConsumerWidget {
  const PorheFoncierApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return MaterialApp(
      title: 'Porhe Foncier',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      // Phase 6 will replace the `user == null` branch with a real
      // Connexion/Inscription screen. Until then, an unauthenticated
      // user lands on the Dev Menu instead of a real login form —
      // this is scaffolding, not a substitute for Phase 6.
      home: authState.when(
        data: (user) => user == null
            ? const ConnexionScreen()
            : RoleRouter(user: user),
        loading: () => const SplashScreen(),
        error: (error, _) => Scaffold(
          body: Center(child: Text('Erreur d\'authentification : $error')),
        ),
      ),
    );
  }
}
