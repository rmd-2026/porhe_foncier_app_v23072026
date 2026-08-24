import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:porhe_foncier_app_23072026/features/profil/data/profil_repository.dart';
import 'package:porhe_foncier_app_23072026/features/profil/presentation/profil_providers.dart';

const List<String> _civiliteValues = ['MONSIEUR', 'MADAME', 'MADEMOISELLE'];

/// On-demand profile view/edit screen, now covering the full field
/// set mettreAJourProfil accepts (per the admin-side screen's
/// confirmed usage): identity fields grouped in their own section,
/// plus a real Storage-backed photo picker/replace flow instead of
/// a raw URL text field.
class ProfilScreen extends ConsumerStatefulWidget {
  const ProfilScreen({super.key});

  @override
  ConsumerState<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends ConsumerState<ProfilScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = true;
  bool _saving = false;
  bool _uploadingPhoto = false;
  String? _errorText;
  ProfilDetail? _profil;

  late final TextEditingController _nomController;
  late final TextEditingController _prenomController;
  late final TextEditingController _telephoneController;
  late final TextEditingController _adresseController;
  late final TextEditingController _lieuNaissanceController;
  late final TextEditingController _nationaliteController;
  late final TextEditingController _numeroPieceController;
  String? _civilite;
  DateTime? _dateNaissance;
  String? _typePieceIdentite;
  DateTime? _pieceValideDe;
  DateTime? _pieceValideA;
  String? _photoUrl;

  @override
  void initState() {
    super.initState();
    _nomController = TextEditingController();
    _prenomController = TextEditingController();
    _telephoneController = TextEditingController();
    _adresseController = TextEditingController();
    _lieuNaissanceController = TextEditingController();
    _nationaliteController = TextEditingController();
    _numeroPieceController = TextEditingController();
    _charger();
  }

  @override
  void dispose() {
    _nomController.dispose();
    _prenomController.dispose();
    _telephoneController.dispose();
    _adresseController.dispose();
    _lieuNaissanceController.dispose();
    _nationaliteController.dispose();
    _numeroPieceController.dispose();
    super.dispose();
  }

  Future<void> _charger() async {
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

    final result = await ref.read(profilRepositoryProvider).obtenirProfil(uid);

    result.match(
      (f) => setState(() => _errorText = f.message),
      (profil) {
        _profil = profil;
        _nomController.text = profil.nom ?? '';
        _prenomController.text = profil.prenom ?? '';
        _telephoneController.text = profil.telephone ?? '';
        _adresseController.text = profil.adresse ?? '';
        _lieuNaissanceController.text = profil.lieuNaissance ?? '';
        _nationaliteController.text = profil.nationalite ?? '';
        _numeroPieceController.text = profil.numeroPieceIdentite ?? '';
        _civilite = profil.civilite;
        _typePieceIdentite = profil.typePieceIdentite;
        _photoUrl = profil.photoUrl;
        _dateNaissance =
            profil.dateNaissance == null ? null : DateTime.tryParse(profil.dateNaissance!);
        _pieceValideDe = profil.pieceIdentiteValideDe == null
            ? null
            : DateTime.tryParse(profil.pieceIdentiteValideDe!);
        _pieceValideA = profil.pieceIdentiteValideA == null
            ? null
            : DateTime.tryParse(profil.pieceIdentiteValideA!);
      },
    );

    setState(() => _loading = false);
  }

  Future<void> _enregistrer() async {
    if (!_formKey.currentState!.validate()) return;
    if (_profil == null) return;

    setState(() {
      _saving = true;
      _errorText = null;
    });

    final result = await ref.read(profilRepositoryProvider).mettreAJourProfil(
          firebaseUid: _profil!.firebaseUid,
          nom: _nomController.text.trim().isEmpty ? null : _nomController.text.trim(),
          prenom: _prenomController.text.trim().isEmpty ? null : _prenomController.text.trim(),
          civilite: _civilite,
          dateNaissance: _dateNaissance,
          lieuNaissance:
              _lieuNaissanceController.text.trim().isEmpty ? null : _lieuNaissanceController.text.trim(),
          nationalite:
              _nationaliteController.text.trim().isEmpty ? null : _nationaliteController.text.trim(),
          typePieceIdentite: _typePieceIdentite,
          numeroPieceIdentite:
              _numeroPieceController.text.trim().isEmpty ? null : _numeroPieceController.text.trim(),
          pieceIdentiteValideDe: _pieceValideDe,
          pieceIdentiteValideA: _pieceValideA,
          telephone:
              _telephoneController.text.trim().isEmpty ? null : _telephoneController.text.trim(),
          adresse: _adresseController.text.trim().isEmpty ? null : _adresseController.text.trim(),
        );

    result.match(
      (f) => setState(() => _errorText = f.message),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profil mis à jour.')),
        );
        _charger();
      },
    );

    if (mounted) setState(() => _saving = false);
  }

  Future<void> _changerPhoto() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery, imageQuality: 85);
    if (picked == null || _profil == null) return;

    setState(() {
      _uploadingPhoto = true;
      _errorText = null;
    });

    final bytes = await picked.readAsBytes();
    final pointIndex = picked.name.lastIndexOf('.');
    final extension = pointIndex != -1 ? picked.name.substring(pointIndex) : '.jpg';

    final result = await ref.read(profilRepositoryProvider).changerPhoto(
          firebaseUid: _profil!.firebaseUid,
          bytes: bytes,
          extensionOriginale: extension,
          ancienneUrl: _photoUrl,
        );

    result.match(
      (f) => setState(() => _errorText = f.message),
      (url) {
        setState(() => _photoUrl = url);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Photo mise à jour.')),
        );
      },
    );

    if (mounted) setState(() => _uploadingPhoto = false);
  }

  Future<DateTime?> _choisirDate({required DateTime? initial, required bool futureAllowed}) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final firstDate = DateTime(today.year - 100, today.month, today.day);
    final lastDate = futureAllowed ? DateTime(today.year + 30, today.month, today.day) : today;
    return showDatePicker(
      context: context,
      initialDate: initial ?? today,
      firstDate: firstDate,
      lastDate: lastDate,
    );
  }

  String _formatDate(DateTime? d) {
    if (d == null) return 'Sélectionner une date';
    return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  }

  List<String> _champsManquants() {
    if (_profil == null) return [];
    final manquants = <String>[];
    if (_nomController.text.trim().isEmpty) manquants.add('Nom');
    if (_prenomController.text.trim().isEmpty) manquants.add('Prénom');
    if (_telephoneController.text.trim().isEmpty) manquants.add('Téléphone');
    if (_adresseController.text.trim().isEmpty) manquants.add('Adresse');
    return manquants;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mon profil')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _profil == null
              ? Center(child: Text(_errorText ?? 'Profil introuvable.'))
              : SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _photoSection(),
                          const SizedBox(height: 16),
                          if (_champsManquants().isNotEmpty) _bannerIncomplet(),
                          if (_errorText != null) ...[
                            Text(_errorText!, style: const TextStyle(color: Colors.red)),
                            const SizedBox(height: 12),
                          ],
                          Text('E-mail', style: Theme.of(context).textTheme.labelMedium),
                          Text(_profil!.email ?? 'Non renseigné (compte téléphone)'),
                          const Text(
                            "L'e-mail est géré par Firebase Auth et ne peut pas être modifié ici.",
                            style: TextStyle(fontSize: 11, fontStyle: FontStyle.italic),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _prenomController,
                            decoration: const InputDecoration(labelText: 'Prénom(s)'),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _nomController,
                            decoration: const InputDecoration(labelText: 'Nom'),
                          ),
                          const SizedBox(height: 12),
                          _dropdown(
                            label: 'Civilité',
                            value: _civilite,
                            values: _civiliteValues,
                            onChanged: (v) => setState(() => _civilite = v),
                          ),
                          const SizedBox(height: 12),
                          _datePicker(
                            label: 'Date de naissance',
                            value: _dateNaissance,
                            onTap: () async {
                              final picked = await _choisirDate(initial: _dateNaissance, futureAllowed: false);
                              if (picked != null) setState(() => _dateNaissance = picked);
                            },
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _lieuNaissanceController,
                            decoration: const InputDecoration(labelText: 'Lieu de naissance'),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _nationaliteController,
                            decoration: const InputDecoration(labelText: 'Nationalité'),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _telephoneController,
                            decoration: const InputDecoration(labelText: 'Téléphone'),
                            keyboardType: TextInputType.phone,
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _adresseController,
                            decoration: const InputDecoration(labelText: 'Adresse'),
                            maxLines: 2,
                          ),
                          const SizedBox(height: 24),
                          Text("Pièce d'identité", style: Theme.of(context).textTheme.titleSmall),
                          const SizedBox(height: 12),
                          _dropdown(
                            label: "Type de pièce d'identité",
                            value: _typePieceIdentite,
                            values: typesPieceIdentite,
                            onChanged: (v) => setState(() => _typePieceIdentite = v),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _numeroPieceController,
                            decoration: const InputDecoration(labelText: 'Numéro de la pièce'),
                          ),
                          const SizedBox(height: 12),
                          _datePicker(
                            label: 'Pièce valide à partir du',
                            value: _pieceValideDe,
                            onTap: () async {
                              final picked = await _choisirDate(initial: _pieceValideDe, futureAllowed: false);
                              if (picked != null) setState(() => _pieceValideDe = picked);
                            },
                          ),
                          const SizedBox(height: 12),
                          _datePicker(
                            label: "Pièce valide jusqu'au",
                            value: _pieceValideA,
                            onTap: () async {
                              final picked = await _choisirDate(initial: _pieceValideA, futureAllowed: true);
                              if (picked != null) setState(() => _pieceValideA = picked);
                            },
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: _saving ? null : _enregistrer,
                            child: _saving
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  )
                                : const Text('Enregistrer'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }

  Widget _photoSection() {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 48,
            backgroundImage: _photoUrl != null && _photoUrl!.isNotEmpty
                ? NetworkImage(_photoUrl!)
                : null,
            child: _photoUrl == null || _photoUrl!.isEmpty
                ? const Icon(Icons.person, size: 48)
                : null,
          ),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: _uploadingPhoto ? null : _changerPhoto,
            icon: _uploadingPhoto
                ? const SizedBox(height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2))
                : const Icon(Icons.photo_camera_outlined, size: 18),
            label: Text(_photoUrl == null || _photoUrl!.isEmpty ? 'Ajouter une photo' : 'Changer la photo'),
          ),
        ],
      ),
    );
  }

  Widget _dropdown({
    required String label,
    required String? value,
    required List<String> values,
    required void Function(String?) onChanged,
  }) {
    return InputDecorator(
      decoration: InputDecoration(labelText: label),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: value,
          hint: const Text('Sélectionner'),
          items: values.map((v) => DropdownMenuItem(value: v, child: Text(v))).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _datePicker({required String label, required DateTime? value, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: InputDecorator(
        decoration: InputDecoration(labelText: label, suffixIcon: const Icon(Icons.calendar_today, size: 18)),
        child: Text(_formatDate(value)),
      ),
    );
  }

  Widget _bannerIncomplet() {
    final manquants = _champsManquants();
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange.withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Votre profil est incomplet', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text('Champs manquants : ${manquants.join(', ')}'),
        ],
      ),
    );
  }
}
