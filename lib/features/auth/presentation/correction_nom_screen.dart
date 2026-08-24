import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/features/auth/presentation/auth_providers.dart';

/// Minimal, non-blocking correction step shown ONCE right after a
/// first-time Google sign-in. Not the full Profile Completion screen
/// (no civilité/date de naissance/adresse here) — just closes the gap
/// where Google's displayName landed entirely in `prenom` with `nom`
/// left blank. Skippable via "Continuer" using the pre-filled values,
/// matching the non-blocking philosophy used elsewhere in Auth.
class CorrectionNomScreen extends ConsumerStatefulWidget {
  const CorrectionNomScreen({
    super.key,
    required this.prenomInitial,
    required this.onTermine,
  });

  final String prenomInitial;
  final VoidCallback onTermine;

  @override
  ConsumerState<CorrectionNomScreen> createState() => _CorrectionNomScreenState();
}

class _CorrectionNomScreenState extends ConsumerState<CorrectionNomScreen> {
  late final TextEditingController _prenomController =
      TextEditingController(text: widget.prenomInitial);
  final TextEditingController _nomController = TextEditingController();
  bool _loading = false;
  String? _errorText;

  @override
  void dispose() {
    _prenomController.dispose();
    _nomController.dispose();
    super.dispose();
  }

  Future<void> _valider() async {
    setState(() {
      _loading = true;
      _errorText = null;
    });

    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      setState(() {
        _loading = false;
        _errorText = 'Session invalide.';
      });
      return;
    }

    final result = await ref.read(authRepositoryProvider).corrigerNomPrenom(
          firebaseUid: uid,
          nom: _nomController.text,
          prenom: _prenomController.text,
        );

    result.match(
      (f) => setState(() => _errorText = f.message),
      (_) => widget.onTermine(),
    );

    if (mounted) setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vérifiez votre nom')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Google nous a transmis votre nom sous un seul champ. '
                'Vérifiez et complétez-le ci-dessous.',
              ),
              const SizedBox(height: 24),
              if (_errorText != null) ...[
                Text(_errorText!, style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 12),
              ],
              TextFormField(
                controller: _prenomController,
                decoration: const InputDecoration(labelText: 'Prénom(s)'),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _nomController,
                decoration: const InputDecoration(labelText: 'Nom'),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _loading ? null : _valider,
                child: _loading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Continuer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
