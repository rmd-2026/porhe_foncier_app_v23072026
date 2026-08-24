import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_data_connect/firebase_data_connect.dart' show Timestamp;
import 'package:fpdart/fpdart.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/core/failure.dart';
import 'package:porhe_foncier_app_23072026/features/document_management/data/document_storage_service.dart';

String _formatTimestamp(Timestamp t) {
  final millis = t.seconds * 1000 + t.nanoseconds ~/ 1000000;
  return DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true).toIso8601String();
}

class DocumentSummary {
  const DocumentSummary({
    required this.id,
    required this.typeDocument,
    required this.nomFichier,
    required this.urlStockage,
    required this.uploadeParFirebaseUid,
    required this.createdAt,
  });

  final int id;
  final String typeDocument;
  final String nomFichier;
  final String urlStockage;
  final String uploadeParFirebaseUid;
  final String createdAt;
}

const List<String> typesDocument = [
  'TITRE_FONCIER',
  'ACTE_VENTE',
  'CERTIFICAT_HERITAGE',
  'PLAN_CADASTRAL',
  'AUTRE',
];

String libelleTypeDocument(String type) {
  switch (type) {
    case 'TITRE_FONCIER':
      return 'Titre foncier';
    case 'ACTE_VENTE':
      return 'Acte de vente';
    case 'CERTIFICAT_HERITAGE':
      return 'Certificat d\'héritage';
    case 'PLAN_CADASTRAL':
      return 'Plan cadastral';
    case 'AUTRE':
    default:
      return 'Autre';
  }
}

/// Builds the stored/displayed nomFichier as
/// "{parcelleId}_{typeDocument}_{timestamp}.{ext}" — e.g.
/// "42_TITRE_FONCIER_1755374760000.pdf" — instead of the raw filename
/// the user picked (e.g. "scan (3).pdf"). The original extension is
/// preserved so download/open-in-browser still works correctly; the
/// original picked filename is discarded entirely, per requirement
/// ("the filename should be [this pattern]", not appended to it).
String _construireNomFichier({
  required int parcelleId,
  required String typeDocument,
  required String nomFichierOriginal,
}) {
  final pointIndex = nomFichierOriginal.lastIndexOf('.');
  final extension = pointIndex == -1 ? '' : nomFichierOriginal.substring(pointIndex);
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  return '${parcelleId}_${typeDocument}_$timestamp$extension';
}

class DocumentRepository {
  DocumentRepository(this._connector, this._auth, this._storage);
  final PorheFoncier23072026Connector _connector;
  final FirebaseAuth _auth;
  final DocumentStorageService _storage;

  Future<Either<Failure, List<DocumentSummary>>> listerParParcelle(int parcelleId) async {
    try {
      final result =
          await _connector.listerDocumentsParParcelle(parcelleId: parcelleId).execute();
      return right(result.data.documentParcelles
          .map((d) => DocumentSummary(
                id: d.id,
                typeDocument: d.typeDocument.stringValue,
                nomFichier: d.nomFichier,
                urlStockage: d.urlStockage,
                uploadeParFirebaseUid: d.uploadeParFirebaseUid,
                createdAt: _formatTimestamp(d.createdAt),
              ))
          .toList());
    } catch (e) {
      return left(Failure('Erreur lors du chargement des documents : $e'));
    }
  }

  /// Uploads the file to Firebase Storage first, then records its
  /// metadata via ajouterDocument. If the Storage upload fails, the
  /// Data Connect mutation is never called — no orphaned metadata row
  /// pointing at a URL that doesn't exist.
  ///
  /// [nomFichierOriginal] is only used to recover the file extension —
  /// the stored/displayed nomFichier is always regenerated as
  /// "{parcelleId}_{typeDocument}_{timestamp}.{ext}", never the raw
  /// picked filename.
  ///
  /// NOTE: deliberately does NOT use Either.match() here — match() is
  /// synchronous in fpdart, and mixing a sync `left(...)` return with
  /// an async success closure made the compiler infer
  /// Future<Either<dynamic, dynamic>>, which then failed a runtime
  /// type cast every time upload succeeded. Plain if/else on
  /// uploadResult avoids that entirely.
  Future<Either<Failure, Unit>> ajouter({
    required int parcelleId,
    required String typeDocument,
    required String nomFichierOriginal,
    required Uint8List bytes,
  }) async {
    final nomFichier = _construireNomFichier(
      parcelleId: parcelleId,
      typeDocument: typeDocument,
      nomFichierOriginal: nomFichierOriginal,
    );

    final uploadResult = await _storage.televerser(
      parcelleId: parcelleId,
      nomFichier: nomFichier,
      bytes: bytes,
    );

    if (uploadResult.isLeft()) {
      return left((uploadResult as Left).value as Failure);
    }
    final url = (uploadResult as Right).value as String;

    try {
      final acteur = _auth.currentUser?.uid ?? 'inconnu';
      await _connector
          .ajouterDocument(
            parcelleId: parcelleId,
            typeDocument: TypeDocument.values.byName(typeDocument),
            nomFichier: nomFichier,
            urlStockage: url,
            uploadeParFirebaseUid: acteur,
          )
          .execute();
    } catch (e) {
      await _storage.supprimer(url);
      return left(Failure('Erreur lors de l\'enregistrement du document : $e'));
    }

    // Audit logging is best-effort here: the document itself is
    // already successfully created at this point, so a transient
    // audit-write failure must never be reported back to the user as
    // an upload failure.
    try {
      await _enregistrerAudit(entiteId: parcelleId, action: 'AJOUT_DOCUMENT');
    } catch (_) {
      // Swallowed intentionally — see comment above.
    }

    return right(unit);
  }

  Future<Either<Failure, Unit>> supprimer({
    required int id,
    required int parcelleId,
    required String urlStockage,
  }) async {
    try {
      await _connector.supprimerDocument(id: id).execute();
    } catch (e) {
      return left(Failure('Erreur lors de la suppression : $e'));
    }

    await _storage.supprimer(urlStockage);
    try {
      await _enregistrerAudit(entiteId: parcelleId, action: 'SUPPRESSION_DOCUMENT');
    } catch (_) {
      // Best-effort, same rationale as in ajouter().
    }
    return right(unit);
  }

  Future<void> _enregistrerAudit({
    required int entiteId,
    required String action,
  }) async {
    final acteur = _auth.currentUser?.uid ?? 'inconnu';
    await _connector
        .enregistrerAudit(
          typeEntite: 'DocumentParcelle',
          entiteId: entiteId,
          action: action,
          acteurFirebaseUid: acteur,
        )
        .execute();
  }
}
