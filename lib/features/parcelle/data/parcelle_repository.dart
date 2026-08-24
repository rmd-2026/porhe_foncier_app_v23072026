import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'package:fpdart/fpdart.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/core/failure.dart';

class ParcelleResume {
  ParcelleResume({
    required this.id,
    required this.codeParcelle,
    required this.communeId,
    this.utilisateurId,
    this.superficieM2,
    required this.statut,
    this.motifRejet,
    required this.createdAt,
  });

  final int id;
  final String codeParcelle;
  final int communeId;
  final int? utilisateurId;
  final double? superficieM2;
  final String statut;
  final String? motifRejet;
  final String createdAt;
}

class ParcelleDetail {
  ParcelleDetail({
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
}

String _formatTimestamp(Timestamp t) {
  final millis = t.seconds * 1000 + t.nanoseconds ~/ 1000000;
  return DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true).toIso8601String();
}

class ParcelleRepository {
  ParcelleRepository(this._connector, this._auth);
  final PorheFoncier23072026Connector _connector;
  final FirebaseAuth _auth;

  /// Resolves the internal Utilisateur.id from the current Firebase
  /// session -- listerParcellesParUtilisateur takes the internal id,
  /// not the firebaseUid, same resolution RoleRouter already does.
  Future<Either<Failure, int>> _idUtilisateurCourant() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return left(const Failure('Session invalide.'));
    try {
      final result = await _connector.obtenirProfilParFirebaseUid(firebaseUid: uid).execute();
      final u = result.data.utilisateur;
      if (u == null) return left(const Failure('Profil introuvable.'));
      return right(u.id);
    } catch (e) {
      return left(Failure('Erreur lors de la résolution du profil : $e'));
    }
  }

  Future<Either<Failure, List<ParcelleResume>>> listerMesParcelles() async {
    final idResult = await _idUtilisateurCourant();
    return idResult.match(
      (f) => left(f),
      (utilisateurId) async {
        try {
          final result =
              await _connector.listerParcellesParUtilisateur(utilisateurId: utilisateurId).execute();
          return right(result.data.parcelles
              .map((p) => ParcelleResume(
                    id: p.id,
                    codeParcelle: p.codeParcelle,
                    communeId: p.communeId,
                    superficieM2: p.superficieM2,
                    statut: p.statut.stringValue,
                    createdAt: _formatTimestamp(p.createdAt),
                  ))
              .toList());
        } catch (e) {
          return left(Failure('Erreur lors du chargement des parcelles : $e'));
        }
      },
    ) as Future<Either<Failure, List<ParcelleResume>>>;
  }

  Future<Either<Failure, List<ParcelleResume>>> listerParCommune(int communeId) async {
    try {
      final result = await _connector.listerParcellesParCommune(communeId: communeId).execute();
      return right(result.data.parcelles
          .map((p) => ParcelleResume(
                id: p.id,
                codeParcelle: p.codeParcelle,
                communeId: communeId,
                utilisateurId: p.utilisateurId,
                superficieM2: p.superficieM2,
                statut: p.statut.stringValue,
                createdAt: _formatTimestamp(p.createdAt),
              ))
          .toList());
    } catch (e) {
      return left(Failure('Erreur lors du chargement des parcelles : $e'));
    }
  }

  Future<Either<Failure, List<ParcelleResume>>> listerParStatut({
    required int communeId,
    required String statut,
  }) async {
    try {
      final result = await _connector
          .listerParcellesParStatut(communeId: communeId, statut: StatutParcelle.values.byName(statut))
          .execute();
      return right(result.data.parcelles
          .map((p) => ParcelleResume(
                id: p.id,
                codeParcelle: p.codeParcelle,
                communeId: p.communeId,
                utilisateurId: p.utilisateurId,
                superficieM2: p.superficieM2,
                statut: p.statut.stringValue,
                createdAt: _formatTimestamp(p.createdAt),
              ))
          .toList());
    } catch (e) {
      return left(Failure('Erreur lors du chargement des parcelles : $e'));
    }
  }

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

  /// Neither validerParcelle nor rejeterParcelle carry an audit insert
  /// in the mutation itself -- confirmed against the current
  /// mutations.gql. Both are followed here by an explicit
  /// enregistrerAudit call, per the Transversal Requirements rule
  /// that no write mutation is phase-complete without its audit
  /// pairing in the same phase.
  Future<Either<Failure, Unit>> valider(int id) async {
    try {
      await _connector.validerParcelle(id: id).execute();
      await _enregistrerAudit(entiteId: id, action: 'VALIDATION_PARCELLE');
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de la validation : $e'));
    }
  }

  Future<Either<Failure, Unit>> rejeter({required int id, required String motifRejet}) async {
    try {
      await _connector.rejeterParcelleAvecMotif(id: id, motifRejet: motifRejet).execute();
      await _enregistrerAudit(entiteId: id, action: 'REJET_PARCELLE', motif: motifRejet);
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors du rejet : $e'));
    }
  }

  Future<Either<Failure, Unit>> resoumettre(int id) async {
    try {
      await _connector.resoumettreParcelle(id: id).execute();
      await _enregistrerAudit(entiteId: id, action: 'RESOUMISSION_PARCELLE');
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de la resoumission : $e'));
    }
  }

  Future<void> _enregistrerAudit({
    required int entiteId,
    required String action,
    String? motif,
  }) async {
    final acteur = _auth.currentUser?.uid ?? 'inconnu';
    try {
      final builder = _connector.enregistrerAudit(
        typeEntite: 'Parcelle',
        entiteId: entiteId,
        action: action,
        acteurFirebaseUid: acteur,
      );
      if (motif != null) builder.motif(motif);
      await builder.execute();
    } catch (_) {
      // Best-effort, matching DocumentRepository's pattern -- the
      // primary operation already succeeded at this point, a
      // transient audit-write failure must never surface as an
      // error for an operation that actually worked.
    }
  }
}
