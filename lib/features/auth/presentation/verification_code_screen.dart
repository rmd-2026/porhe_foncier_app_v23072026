import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/features/auth/presentation/auth_providers.dart';

/// Step 2 of phone auth. No manual navigation on success -- exactly
/// like every other sign-in method in this module, authStateProvider
/// picks up the sign-in and main.dart rebuilds into RoleRouter, which
/// decides (including whether CorrectionNomScreen is needed for a
/// first-time phone signup with no name data at all).
class VerificationCodeScreen extends ConsumerStatefulWidget {
  const VerificationCodeScreen({
    super.key,
    required this.verificationId,
    required this.numeroTelephone,
  });

  final String verificationId;
  final String numeroTelephone;

  @override
  ConsumerState<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends ConsumerState<VerificationCodeScreen> {
  final _codeController = TextEditingController();
  bool _loading = false;
  String? _errorText;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _confirmer() async {
    if (_codeController.text.trim().length < 6) {
      setState(() => _errorText = 'Entrez le code à 6 chiffres.');
      return;
    }

    setState(() {
      _loading = true;
      _errorText = null;
    });

    final result = await ref.read(authRepositoryProvider).confirmerCodeTelephone(
          verificationId: widget.verificationId,
          smsCode: _codeController.text.trim(),
        );

    result.match(
      (f) => setState(() => _errorText = f.message),
      (_) {},
    );

    if (mounted) setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vérification')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Un code a été envoyé au ${widget.numeroTelephone}'),
              const SizedBox(height: 24),
              if (_errorText != null) ...[
                Text(_errorText!, style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 12),
              ],
              TextField(
                controller: _codeController,
                decoration: const InputDecoration(labelText: 'Code à 6 chiffres'),
                keyboardType: TextInputType.number,
                maxLength: 6,
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _loading ? null : _confirmer,
                child: _loading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Vérifier'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
