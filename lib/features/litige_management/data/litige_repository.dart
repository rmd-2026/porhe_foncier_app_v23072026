import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_data_connect/firebase_data_connect.dart' show Timestamp;
import 'package:fpdart/fpdart.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/core/failure.dart';

String _formatTimestamp(Timestamp timestamp) {
  final millis = timestamp.seconds * 1000 + timestamp.nanoseconds ~/ 1000000;
  return DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true).toIso8601String();
}

class LitigeSummary {
  const LitigeSummary({
    required this.id,
    this.parcelleId,
    this.plaignantId,
    required this.statut,
    this.motif,
    this.resolution,
    required this.createdAt,
  });

  final int id;
  final int? parcelleId;
  final int? plaignantId;
  final String statut;
  final String? motif;
  final String? resolution;
  final String createdAt;
}

class LitigeDetail {
  const LitigeDetail({
    required this.id,
    required this.parcelleId,
    this.transactionFonciereId,
    required this.plaignantId,
    required this.motif,
    required this.statut,
    this.resolution,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final int parcelleId;
  final int? transactionFonciereId;
  final int plaignantId;
  final String motif;
  final String statut;
  final String? resolution;
  final String createdAt;
  final String updatedAt;
}

String libelleStatutLitige(String statut) {
  switch (statut) {
    case 'EN_COURS_EXAMEN':
      return 'En cours d\'examen';
    case 'RESOLU':
      return 'Résolu';
    case 'REJETE':
      return 'Rejeté';
    case 'OUVERT':
    default:
      return 'Ouvert';
  }
}

class LitigeRepository {
  LitigeRepository(this._connector, this._auth);
  final PorheFoncier23072026Connector _connector;
  final FirebaseAuth _auth;

  Future<Either<Failure, List<LitigeSummary>>> listerParParcelle(int parcelleId) async {
    try {
      final result = await _connector.listerLitigesParParcelle(parcelleId: parcelleId).execute();
      return right(result.data.litiges
          .map((l) => LitigeSummary(
                id: l.id,
                plaignantId: l.plaignantId,
                statut: l.statut.stringValue,
                motif: l.motif,
                resolution: l.resolution,
                createdAt: _formatTimestamp(l.createdAt),
              ))
          .toList());
    } catch (e) {
      return left(Failure('Erreur lors du chargement des litiges : $e'));
    }
  }

  Future<Either<Failure, List<LitigeSummary>>> listerTous({int? limit, int? offset}) async {
    try {
      var builder = _connector.listerTousLitiges();
      if (limit != null) builder = builder.limit(limit);
      if (offset != null) builder = builder.offset(offset);
      final result = await builder.execute();
      return right(result.data.litiges
          .map((l) => LitigeSummary(
                id: l.id,
                parcelleId: l.parcelleId,
                plaignantId: l.plaignantId,
                statut: l.statut.stringValue,
                createdAt: _formatTimestamp(l.createdAt),
              ))
          .toList());
    } catch (e) {
      return left(Failure('Erreur lors du chargement des litiges : $e'));
    }
  }

  Future<Either<Failure, LitigeDetail>> obtenirDetail(int id) async {
    try {
      final result = await _connector.obtenirLitigeParId(id: id).execute();
      final l = result.data.litige;
      if (l == null) return left(const Failure('Litige introuvable.'));
      return right(LitigeDetail(
        id: l.id,
        parcelleId: l.parcelleId,
        transactionFonciereId: l.transactionFonciereId,
        plaignantId: l.plaignantId,
        motif: l.motif,
        statut: l.statut.stringValue,
        resolution: l.resolution,
        createdAt: _formatTimestamp(l.createdAt),
        updatedAt: _formatTimestamp(l.updatedAt),
      ));
    } catch (e) {
      return left(Failure('Erreur lors du chargement du litige : $e'));
    }
  }

  Future<Either<Failure, Unit>> signaler({
    required int parcelleId,
    required int plaignantId,
    required String motif,
    int? transactionFonciereId,
  }) async {
    try {
      final builder = _connector.signalerLitige(
        parcelleId: parcelleId,
        plaignantId: plaignantId,
        motif: motif,
      );
      if (transactionFonciereId != null) builder.transactionFonciereId(transactionFonciereId);
      await builder.execute();
      await _enregistrerAudit(entiteId: parcelleId, action: 'SIGNALEMENT_LITIGE');
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors du signalement : $e'));
    }
  }

  Future<Either<Failure, Unit>> passerEnExamen({required int id}) async {
    try {
      await _connector.passerLitigeEnExamen(id: id).execute();
      await _enregistrerAudit(entiteId: id, action: 'MISE_EN_EXAMEN_LITIGE');
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors du passage en examen : $e'));
    }
  }

  Future<Either<Failure, Unit>> resoudre({required int id, required String resolution}) async {
    try {
      await _connector.resoudreLitige(id: id, resolution: resolution).execute();
      await _enregistrerAudit(entiteId: id, action: 'RESOLUTION_LITIGE');
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de la résolution : $e'));
    }
  }

  Future<Either<Failure, Unit>> rejeter({required int id, required String motifRejet}) async {
    try {
      await _connector.rejeterLitige(id: id, resolution: motifRejet).execute();
      await _enregistrerAudit(entiteId: id, action: 'REJET_LITIGE');
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors du rejet : $e'));
    }
  }

  Future<Either<Failure, Unit>> supprimer({required int id}) async {
    try {
      await _connector.supprimerLitige(id: id).execute();
      await _enregistrerAudit(entiteId: id, action: 'SUPPRESSION_LITIGE');
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de la suppression : $e'));
    }
  }

  Future<void> _enregistrerAudit({required int entiteId, required String action}) async {
    final acteur = _auth.currentUser?.uid ?? 'inconnu';
    try {
      await _connector
          .enregistrerAudit(
            typeEntite: 'Litige',
            entiteId: entiteId,
            action: action,
            acteurFirebaseUid: acteur,
          )
          .execute();
    } catch (_) {
      // Best-effort, consistent with every other module.
    }
  }
}
