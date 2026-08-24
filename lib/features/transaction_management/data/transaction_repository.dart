import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_data_connect/firebase_data_connect.dart' show Timestamp;
import 'package:fpdart/fpdart.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/core/failure.dart';

String _formatTimestamp(Timestamp t) {
  final millis = t.seconds * 1000 + t.nanoseconds ~/ 1000000;
  return DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true).toIso8601String();
}

class TransactionSummary {
  const TransactionSummary({
    required this.id,
    required this.parcelleId,
    required this.typeTransaction,
    this.montant,
    required this.statut,
    required this.dateTransaction,
  });

  final int id;
  final int parcelleId;
  final String typeTransaction;
  final double? montant;
  final String statut;
  final String dateTransaction;
}

class TransactionDetail {
  const TransactionDetail({
    required this.id,
    required this.parcelleId,
    required this.vendeurId,
    required this.acheteurId,
    required this.typeTransaction,
    this.montant,
    required this.statut,
    this.motifRejet,
    required this.dateTransaction,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final int parcelleId;
  final int vendeurId;
  final int acheteurId;
  final String typeTransaction;
  final double? montant;
  final String statut;
  final String? motifRejet;
  final String dateTransaction;
  final String createdAt;
  final String updatedAt;
}

/// Minimal person lookup, mirrors ProprietaireInfo from
/// parcelle_management — duplicated rather than shared because the two
/// features are independent modules per the Simplification Rules (no
/// premature abstraction across feature boundaries).
class PersonneInfo {
  const PersonneInfo({
    required this.id,
    this.nom,
    this.prenom,
  });

  final int id;
  final String? nom;
  final String? prenom;

  String get nomAffiche {
    final full = [nom, prenom].where((s) => s != null && s.isNotEmpty).join(' ');
    return full.isEmpty ? '(nom non renseigné)' : full;
  }
}

class TransactionRepository {
  TransactionRepository(this._connector, this._auth);
  final PorheFoncier23072026Connector _connector;
  final FirebaseAuth _auth;

  Future<Either<Failure, List<TransactionSummary>>> listerToutes({
    int? limit,
    int? offset,
  }) async {
    try {
      var builder = _connector.listerToutesTransactions();
      if (limit != null) builder = builder.limit(limit);
      if (offset != null) builder = builder.offset(offset);
      final result = await builder.execute();
      return right(result.data.transactionFoncieres
          .map((t) => TransactionSummary(
                id: t.id,
                parcelleId: t.parcelleId,
                typeTransaction: t.typeTransaction.stringValue,
                montant: t.montant,
                statut: t.statut.stringValue,
                dateTransaction: t.dateTransaction.toString(),
              ))
          .toList());
    } catch (e) {
      return left(Failure('Erreur lors du chargement des transactions : $e'));
    }
  }

  Future<Either<Failure, List<TransactionSummary>>> listerEnAttenteParCommune(
    int communeId,
  ) async {
    try {
      final result =
          await _connector.listerTransactionsEnAttenteParCommune(communeId: communeId).execute();
      return right(result.data.transactionFoncieres
          .map((t) => TransactionSummary(
                id: t.id,
                parcelleId: t.parcelleId,
                typeTransaction: t.typeTransaction.stringValue,
                montant: t.montant,
                statut: 'EN_ATTENTE_VALIDATION',
                dateTransaction: t.dateTransaction.toString(),
              ))
          .toList());
    } catch (e) {
      return left(Failure('Erreur lors du chargement des transactions : $e'));
    }
  }

  Future<Either<Failure, List<TransactionSummary>>> listerRejeteesParCommune(
    int communeId,
  ) async {
    try {
      final result =
          await _connector.listerTransactionsRejeteesParCommune(communeId: communeId).execute();
      return right(result.data.transactionFoncieres
          .map((t) => TransactionSummary(
                id: t.id,
                parcelleId: t.parcelleId,
                typeTransaction: 'N/A',
                montant: null,
                statut: 'REJETEE',
                dateTransaction: _formatTimestamp(t.updatedAt),
              ))
          .toList());
    } catch (e) {
      return left(Failure('Erreur lors du chargement des transactions rejetées : $e'));
    }
  }

  Future<Either<Failure, TransactionDetail>> obtenirDetail(int id) async {
    try {
      final result = await _connector.obtenirTransactionParId(id: id).execute();
      final t = result.data.transactionFonciere;
      if (t == null) return left(const Failure('Transaction introuvable.'));
      return right(TransactionDetail(
        id: t.id,
        parcelleId: t.parcelleId,
        vendeurId: t.vendeurId,
        acheteurId: t.acheteurId,
        typeTransaction: t.typeTransaction.stringValue,
        montant: t.montant,
        statut: t.statut.stringValue,
        motifRejet: t.motifRejet,
        dateTransaction: t.dateTransaction.toString(),
        createdAt: _formatTimestamp(t.createdAt),
        updatedAt: _formatTimestamp(t.updatedAt),
      ));
    } catch (e) {
      return left(Failure('Erreur lors du chargement de la transaction : $e'));
    }
  }

  Future<Either<Failure, PersonneInfo>> obtenirPersonne(int utilisateurId) async {
    try {
      final result = await _connector.obtenirUtilisateurParId(id: utilisateurId).execute();
      final matches = result.data.utilisateurs;
      if (matches.isEmpty) return left(const Failure('Utilisateur introuvable.'));
      final u = matches.first;
      return right(PersonneInfo(id: u.id, nom: u.nom, prenom: u.prenom));
    } catch (e) {
      return left(Failure('Erreur lors du chargement de la personne : $e'));
    }
  }

  /// Validates the transaction AND transfers parcelle ownership in one
  /// server-side @transaction mutation (validerTransaction updates both
  /// TransactionFonciere.statut and Parcelle.utilisateurId atomically) —
  /// confirmed in mutations.gql. No audit pairing exists on this
  /// mutation server-side (flagged gap, consistent with Parcelle's
  /// precedent of auditing from the repository layer instead).
  Future<Either<Failure, Unit>> valider({
    required int id,
    required int parcelleId,
    required int nouveauUtilisateurId,
    required int communeId,
  }) async {
    try {
      await _connector
          .validerTransaction(
            id: id,
            parcelleId: parcelleId,
            nouveauUtilisateurId: nouveauUtilisateurId,
          )
          .execute();
      await _enregistrerAudit(
        entiteId: id,
        action: 'VALIDATION',
        communeId: communeId,
        motif: 'Transfert de propriété vers utilisateur #$nouveauUtilisateurId',
      );
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
      await _connector.rejeterTransactionAvecMotif(id: id, motifRejet: motif).execute();
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
      await _connector.resoumettreTransaction(id: id).execute();
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
      typeEntite: 'TransactionFonciere',
      entiteId: entiteId,
      action: action,
      acteurFirebaseUid: acteur,
    );
    builder.communeId(communeId);
    if (motif != null) builder.motif(motif);
    await builder.execute();
  }
}
