import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/core/failure.dart';

class TaxeSummary {
  const TaxeSummary({
    required this.id,
    required this.anneeFiscale,
    required this.montantDu,
    required this.dateEcheance,
    required this.statut,
  });

  final int id;
  final int anneeFiscale;
  final double montantDu;
  final String dateEcheance;
  final String statut;
}

class RapportFinancier {
  const RapportFinancier({
    required this.totalDu,
    required this.totalPaye,
    required this.totalEnAttente,
    required this.totalEnRetard,
    required this.nombreTaxes,
  });

  final double totalDu;
  final double totalPaye;
  final double totalEnAttente;
  final double totalEnRetard;
  final int nombreTaxes;
}

String libelleStatutTaxe(String statut) {
  switch (statut) {
    case 'PAYE':
      return 'Payée';
    case 'EN_RETARD':
      return 'En retard';
    case 'ANNULE':
      return 'Annulée';
    case 'EN_ATTENTE':
    default:
      return 'En attente';
  }
}

class TaxeRepository {
  TaxeRepository(this._connector, this._auth);
  final PorheFoncier23072026Connector _connector;
  final FirebaseAuth _auth;

  Future<Either<Failure, List<TaxeSummary>>> listerParParcelle(int parcelleId) async {
    try {
      final result = await _connector.listerTaxesParParcelle(parcelleId: parcelleId).execute();
      return right(result.data.taxeFoncieres
          .map((t) => TaxeSummary(
                id: t.id,
                anneeFiscale: t.anneeFiscale,
                montantDu: t.montantDu,
                dateEcheance: t.dateEcheance.toString(),
                statut: t.statut.stringValue,
              ))
          .toList());
    } catch (e) {
      return left(Failure('Erreur lors du chargement des taxes : $e'));
    }
  }

  Future<Either<Failure, List<TaxeSummary>>> listerToutes({int? limit, int? offset}) async {
    try {
      var builder = _connector.listerToutesTaxes();
      if (limit != null) builder = builder.limit(limit);
      if (offset != null) builder = builder.offset(offset);
      final result = await builder.execute();
      return right(result.data.taxeFoncieres
          .map((t) => TaxeSummary(
                id: t.id,
                anneeFiscale: t.anneeFiscale,
                montantDu: t.montantDu,
                dateEcheance: t.dateEcheance.toString(),
                statut: t.statut.stringValue,
              ))
          .toList());
    } catch (e) {
      return left(Failure('Erreur lors du chargement des taxes : $e'));
    }
  }

  Future<Either<Failure, List<TaxeSummary>>> listerEnRetardParCommune(int communeId) async {
    try {
      final result =
          await _connector.listerTaxesEnRetardParCommune(communeId: communeId).execute();
      return right(result.data.taxeFoncieres
          .map((t) => TaxeSummary(
                id: t.id,
                anneeFiscale: t.anneeFiscale,
                montantDu: t.montantDu,
                dateEcheance: t.dateEcheance.toString(),
                statut: 'EN_RETARD',
              ))
          .toList());
    } catch (e) {
      return left(Failure('Erreur lors du chargement des taxes en retard : $e'));
    }
  }

  Future<Either<Failure, RapportFinancier>> obtenirRapportFinancier(int communeId) async {
    try {
      final result = await _connector.obtenirRapportFinancierCommune(communeId: communeId).execute();
      final lignes = result.data.taxeFoncieres;

      double totalDu = 0, totalPaye = 0, totalEnAttente = 0, totalEnRetard = 0;
      for (final ligne in lignes) {
        totalDu += ligne.montantDu;
        switch (ligne.statut.stringValue) {
          case 'PAYE':
            totalPaye += ligne.montantDu;
            break;
          case 'EN_RETARD':
            totalEnRetard += ligne.montantDu;
            break;
          case 'EN_ATTENTE':
            totalEnAttente += ligne.montantDu;
            break;
        }
      }

      return right(RapportFinancier(
        totalDu: totalDu,
        totalPaye: totalPaye,
        totalEnAttente: totalEnAttente,
        totalEnRetard: totalEnRetard,
        nombreTaxes: lignes.length,
      ));
    } catch (e) {
      return left(Failure('Erreur lors du chargement du rapport : $e'));
    }
  }

  Future<Either<Failure, Unit>> creer({
    required int parcelleId,
    required int anneeFiscale,
    required double montantDu,
    required DateTime dateEcheance,
    required int communeId,
  }) async {
    try {
      await _connector
          .creerTaxeFonciere(
            parcelleId: parcelleId,
            anneeFiscale: anneeFiscale,
            montantDu: montantDu,
            dateEcheance: dateEcheance,
          )
          .execute();
      await _enregistrerAudit(entiteId: parcelleId, action: 'CREATION_TAXE', communeId: communeId);
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de la création de la taxe : $e'));
    }
  }

  /// Only non-null fields are sent — matches mettreAJourTaxeFonciere's
  /// optional-parameter shape, so partial edits (e.g. only montantDu
  /// changed) don't accidentally clear anneeFiscale/dateEcheance.
  Future<Either<Failure, Unit>> modifier({
    required int id,
    required int communeId,
    int? anneeFiscale,
    double? montantDu,
    DateTime? dateEcheance,
  }) async {
    try {
      final builder = _connector.mettreAJourTaxeFonciere(id: id);
      if (anneeFiscale != null) builder.anneeFiscale(anneeFiscale);
      if (montantDu != null) builder.montantDu(montantDu);
      if (dateEcheance != null) builder.dateEcheance(dateEcheance);
      await builder.execute();
      await _enregistrerAudit(entiteId: id, action: 'MODIFICATION_TAXE', communeId: communeId);
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de la modification : $e'));
    }
  }

  Future<Either<Failure, Unit>> marquerPayee({
    required int id,
    required int communeId,
  }) async {
    try {
      await _connector.marquerTaxePayee(id: id).execute();
      await _enregistrerAudit(entiteId: id, action: 'PAIEMENT_MANUEL', communeId: communeId);
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors du marquage : $e'));
    }
  }

  Future<Either<Failure, Unit>> marquerEnRetard({
    required int id,
    required int communeId,
  }) async {
    try {
      await _connector.marquerTaxeEnRetard(id: id).execute();
      await _enregistrerAudit(entiteId: id, action: 'MARQUAGE_RETARD', communeId: communeId);
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors du marquage : $e'));
    }
  }

  /// Soft path: sets statut to ANNULE, row stays for historical/audit
  /// purposes. This is the recommended action for "this tax no longer
  /// applies" — prefer this over supprimer() in almost all cases.
  Future<Either<Failure, Unit>> annuler({
    required int id,
    required int communeId,
  }) async {
    try {
      await _connector.annulerTaxe(id: id).execute();
      await _enregistrerAudit(entiteId: id, action: 'ANNULATION_TAXE', communeId: communeId);
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de l\'annulation : $e'));
    }
  }

  /// Hard path: the row is gone permanently, with only the JournalAudit
  /// entry (if this call succeeds) as any surviving trace. Reserved
  /// for genuine data-entry mistakes — prefer annuler() otherwise.
  Future<Either<Failure, Unit>> supprimer({
    required int id,
    required int communeId,
  }) async {
    try {
      await _connector.supprimerTaxeFonciere(id: id).execute();
      await _enregistrerAudit(entiteId: id, action: 'SUPPRESSION_TAXE', communeId: communeId);
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de la suppression : $e'));
    }
  }

  Future<void> _enregistrerAudit({
    required int entiteId,
    required String action,
    required int communeId,
  }) async {
    final acteur = _auth.currentUser?.uid ?? 'inconnu';
    try {
      await _connector
          .enregistrerAudit(
            typeEntite: 'TaxeFonciere',
            entiteId: entiteId,
            action: action,
            acteurFirebaseUid: acteur,
          )
          .execute();
    } catch (_) {
      // Best-effort — a transient audit failure must not surface as
      // if the actual tax operation failed.
    }
  }
}
