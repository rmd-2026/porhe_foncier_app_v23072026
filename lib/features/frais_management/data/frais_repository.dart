import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_data_connect/firebase_data_connect.dart' show Timestamp;
import 'package:fpdart/fpdart.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/core/failure.dart';

String _formatTimestamp(Timestamp timestamp) {
  final millis = timestamp.seconds * 1000 + timestamp.nanoseconds ~/ 1000000;
  return DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true).toIso8601String();
}

class FraisSummary {
  const FraisSummary({
    required this.id,
    this.parcelleId,
    required this.typeFrais,
    required this.montant,
    required this.statut,
    required this.createdAt,
  });

  final int id;
  final int? parcelleId;
  final String typeFrais;
  final double montant;
  final String statut;
  final String createdAt;
}

class FraisDetail {
  const FraisDetail({
    required this.id,
    required this.parcelleId,
    required this.typeFrais,
    required this.montant,
    required this.statut,
    this.motifRejet,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final int parcelleId;
  final String typeFrais;
  final double montant;
  final String statut;
  final String? motifRejet;
  final String createdAt;
  final String updatedAt;
}

String libelleTypeFrais(String type) {
  switch (type) {
    case 'INSCRIPTION_PARCELLE':
      return 'Inscription de parcelle';
    case 'DUPLICATA_DOCUMENT':
      return 'Duplicata de document';
    case 'AUTRE':
    default:
      return 'Autre';
  }
}

String libelleStatutFrais(String statut) {
  switch (statut) {
    case 'PAYE':
      return 'Payé';
    case 'EN_RETARD':
      return 'En retard';
    case 'ANNULE':
      return 'Annulé';
    case 'REJETE':
      return 'Rejeté';
    case 'EN_ATTENTE':
    default:
      return 'En attente';
  }
}

class FraisRepository {
  FraisRepository(this._connector, this._auth);
  final PorheFoncier23072026Connector _connector;
  final FirebaseAuth _auth;

  Future<Either<Failure, List<FraisSummary>>> listerParParcelle(int parcelleId) async {
    try {
      final result = await _connector.listerFraisParParcelle(parcelleId: parcelleId).execute();
      return right(result.data.fraisEnregistrements
          .map((f) => FraisSummary(
                id: f.id,
                typeFrais: f.typeFrais.stringValue,
                montant: f.montant,
                statut: f.statut.stringValue,
                createdAt: _formatTimestamp(f.createdAt),
              ))
          .toList());
    } catch (e) {
      return left(Failure('Erreur lors du chargement des frais : $e'));
    }
  }

  Future<Either<Failure, List<FraisSummary>>> listerTous({int? limit, int? offset}) async {
    try {
      var builder = _connector.listerTousFrais();
      if (limit != null) builder = builder.limit(limit);
      if (offset != null) builder = builder.offset(offset);
      final result = await builder.execute();
      return right(result.data.fraisEnregistrements
          .map((f) => FraisSummary(
                id: f.id,
                parcelleId: f.parcelleId,
                typeFrais: f.typeFrais.stringValue,
                montant: f.montant,
                statut: f.statut.stringValue,
                createdAt: _formatTimestamp(f.createdAt),
              ))
          .toList());
    } catch (e) {
      return left(Failure('Erreur lors du chargement des frais : $e'));
    }
  }

  /// Real per-id fetch, now that obtenirFraisParId exists and selects
  /// motifRejet — replaces the earlier list-data-reuse workaround.
  Future<Either<Failure, FraisDetail>> obtenirDetail(int id) async {
    try {
      final result = await _connector.obtenirFraisParId(id: id).execute();
      final f = result.data.fraisEnregistrement;
      if (f == null) return left(const Failure('Frais introuvable.'));
      return right(FraisDetail(
        id: f.id,
        parcelleId: f.parcelleId,
        typeFrais: f.typeFrais.stringValue,
        montant: f.montant,
        statut: f.statut.stringValue,
        motifRejet: f.motifRejet,
        createdAt: _formatTimestamp(f.createdAt),
        updatedAt: _formatTimestamp(f.updatedAt),
      ));
    } catch (e) {
      return left(Failure('Erreur lors du chargement du frais : $e'));
    }
  }

  Future<Either<Failure, Unit>> creer({
    required int parcelleId,
    required String typeFrais,
    required double montant,
  }) async {
    try {
      await _connector
          .creerFraisEnregistrement(
            parcelleId: parcelleId,
            typeFrais: TypeFrais.values.byName(typeFrais),
            montant: montant,
          )
          .execute();
      await _enregistrerAudit(entiteId: parcelleId, action: 'CREATION_FRAIS');
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de la création du frais : $e'));
    }
  }

  Future<Either<Failure, Unit>> marquerPaye({required int id}) async {
    try {
      await _connector.marquerFraisPaye(id: id).execute();
      await _enregistrerAudit(entiteId: id, action: 'PAIEMENT_FRAIS');
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors du marquage : $e'));
    }
  }

  Future<Either<Failure, Unit>> annuler({required int id, required String motifRejet}) async {
    try {
      await _connector.annulerFrais(id: id, motifRejet: motifRejet).execute();
      await _enregistrerAudit(entiteId: id, action: 'ANNULATION_FRAIS');
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de l\'annulation : $e'));
    }
  }

  Future<Either<Failure, Unit>> rejeter({required int id, required String motifRejet}) async {
    try {
      await _connector.rejeterFrais(id: id, motifRejet: motifRejet).execute();
      await _enregistrerAudit(entiteId: id, action: 'REJET_FRAIS');
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors du rejet : $e'));
    }
  }

  Future<Either<Failure, Unit>> supprimer({required int id}) async {
    try {
      await _connector.supprimerFraisEnregistrement(id: id).execute();
      await _enregistrerAudit(entiteId: id, action: 'SUPPRESSION_FRAIS');
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
            typeEntite: 'FraisEnregistrement',
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
