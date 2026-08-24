import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/features/auth/presentation/auth_providers.dart';

/// Shown when the signed-in user's email isn't verified yet. Per the
/// Profile Completion rule ("never a hard gate — enforced at the
/// client/UI level"), this screen still lets the user continue past
/// it (see "Continuer sans vérifier") — email verification is
/// encouraged, not blocking, matching the same philosophy.
class VerificationEmailScreen extends ConsumerStatefulWidget {
  const VerificationEmailScreen({super.key, required this.onContinuer});
  final VoidCallback onContinuer;

  @override
  ConsumerState<VerificationEmailScreen> createState() => _VerificationEmailScreenState();
}

class _VerificationEmailScreenState extends ConsumerState<VerificationEmailScreen> {
  bool _envoiEnCours = false;
  String? _message;

  Future<void> _renvoyer() async {
    setState(() {
      _envoiEnCours = true;
      _message = null;
    });

    final result = await ref.read(authRepositoryProvider).renvoyerEmailVerification();
    result.match(
      (f) => setState(() => _message = f.message),
      (_) => setState(() => _message = 'E-mail de vérification renvoyé.'),
    );

    setState(() => _envoiEnCours = false);
  }

  Future<void> _verifierEtContinuer() async {
    await FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null && user.emailVerified) {
      widget.onContinuer();
    } else if (mounted) {
      setState(() => _message = 'E-mail toujours non vérifié.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance.currentUser?.email ?? '';

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.mark_email_unread_outlined, size: 56, color: Colors.orange),
                const SizedBox(height: 16),
                Text(
                  'Un e-mail de vérification a été envoyé à\n$email',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                if (_message != null) ...[
                  Text(_message!, style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 12),
                ],
                ElevatedButton(
                  onPressed: _verifierEtContinuer,
                  child: const Text('J\'ai vérifié mon e-mail'),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: _envoiEnCours ? null : _renvoyer,
                  child: _envoiEnCours
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Renvoyer l\'e-mail'),
                ),
                TextButton(
                  onPressed: widget.onContinuer,
                  child: const Text('Continuer sans vérifier'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
