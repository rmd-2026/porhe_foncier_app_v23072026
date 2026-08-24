import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_data_connect/firebase_data_connect.dart' show Timestamp;
import 'package:fpdart/fpdart.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/core/failure.dart';

String _formatTimestamp(Timestamp timestamp) {
  final millis = timestamp.seconds * 1000 + timestamp.nanoseconds ~/ 1000000;
  return DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true).toIso8601String();
}

class AlerteSummary {
  const AlerteSummary({
    required this.id,
    this.utilisateurId,
    this.parcelleId,
    required this.typeAlerte,
    required this.lue,
    required this.createdAt,
  });

  final int id;
  final int? utilisateurId;
  final int? parcelleId;
  final String typeAlerte;
  final bool lue;
  final String createdAt;
}

class AlerteDetail {
  const AlerteDetail({
    required this.id,
    required this.utilisateurId,
    this.parcelleId,
    required this.typeAlerte,
    required this.message,
    required this.lue,
    required this.createdAt,
  });

  final int id;
  final int utilisateurId;
  final int? parcelleId;
  final String typeAlerte;
  final String message;
  final bool lue;
  final String createdAt;
}

String libelleTypeAlerte(String type) {
  switch (type) {
    case 'ACTIVITE_SUSPECTE':
      return 'Activité suspecte';
    case 'ECHEANCE_TAXE':
      return 'Échéance de taxe';
    case 'NOUVELLE_TRANSACTION':
      return 'Nouvelle transaction';
    case 'SUIVI_VISUEL':
      return 'Suivi visuel';
    case 'AUTRE':
    default:
      return 'Autre';
  }
}

class AlerteRepository {
  AlerteRepository(this._connector, this._auth);
  final PorheFoncier23072026Connector _connector;
  final FirebaseAuth _auth;

  Future<Either<Failure, List<AlerteSummary>>> listerParUtilisateur(int utilisateurId) async {
    try {
      final result =
          await _connector.listerAlertesParUtilisateur(utilisateurId: utilisateurId).execute();
      return right(result.data.alertes
          .map((a) => AlerteSummary(
                id: a.id,
                parcelleId: a.parcelleId,
                typeAlerte: a.typeAlerte.stringValue,
                lue: a.lue,
                createdAt: _formatTimestamp(a.createdAt),
              ))
          .toList());
    } catch (e) {
      return left(Failure('Erreur lors du chargement des alertes : $e'));
    }
  }

  Future<Either<Failure, List<AlerteSummary>>> listerToutes({int? limit, int? offset}) async {
    try {
      var builder = _connector.listerToutesAlertes();
      if (limit != null) builder = builder.limit(limit);
      if (offset != null) builder = builder.offset(offset);
      final result = await builder.execute();
      return right(result.data.alertes
          .map((a) => AlerteSummary(
                id: a.id,
                utilisateurId: a.utilisateurId,
                parcelleId: a.parcelleId,
                typeAlerte: a.typeAlerte.stringValue,
                lue: a.lue,
                createdAt: _formatTimestamp(a.createdAt),
              ))
          .toList());
    } catch (e) {
      return left(Failure('Erreur lors du chargement des alertes : $e'));
    }
  }

  /// Real per-id fetch, now that obtenirAlerteParId exists and selects
  /// message — replaces the earlier list-data-reuse workaround.
  Future<Either<Failure, AlerteDetail>> obtenirDetail(int id) async {
    try {
      final result = await _connector.obtenirAlerteParId(id: id).execute();
      final a = result.data.alerte;
      if (a == null) return left(const Failure('Alerte introuvable.'));
      return right(AlerteDetail(
        id: a.id,
        utilisateurId: a.utilisateurId,
        parcelleId: a.parcelleId,
        typeAlerte: a.typeAlerte.stringValue,
        message: a.message,
        lue: a.lue,
        createdAt: _formatTimestamp(a.createdAt),
      ));
    } catch (e) {
      return left(Failure('Erreur lors du chargement de l\'alerte : $e'));
    }
  }

  Future<Either<Failure, Unit>> creer({
    required int utilisateurId,
    int? parcelleId,
    required String typeAlerte,
    required String message,
  }) async {
    try {
      final builder = _connector.creerAlerte(
        utilisateurId: utilisateurId,
        typeAlerte: TypeAlerte.values.byName(typeAlerte),
        message: message,
      );
      if (parcelleId != null) builder.parcelleId(parcelleId);
      await builder.execute();
      await _enregistrerAudit(entiteId: utilisateurId, action: 'CREATION_ALERTE');
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de la création de l\'alerte : $e'));
    }
  }

  Future<Either<Failure, Unit>> marquerLue({required int id}) async {
    try {
      await _connector.marquerAlerteLue(id: id).execute();
      await _enregistrerAudit(entiteId: id, action: 'MARQUAGE_LUE');
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors du marquage : $e'));
    }
  }

  Future<Either<Failure, Unit>> supprimer({required int id}) async {
    try {
      await _connector.supprimerAlerte(id: id).execute();
      await _enregistrerAudit(entiteId: id, action: 'SUPPRESSION_ALERTE');
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
            typeEntite: 'Alerte',
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
