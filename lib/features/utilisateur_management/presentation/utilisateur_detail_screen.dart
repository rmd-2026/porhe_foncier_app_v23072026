import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/core/reference_dropdowns.dart';
import 'package:porhe_foncier_app_23072026/features/utilisateur_management/data/utilisateur_repository.dart';
import 'package:porhe_foncier_app_23072026/features/utilisateur_management/presentation/utilisateur_providers.dart';

const List<String> _civiliteValues = ['MONSIEUR', 'MADAME', 'MADEMOISELLE'];
const List<String> _typePieceValues = ['CIN', 'PASSEPORT'];

class UtilisateurDetailScreen extends ConsumerStatefulWidget {
  const UtilisateurDetailScreen({super.key, required this.firebaseUid});
  final String firebaseUid;

  @override
  ConsumerState<UtilisateurDetailScreen> createState() =>
      _UtilisateurDetailScreenState();
}

class _UtilisateurDetailScreenState extends ConsumerState<UtilisateurDetailScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _loading = true;
  bool _saving = false;
  String? _errorText;
  bool _dataChanged = false;
  UtilisateurDetail? _detail;

  late final TextEditingController _nomController;
  late final TextEditingController _prenomController;
  late final TextEditingController _lieuNaissanceController;
  late final TextEditingController _numeroPieceController;
  late final TextEditingController _telephoneController;
  late final TextEditingController _adresseController;
  late final TextEditingController _photoUrlController;

  String? _civilite;
  DateTime? _dateNaissance;
  String? _nationalite;
  String? _typePieceIdentite;
  DateTime? _pieceValideDe;
  DateTime? _pieceValideA;

  @override
  void initState() {
    super.initState();
    _nomController = TextEditingController();
    _prenomController = TextEditingController();
    _lieuNaissanceController = TextEditingController();
    _numeroPieceController = TextEditingController();
    _telephoneController = TextEditingController();
    _adresseController = TextEditingController();
    _photoUrlController = TextEditingController();
    _charger();
  }

  @override
  void dispose() {
    _nomController.dispose();
    _prenomController.dispose();
    _lieuNaissanceController.dispose();
    _numeroPieceController.dispose();
    _telephoneController.dispose();
    _adresseController.dispose();
    _photoUrlController.dispose();
    super.dispose();
  }

  Future<void> _charger() async {
    setState(() {
      _loading = true;
      _errorText = null;
    });

    final repository = ref.read(utilisateurRepositoryProvider);
    final result = await repository.obtenirDetail(widget.firebaseUid);

    result.match(
      (failure) => setState(() => _errorText = failure.message),
      (detail) {
        setState(() {
          _detail = detail;
          _nomController.text = detail.nom ?? '';
          _prenomController.text = detail.prenom ?? '';
          _lieuNaissanceController.text = detail.lieuNaissance ?? '';
          _numeroPieceController.text = detail.numeroPieceIdentite ?? '';
          _telephoneController.text = detail.telephone ?? '';
          _adresseController.text = detail.adresse ?? '';
          _photoUrlController.text = detail.photoUrl ?? '';
          _civilite = detail.civilite;
          _dateNaissance =
              detail.dateNaissance == null ? null : DateTime.tryParse(detail.dateNaissance!);
          _nationalite = detail.nationalite;
          _typePieceIdentite = detail.typePieceIdentite;
          _pieceValideDe = detail.pieceIdentiteValideDe == null
              ? null
              : DateTime.tryParse(detail.pieceIdentiteValideDe!);
          _pieceValideA = detail.pieceIdentiteValideA == null
              ? null
              : DateTime.tryParse(detail.pieceIdentiteValideA!);
        });
      },
    );

    setState(() => _loading = false);
  }

  Future<void> _enregistrer() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _saving = true;
      _errorText = null;
    });

    final repository = ref.read(utilisateurRepositoryProvider);
    final result = await repository.mettreAJourProfil(
      firebaseUid: widget.firebaseUid,
      nom: _nomController.text.trim().isEmpty ? null : _nomController.text.trim(),
      prenom: _prenomController.text.trim().isEmpty ? null : _prenomController.text.trim(),
      civilite: _civilite,
      dateNaissance: _dateNaissance,
      lieuNaissance: _lieuNaissanceController.text.trim().isEmpty
          ? null
          : _lieuNaissanceController.text.trim(),
      nationalite: _nationalite,
      typePieceIdentite: _typePieceIdentite,
      numeroPieceIdentite: _numeroPieceController.text.trim().isEmpty
          ? null
          : _numeroPieceController.text.trim(),
      pieceIdentiteValideDe: _pieceValideDe,
      pieceIdentiteValideA: _pieceValideA,
      telephone: _telephoneController.text.trim().isEmpty
          ? null
          : _telephoneController.text.trim(),
      adresse: _adresseController.text.trim().isEmpty ? null : _adresseController.text.trim(),
      photoUrl: _photoUrlController.text.trim().isEmpty ? null : _photoUrlController.text.trim(),
    );

    result.match(
      (failure) => setState(() => _errorText = failure.message),
      (_) {
        _dataChanged = true;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profil mis à jour.')),
        );
        _charger();
      },
    );

    setState(() => _saving = false);
  }

  Future<void> _valider() async {
    if (_detail == null) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Valider cet utilisateur ?'),
        content: Text(
          'Le statut de ${_detail!.nom ?? ''} ${_detail!.prenom ?? ''} passera à ACTIF.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Valider'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    setState(() => _saving = true);
    final repository = ref.read(utilisateurRepositoryProvider);
    final result = await repository.validerUtilisateur(
      firebaseUid: widget.firebaseUid,
      utilisateurId: _detail!.id,
    );

    result.match(
      (failure) => setState(() => _errorText = failure.message),
      (_) {
        _dataChanged = true;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Utilisateur validé.')),
        );
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Future<void> _desactiver() async {
    if (_detail == null) return;
    final motifController = TextEditingController();

    final motif = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Désactiver cet utilisateur ?'),
        content: TextField(
          controller: motifController,
          decoration: const InputDecoration(
            labelText: 'Motif de désactivation',
            hintText: 'Obligatoire',
          ),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              if (motifController.text.trim().isEmpty) return;
              Navigator.of(dialogContext).pop(motifController.text.trim());
            },
            child: const Text('Désactiver'),
          ),
        ],
      ),
    );
    if (motif == null || motif.isEmpty) return;

    setState(() => _saving = true);
    final repository = ref.read(utilisateurRepositoryProvider);
    final result = await repository.desactiverUtilisateur(
      firebaseUid: widget.firebaseUid,
      utilisateurId: _detail!.id,
      motif: motif,
    );

    result.match(
      (failure) => setState(() => _errorText = failure.message),
      (_) {
        _dataChanged = true;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Utilisateur désactivé.')),
        );
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Future<DateTime?> _pickerDate({
    required DateTime? initial,
    required bool futureAllowed,
  }) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final firstDate = DateTime(today.year - 100, today.month, today.day);
    final lastDate =
        futureAllowed ? DateTime(today.year + 30, today.month, today.day) : today;

    return showDatePicker(
      context: context,
      initialDate: initial ?? today,
      firstDate: firstDate,
      lastDate: lastDate,
    );
  }

  String _formatPickedDate(DateTime? d) {
    if (d == null) return 'Sélectionner une date';
    return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  }

  Widget _statutBanner() {
    if (_detail == null) return const SizedBox.shrink();
    final statut = _detail!.statutCompte;
    final Color color;
    final String label;
    switch (statut) {
      case 'ACTIF':
        color = Colors.green;
        label = 'Actif';
        break;
      case 'DESACTIVE':
        color = Colors.red;
        label = 'Désactivé';
        break;
      default:
        color = Colors.orange;
        label = 'Non vérifié';
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.circle, size: 10, color: color),
              const SizedBox(width: 8),
              Text('Statut : $label', style: TextStyle(color: color, fontWeight: FontWeight.bold)),
            ],
          ),
          if (_detail!.motifStatut != null) ...[
            const SizedBox(height: 4),
            Text('Motif : ${_detail!.motifStatut}'),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              if (statut != 'ACTIF')
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _saving ? null : _valider,
                    icon: const Icon(Icons.check_circle_outline, size: 18),
                    label: const Text('Valider'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              if (statut != 'ACTIF') const SizedBox(width: 8),
              if (statut != 'DESACTIVE')
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _saving ? null : _desactiver,
                    icon: const Icon(Icons.block, size: 18),
                    label: const Text('Désactiver'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) Navigator.of(context).pop(_dataChanged);
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Profil utilisateur')),
        body: _loading
            ? const Center(child: CircularProgressIndicator())
            : _detail == null
                ? Center(
                    child: Text(_errorText ?? 'Utilisateur introuvable.'),
                  )
            : SingleChildScrollView(padding: const EdgeInsets.fromLTRB(16, 16, 16, 48),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _statutBanner(),
                          if (_errorText != null) ...[
                            Text(_errorText!, style: const TextStyle(color: Colors.red)),
                            const SizedBox(height: 12),
                          ],
                          Text('Firebase UID : ${_detail!.firebaseUid}',
                              style: Theme.of(context).textTheme.bodySmall),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _nomController,
                            decoration: const InputDecoration(labelText: 'Nom'),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _prenomController,
                            decoration: const InputDecoration(labelText: 'Prénom'),
                          ),
                          const SizedBox(height: 12),
                          InputDecorator(
                            decoration: const InputDecoration(labelText: 'Civilité'),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: _civilite,
                                hint: const Text('Sélectionner'),
                                items: _civiliteValues
                                    .map((v) => DropdownMenuItem(value: v, child: Text(v)))
                                    .toList(),
                                onChanged: (v) => setState(() => _civilite = v),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          InkWell(
                            onTap: () async {
                              final picked = await _pickerDate(
                                initial: _dateNaissance,
                                futureAllowed: false,
                              );
                              if (picked != null) setState(() => _dateNaissance = picked);
                            },
                            child: InputDecorator(
                              decoration: const InputDecoration(
                                labelText: 'Date de naissance',
                                suffixIcon: Icon(Icons.calendar_today, size: 18),
                              ),
                              child: Text(_formatPickedDate(_dateNaissance)),
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _lieuNaissanceController,
                            decoration: const InputDecoration(labelText: 'Lieu de naissance'),
                          ),
                          const SizedBox(height: 12),
                          CountryDropdown(
                            label: 'Nationalité',
                            initialValue: _nationalite,
                            onChanged: (code) => setState(() => _nationalite = code),
                          ),
                          const SizedBox(height: 12),
                          InputDecorator(
                            decoration:
                                const InputDecoration(labelText: 'Type de pièce d\'identité'),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: _typePieceIdentite,
                                hint: const Text('Sélectionner'),
                                items: _typePieceValues
                                    .map((v) => DropdownMenuItem(value: v, child: Text(v)))
                                    .toList(),
                                onChanged: (v) => setState(() => _typePieceIdentite = v),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _numeroPieceController,
                            decoration: const InputDecoration(labelText: 'Numéro de la pièce'),
                          ),
                          const SizedBox(height: 12),
                          InkWell(
                            onTap: () async {
                              final picked = await _pickerDate(
                                initial: _pieceValideDe,
                                futureAllowed: false,
                              );
                              if (picked != null) setState(() => _pieceValideDe = picked);
                            },
                            child: InputDecorator(
                              decoration: const InputDecoration(
                                labelText: 'Pièce valide à partir du',
                                suffixIcon: Icon(Icons.calendar_today, size: 18),
                              ),
                              child: Text(_formatPickedDate(_pieceValideDe)),
                            ),
                          ),
                          const SizedBox(height: 12),
                          InkWell(
                            onTap: () async {
                              final picked = await _pickerDate(
                                initial: _pieceValideA,
                                futureAllowed: true,
                              );
                              if (picked != null) setState(() => _pieceValideA = picked);
                            },
                            child: InputDecorator(
                              decoration: const InputDecoration(
                                labelText: 'Pièce valide jusqu\'au',
                                suffixIcon: Icon(Icons.calendar_today, size: 18),
                              ),
                              child: Text(_formatPickedDate(_pieceValideA)),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text('E-mail : ${_detail!.email ?? 'Non renseigné'}',
                              style: Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(height: 4),
                          const Text(
                            'L\'e-mail est géré par Firebase Auth et ne peut pas être modifié ici.',
                            style: TextStyle(fontSize: 11, fontStyle: FontStyle.italic),
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
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _photoUrlController,
                            decoration: const InputDecoration(labelText: 'URL photo'),
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
                                : const Text('Enregistrer les modifications'),
                          ),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
