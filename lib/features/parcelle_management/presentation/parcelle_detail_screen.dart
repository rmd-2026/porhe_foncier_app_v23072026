import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/core/reference_dropdowns.dart';
import 'package:porhe_foncier_app_23072026/features/parcelle_management/data/parcelle_repository.dart';
import 'package:porhe_foncier_app_23072026/features/parcelle_management/presentation/parcelle_providers.dart';

import '../../document_management/presentation/document_list_screen.dart';
import '../../taxe_management/presentation/taxe_list_screen.dart';

class ParcelleDetailScreen extends ConsumerStatefulWidget {
  const ParcelleDetailScreen({super.key, required this.id});
  final int id;

  @override
  ConsumerState<ParcelleDetailScreen> createState() => _ParcelleDetailScreenState();
}

class _ParcelleDetailScreenState extends ConsumerState<ParcelleDetailScreen> {
  bool _loading = true;
  bool _saving = false;
  String? _errorText;
  bool _dataChanged = false;
  ParcelleDetail? _detail;
  ProprietaireInfo? _proprietaire;
  String? _proprietaireErreur;

  late final TextEditingController _superficieController;
  late final TextEditingController _latitudeController;
  late final TextEditingController _longitudeController;
  late final TextEditingController _adresseTerrainController;

  @override
  void initState() {
    super.initState();
    _superficieController = TextEditingController();
    _latitudeController = TextEditingController();
    _longitudeController = TextEditingController();
    _adresseTerrainController = TextEditingController();
    _charger();
  }

  @override
  void dispose() {
    _superficieController.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    _adresseTerrainController.dispose();
    super.dispose();
  }

  Future<void> _charger() async {
    setState(() {
      _loading = true;
      _errorText = null;
      _proprietaireErreur = null;
    });

    final repository = ref.read(parcelleRepositoryProvider);
    final result = await repository.obtenirDetail(widget.id);

    result.match(
      (failure) => setState(() => _errorText = failure.message),
      (detail) {
        setState(() {
          _detail = detail;
          _superficieController.text = detail.superficieM2?.toString() ?? '';
          _latitudeController.text = detail.latitude?.toString() ?? '';
          _longitudeController.text = detail.longitude?.toString() ?? '';
          _adresseTerrainController.text = detail.adresseTerrain ?? '';
        });
      },
    );

    setState(() => _loading = false);

    if (_detail != null) {
      final proprioResult = await repository.obtenirProprietaire(_detail!.utilisateurId);
      proprioResult.match(
        (failure) => setState(() => _proprietaireErreur = failure.message),
        (proprio) => setState(() => _proprietaire = proprio),
      );
    }
  }

  Future<void> _enregistrer() async {
    setState(() {
      _saving = true;
      _errorText = null;
    });

    final repository = ref.read(parcelleRepositoryProvider);
    final result = await repository.mettreAJour(
      id: widget.id,
      superficieM2: _superficieController.text.trim().isEmpty
          ? null
          : double.tryParse(_superficieController.text.trim()),
      latitude: _latitudeController.text.trim().isEmpty
          ? null
          : double.tryParse(_latitudeController.text.trim()),
      longitude: _longitudeController.text.trim().isEmpty
          ? null
          : double.tryParse(_longitudeController.text.trim()),
      adresseTerrain: _adresseTerrainController.text.trim().isEmpty
          ? null
          : _adresseTerrainController.text.trim(),
    );

    result.match(
      (failure) => setState(() => _errorText = failure.message),
      (_) {
        _dataChanged = true;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Parcelle mise à jour.')),
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
        title: const Text('Valider cette parcelle ?'),
        content: Text('${_detail!.codeParcelle} passera au statut VALIDEE.'),
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
    final repository = ref.read(parcelleRepositoryProvider);
    final result = await repository.valider(
      id: widget.id,
      communeId: _detail!.communeId,
    );

    result.match(
      (failure) => setState(() => _errorText = failure.message),
      (_) {
        _dataChanged = true;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Parcelle validée.')),
        );
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Future<void> _rejeter() async {
    if (_detail == null) return;
    final motifController = TextEditingController();

    final motif = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Rejeter cette parcelle ?'),
        content: TextField(
          controller: motifController,
          decoration: const InputDecoration(
            labelText: 'Motif du rejet',
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
            child: const Text('Rejeter'),
          ),
        ],
      ),
    );
    if (motif == null || motif.isEmpty) return;

    setState(() => _saving = true);
    final repository = ref.read(parcelleRepositoryProvider);
    final result = await repository.rejeter(
      id: widget.id,
      communeId: _detail!.communeId,
      motif: motif,
    );

    result.match(
      (failure) => setState(() => _errorText = failure.message),
      (_) {
        _dataChanged = true;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Parcelle rejetée.')),
        );
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Future<void> _resoumettre() async {
    if (_detail == null) return;
    setState(() => _saving = true);
    final repository = ref.read(parcelleRepositoryProvider);
    final result = await repository.resoumettre(
      id: widget.id,
      communeId: _detail!.communeId,
    );

    result.match(
      (failure) => setState(() => _errorText = failure.message),
      (_) {
        _dataChanged = true;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Parcelle resoumise.')),
        );
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  /// NOTE: repository.transfererCommune is currently a deliberate
  /// stub that always returns a Failure — the real mutation covering
  /// regionId + communeId + sousPrefectureId together has not been
  /// confirmed against the current (non-stale) mutations.gql yet. This
  /// dialog is fully wired and ready; only the repository call needs
  /// to be swapped in once that mutation is confirmed/added.
  Future<void> _transfererCommune() async {
    if (_detail == null) return;

    int? nouvelleRegionId = _detail!.regionId;
    int? nouvelleCommuneId;
    int? nouvelleSousPrefectureId;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Transférer vers une autre commune'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Localisation actuelle : ${_detail!.nomRegion} / ${_detail!.nomCommune}'
                  '${_detail!.nomSousPrefecture != null ? ' / ${_detail!.nomSousPrefecture}' : ''}',
                  style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
                ),
                const SizedBox(height: 12),
                RegionDropdown(
                  label: 'Nouvelle région',
                  initialValue: nouvelleRegionId,
                  onChanged: (id) => setDialogState(() {
                    nouvelleRegionId = id;
                    // Changing région invalidates any commune/sous-préf
                    // picked under the previous région.
                    nouvelleCommuneId = null;
                    nouvelleSousPrefectureId = null;
                  }),
                ),
                const SizedBox(height: 12),
                CommuneDropdown(
                  label: 'Nouvelle commune',
                  regionId: nouvelleRegionId,
                  initialValue: nouvelleCommuneId,
                  enabled: nouvelleRegionId != null,
                  onChanged: (id) => setDialogState(() {
                    nouvelleCommuneId = id;
                    nouvelleSousPrefectureId = null;
                  }),
                ),
                const SizedBox(height: 12),
                SousPrefectureDropdown(
                  label: 'Nouvelle sous-préfecture (optionnel)',
                  communeId: nouvelleCommuneId,
                  enabled: nouvelleCommuneId != null,
                  onChanged: (id) => setDialogState(() => nouvelleSousPrefectureId = id),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: (nouvelleCommuneId == null || nouvelleRegionId == null)
                  ? null
                  : () => Navigator.of(dialogContext).pop(true),
              child: const Text('Transférer'),
            ),
          ],
        ),
      ),
    );

    if (confirmed != true || nouvelleCommuneId == null || nouvelleRegionId == null) return;

    setState(() => _saving = true);
    final repository = ref.read(parcelleRepositoryProvider);
    final result = await repository.transfererCommune(
      id: widget.id,
      ancienneCommuneId: _detail!.communeId,
      nouvelleRegionId: nouvelleRegionId!,
      nouvelleCommuneId: nouvelleCommuneId!,
      nouvelleSousPrefectureId: nouvelleSousPrefectureId,
    );

    result.match(
      (failure) => setState(() => _errorText = failure.message),
      (_) {
        _dataChanged = true;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Parcelle transférée.')),
        );
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Widget _statutBanner() {
    if (_detail == null) return const SizedBox.shrink();
    final statut = _detail!.statut;
    final Color color;
    final String label;
    switch (statut) {
      case 'VALIDEE':
        color = Colors.green;
        label = 'Validée';
        break;
      case 'REJETEE':
        color = Colors.red;
        label = 'Rejetée';
        break;
      default:
        color = Colors.orange;
        label = 'En attente de validation';
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
              Text('Statut : $label',
                  style: TextStyle(color: color, fontWeight: FontWeight.bold)),
            ],
          ),
          if (_detail!.motifRejet != null) ...[
            const SizedBox(height: 4),
            Text('Motif : ${_detail!.motifRejet}'),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              if (statut != 'VALIDEE')
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
              if (statut != 'VALIDEE') const SizedBox(width: 8),
              if (statut != 'REJETEE')
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _saving ? null : _rejeter,
                    icon: const Icon(Icons.block, size: 18),
                    label: const Text('Rejeter'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          if (statut == 'REJETEE') ...[
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _saving ? null : _resoumettre,
                icon: const Icon(Icons.replay, size: 18),
                label: const Text('Resoumettre'),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _localisationSection() {
    if (_detail == null) return const SizedBox.shrink();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.06),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Localisation', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('Région : ${_detail!.nomRegion}'),
          Text('Commune : ${_detail!.nomCommune}'),
          if (_detail!.nomSousPrefecture != null)
            Text('Sous-préfecture : ${_detail!.nomSousPrefecture}'),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: _saving ? null : _transfererCommune,
            icon: const Icon(Icons.swap_horiz, size: 18),
            label: const Text('Transférer vers une autre commune'),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => DocumentListScreen(parcelleId: widget.id)),
            ),
            icon: const Icon(Icons.folder_open, size: 18),
            label: const Text('Documents de la parcelle'),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => TaxeListScreen(parcelleId: widget.id)),
            ),
            icon: const Icon(Icons.account_balance, size: 18),
            label: const Text('Taxes de la parcelle'),
          ),
        ],
      ),
    );
  }

  Widget _proprietaireSection() {
    if (_detail == null) return const SizedBox.shrink();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.purple.withOpacity(0.06),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Propriétaire', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          if (_proprietaire != null) ...[
            Text(_proprietaire!.nomAffiche),
            if (_proprietaire!.email != null) Text(_proprietaire!.email!),
            if (_proprietaire!.telephone != null) Text(_proprietaire!.telephone!),
          ] else if (_proprietaireErreur != null) ...[
            Text(
              'ID Utilisateur : ${_detail!.utilisateurId} (${_proprietaireErreur!})',
              style: const TextStyle(fontSize: 12, color: Colors.orange),
            ),
          ] else ...[
            const SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ],
          const SizedBox(height: 4),
          const Text(
            'Le transfert de propriété se fait via une transaction foncière validée, pas depuis cet écran.',
            style: TextStyle(fontSize: 11, fontStyle: FontStyle.italic),
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
        appBar: AppBar(title: const Text('Détail parcelle')),
        body: _loading
            ? const Center(child: CircularProgressIndicator())
            : _detail == null
                ? Center(child: Text(_errorText ?? 'Parcelle introuvable.'))
                : SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 48),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _statutBanner(),
                        if (_errorText != null) ...[
                          Text(_errorText!, style: const TextStyle(color: Colors.red)),
                          const SizedBox(height: 12),
                        ],
                        Text('Code parcelle : ${_detail!.codeParcelle}',
                            style: Theme.of(context).textTheme.titleMedium),
                        if (_detail!.qrCode != null) Text('QR Code : ${_detail!.qrCode}'),
                        const SizedBox(height: 16),
                        _proprietaireSection(),
                        _localisationSection(),
                        TextFormField(
                          controller: _superficieController,
                          decoration: const InputDecoration(labelText: 'Superficie (m²)'),
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _latitudeController,
                          decoration: const InputDecoration(labelText: 'Latitude'),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true, signed: true),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _longitudeController,
                          decoration: const InputDecoration(labelText: 'Longitude'),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true, signed: true),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _adresseTerrainController,
                          decoration: const InputDecoration(labelText: 'Adresse du terrain'),
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
    );
  }
}
