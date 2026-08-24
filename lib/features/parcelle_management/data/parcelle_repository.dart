import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_data_connect/firebase_data_connect.dart' show Timestamp;
import 'package:fpdart/fpdart.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/core/failure.dart';
import 'package:porhe_foncier_app_23072026/core/reference_data.dart';

String _formatTimestamp(Timestamp t) {
  final millis = t.seconds * 1000 + t.nanoseconds ~/ 1000000;
  return DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true).toIso8601String();
}

class ParcelleSummary {
  const ParcelleSummary({
    required this.id,
    required this.codeParcelle,
    required this.utilisateurId,
    required this.communeId,
    required this.statut,
    required this.createdAt,
  });

  final int id;
  final String codeParcelle;
  final int utilisateurId;
  final int communeId;
  final String statut;
  final String createdAt;
}

class ParcelleDetail {
  const ParcelleDetail({
    required this.id,
    required this.codeParcelle,
    required this.utilisateurId,
    required this.regionId,
    required this.communeId,
    this.sousPrefectureId,
    this.superficieM2,
    this.latitude,
    this.longitude,
    this.adresseTerrain,
    this.qrCode,
    required this.statut,
    this.motifRejet,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String codeParcelle;
  final int utilisateurId;
  // Confirmed as a real, direct column on Parcelle in schema.gql:
  // regionId: Int! @col(name: "region_id"), separate from and
  // alongside communeId — NOT derived from Commune. This must be
  // selected explicitly in obtenirParcelleParId's field list.
  final int regionId;
  final int communeId;
  final int? sousPrefectureId;
  final double? superficieM2;
  final double? latitude;
  final double? longitude;
  final String? adresseTerrain;
  final String? qrCode;
  final String statut;
  final String? motifRejet;
  final String createdAt;
  final String updatedAt;

  String get nomRegion => findRegion(regionId)?.nom ?? 'Région #$regionId';
  String get nomCommune => findCommune(communeId)?.nom ?? 'Commune #$communeId';
  String? get nomSousPrefecture =>
      sousPrefectureId == null ? null : findSousPrefecture(sousPrefectureId!)?.nom;
}

class ProprietaireInfo {
  const ProprietaireInfo({
    required this.id,
    required this.firebaseUid,
    this.nom,
    this.prenom,
    this.email,
    this.telephone,
  });

  final int id;
  final String firebaseUid;
  final String? nom;
  final String? prenom;
  final String? email;
  final String? telephone;

  String get nomAffiche {
    final full = [nom, prenom].where((s) => s != null && s.isNotEmpty).join(' ');
    return full.isEmpty ? '(nom non renseigné)' : full;
  }
}

class ParcelleRepository {
  ParcelleRepository(this._connector, this._auth);
  final PorheFoncier23072026Connector _connector;
  final FirebaseAuth _auth;

  Future<Either<Failure, List<ParcelleSummary>>> listerToutes({
    int? limit,
    int? offset,
  }) async {
    try {
      var builder = _connector.listerToutesParcelles();
      if (limit != null) builder = builder.limit(limit);
      if (offset != null) builder = builder.offset(offset);
      final result = await builder.execute();
      return right(result.data.parcelles
          .map((p) => ParcelleSummary(
                id: p.id,
                codeParcelle: p.codeParcelle,
                utilisateurId: p.utilisateurId,
                communeId: p.communeId,
                statut: p.statut.stringValue,
                createdAt: _formatTimestamp(p.createdAt),
              ))
          .toList());
    } catch (e) {
      return left(Failure('Erreur lors du chargement des parcelles : $e'));
    }
  }

  Future<Either<Failure, List<ParcelleSummary>>> listerParStatut({
    required int communeId,
    required String statut,
  }) async {
    try {
      final result = await _connector
          .listerParcellesParStatut(
            communeId: communeId,
            statut: StatutParcelle.values.byName(statut),
          )
          .execute();
      return right(result.data.parcelles
          .map((p) => ParcelleSummary(
                id: p.id,
                codeParcelle: p.codeParcelle,
                utilisateurId: p.utilisateurId,
                communeId: p.communeId,
                statut: p.statut.stringValue,
                createdAt: _formatTimestamp(p.createdAt),
              ))
          .toList());
    } catch (e) {
      return left(Failure('Erreur lors du chargement des parcelles : $e'));
    }
  }

  // ⚠️ PENDING CONFIRMATION: this assumes obtenirParcelleParId's
  // selection set includes `regionId` (p.regionId below). The
  // queries.gql available to me is a stale draft that doesn't match
  // the current schema, so I cannot confirm this field is actually
  // selected server-side yet. If the real query omits regionId, add
  // it there first — otherwise p.regionId will fail to compile against
  // the generated SDK.
  Future<Either<Failure, ParcelleDetail>> obtenirDetail(int id) async {
    try {
      final result = await _connector.obtenirParcelleParId(id: id).execute();
      final p = result.data.parcelle;
      if (p == null) return left(const Failure('Parcelle introuvable.'));
      return right(ParcelleDetail(
        id: p.id,
        codeParcelle: p.codeParcelle,
        utilisateurId: p.utilisateurId,
        regionId: p.regionId,
        communeId: p.communeId,
        sousPrefectureId: p.sousPrefectureId,
        superficieM2: p.superficieM2,
        latitude: p.latitude,
        longitude: p.longitude,
        adresseTerrain: p.adresseTerrain,
        qrCode: p.qrCode,
        statut: p.statut.stringValue,
        motifRejet: p.motifRejet,
        createdAt: _formatTimestamp(p.createdAt),
        updatedAt: _formatTimestamp(p.updatedAt),
      ));
    } catch (e) {
      return left(Failure('Erreur lors du chargement de la parcelle : $e'));
    }
  }

  Future<Either<Failure, ProprietaireInfo>> obtenirProprietaire(
    int utilisateurId,
  ) async {
    try {
      final result =
          await _connector.obtenirUtilisateurParId(id: utilisateurId).execute();
      final matches = result.data.utilisateurs;
      if (matches.isEmpty) return left(const Failure('Propriétaire introuvable.'));
      final u = matches.first;
      return right(ProprietaireInfo(
        id: u.id,
        firebaseUid: u.firebaseUid,
        nom: u.nom,
        prenom: u.prenom,
        email: u.email,
        telephone: u.telephone,
      ));
    } catch (e) {
      return left(Failure('Erreur lors du chargement du propriétaire : $e'));
    }
  }

  Future<Either<Failure, Unit>> mettreAJour({
    required int id,
    double? superficieM2,
    double? latitude,
    double? longitude,
    String? adresseTerrain,
  }) async {
    try {
      final builder = _connector.mettreAJourParcelle(id: id);
      if (superficieM2 != null) builder.superficieM2(superficieM2);
      if (latitude != null) builder.latitude(latitude);
      if (longitude != null) builder.longitude(longitude);
      if (adresseTerrain != null) builder.adresseTerrain(adresseTerrain);
      await builder.execute();
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de la mise à jour : $e'));
    }
  }

  // ⚠️ NOT WIRED YET: the actual mutation name/args for transferring a
  // parcelle's regionId + communeId + sousPrefectureId together are
  // unknown until I see the CURRENT mutations.gql — the version I have
  // is a stale draft (UUID/proprietaire model) that doesn't match this
  // schema, so I refuse to guess a mutation signature a third time.
  // Once you attach the real mutations.gql, this method will be
  // rewritten to call the correct, existing mutation (or a newly
  // added one, if none currently covers regionId+communeId together).
  Future<Either<Failure, Unit>> transfererCommune({
    required int id,
    required int ancienneCommuneId,
    required int nouvelleRegionId,
    required int nouvelleCommuneId,
    int? nouvelleSousPrefectureId,
  }) async {
    return left(const Failure(
      'Transfert non disponible : mutation backend non confirmée. '
      'Voir note dans parcelle_repository.dart.',
    ));
  }

  Future<Either<Failure, Unit>> valider({
    required int id,
    required int communeId,
  }) async {
    try {
      await _connector.validerParcelle(id: id).execute();
      await _enregistrerAudit(entiteId: id, action: 'VALIDATION', communeId: communeId);
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de la validation : $e'));
    }
  }

  Future<Either<Failure, Unit>> rejeter({
    required int id,
    required int communeId,
    required String motif,
  }) async {
    try {
      await _connector.rejeterParcelle(id: id, motifRejet: motif).execute();
      await _enregistrerAudit(
        entiteId: id,
        action: 'REJET',
        communeId: communeId,
        motif: motif,
      );
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors du rejet : $e'));
    }
  }

  Future<Either<Failure, Unit>> resoumettre({
    required int id,
    required int communeId,
  }) async {
    try {
      await _connector.resoumettreParcelle(id: id).execute();
      await _enregistrerAudit(entiteId: id, action: 'RESOUMISSION', communeId: communeId);
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de la resoumission : $e'));
    }
  }

  Future<void> _enregistrerAudit({
    required int entiteId,
    required String action,
    required int communeId,
    String? motif,
  }) async {
    final acteur = _auth.currentUser?.uid ?? 'inconnu';
    final builder = _connector.enregistrerAudit(
      typeEntite: 'Parcelle',
      entiteId: entiteId,
      action: action,
      acteurFirebaseUid: acteur,
    );
    builder.communeId(communeId);
    if (motif != null) builder.motif(motif);
    await builder.execute();
  }
}
