import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_data_connect/firebase_data_connect.dart' show Timestamp;
import 'package:fpdart/fpdart.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/core/failure.dart';
import 'package:porhe_foncier_app_23072026/features/suivi_visuel_management/data/suivi_visuel_storage_service.dart';

String _formatTimestamp(Timestamp timestamp) {
  final millis = timestamp.seconds * 1000 + timestamp.nanoseconds ~/ 1000000;
  return DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true).toIso8601String();
}

/// Reverse of _formatTimestamp — builds a Data Connect Timestamp from
/// a Dart DateTime, needed because obtenirUploadsRecentsPourAbonnement's
/// `depuis` parameter is typed Timestamp!, not DateTime. Mirrors the
/// exact helper already used in dev_dashboard_repository.dart.
/// NOTE: constructor shape unverified against the generated SDK —
/// adjust if this throws at runtime.
Timestamp _toDataConnectTimestamp(DateTime date) {
  final millis = date.toUtc().millisecondsSinceEpoch;
  return Timestamp(millis ~/ 1000, (millis % 1000) * 1000000);
}

class SuiviVisuelSummary {
  const SuiviVisuelSummary({
    required this.id,
    required this.typeMedia,
    required this.urlStockage,
    this.latitude,
    this.longitude,
    required this.uploadeParFirebaseUid,
    required this.createdAt,
  });

  final int id;
  final String typeMedia;
  final String urlStockage;
  final double? latitude;
  final double? longitude;
  final String uploadeParFirebaseUid;
  final String createdAt;
}

/// Cadence policy — confirmed by the project owner:
/// BASIQUE 1 upload/30 jours, STANDARD 4/30 jours, PREMIUM illimité.
/// Enforced entirely client-side since no mutation enforces it
/// server-side (ajouterSuiviVisuel has no built-in rate check).
class CadencePolicy {
  static const Duration fenetre = Duration(days: 30);

  static int? limitePour(String niveau) {
    switch (niveau) {
      case 'BASIQUE':
        return 1;
      case 'STANDARD':
        return 4;
      case 'PREMIUM':
      default:
        return null; // null = illimité
    }
  }
}

class ContexteAcces {
  const ContexteAcces({
    required this.niveau,
    required this.nombreUploadsRecents,
    required this.media,
  });

  final String? niveau;
  final int nombreUploadsRecents;
  final List<SuiviVisuelSummary> media;

  int? get limite => niveau == null ? null : CadencePolicy.limitePour(niveau!);
  bool get peutTelverser => limite == null || nombreUploadsRecents < limite!;
  int? get uploadsRestants =>
      limite == null ? null : (limite! - nombreUploadsRecents).clamp(0, limite!);
}

class SuiviVisuelRepository {
  SuiviVisuelRepository(this._connector, this._auth, this._storage);
  final PorheFoncier23072026Connector _connector;
  final FirebaseAuth _auth;
  final SuiviVisuelStorageService _storage;

  Future<Either<Failure, List<SuiviVisuelSummary>>> listerComplet(int parcelleId) async {
    try {
      final result =
          await _connector.listerSuiviVisuelCompletParParcelle(parcelleId: parcelleId).execute();
      return right(result.data.suiviVisuels
          .map((s) => SuiviVisuelSummary(
                id: s.id,
                typeMedia: s.typeMedia.stringValue,
                urlStockage: s.urlStockage,
                latitude: s.latitude,
                longitude: s.longitude,
                uploadeParFirebaseUid: s.uploadeParFirebaseUid,
                createdAt: _formatTimestamp(s.createdAt),
              ))
          .toList());
    } catch (e) {
      return left(Failure('Erreur lors du chargement du suivi visuel : $e'));
    }
  }

  /// Combines the active subscription tier with a fresh count of
  /// uploads within CadencePolicy.fenetre, to decide peutTelverser
  /// before the upload dialog is even opened.
  Future<Either<Failure, ContexteAcces>> obtenirContexteAcces({
    required int parcelleId,
    required int utilisateurId,
  }) async {
    try {
      final depuis = DateTime.now().subtract(CadencePolicy.fenetre);
      final result = await _connector
          .obtenirUploadsRecentsPourAbonnement(
            parcelleId: parcelleId,
            utilisateurId: utilisateurId,
            depuis: _toDataConnectTimestamp(depuis),
          )
          .execute();

      final abonnements = result.data.abonnements;
      final niveau = abonnements.isEmpty ? null : abonnements.first.niveau.stringValue;

      return right(ContexteAcces(
        niveau: niveau,
        nombreUploadsRecents: result.data.suiviVisuels.length,
        media: result.data.suiviVisuels
            .map((s) => SuiviVisuelSummary(
                  id: s.id,
                  typeMedia: s.typeMedia.stringValue,
                  urlStockage: '',
                  uploadeParFirebaseUid: '',
                  createdAt: _formatTimestamp(s.createdAt),
                ))
            .toList(),
      ));
    } catch (e) {
      return left(Failure('Erreur lors de la vérification de l\'abonnement : $e'));
    }
  }

  /// Uploads to Storage first, then records metadata — a failed
  /// metadata write cleans up the orphaned Storage object.
  Future<Either<Failure, Unit>> ajouter({
    required int parcelleId,
    required String typeMedia,
    required String nomFichier,
    required Uint8List bytes,
    double? latitude,
    double? longitude,
  }) async {
    final uploadResult = await _storage.televerser(
      parcelleId: parcelleId,
      nomFichier: nomFichier,
      bytes: bytes,
    );

    if (uploadResult.isLeft()) {
      Failure? erreur;
      uploadResult.match((f) => erreur = f, (_) {});
      return left(erreur!);
    }
    String? url;
    uploadResult.match((_) {}, (u) => url = u);

    try {
      final acteur = _auth.currentUser?.uid ?? 'inconnu';
      final builder = _connector.ajouterSuiviVisuel(
        parcelleId: parcelleId,
        typeMedia: TypeMedia.values.byName(typeMedia),
        urlStockage: url!,
        uploadeParFirebaseUid: acteur,
      );
      if (latitude != null) builder.latitude(latitude);
      if (longitude != null) builder.longitude(longitude);
      await builder.execute();
      await _enregistrerAudit(entiteId: parcelleId, action: 'AJOUT_SUIVI_VISUEL');
      return right(unit);
    } catch (e) {
      await _storage.supprimer(url!);
      return left(Failure('Erreur lors de l\'enregistrement du suivi visuel : $e'));
    }
  }

  /// Motif is captured for the JournalAudit entry only — SuiviVisuel
  /// has no motif/motifSuppression column of its own (confirmed absent
  /// from schema.gql), and supprimerSuiviVisuel's mutation signature is
  /// unchanged (id only, matching every other module's delete mutation
  /// shape — Option A, per project owner's decision). The reason for
  /// deletion survives solely in the audit trail, not on the
  /// (now-deleted) row itself.
  Future<Either<Failure, Unit>> supprimer({
    required int id,
    required int parcelleId,
    required String urlStockage,
    required String motif,
  }) async {
    try {
      await _connector.supprimerSuiviVisuel(id: id).execute();
    } catch (e) {
      return left(Failure('Erreur lors de la suppression : $e'));
    }
    await _storage.supprimer(urlStockage);
    try {
      await _enregistrerAudit(
        entiteId: parcelleId,
        action: 'SUPPRESSION_SUIVI_VISUEL',
        motif: motif,
      );
    } catch (_) {
      // Best-effort.
    }
    return right(unit);
  }

  Future<void> _enregistrerAudit({
    required int entiteId,
    required String action,
    String? motif,
  }) async {
    final acteur = _auth.currentUser?.uid ?? 'inconnu';
    try {
      final builder = _connector.enregistrerAudit(
        typeEntite: 'SuiviVisuel',
        entiteId: entiteId,
        action: action,
        acteurFirebaseUid: acteur,
      );
      if (motif != null) builder.motif(motif);
      await builder.execute();
    } catch (_) {
      // Best-effort, consistent with every other module.
    }
  }
}
