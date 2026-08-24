import 'package:firebase_data_connect/firebase_data_connect.dart' show Timestamp;
import 'package:fpdart/fpdart.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/core/failure.dart';

/// Converts a Data Connect `Timestamp` (its own class — distinct from
/// both Firestore's `Timestamp` and Dart's `DateTime`, exposing raw
/// `seconds`/`nanoseconds` ints) into a readable ISO-8601 string.
String formatDataConnectTimestamp(Timestamp timestamp) {
  final millis = timestamp.seconds * 1000 + timestamp.nanoseconds ~/ 1000000;
  return DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true).toString();
}

/// Converts a Date field (maps to plain Dart DateTime, not the custom
/// Timestamp class) to a readable string. Safe against null.
String? formatDate(DateTime? date) => date?.toString();

/// Reverse of [formatDataConnectTimestamp] — builds a Data Connect
/// Timestamp from a picked DateTime, needed only for
/// obtenirUploadsRecentsPourAbonnement's `depuis` parameter, which is
/// typed Timestamp rather than DateTime. Constructor shape unverified
/// against the generated SDK — adjust if this throws.
Timestamp toDataConnectTimestamp(DateTime date) {
  final millis = date.toUtc().millisecondsSinceEpoch;
  return Timestamp(
     (millis % 1000) * 1000000,
    millis ~/ 1000,
  );
}

// Map<String, dynamic> is used deliberately here: form values from the
// generic dashboard are inherently heterogeneous (String/int/double/enum),
// and this repository's job is to dispatch them into typed connector calls.
//
// Pattern for every mutation/query with optional fields: the required
// fields go into the initial connector method call; every optional
// field is set via its chained fluent setter ONLY if present in
// `values` — an omitted key means "don't send this field at all."
//
// Enum setters on requests take the bare generated enum value directly
// (e.g. TypeTransaction.VENTE) — NOT the Known/Unknown wrapper, which
// is only used when reading enum fields back out of a query result.
class DevDashboardRepository {
  DevDashboardRepository(this._connector);
  final PorheFoncier23072026Connector _connector;

  // ==========================================================
  // QUERIES
  // ==========================================================

  Future<Either<Failure, Map<String, dynamic>>> runQuery(
    String name,
    Map<String, dynamic> values,
  ) async {
    try {
      switch (name) {
        // ---------- Référence ----------
        case 'listerRegions':
          final result = await _connector.listerRegions().execute();
          return right({
            'regions':
                result.data.regions.map((r) => {'id': r.id, 'nom': r.nom}).toList(),
          });

        case 'listerCommunes':
          final result = await _connector.listerCommunes().execute();
          return right({
            'communes': result.data.communes
                .map((c) => {'id': c.id, 'nom': c.nom, 'regionId': c.regionId})
                .toList(),
          });

        case 'listerCommunesParRegion':
          final result = await _connector
              .listerCommunesParRegion(regionId: values['regionId'] as int)
              .execute();
          return right({
            'communes': result.data.communes
                .map((c) => {'id': c.id, 'nom': c.nom, 'regionId': c.regionId})
                .toList(),
          });

        case 'listerSousPrefectures':
          final result = await _connector.listerSousPrefectures().execute();
          return right({
            'sousPrefectures': result.data.sousPrefectures
                .map((s) => {'id': s.id, 'nom': s.nom, 'communeId': s.communeId})
                .toList(),
          });

        case 'listerSousPrefecturesParCommune':
          final result = await _connector
              .listerSousPrefecturesParCommune(
                  communeId: values['communeId'] as int)
              .execute();
          return right({
            'sousPrefectures': result.data.sousPrefectures
                .map((s) => {'id': s.id, 'nom': s.nom, 'communeId': s.communeId})
                .toList(),
          });

        // ---------- Identité ----------
        case 'obtenirProfilParFirebaseUid':
          final result = await _connector
              .obtenirProfilParFirebaseUid(
                  firebaseUid: values['firebaseUid'] as String)
              .execute();
          final u = result.data.utilisateur;
          if (u == null) {
            return left(
                const Failure('Aucun utilisateur trouvé pour ce firebaseUid.'));
          }
          return right({
            'id': u.id,
            'firebaseUid': u.firebaseUid,
            'nom': u.nom,
            'prenom': u.prenom,
            'civilite': u.civilite?.stringValue,
            'dateNaissance': formatDate(u.dateNaissance),
            'lieuNaissance': u.lieuNaissance,
            'nationalite': u.nationalite,
            'typePieceIdentite': u.typePieceIdentite?.stringValue,
            'numeroPieceIdentite': u.numeroPieceIdentite,
            'pieceIdentiteValideDe': formatDate(u.pieceIdentiteValideDe),
            'pieceIdentiteValideA': formatDate(u.pieceIdentiteValideA),
            'email': u.email,
            'telephone': u.telephone,
            'adresse': u.adresse,
            'photoUrl': u.photoUrl,
            'createdAt': formatDataConnectTimestamp(u.createdAt),
            'updatedAt': formatDataConnectTimestamp(u.updatedAt),
          });

        case 'estProfilIncomplet':
          final result = await _connector
              .estProfilIncomplet(firebaseUid: values['firebaseUid'] as String)
              .execute();
          final u = result.data.utilisateur;
          return right({
            'nom': u?.nom,
            'prenom': u?.prenom,
            'telephone': u?.telephone,
            'adresse': u?.adresse,
          });

        // ---------- RBAC ----------
        case 'obtenirRoleParUtilisateurId':
          final result = await _connector
              .obtenirRoleParUtilisateurId(
                  utilisateurId: values['utilisateurId'] as int)
              .execute();
          final r = result.data.utilisateurRole;
          if (r == null) {
            return left(const Failure('Aucun rôle trouvé pour cet utilisateur.'));
          }
          return right({
            'id': r.id,
            'nomRole': r.nomRole.stringValue,
            'communeId': r.communeId,
            'createdAt': formatDataConnectTimestamp(r.createdAt),
            'updatedAt': formatDataConnectTimestamp(r.updatedAt),
          });

        case 'verifierAppartenanceCommune':
          final result = await _connector
              .verifierAppartenanceCommune(
                utilisateurId: values['utilisateurId'] as int,
                communeId: values['communeId'] as int,
              )
              .execute();
          return right({
            'appartient': result.data.utilisateurRoles.isNotEmpty,
            'roles': result.data.utilisateurRoles
                .map((r) => {'nomRole': r.nomRole.stringValue, 'communeId': r.communeId})
                .toList(),
          });

        // ---------- Audit / Historique ----------
        case 'listerAuditToutes':
          {
            var builder = _connector.listerAuditToutes();
            if (values['limit'] != null) builder = builder.limit(values['limit'] as int);
            if (values['offset'] != null) builder = builder.offset(values['offset'] as int);
            final result = await builder.execute();
            return right({
              'journalAudits': result.data.journalAudits
                  .map((a) => {
                        'id': a.id,
                        'typeEntite': a.typeEntite,
                        'entiteId': a.entiteId,
                        'action': a.action,
                        'motif': a.motif,
                        'acteurFirebaseUid': a.acteurFirebaseUid,
                        'communeId': a.communeId,
                        'donneesAvant': a.donneesAvant,
                        'donneesApres': a.donneesApres,
                        'createdAt': formatDataConnectTimestamp(a.createdAt),
                      })
                  .toList(),
            });
          }

        case 'listerAuditParActeur':
          final result = await _connector
              .listerAuditParActeur(
                  acteurFirebaseUid: values['acteurFirebaseUid'] as String)
              .execute();
          return right({
            'journalAudits': result.data.journalAudits
                .map((a) => {
                      'id': a.id,
                      'typeEntite': a.typeEntite,
                      'entiteId': a.entiteId,
                      'action': a.action,
                      'motif': a.motif,
                      'communeId': a.communeId,
                      'createdAt': formatDataConnectTimestamp(a.createdAt),
                    })
                .toList(),
          });

        case 'listerAuditParCommune':
          final result = await _connector
              .listerAuditParCommune(communeId: values['communeId'] as int)
              .execute();
          return right({
            'journalAudits': result.data.journalAudits
                .map((a) => {
                      'id': a.id,
                      'typeEntite': a.typeEntite,
                      'entiteId': a.entiteId,
                      'action': a.action,
                      'motif': a.motif,
                      'acteurFirebaseUid': a.acteurFirebaseUid,
                      'donneesAvant': a.donneesAvant,
                      'donneesApres': a.donneesApres,
                      'createdAt': formatDataConnectTimestamp(a.createdAt),
                    })
                .toList(),
          });

        case 'listerAuditParTypeEntite':
          final result = await _connector
              .listerAuditParTypeEntite(typeEntite: values['typeEntite'] as String)
              .execute();
          return right({
            'journalAudits': result.data.journalAudits
                .map((a) => {
                      'id': a.id,
                      'entiteId': a.entiteId,
                      'action': a.action,
                      'motif': a.motif,
                      'acteurFirebaseUid': a.acteurFirebaseUid,
                      'communeId': a.communeId,
                      'createdAt': formatDataConnectTimestamp(a.createdAt),
                    })
                .toList(),
          });

        case 'listerHistoriqueRejetsEtSuppressions':
          {
            var builder = _connector.listerHistoriqueRejetsEtSuppressions();
            if (values['communeId'] != null) {
              builder = builder.communeId(values['communeId'] as int);
            }
            if (values['limit'] != null) builder = builder.limit(values['limit'] as int);
            if (values['offset'] != null) builder = builder.offset(values['offset'] as int);
            final result = await builder.execute();
            return right({
              'journalAudits': result.data.journalAudits
                  .map((a) => {
                        'id': a.id,
                        'typeEntite': a.typeEntite,
                        'entiteId': a.entiteId,
                        'action': a.action,
                        'motif': a.motif,
                        'acteurFirebaseUid': a.acteurFirebaseUid,
                        'communeId': a.communeId,
                        'donneesAvant': a.donneesAvant,
                        'createdAt': formatDataConnectTimestamp(a.createdAt),
                      })
                  .toList(),
            });
          }

        // ---------- Parcelle ----------
        case 'obtenirParcelleParId':
          final result = await _connector
              .obtenirParcelleParId(id: values['id'] as int)
              .execute();
          final p = result.data.parcelle;
          if (p == null) return left(const Failure('Parcelle introuvable.'));
          return right({
            'id': p.id,
            'codeParcelle': p.codeParcelle,
            'utilisateurId': p.utilisateurId,
            'regionId': p.regionId,
            'communeId': p.communeId,
            'sousPrefectureId': p.sousPrefectureId,
            'superficieM2': p.superficieM2,
            'latitude': p.latitude,
            'longitude': p.longitude,
            'adresseTerrain': p.adresseTerrain,
            'qrCode': p.qrCode,
            'statut': p.statut.stringValue,
            'motifRejet': p.motifRejet,
            'createdAt': formatDataConnectTimestamp(p.createdAt),
            'updatedAt': formatDataConnectTimestamp(p.updatedAt),
          });

        case 'obtenirParcelleParQrCode':
          final result = await _connector
              .obtenirParcelleParQrCode(qrCode: values['qrCode'] as String)
              .execute();
          return right({
            'parcelles': result.data.parcelles
                .map((p) => {
                      'id': p.id,
                      'codeParcelle': p.codeParcelle,
                      'utilisateurId': p.utilisateurId,
                      'communeId': p.communeId,
                      'statut': p.statut.stringValue,
                    })
                .toList(),
          });

        case 'listerParcellesParUtilisateur':
          final result = await _connector
              .listerParcellesParUtilisateur(
                  utilisateurId: values['utilisateurId'] as int)
              .execute();
          return right({
            'parcelles': result.data.parcelles
                .map((p) => {
                      'id': p.id,
                      'codeParcelle': p.codeParcelle,
                      'communeId': p.communeId,
                      'superficieM2': p.superficieM2,
                      'statut': p.statut.stringValue,
                      'createdAt': formatDataConnectTimestamp(p.createdAt),
                    })
                .toList(),
          });

        case 'listerParcellesParCommune':
          {
            var builder = _connector.listerParcellesParCommune(
              communeId: values['communeId'] as int,
            );
            if (values['limit'] != null) builder = builder.limit(values['limit'] as int);
            if (values['offset'] != null) builder = builder.offset(values['offset'] as int);
            final result = await builder.execute();
            return right({
              'parcelles': result.data.parcelles
                  .map((p) => {
                        'id': p.id,
                        'codeParcelle': p.codeParcelle,
                        'utilisateurId': p.utilisateurId,
                        'superficieM2': p.superficieM2,
                        'statut': p.statut.stringValue,
                        'createdAt': formatDataConnectTimestamp(p.createdAt),
                      })
                  .toList(),
            });
          }

        case 'listerParcellesParStatut':
          final result = await _connector
              .listerParcellesParStatut(
                communeId: values['communeId'] as int,
                statut: StatutParcelle.values.byName(values['statut'] as String),
              )
              .execute();
          return right({
            'parcelles': result.data.parcelles
                .map((p) => {
                      'id': p.id,
                      'codeParcelle': p.codeParcelle,
                      'utilisateurId': p.utilisateurId,
                      'communeId': p.communeId,
                      'superficieM2': p.superficieM2,
                      'statut': p.statut.stringValue,
                      'createdAt': formatDataConnectTimestamp(p.createdAt),
                      'updatedAt': formatDataConnectTimestamp(p.updatedAt),
                    })
                .toList(),
          });

        case 'listerParcellesRejeteesParCommune':
          final result = await _connector
              .listerParcellesRejeteesParCommune(
                  communeId: values['communeId'] as int)
              .execute();
          return right({
            'parcelles': result.data.parcelles
                .map((p) => {
                      'id': p.id,
                      'codeParcelle': p.codeParcelle,
                      'utilisateurId': p.utilisateurId,
                      'motifRejet': p.motifRejet,
                      'updatedAt': formatDataConnectTimestamp(p.updatedAt),
                    })
                .toList(),
          });

        case 'listerParcellesDansZone':
          final result = await _connector
              .listerParcellesDansZone(
                latMin: values['latMin'] as double,
                latMax: values['latMax'] as double,
                lonMin: values['lonMin'] as double,
                lonMax: values['lonMax'] as double,
              )
              .execute();
          return right({
            'parcelles': result.data.parcelles
                .map((p) => {
                      'id': p.id,
                      'codeParcelle': p.codeParcelle,
                      'latitude': p.latitude,
                      'longitude': p.longitude,
                      'statut': p.statut.stringValue,
                      'communeId': p.communeId,
                    })
                .toList(),
          });

        case 'rechercherParcelles':
          final result = await _connector
              .rechercherParcelles(terme: values['terme'] as String)
              .execute();
          return right({
            'parcelles': result.data.parcelles
                .map((p) => {
                      'id': p.id,
                      'codeParcelle': p.codeParcelle,
                      'communeId': p.communeId,
                      'statut': p.statut.stringValue,
                    })
                .toList(),
          });

        case 'listerToutesParcelles':
          {
            var builder = _connector.listerToutesParcelles();
            if (values['limit'] != null) builder = builder.limit(values['limit'] as int);
            if (values['offset'] != null) builder = builder.offset(values['offset'] as int);
            final result = await builder.execute();
            return right({
              'parcelles': result.data.parcelles
                  .map((p) => {
                        'id': p.id,
                        'codeParcelle': p.codeParcelle,
                        'utilisateurId': p.utilisateurId,
                        'communeId': p.communeId,
                        'statut': p.statut.stringValue,
                        'createdAt': formatDataConnectTimestamp(p.createdAt),
                      })
                  .toList(),
            });
          }

        // ---------- Transaction ----------
        case 'obtenirTransactionParId':
          final result = await _connector
              .obtenirTransactionParId(id: values['id'] as int)
              .execute();
          final t = result.data.transactionFonciere;
          if (t == null) return left(const Failure('Transaction introuvable.'));
          return right({
            'id': t.id,
            'parcelleId': t.parcelleId,
            'vendeurId': t.vendeurId,
            'acheteurId': t.acheteurId,
            'typeTransaction': t.typeTransaction.stringValue,
            'montant': t.montant,
            'statut': t.statut.stringValue,
            'motifRejet': t.motifRejet,
            'dateTransaction': formatDate(t.dateTransaction),
            'createdAt': formatDataConnectTimestamp(t.createdAt),
            'updatedAt': formatDataConnectTimestamp(t.updatedAt),
          });

        case 'listerTransactionsParParcelle':
          final result = await _connector
              .listerTransactionsParParcelle(parcelleId: values['parcelleId'] as int)
              .execute();
          return right({
            'transactionFoncieres': result.data.transactionFoncieres
                .map((t) => {
                      'id': t.id,
                      'typeTransaction': t.typeTransaction.stringValue,
                      'montant': t.montant,
                      'statut': t.statut.stringValue,
                      'dateTransaction': formatDate(t.dateTransaction),
                    })
                .toList(),
          });

        case 'listerTransactionsParUtilisateur':
          final result = await _connector
              .listerTransactionsParUtilisateur(
                  utilisateurId: values['utilisateurId'] as int)
              .execute();
          return right({
            'transactionFoncieres': result.data.transactionFoncieres
                .map((t) => {
                      'id': t.id,
                      'parcelleId': t.parcelleId,
                      'typeTransaction': t.typeTransaction.stringValue,
                      'montant': t.montant,
                      'statut': t.statut.stringValue,
                      'dateTransaction': formatDate(t.dateTransaction),
                    })
                .toList(),
          });

        case 'listerTransactionsEnAttenteParCommune':
          final result = await _connector
              .listerTransactionsEnAttenteParCommune(
                  communeId: values['communeId'] as int)
              .execute();
          return right({
            'transactionFoncieres': result.data.transactionFoncieres
                .map((t) => {
                      'id': t.id,
                      'parcelleId': t.parcelleId,
                      'typeTransaction': t.typeTransaction.stringValue,
                      'montant': t.montant,
                      'dateTransaction': formatDate(t.dateTransaction),
                      'createdAt': formatDataConnectTimestamp(t.createdAt),
                    })
                .toList(),
          });

        case 'listerTransactionsRejeteesParCommune':
          final result = await _connector
              .listerTransactionsRejeteesParCommune(
                  communeId: values['communeId'] as int)
              .execute();
          return right({
            'transactionFoncieres': result.data.transactionFoncieres
                .map((t) => {
                      'id': t.id,
                      'parcelleId': t.parcelleId,
                      'motifRejet': t.motifRejet,
                      'updatedAt': formatDataConnectTimestamp(t.updatedAt),
                    })
                .toList(),
          });

        case 'obtenirHistoriquePropriete':
          final result = await _connector
              .obtenirHistoriquePropriete(parcelleId: values['parcelleId'] as int)
              .execute();
          return right({
            'transactionFoncieres': result.data.transactionFoncieres
                .map((t) => {
                      'id': t.id,
                      'vendeurId': t.vendeurId,
                      'acheteurId': t.acheteurId,
                      'typeTransaction': t.typeTransaction.stringValue,
                      'montant': t.montant,
                      'dateTransaction': formatDate(t.dateTransaction),
                    })
                .toList(),
          });

        case 'listerToutesTransactions':
          {
            var builder = _connector.listerToutesTransactions();
            if (values['limit'] != null) builder = builder.limit(values['limit'] as int);
            if (values['offset'] != null) builder = builder.offset(values['offset'] as int);
            final result = await builder.execute();
            return right({
              'transactionFoncieres': result.data.transactionFoncieres
                  .map((t) => {
                        'id': t.id,
                        'parcelleId': t.parcelleId,
                        'typeTransaction': t.typeTransaction.stringValue,
                        'montant': t.montant,
                        'statut': t.statut.stringValue,
                        'dateTransaction': formatDate(t.dateTransaction),
                      })
                  .toList(),
            });
          }

        // ---------- Document ----------
        case 'obtenirDocumentParId':
          final result = await _connector
              .obtenirDocumentParId(id: values['id'] as int)
              .execute();
          final d = result.data.documentParcelle;
          if (d == null) return left(const Failure('Document introuvable.'));
          return right({
            'id': d.id,
            'parcelleId': d.parcelleId,
            'typeDocument': d.typeDocument.stringValue,
            'nomFichier': d.nomFichier,
            'urlStockage': d.urlStockage,
            'uploadeParFirebaseUid': d.uploadeParFirebaseUid,
            'createdAt': formatDataConnectTimestamp(d.createdAt),
            'updatedAt': formatDataConnectTimestamp(d.updatedAt),
          });

        case 'listerDocumentsParParcelle':
          final result = await _connector
              .listerDocumentsParParcelle(parcelleId: values['parcelleId'] as int)
              .execute();
          return right({
            'documentParcelles': result.data.documentParcelles
                .map((d) => {
                      'id': d.id,
                      'typeDocument': d.typeDocument.stringValue,
                      'nomFichier': d.nomFichier,
                      'urlStockage': d.urlStockage,
                      'uploadeParFirebaseUid': d.uploadeParFirebaseUid,
                      'createdAt': formatDataConnectTimestamp(d.createdAt),
                    })
                .toList(),
          });

        case 'listerTousDocuments':
          {
            var builder = _connector.listerTousDocuments();
            if (values['limit'] != null) builder = builder.limit(values['limit'] as int);
            if (values['offset'] != null) builder = builder.offset(values['offset'] as int);
            final result = await builder.execute();
            return right({
              'documentParcelles': result.data.documentParcelles
                  .map((d) => {
                        'id': d.id,
                        'parcelleId': d.parcelleId,
                        'typeDocument': d.typeDocument.stringValue,
                        'nomFichier': d.nomFichier,
                        'createdAt': formatDataConnectTimestamp(d.createdAt),
                      })
                  .toList(),
            });
          }

        // ---------- Taxe ----------
        case 'obtenirTaxeParId':
          final result = await _connector
              .obtenirTaxeParId(id: values['id'] as int)
              .execute();
          final t = result.data.taxeFonciere;
          if (t == null) return left(const Failure('Taxe introuvable.'));
          return right({
            'id': t.id,
            'parcelleId': t.parcelleId,
            'anneeFiscale': t.anneeFiscale,
            'montantDu': t.montantDu,
            'dateEcheance': formatDate(t.dateEcheance),
            'statut': t.statut.stringValue,
            'createdAt': formatDataConnectTimestamp(t.createdAt),
            'updatedAt': formatDataConnectTimestamp(t.updatedAt),
          });

        case 'listerTaxesParParcelle':
          final result = await _connector
              .listerTaxesParParcelle(parcelleId: values['parcelleId'] as int)
              .execute();
          return right({
            'taxeFoncieres': result.data.taxeFoncieres
                .map((t) => {
                      'id': t.id,
                      'anneeFiscale': t.anneeFiscale,
                      'montantDu': t.montantDu,
                      'dateEcheance': formatDate(t.dateEcheance),
                      'statut': t.statut.stringValue,
                    })
                .toList(),
          });

        case 'listerTaxesEnRetardParCommune':
          final result = await _connector
              .listerTaxesEnRetardParCommune(communeId: values['communeId'] as int)
              .execute();
          return right({
            'taxeFoncieres': result.data.taxeFoncieres
                .map((t) => {
                      'id': t.id,
                      'parcelleId': t.parcelleId,
                      'anneeFiscale': t.anneeFiscale,
                      'montantDu': t.montantDu,
                      'dateEcheance': formatDate(t.dateEcheance),
                    })
                .toList(),
          });

        case 'listerTaxesEcheanceDepassee':
          final result = await _connector
              .listerTaxesEcheanceDepassee(
                communeId: values['communeId'] as int,
                dateActuelle: values['dateActuelle'] as DateTime,
              )
              .execute();
          return right({
            'taxeFoncieres': result.data.taxeFoncieres
                .map((t) => {
                      'id': t.id,
                      'parcelleId': t.parcelleId,
                      'anneeFiscale': t.anneeFiscale,
                      'montantDu': t.montantDu,
                      'dateEcheance': formatDate(t.dateEcheance),
                    })
                .toList(),
          });

        case 'obtenirRapportFinancierCommune':
          final result = await _connector
              .obtenirRapportFinancierCommune(communeId: values['communeId'] as int)
              .execute();
          return right({
            'taxeFoncieres': result.data.taxeFoncieres
                .map((t) => {
                      'id': t.id,
                      'montantDu': t.montantDu,
                      'statut': t.statut.stringValue,
                      'anneeFiscale': t.anneeFiscale,
                    })
                .toList(),
          });

        case 'listerToutesTaxes':
          {
            var builder = _connector.listerToutesTaxes();
            if (values['limit'] != null) builder = builder.limit(values['limit'] as int);
            if (values['offset'] != null) builder = builder.offset(values['offset'] as int);
            final result = await builder.execute();
            return right({
              'taxeFoncieres': result.data.taxeFoncieres
                  .map((t) => {
                        'id': t.id,
                        'parcelleId': t.parcelleId,
                        'anneeFiscale': t.anneeFiscale,
                        'montantDu': t.montantDu,
                        'statut': t.statut.stringValue,
                        'dateEcheance': formatDate(t.dateEcheance),
                      })
                  .toList(),
            });
          }

        // ---------- Suivi Visuel ----------
        case 'listerSuiviVisuelParParcelle':
          final result = await _connector
              .listerSuiviVisuelParParcelle(parcelleId: values['parcelleId'] as int)
              .execute();
          return right({
            'suiviVisuels': result.data.suiviVisuels
                .map((s) => {
                      'id': s.id,
                      'typeMedia': s.typeMedia.stringValue,
                      'urlStockage': s.urlStockage,
                      'latitude': s.latitude,
                      'longitude': s.longitude,
                      'uploadeParFirebaseUid': s.uploadeParFirebaseUid,
                      'createdAt': formatDataConnectTimestamp(s.createdAt),
                    })
                .toList(),
          });

        case 'listerSuiviVisuelRecentParParcelle':
          final result = await _connector
              .listerSuiviVisuelRecentParParcelle(
                  parcelleId: values['parcelleId'] as int)
              .execute();
          return right({
            'suiviVisuels': result.data.suiviVisuels
                .map((s) => {
                      'id': s.id,
                      'typeMedia': s.typeMedia.stringValue,
                      'urlStockage': s.urlStockage,
                      'createdAt': formatDataConnectTimestamp(s.createdAt),
                    })
                .toList(),
          });

        case 'listerSuiviVisuelCompletParParcelle':
          final result = await _connector
              .listerSuiviVisuelCompletParParcelle(
                  parcelleId: values['parcelleId'] as int)
              .execute();
          return right({
            'suiviVisuels': result.data.suiviVisuels
                .map((s) => {
                      'id': s.id,
                      'typeMedia': s.typeMedia.stringValue,
                      'urlStockage': s.urlStockage,
                      'latitude': s.latitude,
                      'longitude': s.longitude,
                      'uploadeParFirebaseUid': s.uploadeParFirebaseUid,
                      'createdAt': formatDataConnectTimestamp(s.createdAt),
                    })
                .toList(),
          });

        case 'obtenirContexteAccesSuiviVisuel':
          final result = await _connector
              .obtenirContexteAccesSuiviVisuel(
                parcelleId: values['parcelleId'] as int,
                utilisateurId: values['utilisateurId'] as int,
              )
              .execute();
          return right({
            'abonnements': result.data.abonnements
                .map((a) => {'niveau': a.niveau.stringValue})
                .toList(),
            'suiviVisuels': result.data.suiviVisuels
                .map((s) => {
                      'id': s.id,
                      'typeMedia': s.typeMedia.stringValue,
                      'urlStockage': s.urlStockage,
                      'createdAt': formatDataConnectTimestamp(s.createdAt),
                    })
                .toList(),
          });

        case 'obtenirUploadsRecentsPourAbonnement':
          final result = await _connector
              .obtenirUploadsRecentsPourAbonnement(
                parcelleId: values['parcelleId'] as int,
                utilisateurId: values['utilisateurId'] as int,
                depuis: toDataConnectTimestamp(values['depuis'] as DateTime),
              )
              .execute();
          return right({
            'abonnements': result.data.abonnements
                .map((a) => {'niveau': a.niveau.stringValue})
                .toList(),
            'suiviVisuels': result.data.suiviVisuels
                .map((s) => {
                      'id': s.id,
                      'typeMedia': s.typeMedia.stringValue,
                      'createdAt': formatDataConnectTimestamp(s.createdAt),
                    })
                .toList(),
          });

        // ---------- Abonnement ----------
        case 'obtenirAbonnementActifParUtilisateur':
          final result = await _connector
              .obtenirAbonnementActifParUtilisateur(
                  utilisateurId: values['utilisateurId'] as int)
              .execute();
          return right({
            'abonnements': result.data.abonnements
                .map((a) => {
                      'id': a.id,
                      'niveau': a.niveau.stringValue,
                      'statut': a.statut.stringValue,
                      'dateDebut': formatDate(a.dateDebut),
                      'dateFin': formatDate(a.dateFin),
                    })
                .toList(),
          });

        case 'listerAbonnementsParUtilisateur':
          final result = await _connector
              .listerAbonnementsParUtilisateur(
                  utilisateurId: values['utilisateurId'] as int)
              .execute();
          return right({
            'abonnements': result.data.abonnements
                .map((a) => {
                      'id': a.id,
                      'niveau': a.niveau.stringValue,
                      'statut': a.statut.stringValue,
                      'dateDebut': formatDate(a.dateDebut),
                      'dateFin': formatDate(a.dateFin),
                    })
                .toList(),
          });

        case 'listerAbonnementsActifsToutes':
          final result = await _connector.listerAbonnementsActifsToutes().execute();
          return right({
            'abonnements': result.data.abonnements
                .map((a) => {
                      'id': a.id,
                      'utilisateurId': a.utilisateurId,
                      'niveau': a.niveau.stringValue,
                      'dateDebut': formatDate(a.dateDebut),
                      'dateFin': formatDate(a.dateFin),
                    })
                .toList(),
          });

        case 'listerTousAbonnements':
          {
            var builder = _connector.listerTousAbonnements();
            if (values['limit'] != null) builder = builder.limit(values['limit'] as int);
            if (values['offset'] != null) builder = builder.offset(values['offset'] as int);
            final result = await builder.execute();
            return right({
              'abonnements': result.data.abonnements
                  .map((a) => {
                        'id': a.id,
                        'utilisateurId': a.utilisateurId,
                        'niveau': a.niveau.stringValue,
                        'statut': a.statut.stringValue,
                        'dateDebut': formatDate(a.dateDebut),
                        'dateFin': formatDate(a.dateFin),
                      })
                  .toList(),
            });
          }

        // ---------- Paiement ----------
        case 'obtenirPaiementParId':
          final result = await _connector
              .obtenirPaiementParId(id: values['id'] as int)
              .execute();
          final p = result.data.paiement;
          if (p == null) return left(const Failure('Paiement introuvable.'));
          return right({
            'id': p.id,
            'utilisateurId': p.utilisateurId,
            'taxeFonciereId': p.taxeFonciereId,
            'abonnementId': p.abonnementId,
            'fraisEnregistrementId': p.fraisEnregistrementId,
            'methodePaiement': p.methodePaiement.stringValue,
            'montant': p.montant,
            'referenceTransaction': p.referenceTransaction,
            'statut': p.statut.stringValue,
            'createdAt': formatDataConnectTimestamp(p.createdAt),
            'updatedAt': formatDataConnectTimestamp(p.updatedAt),
          });

        case 'listerPaiementsParUtilisateur':
          final result = await _connector
              .listerPaiementsParUtilisateur(
                  utilisateurId: values['utilisateurId'] as int)
              .execute();
          return right({
            'paiements': result.data.paiements
                .map((p) => {
                      'id': p.id,
                      'taxeFonciereId': p.taxeFonciereId,
                      'abonnementId': p.abonnementId,
                      'fraisEnregistrementId': p.fraisEnregistrementId,
                      'methodePaiement': p.methodePaiement.stringValue,
                      'montant': p.montant,
                      'referenceTransaction': p.referenceTransaction,
                      'statut': p.statut.stringValue,
                      'createdAt': formatDataConnectTimestamp(p.createdAt),
                    })
                .toList(),
          });

        case 'listerPaiementsTaxeEnAttenteParCommune':
          final result = await _connector
              .listerPaiementsTaxeEnAttenteParCommune(
                  communeId: values['communeId'] as int)
              .execute();
          return right({
            'paiements': result.data.paiements
                .map((p) => {
                      'id': p.id,
                      'utilisateurId': p.utilisateurId,
                      'taxeFonciereId': p.taxeFonciereId,
                      'methodePaiement': p.methodePaiement.stringValue,
                      'montant': p.montant,
                      'referenceTransaction': p.referenceTransaction,
                      'createdAt': formatDataConnectTimestamp(p.createdAt),
                    })
                .toList(),
          });

        case 'listerPaiementsAbonnementEnAttente':
          final result = await _connector.listerPaiementsAbonnementEnAttente().execute();
          return right({
            'paiements': result.data.paiements
                .map((p) => {
                      'id': p.id,
                      'utilisateurId': p.utilisateurId,
                      'abonnementId': p.abonnementId,
                      'methodePaiement': p.methodePaiement.stringValue,
                      'montant': p.montant,
                      'referenceTransaction': p.referenceTransaction,
                      'createdAt': formatDataConnectTimestamp(p.createdAt),
                    })
                .toList(),
          });

        case 'listerTousPaiements':
          {
            var builder = _connector.listerTousPaiements();
            if (values['limit'] != null) builder = builder.limit(values['limit'] as int);
            if (values['offset'] != null) builder = builder.offset(values['offset'] as int);
            final result = await builder.execute();
            return right({
              'paiements': result.data.paiements
                  .map((p) => {
                        'id': p.id,
                        'utilisateurId': p.utilisateurId,
                        'methodePaiement': p.methodePaiement.stringValue,
                        'montant': p.montant,
                        'statut': p.statut.stringValue,
                        'createdAt': formatDataConnectTimestamp(p.createdAt),
                      })
                  .toList(),
            });
          }

        // ---------- Alerte ----------
        case 'listerAlertesParUtilisateur':
          {
            var builder = _connector.listerAlertesParUtilisateur(
              utilisateurId: values['utilisateurId'] as int,
            );
            if (values['limit'] != null) builder = builder.limit(values['limit'] as int);
            if (values['offset'] != null) builder = builder.offset(values['offset'] as int);
            final result = await builder.execute();
            return right({
              'alertes': result.data.alertes
                  .map((a) => {
                        'id': a.id,
                        'parcelleId': a.parcelleId,
                        'typeAlerte': a.typeAlerte.stringValue,
                        'message': a.message,
                        'lue': a.lue,
                        'createdAt': formatDataConnectTimestamp(a.createdAt),
                      })
                  .toList(),
            });
          }

        case 'listerAlertesNonLuesParUtilisateur':
          final result = await _connector
              .listerAlertesNonLuesParUtilisateur(
                  utilisateurId: values['utilisateurId'] as int)
              .execute();
          return right({
            'alertes': result.data.alertes
                .map((a) => {
                      'id': a.id,
                      'parcelleId': a.parcelleId,
                      'typeAlerte': a.typeAlerte.stringValue,
                      'message': a.message,
                      'createdAt': formatDataConnectTimestamp(a.createdAt),
                    })
                .toList(),
          });

        case 'listerToutesAlertes':
          {
            var builder = _connector.listerToutesAlertes();
            if (values['limit'] != null) builder = builder.limit(values['limit'] as int);
            if (values['offset'] != null) builder = builder.offset(values['offset'] as int);
            final result = await builder.execute();
            return right({
              'alertes': result.data.alertes
                  .map((a) => {
                        'id': a.id,
                        'utilisateurId': a.utilisateurId,
                        'parcelleId': a.parcelleId,
                        'typeAlerte': a.typeAlerte.stringValue,
                        'lue': a.lue,
                        'createdAt': formatDataConnectTimestamp(a.createdAt),
                      })
                  .toList(),
            });
          }

        // ---------- Litige ----------
        case 'obtenirLitigeParId':
          final result = await _connector
              .obtenirLitigeParId(id: values['id'] as int)
              .execute();
          final l = result.data.litige;
          if (l == null) return left(const Failure('Litige introuvable.'));
          return right({
            'id': l.id,
            'parcelleId': l.parcelleId,
            'transactionFonciereId': l.transactionFonciereId,
            'plaignantId': l.plaignantId,
            'motif': l.motif,
            'statut': l.statut.stringValue,
            'resolution': l.resolution,
            'createdAt': formatDataConnectTimestamp(l.createdAt),
            'updatedAt': formatDataConnectTimestamp(l.updatedAt),
          });

        case 'listerLitigesParParcelle':
          final result = await _connector
              .listerLitigesParParcelle(parcelleId: values['parcelleId'] as int)
              .execute();
          return right({
            'litiges': result.data.litiges
                .map((l) => {
                      'id': l.id,
                      'plaignantId': l.plaignantId,
                      'motif': l.motif,
                      'statut': l.statut.stringValue,
                      'resolution': l.resolution,
                      'createdAt': formatDataConnectTimestamp(l.createdAt),
                      'updatedAt': formatDataConnectTimestamp(l.updatedAt),
                    })
                .toList(),
          });

        case 'listerLitigesOuvertsParCommune':
          final result = await _connector
              .listerLitigesOuvertsParCommune(communeId: values['communeId'] as int)
              .execute();
          return right({
            'litiges': result.data.litiges
                .map((l) => {
                      'id': l.id,
                      'parcelleId': l.parcelleId,
                      'plaignantId': l.plaignantId,
                      'motif': l.motif,
                      'createdAt': formatDataConnectTimestamp(l.createdAt),
                    })
                .toList(),
          });

        case 'listerTousLitiges':
          {
            var builder = _connector.listerTousLitiges();
            if (values['limit'] != null) builder = builder.limit(values['limit'] as int);
            if (values['offset'] != null) builder = builder.offset(values['offset'] as int);
            final result = await builder.execute();
            return right({
              'litiges': result.data.litiges
                  .map((l) => {
                        'id': l.id,
                        'parcelleId': l.parcelleId,
                        'plaignantId': l.plaignantId,
                        'statut': l.statut.stringValue,
                        'createdAt': formatDataConnectTimestamp(l.createdAt),
                      })
                  .toList(),
            });
          }

        // ---------- Frais ----------
        case 'listerFraisParParcelle':
          final result = await _connector
              .listerFraisParParcelle(parcelleId: values['parcelleId'] as int)
              .execute();
          return right({
            'fraisEnregistrements': result.data.fraisEnregistrements
                .map((f) => {
                      'id': f.id,
                      'typeFrais': f.typeFrais.stringValue,
                      'montant': f.montant,
                      'statut': f.statut.stringValue,
                      'createdAt': formatDataConnectTimestamp(f.createdAt),
                    })
                .toList(),
          });

        case 'listerFraisEnAttenteParCommune':
          final result = await _connector
              .listerFraisEnAttenteParCommune(communeId: values['communeId'] as int)
              .execute();
          return right({
            'fraisEnregistrements': result.data.fraisEnregistrements
                .map((f) => {
                      'id': f.id,
                      'parcelleId': f.parcelleId,
                      'typeFrais': f.typeFrais.stringValue,
                      'montant': f.montant,
                      'createdAt': formatDataConnectTimestamp(f.createdAt),
                    })
                .toList(),
          });

        case 'listerTousFrais':
          {
            var builder = _connector.listerTousFrais();
            if (values['limit'] != null) builder = builder.limit(values['limit'] as int);
            if (values['offset'] != null) builder = builder.offset(values['offset'] as int);
            final result = await builder.execute();
            return right({
              'fraisEnregistrements': result.data.fraisEnregistrements
                  .map((f) => {
                        'id': f.id,
                        'parcelleId': f.parcelleId,
                        'typeFrais': f.typeFrais.stringValue,
                        'montant': f.montant,
                        'statut': f.statut.stringValue,
                        'createdAt': formatDataConnectTimestamp(f.createdAt),
                      })
                  .toList(),
            });
          }

        // ---------- Cross-cutting ----------
        case 'obtenirStatistiquesCommune':
          final result = await _connector
              .obtenirStatistiquesCommune(communeId: values['communeId'] as int)
              .execute();
          return right({
            'parcelles': result.data.parcelles
                .map((p) => {'id': p.id, 'statut': p.statut.stringValue})
                .toList(),
            'taxeFoncieres': result.data.taxeFoncieres
                .map((t) => {
                      'id': t.id,
                      'montantDu': t.montantDu,
                      'statut': t.statut.stringValue,
                    })
                .toList(),
            'transactionFoncieres': result.data.transactionFoncieres
                .map((t) => {
                      'id': t.id,
                      'statut': t.statut.stringValue,
                      'montant': t.montant,
                    })
                .toList(),
          });

        case 'obtenirChronologieParcelle':
          final result = await _connector
              .obtenirChronologieParcelle(parcelleId: values['parcelleId'] as int)
              .execute();
          return right({
            'transactionFoncieres': result.data.transactionFoncieres
                .map((t) => {
                      'id': t.id,
                      'typeTransaction': t.typeTransaction.stringValue,
                      'montant': t.montant,
                      'statut': t.statut.stringValue,
                      'dateTransaction': formatDate(t.dateTransaction),
                    })
                .toList(),
            'taxeFoncieres': result.data.taxeFoncieres
                .map((t) => {
                      'id': t.id,
                      'anneeFiscale': t.anneeFiscale,
                      'montantDu': t.montantDu,
                      'statut': t.statut.stringValue,
                    })
                .toList(),
            'documentParcelles': result.data.documentParcelles
                .map((d) => {
                      'id': d.id,
                      'typeDocument': d.typeDocument.stringValue,
                      'nomFichier': d.nomFichier,
                      'createdAt': formatDataConnectTimestamp(d.createdAt),
                    })
                .toList(),
            'suiviVisuels': result.data.suiviVisuels
                .map((s) => {
                      'id': s.id,
                      'typeMedia': s.typeMedia.stringValue,
                      'urlStockage': s.urlStockage,
                      'createdAt': formatDataConnectTimestamp(s.createdAt),
                    })
                .toList(),
            'litiges': result.data.litiges
                .map((l) => {
                      'id': l.id,
                      'statut': l.statut.stringValue,
                      'motif': l.motif,
                      'createdAt': formatDataConnectTimestamp(l.createdAt),
                    })
                .toList(),
          });

        default:
          return left(Failure(
              'Requête "$name" pas encore câblée dans ce tableau de bord.'));
      }
    } catch (e) {
      return left(Failure('Erreur lors de l\'exécution de "$name" : $e'));
    }
  }

  // ==========================================================
  // MUTATIONS
  // ==========================================================

  Future<Either<Failure, Unit>> runMutation(
    String name,
    Map<String, dynamic> values,
  ) async {
    try {
      switch (name) {
        // ---------- Référence ----------
        case 'seedRegions':
          await _connector.seedRegions().execute();
          return right(unit);

        case 'seedCommunes':
          await _connector.seedCommunes().execute();
          return right(unit);

        case 'seedSousPrefectures':
          await _connector.seedSousPrefectures().execute();
          return right(unit);

        // ---------- Identité ----------
        case 'upsertUtilisateurParFirebaseUid':
          {
            final builder = _connector.upsertUtilisateurParFirebaseUid(
              firebaseUid: values['firebaseUid'] as String,
            );
            if (values['nom'] != null) builder.nom(values['nom'] as String);
            if (values['prenom'] != null) builder.prenom(values['prenom'] as String);
            if (values['civilite'] != null) {
              builder.civilite(Civilite.values.byName(values['civilite'] as String));
            }
            if (values['dateNaissance'] != null) {
              builder.dateNaissance(values['dateNaissance'] as DateTime);
            }
            if (values['lieuNaissance'] != null) {
              builder.lieuNaissance(values['lieuNaissance'] as String);
            }
            if (values['nationalite'] != null) {
              builder.nationalite(values['nationalite'] as String);
            }
            if (values['typePieceIdentite'] != null) {
              builder.typePieceIdentite(
                TypePieceIdentite.values.byName(values['typePieceIdentite'] as String),
              );
            }
            if (values['numeroPieceIdentite'] != null) {
              builder.numeroPieceIdentite(values['numeroPieceIdentite'] as String);
            }
            if (values['pieceIdentiteValideDe'] != null) {
              builder.pieceIdentiteValideDe(values['pieceIdentiteValideDe'] as DateTime);
            }
            if (values['pieceIdentiteValideA'] != null) {
              builder.pieceIdentiteValideA(values['pieceIdentiteValideA'] as DateTime);
            }
            if (values['email'] != null) builder.email(values['email'] as String);
            if (values['telephone'] != null) builder.telephone(values['telephone'] as String);
            if (values['photoUrl'] != null) builder.photoUrl(values['photoUrl'] as String);
            await builder.execute();
            return right(unit);
          }

        case 'mettreAJourProfil':
          {
            final builder = _connector.mettreAJourProfil(
              firebaseUid: values['firebaseUid'] as String,
            );
            if (values['nom'] != null) builder.nom(values['nom'] as String);
            if (values['prenom'] != null) builder.prenom(values['prenom'] as String);
            if (values['civilite'] != null) {
              builder.civilite(Civilite.values.byName(values['civilite'] as String));
            }
            if (values['dateNaissance'] != null) {
              builder.dateNaissance(values['dateNaissance'] as DateTime);
            }
            if (values['lieuNaissance'] != null) {
              builder.lieuNaissance(values['lieuNaissance'] as String);
            }
            if (values['nationalite'] != null) {
              builder.nationalite(values['nationalite'] as String);
            }
            if (values['typePieceIdentite'] != null) {
              builder.typePieceIdentite(
                TypePieceIdentite.values.byName(values['typePieceIdentite'] as String),
              );
            }
            if (values['numeroPieceIdentite'] != null) {
              builder.numeroPieceIdentite(values['numeroPieceIdentite'] as String);
            }
            if (values['pieceIdentiteValideDe'] != null) {
              builder.pieceIdentiteValideDe(values['pieceIdentiteValideDe'] as DateTime);
            }
            if (values['pieceIdentiteValideA'] != null) {
              builder.pieceIdentiteValideA(values['pieceIdentiteValideA'] as DateTime);
            }
            if (values['telephone'] != null) builder.telephone(values['telephone'] as String);
            if (values['adresse'] != null) builder.adresse(values['adresse'] as String);
            if (values['photoUrl'] != null) builder.photoUrl(values['photoUrl'] as String);
            await builder.execute();
            return right(unit);
          }

        // ---------- RBAC ----------
        case 'assignerRoleUtilisateurParDefaut':
          await _connector
              .assignerRoleUtilisateurParDefaut(
                  utilisateurId: values['utilisateurId'] as int)
              .execute();
          return right(unit);

        case 'assignerRoleGlobal':
          await _connector
              .assignerRoleGlobal(
                utilisateurId: values['utilisateurId'] as int,
                nomRole: NomRole.values.byName(values['nomRole'] as String),
              )
              .execute();
          return right(unit);

        case 'assignerRoleCommune':
          await _connector
              .assignerRoleCommune(
                utilisateurId: values['utilisateurId'] as int,
                nomRole: NomRole.values.byName(values['nomRole'] as String),
                communeId: values['communeId'] as int,
              )
              .execute();
          return right(unit);

        // ---------- Audit / Historique ----------
        case 'enregistrerAudit':
          {
            final builder = _connector.enregistrerAudit(
              typeEntite: values['typeEntite'] as String,
              entiteId: values['entiteId'] as int,
              action: values['action'] as String,
              acteurFirebaseUid: values['acteurFirebaseUid'] as String,
            );
            if (values['motif'] != null) builder.motif(values['motif'] as String);
            if (values['communeId'] != null) builder.communeId(values['communeId'] as int);
            if (values['donneesAvant'] != null) {
              builder.donneesAvant(values['donneesAvant'] as String);
            }
            if (values['donneesApres'] != null) {
              builder.donneesApres(values['donneesApres'] as String);
            }
            await builder.execute();
            return right(unit);
          }

        // ---------- Parcelle ----------
        case 'creerParcelle':
          {
            final builder = _connector.creerParcelle(
              codeParcelle: values['codeParcelle'] as String,
              utilisateurId: values['utilisateurId'] as int,
              regionId: values['regionId'] as int,
              communeId: values['communeId'] as int,
            );
            if (values['sousPrefectureId'] != null) {
              builder.sousPrefectureId(values['sousPrefectureId'] as int);
            }
            if (values['superficieM2'] != null) {
              builder.superficieM2(values['superficieM2'] as double);
            }
            if (values['latitude'] != null) builder.latitude(values['latitude'] as double);
            if (values['longitude'] != null) builder.longitude(values['longitude'] as double);
            if (values['adresseTerrain'] != null) {
              builder.adresseTerrain(values['adresseTerrain'] as String);
            }
            if (values['qrCode'] != null) builder.qrCode(values['qrCode'] as String);
            await builder.execute();
            return right(unit);
          }

        case 'mettreAJourParcelle':
          {
            final builder = _connector.mettreAJourParcelle(id: values['id'] as int);
            if (values['superficieM2'] != null) {
              builder.superficieM2(values['superficieM2'] as double);
            }
            if (values['latitude'] != null) builder.latitude(values['latitude'] as double);
            if (values['longitude'] != null) builder.longitude(values['longitude'] as double);
            if (values['adresseTerrain'] != null) {
              builder.adresseTerrain(values['adresseTerrain'] as String);
            }
            await builder.execute();
            return right(unit);
          }

        case 'validerParcelle':
          await _connector.validerParcelle(id: values['id'] as int).execute();
          return right(unit);

        case 'rejeterParcelle':
          await _connector
              .rejeterParcelle(
                id: values['id'] as int,
                motifRejet: values['motifRejet'] as String,
              )
              .execute();
          return right(unit);

        case 'rejeterParcelleAvecMotif':
          await _connector
              .rejeterParcelleAvecMotif(
                id: values['id'] as int,
                motifRejet: values['motifRejet'] as String,
              )
              .execute();
          return right(unit);

        case 'resoumettreParcelle':
          await _connector.resoumettreParcelle(id: values['id'] as int).execute();
          return right(unit);

        case 'transfererParcelleEntreCommunes':
          {
            final builder = _connector.transfererParcelleEntreCommunes(
              id: values['id'] as int,
              nouvelleRegionId: values['nouvelleRegionId'] as int,
              nouvelleCommuneId: values['nouvelleCommuneId'] as int,
            );
            if (values['nouvelleSousPrefectureId'] != null) {
              builder.nouvelleSousPrefectureId(values['nouvelleSousPrefectureId'] as int);
            }
            await builder.execute();
            return right(unit);
          }

        case 'supprimerParcelle':
          await _connector.supprimerParcelle(id: values['id'] as int).execute();
          return right(unit);

        // ---------- Transaction ----------
        case 'creerTransaction':
          {
            final builder = _connector.creerTransaction(
              parcelleId: values['parcelleId'] as int,
              vendeurId: values['vendeurId'] as int,
              acheteurId: values['acheteurId'] as int,
              typeTransaction:
                  TypeTransaction.values.byName(values['typeTransaction'] as String),
              dateTransaction: values['dateTransaction'] as DateTime,
            );
            if (values['montant'] != null) builder.montant(values['montant'] as double);
            await builder.execute();
            return right(unit);
          }

        case 'validerTransaction':
          await _connector
              .validerTransaction(
                id: values['id'] as int,
                parcelleId: values['parcelleId'] as int,
                nouveauUtilisateurId: values['nouveauUtilisateurId'] as int,
              )
              .execute();
          return right(unit);

        case 'rejeterTransactionAvecMotif':
          await _connector
              .rejeterTransactionAvecMotif(
                id: values['id'] as int,
                motifRejet: values['motifRejet'] as String,
              )
              .execute();
          return right(unit);

        case 'resoumettreTransaction':
          await _connector.resoumettreTransaction(id: values['id'] as int).execute();
          return right(unit);

        // ---------- Document ----------
        case 'ajouterDocument':
          await _connector
              .ajouterDocument(
                parcelleId: values['parcelleId'] as int,
                typeDocument: TypeDocument.values.byName(values['typeDocument'] as String),
                nomFichier: values['nomFichier'] as String,
                urlStockage: values['urlStockage'] as String,
                uploadeParFirebaseUid: values['uploadeParFirebaseUid'] as String,
              )
              .execute();
          return right(unit);

        case 'supprimerDocument':
          await _connector.supprimerDocument(id: values['id'] as int).execute();
          return right(unit);

        // ---------- Taxe ----------
        case 'creerTaxeFonciere':
          await _connector
              .creerTaxeFonciere(
                parcelleId: values['parcelleId'] as int,
                anneeFiscale: values['anneeFiscale'] as int,
                montantDu: values['montantDu'] as double,
                dateEcheance: values['dateEcheance'] as DateTime,
              )
              .execute();
          return right(unit);

        case 'marquerTaxePayee':
          await _connector.marquerTaxePayee(id: values['id'] as int).execute();
          return right(unit);

        case 'marquerTaxeEnRetard':
          await _connector.marquerTaxeEnRetard(id: values['id'] as int).execute();
          return right(unit);

        // ---------- Suivi Visuel ----------
        case 'ajouterSuiviVisuel':
          {
            final builder = _connector.ajouterSuiviVisuel(
              parcelleId: values['parcelleId'] as int,
              typeMedia: TypeMedia.values.byName(values['typeMedia'] as String),
              urlStockage: values['urlStockage'] as String,
              uploadeParFirebaseUid: values['uploadeParFirebaseUid'] as String,
            );
            if (values['latitude'] != null) builder.latitude(values['latitude'] as double);
            if (values['longitude'] != null) builder.longitude(values['longitude'] as double);
            await builder.execute();
            return right(unit);
          }

        case 'supprimerSuiviVisuel':
          await _connector.supprimerSuiviVisuel(id: values['id'] as int).execute();
          return right(unit);

        // ---------- Abonnement ----------
        case 'creerAbonnement':
          await _connector
              .creerAbonnement(
                utilisateurId: values['utilisateurId'] as int,
                niveau: NiveauAbonnement.values.byName(values['niveau'] as String),
                dateDebut: values['dateDebut'] as DateTime,
                dateFin: values['dateFin'] as DateTime,
              )
              .execute();
          return right(unit);

        case 'renouvelerAbonnement':
          await _connector
              .renouvelerAbonnement(
                id: values['id'] as int,
                dateFin: values['dateFin'] as DateTime,
              )
              .execute();
          return right(unit);

        case 'annulerAbonnement':
          await _connector.annulerAbonnement(id: values['id'] as int).execute();
          return right(unit);

        // ---------- Paiement ----------
        case 'enregistrerPaiement':
          {
            final builder = _connector.enregistrerPaiement(
              utilisateurId: values['utilisateurId'] as int,
              methodePaiement: MethodePaiement.values.byName(values['methodePaiement'] as String),
              montant: values['montant'] as double,
            );
            if (values['taxeFonciereId'] != null) {
              builder.taxeFonciereId(values['taxeFonciereId'] as int);
            }
            if (values['abonnementId'] != null) {
              builder.abonnementId(values['abonnementId'] as int);
            }
            if (values['fraisEnregistrementId'] != null) {
              builder.fraisEnregistrementId(values['fraisEnregistrementId'] as int);
            }
            if (values['referenceTransaction'] != null) {
              builder.referenceTransaction(values['referenceTransaction'] as String);
            }
            await builder.execute();
            return right(unit);
          }

        case 'confirmerPaiement':
          await _connector.confirmerPaiement(id: values['id'] as int).execute();
          return right(unit);

        case 'confirmerPaiementTaxe':
          await _connector
              .confirmerPaiementTaxe(
                id: values['id'] as int,
                taxeFonciereId: values['taxeFonciereId'] as int,
              )
              .execute();
          return right(unit);

        case 'confirmerPaiementAbonnement':
          await _connector
              .confirmerPaiementAbonnement(
                id: values['id'] as int,
                abonnementId: values['abonnementId'] as int,
              )
              .execute();
          return right(unit);

        case 'annulerPaiement':
          await _connector.annulerPaiement(id: values['id'] as int).execute();
          return right(unit);

        // ---------- Alerte ----------
        case 'creerAlerte':
          {
            final builder = _connector.creerAlerte(
              utilisateurId: values['utilisateurId'] as int,
              typeAlerte: TypeAlerte.values.byName(values['typeAlerte'] as String),
              message: values['message'] as String,
            );
            if (values['parcelleId'] != null) builder.parcelleId(values['parcelleId'] as int);
            await builder.execute();
            return right(unit);
          }

        case 'marquerAlerteLue':
          await _connector.marquerAlerteLue(id: values['id'] as int).execute();
          return right(unit);

        case 'supprimerAlerte':
          await _connector.supprimerAlerte(id: values['id'] as int).execute();
          return right(unit);

        // ---------- Litige ----------
        case 'signalerLitige':
          {
            final builder = _connector.signalerLitige(
              parcelleId: values['parcelleId'] as int,
              plaignantId: values['plaignantId'] as int,
              motif: values['motif'] as String,
            );
            if (values['transactionFonciereId'] != null) {
              builder.transactionFonciereId(values['transactionFonciereId'] as int);
            }
            await builder.execute();
            return right(unit);
          }

        case 'passerLitigeEnExamen':
          await _connector.passerLitigeEnExamen(id: values['id'] as int).execute();
          return right(unit);

        case 'resoudreLitige':
          await _connector
              .resoudreLitige(
                id: values['id'] as int,
                resolution: values['resolution'] as String,
              )
              .execute();
          return right(unit);

        case 'rejeterLitige':
          await _connector
              .rejeterLitige(
                id: values['id'] as int,
                resolution: values['resolution'] as String,
              )
              .execute();
          return right(unit);

        // ---------- Frais ----------
        case 'creerFraisEnregistrement':
          await _connector
              .creerFraisEnregistrement(
                parcelleId: values['parcelleId'] as int,
                typeFrais: TypeFrais.values.byName(values['typeFrais'] as String),
                montant: values['montant'] as double,
              )
              .execute();
          return right(unit);

        case 'marquerFraisPaye':
          await _connector.marquerFraisPaye(id: values['id'] as int).execute();
          return right(unit);

        case 'annulerFrais':
          await _connector
              .annulerFrais(
            id: values['id'] as int,
            motifRejet: values['motifRejet'] as String,
          )
              .execute();
          return right(unit);

        case 'rejeterFrais':
          await _connector
              .rejeterFrais(
            id: values['id'] as int,
            motifRejet: values['motifRejet'] as String,
          )
              .execute();
          return right(unit);

        case 'supprimerLitige':
          await _connector.supprimerLitige(id: values['id'] as int).execute();
          return right(unit);

        case 'supprimerFraisEnregistrement':
          await _connector.supprimerFraisEnregistrement(id: values['id'] as int).execute();
          return right(unit);

        default:
          return left(Failure(
              'Mutation "$name" pas encore câblée dans ce tableau de bord.'));
      }
    } catch (e) {
      return left(Failure('Erreur lors de l\'exécution de "$name" : $e'));
    }
  }
}
