import 'package:flutter/material.dart';

/// Pure scaffolding — shown while Firebase Auth's initial state
/// resolves (main.dart's authStateProvider is loading) or while
/// RoleRouter is fetching profile/role data after sign-in. No
/// business logic belongs here.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.map_outlined, size: 64, color: Colors.teal),
            SizedBox(height: 16),
            Text(
              'Porhe Foncier',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
