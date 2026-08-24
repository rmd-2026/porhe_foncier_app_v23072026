import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/features/parcelle/data/parcelle_repository.dart';
import 'package:porhe_foncier_app_23072026/features/parcelle/presentation/parcelle_providers.dart';

/// Read-only detail view in this part, plus Admin validate/reject
/// actions per your Product Scope ("validation/rejection actions for
/// Admin" is explicitly named in Phase 8's own description, so it's
/// included here rather than deferred). Edit/GPS-recapture form,
/// QR display, and map view are NOT in this part.
class ParcelleDetailScreen extends ConsumerStatefulWidget {
  const ParcelleDetailScreen({super.key, required this.parcelleId});
  final int parcelleId;

  @override
  ConsumerState<ParcelleDetailScreen> createState() => _ParcelleDetailScreenState();
}

class _ParcelleDetailScreenState extends ConsumerState<ParcelleDetailScreen> {
  bool _loading = true;
  bool _saving = false;
  String? _errorText;
  ParcelleDetail? _parcelle;

  @override
  void initState() {
    super.initState();
    _charger();
  }

  Future<void> _charger() async {
    setState(() {
      _loading = true;
      _errorText = null;
    });

    final result = await ref.read(parcelleRepositoryProvider).obtenirDetail(widget.parcelleId);

    result.match(
      (f) => setState(() => _errorText = f.message),
      (p) => setState(() => _parcelle = p),
    );

    setState(() => _loading = false);
  }

  Future<void> _valider() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Valider cette parcelle ?'),
        content: Text('${_parcelle!.codeParcelle} passera au statut Validée.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(dialogContext).pop(false), child: const Text('Annuler')),
          TextButton(onPressed: () => Navigator.of(dialogContext).pop(true), child: const Text('Valider')),
        ],
      ),
    );
    if (confirmed != true) return;

    setState(() => _saving = true);
    final result = await ref.read(parcelleRepositoryProvider).valider(widget.parcelleId);
    result.match(
      (f) => setState(() => _errorText = f.message),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Parcelle validée.')));
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Future<void> _rejeter() async {
    final motifController = TextEditingController();
    final motif = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Rejeter cette parcelle ?'),
        content: TextField(
          controller: motifController,
          decoration: const InputDecoration(labelText: 'Motif de rejet', hintText: 'Obligatoire'),
          maxLines: 3,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(dialogContext).pop(), child: const Text('Annuler')),
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
    final result = await ref.read(parcelleRepositoryProvider).rejeter(id: widget.parcelleId, motifRejet: motif);
    result.match(
      (f) => setState(() => _errorText = f.message),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Parcelle rejetée.')));
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Future<void> _resoumettre() async {
    setState(() => _saving = true);
    final result = await ref.read(parcelleRepositoryProvider).resoumettre(widget.parcelleId);
    result.match(
      (f) => setState(() => _errorText = f.message),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Parcelle resoumise.')));
        _charger();
      },
    );
    setState(() => _saving = false);
  }

  Color _couleurStatut(String statut) {
    switch (statut) {
      case 'VALIDEE':
        return Colors.green;
      case 'REJETEE':
        return Colors.red;
      default:
        return Colors.orange;
    }
  }

  String _libelleStatut(String statut) {
    switch (statut) {
      case 'VALIDEE':
        return 'Validée';
      case 'REJETEE':
        return 'Rejetée';
      default:
        return 'En attente de validation';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_parcelle?.codeParcelle ?? 'Parcelle')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _parcelle == null
              ? Center(child: Text(_errorText ?? 'Parcelle introuvable.'))
              : SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _statutBanner(),
                        if (_errorText != null) ...[
                          Text(_errorText!, style: const TextStyle(color: Colors.red)),
                          const SizedBox(height: 12),
                        ],
                        _ligne('Code parcelle', _parcelle!.codeParcelle),
                        _ligne('Superficie', _parcelle!.superficieM2 != null ? '${_parcelle!.superficieM2} m²' : 'Non renseignée'),
                        _ligne('Adresse terrain', _parcelle!.adresseTerrain ?? 'Non renseignée'),
                        _ligne('Latitude', _parcelle!.latitude?.toString() ?? 'Non renseignée'),
                        _ligne('Longitude', _parcelle!.longitude?.toString() ?? 'Non renseignée'),
                        _ligne('Code QR', _parcelle!.qrCode ?? 'Non généré'),
                        _ligne('Créée le', _parcelle!.createdAt),
                        _ligne('Mise à jour le', _parcelle!.updatedAt),
                        const SizedBox(height: 24),
                        _actionsAdmin(),
                      ],
                    ),
                  ),
                ),
    );
  }

  Widget _ligne(String label, String valeur) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          Text(valeur, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _statutBanner() {
    final color = _couleurStatut(_parcelle!.statut);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Row(
        children: [
          Icon(Icons.circle, size: 10, color: color),
          const SizedBox(width: 8),
          Text(_libelleStatut(_parcelle!.statut), style: TextStyle(color: color, fontWeight: FontWeight.bold)),
          if (_parcelle!.motifRejet != null) ...[
            const Spacer(),
            Flexible(child: Text('Motif : ${_parcelle!.motifRejet}', textAlign: TextAlign.end)),
          ],
        ],
      ),
    );
  }

  /// Flagged: these buttons are shown to EVERY user reaching this
  /// screen right now, since Phase 8 Part 1 has no RBAC-aware
  /// visibility gate wired into the UI yet -- the backend mutations
  /// themselves are authlevel USER only (per the .gql), not scoped
  /// to ADMIN_COMMUNE/ADMIN_GLOBAL. A PROPRIETAIRE viewing their own
  /// parcel should NOT see Valider/Rejeter. This needs a role check
  /// before being called complete -- explicitly flagging rather than
  /// silently shipping an owner-facing validate button.
  Widget _actionsAdmin() {
    final statut = _parcelle!.statut;
    return Column(
      children: [
        Row(
          children: [
            if (statut != 'VALIDEE')
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _saving ? null : _valider,
                  icon: const Icon(Icons.check_circle_outline, size: 18),
                  label: const Text('Valider'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                ),
              ),
            if (statut != 'VALIDEE') const SizedBox(width: 8),
            if (statut != 'REJETEE')
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _saving ? null : _rejeter,
                  icon: const Icon(Icons.block, size: 18),
                  label: const Text('Rejeter'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
                ),
              ),
          ],
        ),
        if (statut == 'REJETEE') ...[
          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: _saving ? null : _resoumettre,
            icon: const Icon(Icons.refresh, size: 18),
            label: const Text('Resoumettre'),
          ),
        ],
      ],
    );
  }
}
