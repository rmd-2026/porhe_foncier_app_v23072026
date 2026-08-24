import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/core/failure.dart';

class PaiementSummary {
  const PaiementSummary({
    required this.id,
    this.utilisateurId,
    this.taxeFonciereId,
    this.abonnementId,
    this.fraisEnregistrementId,
    required this.methodePaiement,
    required this.montant,
    this.referenceTransaction,
    required this.statut,
    required this.createdAt,
  });

  final int id;
  final int? utilisateurId;
  final int? taxeFonciereId;
  final int? abonnementId;
  final int? fraisEnregistrementId;
  final String methodePaiement;
  final double montant;
  final String? referenceTransaction;
  final String statut;
  final String createdAt;

  /// Which entity this payment is linked to, if any — drives which
  /// confirm mutation is correct to call (see confirmerAdapte below).
  String get typeLien {
    if (taxeFonciereId != null) return 'TAXE';
    if (abonnementId != null) return 'ABONNEMENT';
    if (fraisEnregistrementId != null) return 'FRAIS';
    return 'AUCUN';
  }
}

String libelleMethodePaiement(String methode) {
  switch (methode) {
    case 'ORANGE_MONEY':
      return 'Orange Money';
    case 'MTN_MOMO':
      return 'MTN MoMo';
    case 'AUTRE':
    default:
      return 'Autre';
  }
}

String libelleStatutPaiement(String statut) {
  switch (statut) {
    case 'PAYE':
      return 'Payé';
    case 'EN_RETARD':
      return 'En retard';
    case 'ANNULE':
      return 'Annulé';
    case 'EN_ATTENTE':
    default:
      return 'En attente';
  }
}

class PaiementRepository {
  PaiementRepository(this._connector, this._auth);
  final PorheFoncier23072026Connector _connector;
  final FirebaseAuth _auth;

  Future<Either<Failure, List<PaiementSummary>>> listerParUtilisateur(int utilisateurId) async {
    try {
      final result =
          await _connector.listerPaiementsParUtilisateur(utilisateurId: utilisateurId).execute();
      return right(result.data.paiements
          .map((p) => PaiementSummary(
                id: p.id,
                taxeFonciereId: p.taxeFonciereId,
                abonnementId: p.abonnementId,
                fraisEnregistrementId: p.fraisEnregistrementId,
                methodePaiement: p.methodePaiement.stringValue,
                montant: p.montant,
                referenceTransaction: p.referenceTransaction,
                statut: p.statut.stringValue,
                createdAt: p.createdAt.toString(),
              ))
          .toList());
    } catch (e) {
      return left(Failure('Erreur lors du chargement des paiements : $e'));
    }
  }

  Future<Either<Failure, List<PaiementSummary>>> listerTous({int? limit, int? offset}) async {
    try {
      var builder = _connector.listerTousPaiements();
      if (limit != null) builder = builder.limit(limit);
      if (offset != null) builder = builder.offset(offset);
      final result = await builder.execute();
      return right(result.data.paiements
          .map((p) => PaiementSummary(
                id: p.id,
                utilisateurId: p.utilisateurId,
                methodePaiement: p.methodePaiement.stringValue,
                montant: p.montant,
                statut: p.statut.stringValue,
                createdAt: p.createdAt.toString(),
              ))
          .toList());
    } catch (e) {
      return left(Failure('Erreur lors du chargement des paiements : $e'));
    }
  }

  Future<Either<Failure, PaiementSummary>> obtenirDetail(int id) async {
    try {
      final result = await _connector.obtenirPaiementParId(id: id).execute();
      final p = result.data.paiement;
      if (p == null) return left(const Failure('Paiement introuvable.'));
      return right(PaiementSummary(
        id: p.id,
        utilisateurId: p.utilisateurId,
        taxeFonciereId: p.taxeFonciereId,
        abonnementId: p.abonnementId,
        fraisEnregistrementId: p.fraisEnregistrementId,
        methodePaiement: p.methodePaiement.stringValue,
        montant: p.montant,
        referenceTransaction: p.referenceTransaction,
        statut: p.statut.stringValue,
        createdAt: p.createdAt.toString(),
      ));
    } catch (e) {
      return left(Failure('Erreur lors du chargement du paiement : $e'));
    }
  }

  Future<Either<Failure, Unit>> enregistrer({
    required int utilisateurId,
    int? taxeFonciereId,
    int? abonnementId,
    int? fraisEnregistrementId,
    required String methodePaiement,
    required double montant,
    String? referenceTransaction,
  }) async {
    try {
      final builder = _connector.enregistrerPaiement(
        utilisateurId: utilisateurId,
        methodePaiement: MethodePaiement.values.byName(methodePaiement),
        montant: montant,
      );
      if (taxeFonciereId != null) builder.taxeFonciereId(taxeFonciereId);
      if (abonnementId != null) builder.abonnementId(abonnementId);
      if (fraisEnregistrementId != null) builder.fraisEnregistrementId(fraisEnregistrementId);
      if (referenceTransaction != null) builder.referenceTransaction(referenceTransaction);
      await builder.execute();
      await _enregistrerAudit(entiteId: utilisateurId, action: 'ENREGISTREMENT_PAIEMENT');
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de l\'enregistrement du paiement : $e'));
    }
  }

  /// Picks the correct confirmation mutation based on which entity
  /// this payment is actually linked to — using confirmerPaiement
  /// alone on a taxe/abonnement-linked payment would mark the payment
  /// PAYE without ever updating the linked TaxeFonciere/Abonnement,
  /// leaving them silently out of sync.
  Future<Either<Failure, Unit>> confirmerAdapte(PaiementSummary paiement) async {
    try {
      switch (paiement.typeLien) {
        case 'TAXE':
          await _connector
              .confirmerPaiementTaxe(id: paiement.id, taxeFonciereId: paiement.taxeFonciereId!)
              .execute();
          break;
        case 'ABONNEMENT':
          await _connector
              .confirmerPaiementAbonnement(id: paiement.id, abonnementId: paiement.abonnementId!)
              .execute();
          break;
        case 'FRAIS':
          // No confirmerPaiementFrais mutation exists — FraisEnregistrement.statut
          // is NOT updated atomically here, unlike taxe/abonnement. Flagged
          // gap, not silently worked around.
          await _connector.confirmerPaiement(id: paiement.id).execute();
          break;
        default:
          await _connector.confirmerPaiement(id: paiement.id).execute();
      }
      await _enregistrerAudit(entiteId: paiement.id, action: 'CONFIRMATION_PAIEMENT');
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de la confirmation : $e'));
    }
  }

  Future<Either<Failure, Unit>> annuler({required int id}) async {
    try {
      await _connector.annulerPaiement(id: id).execute();
      await _enregistrerAudit(entiteId: id, action: 'ANNULATION_PAIEMENT');
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de l\'annulation : $e'));
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
            typeEntite: 'Paiement',
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
