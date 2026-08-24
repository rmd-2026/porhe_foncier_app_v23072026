import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_data_connect/firebase_data_connect.dart' show Timestamp;
import 'package:fpdart/fpdart.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/core/failure.dart';

String _formatTimestamp(Timestamp t) {
  final millis = t.seconds * 1000 + t.nanoseconds ~/ 1000000;
  return DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true).toIso8601String();
}

String? _formatDate(DateTime? d) => d?.toString();

class UtilisateurSummary {
  const UtilisateurSummary({
    required this.id,
    required this.firebaseUid,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.telephone,
    required this.statutCompte,
    required this.createdAt,
  });

  final int id;
  final String firebaseUid;
  final String? nom;
  final String? prenom;
  final String? email;
  final String? telephone;
  final String statutCompte;
  final String createdAt;

  String get nomAffiche {
    final full = [nom, prenom].where((s) => s != null && s.isNotEmpty).join(' ');
    return full.isEmpty ? '(nom non renseigné)' : full;
  }
}

class UtilisateurDetail {
  const UtilisateurDetail({
    required this.id,
    required this.firebaseUid,
    this.nom,
    this.prenom,
    this.civilite,
    this.dateNaissance,
    this.lieuNaissance,
    this.nationalite,
    this.typePieceIdentite,
    this.numeroPieceIdentite,
    this.pieceIdentiteValideDe,
    this.pieceIdentiteValideA,
    this.email,
    this.telephone,
    this.adresse,
    this.photoUrl,
    required this.statutCompte,
    this.motifStatut,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String firebaseUid;
  final String? nom;
  final String? prenom;
  final String? civilite;
  final String? dateNaissance;
  final String? lieuNaissance;
  final String? nationalite;
  final String? typePieceIdentite;
  final String? numeroPieceIdentite;
  final String? pieceIdentiteValideDe;
  final String? pieceIdentiteValideA;
  final String? email;
  final String? telephone;
  final String? adresse;
  final String? photoUrl;
  final String statutCompte;
  final String? motifStatut;
  final String createdAt;
  final String updatedAt;
}

class UtilisateurRepository {
  UtilisateurRepository(this._connector, this._auth);
  final PorheFoncier23072026Connector _connector;
  final FirebaseAuth _auth;

  Future<Either<Failure, List<UtilisateurSummary>>> listerParStatut(
    String statutCompte,
  ) async {
    try {
      final result = await _connector
          .listerUtilisateursParStatutCompte(
            statutCompte: StatutCompte.values.byName(statutCompte),
          )
          .execute();
      return right(result.data.utilisateurs
          .map((u) => UtilisateurSummary(
                id: u.id,
                firebaseUid: u.firebaseUid,
                nom: u.nom,
                prenom: u.prenom,
                email: u.email,
                telephone: u.telephone,
                statutCompte: u.statutCompte.stringValue,
                createdAt: _formatTimestamp(u.createdAt),
              ))
          .toList());
    } catch (e) {
      return left(Failure('Erreur lors du chargement des utilisateurs : $e'));
    }
  }
  /// $limit/$offset are optional GraphQL variables with server-side
  /// defaults, so — matching every other paginated query in this
  /// codebase (listerAuditToutes, listerParcellesParCommune, etc.) —
  /// they are set via chained fluent setters on the builder, never as
  /// named constructor arguments to listerTousUtilisateurs(...).
  Future<Either<Failure, List<UtilisateurSummary>>> listerTous({
    int? limit,
    int? offset,
  }) async {
    try {
      var builder = _connector.listerTousUtilisateurs();
      if (limit != null) builder = builder.limit(limit);
      if (offset != null) builder = builder.offset(offset);
      final result = await builder.execute();
      return right(result.data.utilisateurs
          .map((u) => UtilisateurSummary(
                id: u.id,
                firebaseUid: u.firebaseUid,
                nom: u.nom,
                prenom: u.prenom,
                email: u.email,
                telephone: u.telephone,
                statutCompte: u.statutCompte.stringValue,
                createdAt: _formatTimestamp(u.createdAt),
              ))
          .toList());
    } catch (e) {
      return left(Failure('Erreur lors du chargement des utilisateurs : $e'));
    }
  }

  Future<Either<Failure, UtilisateurDetail>> obtenirDetail(
    String firebaseUid,
  ) async {
    try {
      final result = await _connector
          .obtenirProfilParFirebaseUid(firebaseUid: firebaseUid)
          .execute();
      final u = result.data.utilisateur;
      if (u == null) {
        return left(const Failure('Utilisateur introuvable.'));
      }
      return right(UtilisateurDetail(
        id: u.id,
        firebaseUid: u.firebaseUid,
        nom: u.nom,
        prenom: u.prenom,
        civilite: u.civilite?.stringValue,
        dateNaissance: _formatDate(u.dateNaissance),
        lieuNaissance: u.lieuNaissance,
        nationalite: u.nationalite,
        typePieceIdentite: u.typePieceIdentite?.stringValue,
        numeroPieceIdentite: u.numeroPieceIdentite,
        pieceIdentiteValideDe: _formatDate(u.pieceIdentiteValideDe),
        pieceIdentiteValideA: _formatDate(u.pieceIdentiteValideA),
        email: u.email,
        telephone: u.telephone,
        adresse: u.adresse,
        photoUrl: u.photoUrl,
        statutCompte: u.statutCompte.stringValue,
        motifStatut: u.motifStatut,
        createdAt: _formatTimestamp(u.createdAt),
        updatedAt: _formatTimestamp(u.updatedAt),
      ));
    } catch (e) {
      return left(Failure('Erreur lors du chargement du profil : $e'));
    }
  }

  /// Full profile edit — every field optional/settable, matching
  /// mettreAJourProfil's signature. Only non-null values are sent.
  Future<Either<Failure, Unit>> mettreAJourProfil({
    required String firebaseUid,
    String? nom,
    String? prenom,
    String? civilite,
    DateTime? dateNaissance,
    String? lieuNaissance,
    String? nationalite,
    String? typePieceIdentite,
    String? numeroPieceIdentite,
    DateTime? pieceIdentiteValideDe,
    DateTime? pieceIdentiteValideA,
    String? telephone,
    String? adresse,
    String? photoUrl,
  }) async {
    try {
      final builder = _connector.mettreAJourProfil(firebaseUid: firebaseUid);
      if (nom != null) builder.nom(nom);
      if (prenom != null) builder.prenom(prenom);
      if (civilite != null) builder.civilite(Civilite.values.byName(civilite));
      if (dateNaissance != null) builder.dateNaissance(dateNaissance);
      if (lieuNaissance != null) builder.lieuNaissance(lieuNaissance);
      if (nationalite != null) builder.nationalite(nationalite);
      if (typePieceIdentite != null) {
        builder.typePieceIdentite(TypePieceIdentite.values.byName(typePieceIdentite));
      }
      if (numeroPieceIdentite != null) builder.numeroPieceIdentite(numeroPieceIdentite);
      if (pieceIdentiteValideDe != null) {
        builder.pieceIdentiteValideDe(pieceIdentiteValideDe);
      }
      if (pieceIdentiteValideA != null) {
        builder.pieceIdentiteValideA(pieceIdentiteValideA);
      }
      if (telephone != null) builder.telephone(telephone);
      if (adresse != null) builder.adresse(adresse);
      if (photoUrl != null) builder.photoUrl(photoUrl);
      await builder.execute();
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de la mise à jour du profil : $e'));
    }
  }

  /// Approves a user — KYC success or reinstatement after deactivation.
  /// Pairs with a JournalAudit insert in the same call, per the
  /// project's transversal audit rule (never retrofitted).
  Future<Either<Failure, Unit>> validerUtilisateur({
    required String firebaseUid,
    required int utilisateurId,
  }) async {
    try {
      await _connector.validerUtilisateur(firebaseUid: firebaseUid).execute();

      final acteur = _auth.currentUser?.uid ?? 'inconnu';
      await _connector
          .enregistrerAudit(
            typeEntite: 'Utilisateur',
            entiteId: utilisateurId,
            action: 'VALIDATION',
            acteurFirebaseUid: acteur,
          )
          .execute();

      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de la validation : $e'));
    }
  }

  /// Deactivates a user — failed KYC or manual deactivation, one path
  /// for both. Motif is mandatory. Pairs with a JournalAudit insert.
  ///
  /// NOTE: this does NOT disable the underlying Firebase Auth account.
  /// That requires the Admin SDK (server-side only) and is not yet
  /// implemented — see the flagged Cloud Function follow-up. A
  /// deactivated Utilisateur can currently still authenticate via
  /// Firebase Auth; only this app's own data/UI should treat them as
  /// deactivated until that follow-up lands.
  Future<Either<Failure, Unit>> desactiverUtilisateur({
    required String firebaseUid,
    required int utilisateurId,
    required String motif,
  }) async {
    try {
      await _connector
          .desactiverUtilisateur(firebaseUid: firebaseUid, motifStatut: motif)
          .execute();

      final acteur = _auth.currentUser?.uid ?? 'inconnu';
      // motif is an optional field on enregistrerAudit, set via the
      // chained fluent setter — not a named constructor argument, same
      // pattern as every other optional field in this codebase.
      final auditBuilder = _connector.enregistrerAudit(
        typeEntite: 'Utilisateur',
        entiteId: utilisateurId,
        action: 'DESACTIVATION',
        acteurFirebaseUid: acteur,
      );
      auditBuilder.motif(motif);
      await auditBuilder.execute();

      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de la désactivation : $e'));
    }
  }
}
