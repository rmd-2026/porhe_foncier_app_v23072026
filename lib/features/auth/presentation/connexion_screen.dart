import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/features/auth/presentation/auth_providers.dart';
import 'package:porhe_foncier_app_23072026/features/auth/presentation/inscription_screen.dart';

import 'numero_telephone_screen.dart';

/// Phone auth and email-link passwordless are added in a later part
/// of Phase 6.
///
/// Note: the Google button no longer inspects isNouveauCompte or
/// navigates manually after sign-in — that logic was racing against
/// authStateProvider's rebuild and using an unreliable SDK flag. The
/// "does this profile need correcting" decision now lives entirely in
/// RoleRouter, which is the widget that actually survives the
/// post-sign-in rebuild. This screen just triggers sign-in and lets
/// the auth-state stream take over, identical to email/password.
class ConnexionScreen extends ConsumerStatefulWidget {
  const ConnexionScreen({super.key});

  @override
  ConsumerState<ConnexionScreen> createState() => _ConnexionScreenState();
}

class _ConnexionScreenState extends ConsumerState<ConnexionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _motDePasseController = TextEditingController();
  bool _loading = false;
  String? _errorText;
  bool _motDePasseVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _motDePasseController.dispose();
    super.dispose();
  }

  Future<void> _connecter() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _loading = true;
      _errorText = null;
    });

    final result = await ref.read(authRepositoryProvider).connecterParEmail(
          email: _emailController.text.trim(),
          motDePasse: _motDePasseController.text,
        );

    result.match(
      (f) => setState(() => _errorText = f.message),
      (_) {},
    );

    if (mounted) setState(() => _loading = false);
  }

  Future<void> _connecterAvecGoogle() async {
    setState(() {
      _loading = true;
      _errorText = null;
    });

    final result = await ref.read(authRepositoryProvider).connecterAvecGoogle();

    // No navigation here — RoleRouter decides, including whether to
    // show CorrectionNomScreen, once authStateProvider rebuilds home.
    result.match(
      (f) => setState(() => _errorText = f.message),
      (_) {},
    );

    if (mounted) setState(() => _loading = false);
  }

  Future<void> _reinitialiserMotDePasse() async {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      setState(() => _errorText = 'Entrez votre e-mail pour réinitialiser le mot de passe.');
      return;
    }

    final result = await ref.read(authRepositoryProvider).envoyerEmailReinitialisation(email);
    result.match(
      (f) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(f.message))),
      (_) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('E-mail de réinitialisation envoyé.')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(Icons.map_outlined, size: 56, color: Colors.teal),
                  const SizedBox(height: 12),
                  Text(
                    'Porhe Foncier',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 32),
                  if (_errorText != null) ...[
                    Text(_errorText!, style: const TextStyle(color: Colors.red)),
                    const SizedBox(height: 12),
                  ],
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'E-mail'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (v) => (v == null || v.trim().isEmpty) ? 'Champ obligatoire' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _motDePasseController,
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      suffixIcon: IconButton(
                        icon: Icon(_motDePasseVisible ? Icons.visibility_off : Icons.visibility),
                        onPressed: () => setState(() => _motDePasseVisible = !_motDePasseVisible),
                      ),
                    ),
                    obscureText: !_motDePasseVisible,
                    validator: (v) => (v == null || v.isEmpty) ? 'Champ obligatoire' : null,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: _loading ? null : _reinitialiserMotDePasse,
                      child: const Text('Mot de passe oublié ?'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _loading ? null : _connecter,
                    child: _loading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Se connecter'),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text('ou'),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton.icon(
                    onPressed: _loading ? null : _connecterAvecGoogle,
                    icon: const Icon(Icons.g_mobiledata, size: 28),
                    label: const Text('Continuer avec Google'),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: _loading
                        ? null
                        : () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const NumeroTelephoneScreen()),
                    ),
                    icon: const Icon(Icons.phone_outlined),
                    label: const Text('Continuer avec le téléphone'),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: _loading
                        ? null
                        : () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => const InscriptionScreen()),
                            ),
                    child: const Text('Pas encore de compte ? S\'inscrire'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
