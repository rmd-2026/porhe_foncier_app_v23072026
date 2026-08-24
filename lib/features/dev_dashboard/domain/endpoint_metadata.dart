enum EndpointType { query, mutation }
enum DateRangeKind { pastOnly, futureAllowed }

enum FieldType {
  text,
  integer,
  decimal,
  date,
  enumField,
  regionRef,
  communeRef,
  sousPrefectureRef,
  countryRef,
}

class FieldSpec {
  const FieldSpec({
    required this.name,
    required this.label,
    required this.type,
    this.enumValues = const [],
    this.required = true,
    this.dateRangeKind = DateRangeKind.pastOnly,
  });

  final String name;
  final String label;
  final FieldType type;
  final List<String> enumValues;
  final bool required;
  final DateRangeKind dateRangeKind;
}

class EndpointMetadata {
  const EndpointMetadata({
    required this.name,
    required this.type,
    required this.fields,
  });

  final String name;
  final EndpointType type;
  final List<FieldSpec> fields;
}

class EndpointCategory {
  const EndpointCategory({required this.label, required this.endpoints});
  final String label;
  final List<EndpointMetadata> endpoints;
}

const List<String> _civiliteValues = ['MONSIEUR', 'MADAME', 'MADEMOISELLE'];
const List<String> _typePieceIdentiteValues = ['CIN', 'PASSEPORT'];
const List<String> _nomRoleValues = [
  'AGENT', 'ADMIN_COMMUNE', 'ADMIN_GLOBAL', 'PROPRIETAIRE',
];
const List<String> _typeTransactionValues = [
  'VENTE', 'HERITAGE', 'DONATION', 'ECHANGE',
];
const List<String> _typeDocumentValues = [
  'TITRE_FONCIER', 'ACTE_VENTE', 'CERTIFICAT_HERITAGE', 'PLAN_CADASTRAL', 'AUTRE',
];
const List<String> _typeMediaValues = ['PHOTO', 'VIDEO'];
const List<String> _niveauAbonnementValues = ['BASIQUE', 'STANDARD', 'PREMIUM'];
const List<String> _methodePaiementValues = ['ORANGE_MONEY', 'MTN_MOMO', 'AUTRE'];
const List<String> _typeAlerteValues = [
  'ACTIVITE_SUSPECTE', 'ECHEANCE_TAXE', 'NOUVELLE_TRANSACTION', 'SUIVI_VISUEL', 'AUTRE',
];
const List<String> _typeFraisValues = [
  'INSCRIPTION_PARCELLE', 'DUPLICATA_DOCUMENT', 'AUTRE',
];
const List<String> _statutParcelleValues = [
  'EN_ATTENTE_VALIDATION', 'VALIDEE', 'REJETEE',
];

const _text = FieldType.text;
const _int = FieldType.integer;
const _dec = FieldType.decimal;
const _date = FieldType.date;
const _enum = FieldType.enumField;
const _regionRef = FieldType.regionRef;
const _communeRef = FieldType.communeRef;
const _sousPrefRef = FieldType.sousPrefectureRef;
const _countryRef = FieldType.countryRef;

// Shorthand for optional fields — required defaults to true, so every
// optional field below must explicitly pass required: false. This is a
// plain function (not const-constructible), which is why any list
// containing an _opt(...) call is NOT declared `const`.
FieldSpec _opt(String name, String label, FieldType type, {List<String> enumValues = const []}) =>
    FieldSpec(name: name, label: label, type: type, enumValues: enumValues, required: false);

final List<EndpointCategory> endpointCategories = [
  EndpointCategory(label: 'Référence', endpoints: [
    const EndpointMetadata(name: 'seedRegions', type: EndpointType.mutation, fields: []),
    const EndpointMetadata(name: 'seedCommunes', type: EndpointType.mutation, fields: []),
    const EndpointMetadata(name: 'seedSousPrefectures', type: EndpointType.mutation, fields: []),
    const EndpointMetadata(name: 'listerRegions', type: EndpointType.query, fields: []),
    const EndpointMetadata(name: 'listerCommunes', type: EndpointType.query, fields: []),
    const EndpointMetadata(name: 'listerCommunesParRegion', type: EndpointType.query, fields: [
      FieldSpec(name: 'regionId', label: 'Région', type: _regionRef),
    ]),
    const EndpointMetadata(name: 'listerSousPrefectures', type: EndpointType.query, fields: []),
    const EndpointMetadata(name: 'listerSousPrefecturesParCommune', type: EndpointType.query, fields: [
      FieldSpec(name: 'communeId', label: 'Commune', type: _communeRef),
    ]),
  ]),
  EndpointCategory(label: 'Identité', endpoints: [
    EndpointMetadata(name: 'upsertUtilisateurParFirebaseUid', type: EndpointType.mutation, fields: [
      const FieldSpec(name: 'firebaseUid', label: 'Firebase UID', type: _text),
      _opt('nom', 'Nom', _text),
      _opt('prenom', 'Prénom', _text),
      _opt('civilite', 'Civilité', _enum, enumValues: _civiliteValues),
      _opt('dateNaissance', 'Date de naissance', _date),
      _opt('lieuNaissance', 'Lieu de naissance', _text),
      _opt('nationalite', 'Nationalité', _countryRef),
      _opt('typePieceIdentite', 'Type de pièce d\'identité', _enum, enumValues: _typePieceIdentiteValues),
      _opt('numeroPieceIdentite', 'Numéro de la pièce', _text),
      _opt('pieceIdentiteValideDe', 'Pièce valide à partir du', _date),
      _opt('pieceIdentiteValideA', 'Pièce valide jusqu\'au', _date),
      _opt('email', 'E-mail', _text),
      _opt('telephone', 'Téléphone', _text),
      _opt('photoUrl', 'URL photo', _text),
    ]),
    EndpointMetadata(name: 'mettreAJourProfil', type: EndpointType.mutation, fields: [
      const FieldSpec(name: 'firebaseUid', label: 'Firebase UID', type: _text),
      _opt('nom', 'Nom', _text),
      _opt('prenom', 'Prénom', _text),
      _opt('civilite', 'Civilité', _enum, enumValues: _civiliteValues),
      _opt('dateNaissance', 'Date de naissance', _date),
      _opt('lieuNaissance', 'Lieu de naissance', _text),
      _opt('nationalite', 'Nationalité', _countryRef),
      _opt('typePieceIdentite', 'Type de pièce d\'identité', _enum, enumValues: _typePieceIdentiteValues),
      _opt('numeroPieceIdentite', 'Numéro de la pièce', _text),
      _opt('pieceIdentiteValideDe', 'Pièce valide à partir du', _date),
      _opt('pieceIdentiteValideA', 'Pièce valide jusqu\'au', _date),
      _opt('telephone', 'Téléphone', _text),
      _opt('adresse', 'Adresse', _text),
      _opt('photoUrl', 'URL photo', _text),
    ]),
    const EndpointMetadata(name: 'obtenirProfilParFirebaseUid', type: EndpointType.query, fields: [
      FieldSpec(name: 'firebaseUid', label: 'Firebase UID', type: _text),
    ]),
    const EndpointMetadata(name: 'estProfilIncomplet', type: EndpointType.query, fields: [
      FieldSpec(name: 'firebaseUid', label: 'Firebase UID', type: _text),
    ]),
  ]),
  EndpointCategory(label: 'RBAC', endpoints: [
    const EndpointMetadata(name: 'assignerRoleUtilisateurParDefaut', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'utilisateurId', label: 'ID Utilisateur', type: _int),
    ]),
    const EndpointMetadata(name: 'assignerRoleGlobal', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'utilisateurId', label: 'ID Utilisateur', type: _int),
      FieldSpec(name: 'nomRole', label: 'Rôle', type: _enum, enumValues: _nomRoleValues),
    ]),
    const EndpointMetadata(name: 'assignerRoleCommune', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'utilisateurId', label: 'ID Utilisateur', type: _int),
      FieldSpec(name: 'nomRole', label: 'Rôle', type: _enum, enumValues: _nomRoleValues),
      FieldSpec(name: 'communeId', label: 'Commune', type: _communeRef),
    ]),
    const EndpointMetadata(name: 'obtenirRoleParUtilisateurId', type: EndpointType.query, fields: [
      FieldSpec(name: 'utilisateurId', label: 'ID Utilisateur', type: _int),
    ]),
    const EndpointMetadata(name: 'verifierAppartenanceCommune', type: EndpointType.query, fields: [
      FieldSpec(name: 'utilisateurId', label: 'ID Utilisateur', type: _int),
      FieldSpec(name: 'communeId', label: 'Commune', type: _communeRef),
    ]),
  ]),
  EndpointCategory(label: 'Audit / Historique', endpoints: [
    EndpointMetadata(name: 'enregistrerAudit', type: EndpointType.mutation, fields: [
      const FieldSpec(name: 'typeEntite', label: 'Type entité', type: _text),
      const FieldSpec(name: 'entiteId', label: 'ID entité', type: _int),
      const FieldSpec(name: 'action', label: 'Action', type: _text),
      const FieldSpec(name: 'acteurFirebaseUid', label: 'Firebase UID acteur', type: _text),
      _opt('motif', 'Motif', _text),
      _opt('communeId', 'Commune', _communeRef),
      _opt('donneesAvant', 'Données avant (JSON)', _text),
      _opt('donneesApres', 'Données après (JSON)', _text),
    ]),
    EndpointMetadata(name: 'listerAuditToutes', type: EndpointType.query, fields: [
      _opt('limit', 'Limite', _int),
      _opt('offset', 'Décalage', _int),
    ]),
    const EndpointMetadata(name: 'listerAuditParActeur', type: EndpointType.query, fields: [
      FieldSpec(name: 'acteurFirebaseUid', label: 'Firebase UID acteur', type: _text),
    ]),
    const EndpointMetadata(name: 'listerAuditParCommune', type: EndpointType.query, fields: [
      FieldSpec(name: 'communeId', label: 'Commune', type: _communeRef),
    ]),
    const EndpointMetadata(name: 'listerAuditParTypeEntite', type: EndpointType.query, fields: [
      FieldSpec(name: 'typeEntite', label: 'Type entité', type: _text),
    ]),
    EndpointMetadata(name: 'listerHistoriqueRejetsEtSuppressions', type: EndpointType.query, fields: [
      _opt('communeId', 'Commune', _communeRef),
      _opt('limit', 'Limite', _int),
      _opt('offset', 'Décalage', _int),
    ]),
  ]),
  EndpointCategory(label: 'Parcelle', endpoints: [
    EndpointMetadata(name: 'creerParcelle', type: EndpointType.mutation, fields: [
      const FieldSpec(name: 'codeParcelle', label: 'Code parcelle', type: _text),
      const FieldSpec(name: 'utilisateurId', label: 'ID Utilisateur', type: _int),
      const FieldSpec(name: 'regionId', label: 'Région', type: _regionRef),
      const FieldSpec(name: 'communeId', label: 'Commune', type: _communeRef),
      _opt('sousPrefectureId', 'Sous-préfecture', _sousPrefRef),
      _opt('superficieM2', 'Superficie (m²)', _dec),
      _opt('latitude', 'Latitude', _dec),
      _opt('longitude', 'Longitude', _dec),
      _opt('adresseTerrain', 'Adresse du terrain', _text),
      _opt('qrCode', 'QR Code', _text),
    ]),
    EndpointMetadata(name: 'mettreAJourParcelle', type: EndpointType.mutation, fields: [
      const FieldSpec(name: 'id', label: 'ID Parcelle', type: _int),
      _opt('superficieM2', 'Superficie (m²)', _dec),
      _opt('latitude', 'Latitude', _dec),
      _opt('longitude', 'Longitude', _dec),
      _opt('adresseTerrain', 'Adresse du terrain', _text),
    ]),
    const EndpointMetadata(name: 'validerParcelle', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'id', label: 'ID Parcelle', type: _int),
    ]),
    const EndpointMetadata(name: 'rejeterParcelle', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'id', label: 'ID Parcelle', type: _int),
      FieldSpec(name: 'motifRejet', label: 'Motif du rejet', type: _text),
    ]),
    const EndpointMetadata(name: 'rejeterParcelleAvecMotif', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'id', label: 'ID Parcelle', type: _int),
      FieldSpec(name: 'motifRejet', label: 'Motif du rejet', type: _text),
    ]),
    const EndpointMetadata(name: 'resoumettreParcelle', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'id', label: 'ID Parcelle', type: _int),
    ]),
    EndpointMetadata(name: 'transfererParcelleEntreCommunes', type: EndpointType.mutation, fields: [
      const FieldSpec(name: 'id', label: 'ID Parcelle', type: _int),
      const FieldSpec(name: 'nouvelleCommuneId', label: 'Nouvelle commune', type: _communeRef),
      _opt('nouvelleSousPrefectureId', 'Nouvelle sous-préfecture', _sousPrefRef),
    ]),
    const EndpointMetadata(name: 'supprimerParcelle', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'id', label: 'ID Parcelle', type: _int),
    ]),
    const EndpointMetadata(name: 'obtenirParcelleParId', type: EndpointType.query, fields: [
      FieldSpec(name: 'id', label: 'ID Parcelle', type: _int),
    ]),
    const EndpointMetadata(name: 'obtenirParcelleParQrCode', type: EndpointType.query, fields: [
      FieldSpec(name: 'qrCode', label: 'QR Code', type: _text),
    ]),
    const EndpointMetadata(name: 'listerParcellesParUtilisateur', type: EndpointType.query, fields: [
      FieldSpec(name: 'utilisateurId', label: 'ID Utilisateur', type: _int),
    ]),
    EndpointMetadata(name: 'listerParcellesParCommune', type: EndpointType.query, fields: [
      const FieldSpec(name: 'communeId', label: 'Commune', type: _communeRef),
      _opt('limit', 'Limite', _int),
      _opt('offset', 'Décalage', _int),
    ]),
    const EndpointMetadata(name: 'listerParcellesParStatut', type: EndpointType.query, fields: [
      FieldSpec(name: 'communeId', label: 'Commune', type: _communeRef),
      FieldSpec(name: 'statut', label: 'Statut', type: _enum, enumValues: _statutParcelleValues),
    ]),
    const EndpointMetadata(name: 'listerParcellesRejeteesParCommune', type: EndpointType.query, fields: [
      FieldSpec(name: 'communeId', label: 'Commune', type: _communeRef),
    ]),
    const EndpointMetadata(name: 'listerParcellesDansZone', type: EndpointType.query, fields: [
      FieldSpec(name: 'latMin', label: 'Latitude min', type: _dec),
      FieldSpec(name: 'latMax', label: 'Latitude max', type: _dec),
      FieldSpec(name: 'lonMin', label: 'Longitude min', type: _dec),
      FieldSpec(name: 'lonMax', label: 'Longitude max', type: _dec),
    ]),
    const EndpointMetadata(name: 'rechercherParcelles', type: EndpointType.query, fields: [
      FieldSpec(name: 'terme', label: 'Terme de recherche', type: _text),
    ]),
    const EndpointMetadata(name: 'listerToutesParcelles', type: EndpointType.query, fields: [
      FieldSpec(name: 'limit', label: 'Limite', type: _int, required: false),
      FieldSpec(name: 'offset', label: 'Décalage', type: _int, required: false),
    ]),
  ]),
  EndpointCategory(label: 'Transaction', endpoints: [
    EndpointMetadata(name: 'creerTransaction', type: EndpointType.mutation, fields: [
      const FieldSpec(name: 'parcelleId', label: 'ID Parcelle', type: _int),
      const FieldSpec(name: 'vendeurId', label: 'ID Vendeur', type: _int),
      const FieldSpec(name: 'acheteurId', label: 'ID Acheteur', type: _int),
      const FieldSpec(name: 'typeTransaction', label: 'Type', type: _enum, enumValues: _typeTransactionValues),
      _opt('montant', 'Montant', _dec),
      const FieldSpec(name: 'dateTransaction', label: 'Date transaction', type: _date),
    ]),
    const EndpointMetadata(name: 'validerTransaction', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'id', label: 'ID Transaction', type: _int),
      FieldSpec(name: 'parcelleId', label: 'ID Parcelle', type: _int),
      FieldSpec(name: 'nouveauUtilisateurId', label: 'Nouveau propriétaire', type: _int),
    ]),
    const EndpointMetadata(name: 'rejeterTransactionAvecMotif', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'id', label: 'ID Transaction', type: _int),
      FieldSpec(name: 'motifRejet', label: 'Motif du rejet', type: _text),
    ]),
    const EndpointMetadata(name: 'resoumettreTransaction', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'id', label: 'ID Transaction', type: _int),
    ]),
    const EndpointMetadata(name: 'obtenirTransactionParId', type: EndpointType.query, fields: [
      FieldSpec(name: 'id', label: 'ID Transaction', type: _int),
    ]),
    const EndpointMetadata(name: 'listerTransactionsParParcelle', type: EndpointType.query, fields: [
      FieldSpec(name: 'parcelleId', label: 'ID Parcelle', type: _int),
    ]),
    const EndpointMetadata(name: 'listerTransactionsParUtilisateur', type: EndpointType.query, fields: [
      FieldSpec(name: 'utilisateurId', label: 'ID Utilisateur', type: _int),
    ]),
    const EndpointMetadata(name: 'listerTransactionsEnAttenteParCommune', type: EndpointType.query, fields: [
      FieldSpec(name: 'communeId', label: 'Commune', type: _communeRef),
    ]),
    const EndpointMetadata(name: 'listerTransactionsRejeteesParCommune', type: EndpointType.query, fields: [
      FieldSpec(name: 'communeId', label: 'Commune', type: _communeRef),
    ]),
    const EndpointMetadata(name: 'obtenirHistoriquePropriete', type: EndpointType.query, fields: [
      FieldSpec(name: 'parcelleId', label: 'ID Parcelle', type: _int),
    ]),
    const EndpointMetadata(name: 'listerToutesTransactions', type: EndpointType.query, fields: [
      FieldSpec(name: 'limit', label: 'Limite', type: _int, required: false),
      FieldSpec(name: 'offset', label: 'Décalage', type: _int, required: false),
    ]),
  ]),
  EndpointCategory(label: 'Document', endpoints: [
    const EndpointMetadata(name: 'ajouterDocument', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'parcelleId', label: 'ID Parcelle', type: _int),
      FieldSpec(name: 'typeDocument', label: 'Type document', type: _enum, enumValues: _typeDocumentValues),
      FieldSpec(name: 'nomFichier', label: 'Nom fichier', type: _text),
      FieldSpec(name: 'urlStockage', label: 'URL stockage', type: _text),
      FieldSpec(name: 'uploadeParFirebaseUid', label: 'Firebase UID uploadeur', type: _text),
    ]),
    const EndpointMetadata(name: 'supprimerDocument', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'id', label: 'ID Document', type: _int),
    ]),
    const EndpointMetadata(name: 'obtenirDocumentParId', type: EndpointType.query, fields: [
      FieldSpec(name: 'id', label: 'ID Document', type: _int),
    ]),
    const EndpointMetadata(name: 'listerDocumentsParParcelle', type: EndpointType.query, fields: [
      FieldSpec(name: 'parcelleId', label: 'ID Parcelle', type: _int),
    ]),
    const EndpointMetadata(name: 'listerTousDocuments', type: EndpointType.query, fields: [
      FieldSpec(name: 'limit', label: 'Limite', type: _int, required: false),
      FieldSpec(name: 'offset', label: 'Décalage', type: _int, required: false),
    ]),
  ]),
  EndpointCategory(label: 'Taxe', endpoints: [
    const EndpointMetadata(name: 'creerTaxeFonciere', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'parcelleId', label: 'ID Parcelle', type: _int),
      FieldSpec(name: 'anneeFiscale', label: 'Année fiscale', type: _int),
      FieldSpec(name: 'montantDu', label: 'Montant dû', type: _dec),
      FieldSpec(name: 'dateEcheance', label: 'Date échéance', type: _date),
    ]),
    const EndpointMetadata(name: 'marquerTaxePayee', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'id', label: 'ID Taxe', type: _int),
    ]),
    const EndpointMetadata(name: 'marquerTaxeEnRetard', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'id', label: 'ID Taxe', type: _int),
    ]),
    const EndpointMetadata(name: 'obtenirTaxeParId', type: EndpointType.query, fields: [
      FieldSpec(name: 'id', label: 'ID Taxe', type: _int),
    ]),
    const EndpointMetadata(name: 'listerTaxesParParcelle', type: EndpointType.query, fields: [
      FieldSpec(name: 'parcelleId', label: 'ID Parcelle', type: _int),
    ]),
    const EndpointMetadata(name: 'listerTaxesEnRetardParCommune', type: EndpointType.query, fields: [
      FieldSpec(name: 'communeId', label: 'Commune', type: _communeRef),
    ]),
    const EndpointMetadata(name: 'listerTaxesEcheanceDepassee', type: EndpointType.query, fields: [
      FieldSpec(name: 'communeId', label: 'Commune', type: _communeRef),
      FieldSpec(name: 'dateActuelle', label: 'Date actuelle', type: _date),
    ]),
    const EndpointMetadata(name: 'obtenirRapportFinancierCommune', type: EndpointType.query, fields: [
      FieldSpec(name: 'communeId', label: 'Commune', type: _communeRef),
    ]),
    const EndpointMetadata(name: 'listerToutesTaxes', type: EndpointType.query, fields: [
      FieldSpec(name: 'limit', label: 'Limite', type: _int, required: false),
      FieldSpec(name: 'offset', label: 'Décalage', type: _int, required: false),
    ]),
  ]),
  EndpointCategory(label: 'Suivi Visuel', endpoints: [
    EndpointMetadata(name: 'ajouterSuiviVisuel', type: EndpointType.mutation, fields: [
      const FieldSpec(name: 'parcelleId', label: 'ID Parcelle', type: _int),
      const FieldSpec(name: 'typeMedia', label: 'Type média', type: _enum, enumValues: _typeMediaValues),
      const FieldSpec(name: 'urlStockage', label: 'URL stockage', type: _text),
      _opt('latitude', 'Latitude', _dec),
      _opt('longitude', 'Longitude', _dec),
      const FieldSpec(name: 'uploadeParFirebaseUid', label: 'Firebase UID uploadeur', type: _text),
    ]),
    const EndpointMetadata(name: 'supprimerSuiviVisuel', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'id', label: 'ID Suivi visuel', type: _int),
    ]),
    const EndpointMetadata(name: 'listerSuiviVisuelParParcelle', type: EndpointType.query, fields: [
      FieldSpec(name: 'parcelleId', label: 'ID Parcelle', type: _int),
    ]),
    const EndpointMetadata(name: 'listerSuiviVisuelRecentParParcelle', type: EndpointType.query, fields: [
      FieldSpec(name: 'parcelleId', label: 'ID Parcelle', type: _int),
    ]),
    const EndpointMetadata(name: 'listerSuiviVisuelCompletParParcelle', type: EndpointType.query, fields: [
      FieldSpec(name: 'parcelleId', label: 'ID Parcelle', type: _int),
    ]),
    const EndpointMetadata(name: 'obtenirContexteAccesSuiviVisuel', type: EndpointType.query, fields: [
      FieldSpec(name: 'parcelleId', label: 'ID Parcelle', type: _int),
      FieldSpec(name: 'utilisateurId', label: 'ID Utilisateur', type: _int),
    ]),
    const EndpointMetadata(name: 'obtenirUploadsRecentsPourAbonnement', type: EndpointType.query, fields: [
      FieldSpec(name: 'parcelleId', label: 'ID Parcelle', type: _int),
      FieldSpec(name: 'utilisateurId', label: 'ID Utilisateur', type: _int),
      FieldSpec(name: 'depuis', label: 'Depuis (date)', type: _date),
    ]),
  ]),
  EndpointCategory(label: 'Abonnement', endpoints: [
    const EndpointMetadata(name: 'creerAbonnement', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'utilisateurId', label: 'ID Utilisateur', type: _int),
      FieldSpec(name: 'niveau', label: 'Niveau', type: _enum, enumValues: _niveauAbonnementValues),
      FieldSpec(name: 'dateDebut', label: 'Date début', type: _date),
      FieldSpec(name: 'dateFin', label: 'Date fin', type: _date),
    ]),
    const EndpointMetadata(name: 'renouvelerAbonnement', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'id', label: 'ID Abonnement', type: _int),
      FieldSpec(name: 'dateFin', label: 'Nouvelle date fin', type: _date),
    ]),
    const EndpointMetadata(name: 'annulerAbonnement', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'id', label: 'ID Abonnement', type: _int),
    ]),
    const EndpointMetadata(name: 'obtenirAbonnementActifParUtilisateur', type: EndpointType.query, fields: [
      FieldSpec(name: 'utilisateurId', label: 'ID Utilisateur', type: _int),
    ]),
    const EndpointMetadata(name: 'listerAbonnementsParUtilisateur', type: EndpointType.query, fields: [
      FieldSpec(name: 'utilisateurId', label: 'ID Utilisateur', type: _int),
    ]),
    const EndpointMetadata(name: 'listerAbonnementsActifsToutes', type: EndpointType.query, fields: []),
    const EndpointMetadata(name: 'listerTousAbonnements', type: EndpointType.query, fields: [
      FieldSpec(name: 'limit', label: 'Limite', type: _int, required: false),
      FieldSpec(name: 'offset', label: 'Décalage', type: _int, required: false),
    ]),
  ]),
  EndpointCategory(label: 'Paiement', endpoints: [
    EndpointMetadata(name: 'enregistrerPaiement', type: EndpointType.mutation, fields: [
      const FieldSpec(name: 'utilisateurId', label: 'ID Utilisateur', type: _int),
      _opt('taxeFonciereId', 'ID Taxe', _int),
      _opt('abonnementId', 'ID Abonnement', _int),
      _opt('fraisEnregistrementId', 'ID Frais', _int),
      const FieldSpec(name: 'methodePaiement', label: 'Méthode', type: _enum, enumValues: _methodePaiementValues),
      const FieldSpec(name: 'montant', label: 'Montant', type: _dec),
      _opt('referenceTransaction', 'Référence transaction', _text),
    ]),
    const EndpointMetadata(name: 'confirmerPaiement', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'id', label: 'ID Paiement', type: _int),
    ]),
    const EndpointMetadata(name: 'confirmerPaiementTaxe', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'id', label: 'ID Paiement', type: _int),
      FieldSpec(name: 'taxeFonciereId', label: 'ID Taxe', type: _int),
    ]),
    const EndpointMetadata(name: 'confirmerPaiementAbonnement', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'id', label: 'ID Paiement', type: _int),
      FieldSpec(name: 'abonnementId', label: 'ID Abonnement', type: _int),
    ]),
    const EndpointMetadata(name: 'annulerPaiement', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'id', label: 'ID Paiement', type: _int),
    ]),
    const EndpointMetadata(name: 'obtenirPaiementParId', type: EndpointType.query, fields: [
      FieldSpec(name: 'id', label: 'ID Paiement', type: _int),
    ]),
    const EndpointMetadata(name: 'listerPaiementsParUtilisateur', type: EndpointType.query, fields: [
      FieldSpec(name: 'utilisateurId', label: 'ID Utilisateur', type: _int),
    ]),
    const EndpointMetadata(name: 'listerPaiementsTaxeEnAttenteParCommune', type: EndpointType.query, fields: [
      FieldSpec(name: 'communeId', label: 'Commune', type: _communeRef),
    ]),
    const EndpointMetadata(name: 'listerPaiementsAbonnementEnAttente', type: EndpointType.query, fields: []),
    const EndpointMetadata(name: 'listerTousPaiements', type: EndpointType.query, fields: [
      FieldSpec(name: 'limit', label: 'Limite', type: _int, required: false),
      FieldSpec(name: 'offset', label: 'Décalage', type: _int, required: false),
    ]),
  ]),
  EndpointCategory(label: 'Alerte', endpoints: [
    EndpointMetadata(name: 'creerAlerte', type: EndpointType.mutation, fields: [
      const FieldSpec(name: 'utilisateurId', label: 'ID Utilisateur', type: _int),
      _opt('parcelleId', 'ID Parcelle', _int),
      const FieldSpec(name: 'typeAlerte', label: 'Type alerte', type: _enum, enumValues: _typeAlerteValues),
      const FieldSpec(name: 'message', label: 'Message', type: _text),
    ]),
    const EndpointMetadata(name: 'marquerAlerteLue', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'id', label: 'ID Alerte', type: _int),
    ]),
    const EndpointMetadata(name: 'supprimerAlerte', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'id', label: 'ID Alerte', type: _int),
    ]),
    EndpointMetadata(name: 'listerAlertesParUtilisateur', type: EndpointType.query, fields: [
      const FieldSpec(name: 'utilisateurId', label: 'ID Utilisateur', type: _int),
      _opt('limit', 'Limite', _int),
      _opt('offset', 'Décalage', _int),
    ]),
    const EndpointMetadata(name: 'listerAlertesNonLuesParUtilisateur', type: EndpointType.query, fields: [
      FieldSpec(name: 'utilisateurId', label: 'ID Utilisateur', type: _int),
    ]),
    const EndpointMetadata(name: 'listerToutesAlertes', type: EndpointType.query, fields: [
      FieldSpec(name: 'limit', label: 'Limite', type: _int, required: false),
      FieldSpec(name: 'offset', label: 'Décalage', type: _int, required: false),
    ]),
  ]),
  EndpointCategory(label: 'Litige', endpoints: [
    EndpointMetadata(name: 'signalerLitige', type: EndpointType.mutation, fields: [
      const FieldSpec(name: 'parcelleId', label: 'ID Parcelle', type: _int),
      const FieldSpec(name: 'plaignantId', label: 'ID Plaignant', type: _int),
      const FieldSpec(name: 'motif', label: 'Motif', type: _text),
      _opt('transactionFonciereId', 'ID Transaction', _int),
    ]),
    const EndpointMetadata(name: 'passerLitigeEnExamen', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'id', label: 'ID Litige', type: _int),
    ]),
    const EndpointMetadata(name: 'resoudreLitige', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'id', label: 'ID Litige', type: _int),
      FieldSpec(name: 'resolution', label: 'Résolution', type: _text),
    ]),
    const EndpointMetadata(name: 'rejeterLitige', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'id', label: 'ID Litige', type: _int),
      FieldSpec(name: 'resolution', label: 'Résolution', type: _text),
    ]),
    const EndpointMetadata(name: 'obtenirLitigeParId', type: EndpointType.query, fields: [
      FieldSpec(name: 'id', label: 'ID Litige', type: _int),
    ]),
    const EndpointMetadata(name: 'listerLitigesParParcelle', type: EndpointType.query, fields: [
      FieldSpec(name: 'parcelleId', label: 'ID Parcelle', type: _int),
    ]),
    const EndpointMetadata(name: 'listerLitigesOuvertsParCommune', type: EndpointType.query, fields: [
      FieldSpec(name: 'communeId', label: 'Commune', type: _communeRef),
    ]),
    const EndpointMetadata(name: 'listerTousLitiges', type: EndpointType.query, fields: [
      FieldSpec(name: 'limit', label: 'Limite', type: _int, required: false),
      FieldSpec(name: 'offset', label: 'Décalage', type: _int, required: false),
    ]),
  ]),
  EndpointCategory(label: 'Frais', endpoints: [
    const EndpointMetadata(name: 'creerFraisEnregistrement', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'parcelleId', label: 'ID Parcelle', type: _int),
      FieldSpec(name: 'typeFrais', label: 'Type frais', type: _enum, enumValues: _typeFraisValues),
      FieldSpec(name: 'montant', label: 'Montant', type: _dec),
    ]),
    const EndpointMetadata(name: 'marquerFraisPaye', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'id', label: 'ID Frais', type: _int),
    ]),
    const EndpointMetadata(name: 'annulerFrais', type: EndpointType.mutation, fields: [
      FieldSpec(name: 'id', label: 'ID Frais', type: _int),
    ]),
    const EndpointMetadata(name: 'listerFraisParParcelle', type: EndpointType.query, fields: [
      FieldSpec(name: 'parcelleId', label: 'ID Parcelle', type: _int),
    ]),
    const EndpointMetadata(name: 'listerFraisEnAttenteParCommune', type: EndpointType.query, fields: [
      FieldSpec(name: 'communeId', label: 'Commune', type: _communeRef),
    ]),
    const EndpointMetadata(name: 'listerTousFrais', type: EndpointType.query, fields: [
      FieldSpec(name: 'limit', label: 'Limite', type: _int, required: false),
      FieldSpec(name: 'offset', label: 'Décalage', type: _int, required: false),
    ]),
  ]),
  EndpointCategory(label: 'Cross-cutting', endpoints: [
    const EndpointMetadata(name: 'obtenirStatistiquesCommune', type: EndpointType.query, fields: [
      FieldSpec(name: 'communeId', label: 'Commune', type: _communeRef),
    ]),
    const EndpointMetadata(name: 'obtenirChronologieParcelle', type: EndpointType.query, fields: [
      FieldSpec(name: 'parcelleId', label: 'ID Parcelle', type: _int),
    ]),
  ]),
];
