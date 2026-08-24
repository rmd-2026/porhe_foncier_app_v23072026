import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/features/auth/presentation/auth_providers.dart';

/// Signup philosophy per the Auth Rules: minimal friction, progressive
/// disclosure. Nom and prénom are collected as two SEPARATE fields
/// (no client-side name-splitting heuristic) alongside e-mail, mot de
/// passe, confirmation, and an OPTIONAL téléphone. Civilité, date de
/// naissance, adresse, pièce d'identité are deliberately absent here
/// and deferred to the post-signup Profile Completion screen.
class InscriptionScreen extends ConsumerStatefulWidget {
  const InscriptionScreen({super.key});

  @override
  ConsumerState<InscriptionScreen> createState() => _InscriptionScreenState();
}

class _InscriptionScreenState extends ConsumerState<InscriptionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _emailController = TextEditingController();
  final _motDePasseController = TextEditingController();
  final _confirmationController = TextEditingController();
  final _telephoneController = TextEditingController();
  bool _loading = false;
  String? _errorText;
  bool _motDePasseVisible = false;

  @override
  void dispose() {
    _nomController.dispose();
    _prenomController.dispose();
    _emailController.dispose();
    _motDePasseController.dispose();
    _confirmationController.dispose();
    _telephoneController.dispose();
    super.dispose();
  }

  Future<void> _inscrire() async {
    if (!_formKey.currentState!.validate()) return;

    if (_motDePasseController.text != _confirmationController.text) {
      setState(() => _errorText = 'Les mots de passe ne correspondent pas.');
      return;
    }

    setState(() {
      _loading = true;
      _errorText = null;
    });

    final result = await ref.read(authRepositoryProvider).inscrireParEmail(
          nom: _nomController.text.trim(),
          prenom: _prenomController.text.trim(),
          email: _emailController.text.trim(),
          motDePasse: _motDePasseController.text,
          telephone: _telephoneController.text.trim().isEmpty
              ? null
              : _telephoneController.text.trim(),
        );

    result.match(
      (f) => setState(() => _errorText = f.message),
      // No manual navigation needed — creating the Firebase user
      // triggers authStateProvider, and main.dart rebuilds into
      // RoleRouter automatically. Just pop this screen so the
      // Connexion screen underneath isn't left on the stack.
      (_) {
        if (mounted) Navigator.of(context).pop();
      },
    );

    if (mounted) setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Créer un compte')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (_errorText != null) ...[
                  Text(_errorText!, style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 12),
                ],
                TextFormField(
                  controller: _prenomController,
                  decoration: const InputDecoration(labelText: 'Prénom(s)'),
                  textCapitalization: TextCapitalization.words,
                  validator: (v) => (v == null || v.trim().isEmpty) ? 'Champ obligatoire' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _nomController,
                  decoration: const InputDecoration(labelText: 'Nom'),
                  textCapitalization: TextCapitalization.words,
                  validator: (v) => (v == null || v.trim().isEmpty) ? 'Champ obligatoire' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return 'Champ obligatoire';
                    if (!v.contains('@')) return 'E-mail invalide';
                    return null;
                  },
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
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Champ obligatoire';
                    if (v.length < 6) return '6 caractères minimum';
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _confirmationController,
                  decoration: const InputDecoration(labelText: 'Confirmer le mot de passe'),
                  obscureText: !_motDePasseVisible,
                  validator: (v) => (v == null || v.isEmpty) ? 'Champ obligatoire' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _telephoneController,
                  decoration: const InputDecoration(
                    labelText: 'Téléphone (optionnel)',
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _loading ? null : _inscrire,
                  child: _loading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('S\'inscrire'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
