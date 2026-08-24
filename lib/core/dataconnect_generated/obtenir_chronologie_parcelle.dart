part of 'porhe_foncier23072026.dart';

class ObtenirChronologieParcelleVariablesBuilder {
  int parcelleId;

  final FirebaseDataConnect _dataConnect;
  ObtenirChronologieParcelleVariablesBuilder(this._dataConnect, {required  this.parcelleId,});
  Deserializer<ObtenirChronologieParcelleData> dataDeserializer = (dynamic json)  => ObtenirChronologieParcelleData.fromJson(jsonDecode(json));
  Serializer<ObtenirChronologieParcelleVariables> varsSerializer = (ObtenirChronologieParcelleVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ObtenirChronologieParcelleData, ObtenirChronologieParcelleVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ObtenirChronologieParcelleData, ObtenirChronologieParcelleVariables> ref() {
    ObtenirChronologieParcelleVariables vars= ObtenirChronologieParcelleVariables(parcelleId: parcelleId,);
    return _dataConnect.query("obtenirChronologieParcelle", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ObtenirChronologieParcelleTransactionFoncieres {
  final int id;
  final EnumValue<TypeTransaction> typeTransaction;
  final double? montant;
  final EnumValue<StatutTransaction> statut;
  final DateTime dateTransaction;
  ObtenirChronologieParcelleTransactionFoncieres.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  typeTransaction = typeTransactionDeserializer(json['typeTransaction']),
  montant = json['montant'] == null ? null : nativeFromJson<double>(json['montant']),
  statut = statutTransactionDeserializer(json['statut']),
  dateTransaction = nativeFromJson<DateTime>(json['dateTransaction']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirChronologieParcelleTransactionFoncieres otherTyped = other as ObtenirChronologieParcelleTransactionFoncieres;
    return id == otherTyped.id && 
    typeTransaction == otherTyped.typeTransaction && 
    montant == otherTyped.montant && 
    statut == otherTyped.statut && 
    dateTransaction == otherTyped.dateTransaction;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, typeTransaction.hashCode, montant.hashCode, statut.hashCode, dateTransaction.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['typeTransaction'] = 
    typeTransactionSerializer(typeTransaction)
    ;
    if (montant != null) {
      json['montant'] = nativeToJson<double?>(montant);
    }
    json['statut'] = 
    statutTransactionSerializer(statut)
    ;
    json['dateTransaction'] = nativeToJson<DateTime>(dateTransaction);
    return json;
  }

  ObtenirChronologieParcelleTransactionFoncieres({
    required this.id,
    required this.typeTransaction,
    this.montant,
    required this.statut,
    required this.dateTransaction,
  });
}

@immutable
class ObtenirChronologieParcelleTaxeFoncieres {
  final int id;
  final int anneeFiscale;
  final double montantDu;
  final EnumValue<StatutPaiement> statut;
  ObtenirChronologieParcelleTaxeFoncieres.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  anneeFiscale = nativeFromJson<int>(json['anneeFiscale']),
  montantDu = nativeFromJson<double>(json['montantDu']),
  statut = statutPaiementDeserializer(json['statut']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirChronologieParcelleTaxeFoncieres otherTyped = other as ObtenirChronologieParcelleTaxeFoncieres;
    return id == otherTyped.id && 
    anneeFiscale == otherTyped.anneeFiscale && 
    montantDu == otherTyped.montantDu && 
    statut == otherTyped.statut;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, anneeFiscale.hashCode, montantDu.hashCode, statut.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['anneeFiscale'] = nativeToJson<int>(anneeFiscale);
    json['montantDu'] = nativeToJson<double>(montantDu);
    json['statut'] = 
    statutPaiementSerializer(statut)
    ;
    return json;
  }

  ObtenirChronologieParcelleTaxeFoncieres({
    required this.id,
    required this.anneeFiscale,
    required this.montantDu,
    required this.statut,
  });
}

@immutable
class ObtenirChronologieParcelleDocumentParcelles {
  final int id;
  final EnumValue<TypeDocument> typeDocument;
  final String nomFichier;
  final Timestamp createdAt;
  ObtenirChronologieParcelleDocumentParcelles.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  typeDocument = typeDocumentDeserializer(json['typeDocument']),
  nomFichier = nativeFromJson<String>(json['nomFichier']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirChronologieParcelleDocumentParcelles otherTyped = other as ObtenirChronologieParcelleDocumentParcelles;
    return id == otherTyped.id && 
    typeDocument == otherTyped.typeDocument && 
    nomFichier == otherTyped.nomFichier && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, typeDocument.hashCode, nomFichier.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['typeDocument'] = 
    typeDocumentSerializer(typeDocument)
    ;
    json['nomFichier'] = nativeToJson<String>(nomFichier);
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ObtenirChronologieParcelleDocumentParcelles({
    required this.id,
    required this.typeDocument,
    required this.nomFichier,
    required this.createdAt,
  });
}

@immutable
class ObtenirChronologieParcelleSuiviVisuels {
  final int id;
  final EnumValue<TypeMedia> typeMedia;
  final String urlStockage;
  final Timestamp createdAt;
  ObtenirChronologieParcelleSuiviVisuels.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  typeMedia = typeMediaDeserializer(json['typeMedia']),
  urlStockage = nativeFromJson<String>(json['urlStockage']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirChronologieParcelleSuiviVisuels otherTyped = other as ObtenirChronologieParcelleSuiviVisuels;
    return id == otherTyped.id && 
    typeMedia == otherTyped.typeMedia && 
    urlStockage == otherTyped.urlStockage && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, typeMedia.hashCode, urlStockage.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['typeMedia'] = 
    typeMediaSerializer(typeMedia)
    ;
    json['urlStockage'] = nativeToJson<String>(urlStockage);
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ObtenirChronologieParcelleSuiviVisuels({
    required this.id,
    required this.typeMedia,
    required this.urlStockage,
    required this.createdAt,
  });
}

@immutable
class ObtenirChronologieParcelleLitiges {
  final int id;
  final EnumValue<StatutLitige> statut;
  final String motif;
  final Timestamp createdAt;
  ObtenirChronologieParcelleLitiges.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  statut = statutLitigeDeserializer(json['statut']),
  motif = nativeFromJson<String>(json['motif']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirChronologieParcelleLitiges otherTyped = other as ObtenirChronologieParcelleLitiges;
    return id == otherTyped.id && 
    statut == otherTyped.statut && 
    motif == otherTyped.motif && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, statut.hashCode, motif.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['statut'] = 
    statutLitigeSerializer(statut)
    ;
    json['motif'] = nativeToJson<String>(motif);
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ObtenirChronologieParcelleLitiges({
    required this.id,
    required this.statut,
    required this.motif,
    required this.createdAt,
  });
}

@immutable
class ObtenirChronologieParcelleData {
  final List<ObtenirChronologieParcelleTransactionFoncieres> transactionFoncieres;
  final List<ObtenirChronologieParcelleTaxeFoncieres> taxeFoncieres;
  final List<ObtenirChronologieParcelleDocumentParcelles> documentParcelles;
  final List<ObtenirChronologieParcelleSuiviVisuels> suiviVisuels;
  final List<ObtenirChronologieParcelleLitiges> litiges;
  ObtenirChronologieParcelleData.fromJson(dynamic json):
  
  transactionFoncieres = (json['transactionFoncieres'] as List<dynamic>)
        .map((e) => ObtenirChronologieParcelleTransactionFoncieres.fromJson(e))
        .toList(),
  taxeFoncieres = (json['taxeFoncieres'] as List<dynamic>)
        .map((e) => ObtenirChronologieParcelleTaxeFoncieres.fromJson(e))
        .toList(),
  documentParcelles = (json['documentParcelles'] as List<dynamic>)
        .map((e) => ObtenirChronologieParcelleDocumentParcelles.fromJson(e))
        .toList(),
  suiviVisuels = (json['suiviVisuels'] as List<dynamic>)
        .map((e) => ObtenirChronologieParcelleSuiviVisuels.fromJson(e))
        .toList(),
  litiges = (json['litiges'] as List<dynamic>)
        .map((e) => ObtenirChronologieParcelleLitiges.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirChronologieParcelleData otherTyped = other as ObtenirChronologieParcelleData;
    return transactionFoncieres == otherTyped.transactionFoncieres && 
    taxeFoncieres == otherTyped.taxeFoncieres && 
    documentParcelles == otherTyped.documentParcelles && 
    suiviVisuels == otherTyped.suiviVisuels && 
    litiges == otherTyped.litiges;
    
  }
  @override
  int get hashCode => Object.hashAll([transactionFoncieres.hashCode, taxeFoncieres.hashCode, documentParcelles.hashCode, suiviVisuels.hashCode, litiges.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['transactionFoncieres'] = transactionFoncieres.map((e) => e.toJson()).toList();
    json['taxeFoncieres'] = taxeFoncieres.map((e) => e.toJson()).toList();
    json['documentParcelles'] = documentParcelles.map((e) => e.toJson()).toList();
    json['suiviVisuels'] = suiviVisuels.map((e) => e.toJson()).toList();
    json['litiges'] = litiges.map((e) => e.toJson()).toList();
    return json;
  }

  ObtenirChronologieParcelleData({
    required this.transactionFoncieres,
    required this.taxeFoncieres,
    required this.documentParcelles,
    required this.suiviVisuels,
    required this.litiges,
  });
}

@immutable
class ObtenirChronologieParcelleVariables {
  final int parcelleId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ObtenirChronologieParcelleVariables.fromJson(Map<String, dynamic> json):
  
  parcelleId = nativeFromJson<int>(json['parcelleId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirChronologieParcelleVariables otherTyped = other as ObtenirChronologieParcelleVariables;
    return parcelleId == otherTyped.parcelleId;
    
  }
  @override
  int get hashCode => parcelleId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    return json;
  }

  ObtenirChronologieParcelleVariables({
    required this.parcelleId,
  });
}

