import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:porhe_foncier_app_23072026/features/auth/presentation/auth_providers.dart';
import 'package:porhe_foncier_app_23072026/features/auth/presentation/verification_code_screen.dart';

/// Step 1 of phone auth. Uses intl_phone_field instead of any
/// hardcoded dial-code prefix: tapping the country-code segment opens
/// a searchable list of ALL countries with flags, and selecting one
/// auto-fills the dial code -- no assumption baked in about which
/// country the user is in. initialCountryCode only sets what's
/// pre-selected by DEFAULT (Guinea, since that's the app's primary
/// market) -- the user can change it to any country at any time.
class NumeroTelephoneScreen extends ConsumerStatefulWidget {
  const NumeroTelephoneScreen({super.key});

  @override
  ConsumerState<NumeroTelephoneScreen> createState() => _NumeroTelephoneScreenState();
}

class _NumeroTelephoneScreenState extends ConsumerState<NumeroTelephoneScreen> {
  String? _numeroComplet;
  bool _loading = false;
  String? _errorText;

  Future<void> _envoyerCode() async {
    if (_numeroComplet == null || _numeroComplet!.isEmpty) {
      setState(() => _errorText = 'Entrez votre numéro de téléphone.');
      return;
    }

    setState(() {
      _loading = true;
      _errorText = null;
    });

    final numeroComplet = _numeroComplet!;

    await ref.read(authRepositoryProvider).demarrerVerificationTelephone(
          numeroTelephone: numeroComplet,
          onCodeEnvoye: (verificationId) {
            if (!mounted) return;
            setState(() => _loading = false);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => VerificationCodeScreen(
                  verificationId: verificationId,
                  numeroTelephone: numeroComplet,
                ),
              ),
            );
          },
          onEchec: (message) {
            if (!mounted) return;
            setState(() {
              _loading = false;
              _errorText = message;
            });
          },
          onAutoVerificationReussie: () {
            if (!mounted) return;
            setState(() => _loading = false);
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Connexion par téléphone')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (_errorText != null) ...[
                Text(_errorText!, style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 12),
              ],
              IntlPhoneField(
                decoration: const InputDecoration(
                  labelText: 'Numéro de téléphone',
                  border: OutlineInputBorder(),
                ),
                // Default selection only -- tapping the flag/code
                // segment opens the full searchable country list,
                // the user is never locked to this choice.
                initialCountryCode: 'GN',
                onChanged: (phone) {
                  _numeroComplet = phone.completeNumber;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _loading ? null : _envoyerCode,
                child: _loading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Envoyer le code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
