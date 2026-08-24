import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/core/failure.dart';

class AbonnementSummary {
  const AbonnementSummary({
    required this.id,
    this.utilisateurId,
    required this.niveau,
    required this.statut,
    required this.dateDebut,
    required this.dateFin,
  });

  final int id;
  final int? utilisateurId;
  final String niveau;
  final String statut;
  final String dateDebut;
  final String dateFin;

  bool get estExpireParDate => DateTime.tryParse(dateFin)?.isBefore(DateTime.now()) ?? false;
}

String libelleNiveau(String niveau) {
  switch (niveau) {
    case 'BASIQUE':
      return 'Basique';
    case 'STANDARD':
      return 'Standard';
    case 'PREMIUM':
      return 'Premium';
    default:
      return niveau;
  }
}

String libelleStatutAbonnement(String statut) {
  switch (statut) {
    case 'ACTIF':
      return 'Actif';
    case 'EXPIRE':
      return 'Expiré';
    case 'ANNULE':
      return 'Annulé';
    default:
      return statut;
  }
}

class AbonnementRepository {
  AbonnementRepository(this._connector, this._auth);
  final PorheFoncier23072026Connector _connector;
  final FirebaseAuth _auth;

  Future<Either<Failure, List<AbonnementSummary>>> listerParUtilisateur(int utilisateurId) async {
    try {
      final result =
          await _connector.listerAbonnementsParUtilisateur(utilisateurId: utilisateurId).execute();
      return right(result.data.abonnements
          .map((a) => AbonnementSummary(
                id: a.id,
                niveau: a.niveau.stringValue,
                statut: a.statut.stringValue,
                dateDebut: a.dateDebut.toString(),
                dateFin: a.dateFin.toString(),
              ))
          .toList());
    } catch (e) {
      return left(Failure('Erreur lors du chargement des abonnements : $e'));
    }
  }

  Future<Either<Failure, List<AbonnementSummary>>> listerTous({int? limit, int? offset}) async {
    try {
      var builder = _connector.listerTousAbonnements();
      if (limit != null) builder = builder.limit(limit);
      if (offset != null) builder = builder.offset(offset);
      final result = await builder.execute();
      return right(result.data.abonnements
          .map((a) => AbonnementSummary(
                id: a.id,
                utilisateurId: a.utilisateurId,
                niveau: a.niveau.stringValue,
                statut: a.statut.stringValue,
                dateDebut: a.dateDebut.toString(),
                dateFin: a.dateFin.toString(),
              ))
          .toList());
    } catch (e) {
      return left(Failure('Erreur lors du chargement des abonnements : $e'));
    }
  }

  Future<Either<Failure, List<AbonnementSummary>>> listerActifsToutes() async {
    try {
      final result = await _connector.listerAbonnementsActifsToutes().execute();
      return right(result.data.abonnements
          .map((a) => AbonnementSummary(
                id: a.id,
                utilisateurId: a.utilisateurId,
                niveau: a.niveau.stringValue,
                statut: 'ACTIF',
                dateDebut: a.dateDebut.toString(),
                dateFin: a.dateFin.toString(),
              ))
          .toList());
    } catch (e) {
      return left(Failure('Erreur lors du chargement des abonnements actifs : $e'));
    }
  }

  Future<Either<Failure, Unit>> creer({
    required int utilisateurId,
    required String niveau,
    required DateTime dateDebut,
    required DateTime dateFin,
  }) async {
    try {
      await _connector
          .creerAbonnement(
            utilisateurId: utilisateurId,
            niveau: NiveauAbonnement.values.byName(niveau),
            dateDebut: dateDebut,
            dateFin: dateFin,
          )
          .execute();
      await _enregistrerAudit(entiteId: utilisateurId, action: 'CREATION_ABONNEMENT');
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de la création de l\'abonnement : $e'));
    }
  }

  /// Only non-null fields are sent, matching mettreAJourAbonnement's
  /// optional-parameter shape — a partial edit (e.g. only niveau
  /// changed) never accidentally clears dateDebut/dateFin.
  Future<Either<Failure, Unit>> modifier({
    required int id,
    String? niveau,
    DateTime? dateDebut,
    DateTime? dateFin,
  }) async {
    try {
      final builder = _connector.mettreAJourAbonnement(id: id);
      if (niveau != null) builder.niveau(NiveauAbonnement.values.byName(niveau));
      if (dateDebut != null) builder.dateDebut(dateDebut);
      if (dateFin != null) builder.dateFin(dateFin);
      await builder.execute();
      await _enregistrerAudit(entiteId: id, action: 'MODIFICATION_ABONNEMENT');
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de la modification : $e'));
    }
  }

  Future<Either<Failure, Unit>> renouveler({
    required int id,
    required DateTime nouvelleDateFin,
  }) async {
    try {
      await _connector.renouvelerAbonnement(id: id, dateFin: nouvelleDateFin).execute();
      await _enregistrerAudit(entiteId: id, action: 'RENOUVELLEMENT_ABONNEMENT');
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors du renouvellement : $e'));
    }
  }

  /// Soft path: sets statut to ANNULE, row stays. Prefer this over
  /// supprimer() in almost all cases — same lifecycle split as Taxe's
  /// annuler()/supprimer() pair.
  Future<Either<Failure, Unit>> annuler({required int id}) async {
    try {
      await _connector.annulerAbonnement(id: id).execute();
      await _enregistrerAudit(entiteId: id, action: 'ANNULATION_ABONNEMENT');
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de l\'annulation : $e'));
    }
  }

  /// Hard path: permanent, no recovery beyond JournalAudit. Reserved
  /// for genuine data-entry mistakes.
  Future<Either<Failure, Unit>> supprimer({required int id}) async {
    try {
      await _connector.supprimerAbonnement(id: id).execute();
      await _enregistrerAudit(entiteId: id, action: 'SUPPRESSION_ABONNEMENT');
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de la suppression : $e'));
    }
  }

  Future<void> _enregistrerAudit({
    required int entiteId,
    required String action,
  }) async {
    final acteur = _auth.currentUser?.uid ?? 'inconnu';
    try {
      await _connector
          .enregistrerAudit(
            typeEntite: 'Abonnement',
            entiteId: entiteId,
            action: action,
            acteurFirebaseUid: acteur,
          )
          .execute();
    } catch (_) {
      // Best-effort, consistent with every other module's audit calls.
    }
  }
}
