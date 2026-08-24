part of 'porhe_foncier23072026.dart';

class ObtenirStatistiquesCommuneVariablesBuilder {
  int communeId;

  final FirebaseDataConnect _dataConnect;
  ObtenirStatistiquesCommuneVariablesBuilder(this._dataConnect, {required  this.communeId,});
  Deserializer<ObtenirStatistiquesCommuneData> dataDeserializer = (dynamic json)  => ObtenirStatistiquesCommuneData.fromJson(jsonDecode(json));
  Serializer<ObtenirStatistiquesCommuneVariables> varsSerializer = (ObtenirStatistiquesCommuneVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ObtenirStatistiquesCommuneData, ObtenirStatistiquesCommuneVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ObtenirStatistiquesCommuneData, ObtenirStatistiquesCommuneVariables> ref() {
    ObtenirStatistiquesCommuneVariables vars= ObtenirStatistiquesCommuneVariables(communeId: communeId,);
    return _dataConnect.query("obtenirStatistiquesCommune", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ObtenirStatistiquesCommuneParcelles {
  final int id;
  final EnumValue<StatutParcelle> statut;
  ObtenirStatistiquesCommuneParcelles.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  statut = statutParcelleDeserializer(json['statut']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirStatistiquesCommuneParcelles otherTyped = other as ObtenirStatistiquesCommuneParcelles;
    return id == otherTyped.id && 
    statut == otherTyped.statut;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, statut.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['statut'] = 
    statutParcelleSerializer(statut)
    ;
    return json;
  }

  ObtenirStatistiquesCommuneParcelles({
    required this.id,
    required this.statut,
  });
}

@immutable
class ObtenirStatistiquesCommuneTaxeFoncieres {
  final int id;
  final double montantDu;
  final EnumValue<StatutPaiement> statut;
  ObtenirStatistiquesCommuneTaxeFoncieres.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
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

    final ObtenirStatistiquesCommuneTaxeFoncieres otherTyped = other as ObtenirStatistiquesCommuneTaxeFoncieres;
    return id == otherTyped.id && 
    montantDu == otherTyped.montantDu && 
    statut == otherTyped.statut;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, montantDu.hashCode, statut.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['montantDu'] = nativeToJson<double>(montantDu);
    json['statut'] = 
    statutPaiementSerializer(statut)
    ;
    return json;
  }

  ObtenirStatistiquesCommuneTaxeFoncieres({
    required this.id,
    required this.montantDu,
    required this.statut,
  });
}

@immutable
class ObtenirStatistiquesCommuneTransactionFoncieres {
  final int id;
  final EnumValue<StatutTransaction> statut;
  final double? montant;
  ObtenirStatistiquesCommuneTransactionFoncieres.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  statut = statutTransactionDeserializer(json['statut']),
  montant = json['montant'] == null ? null : nativeFromJson<double>(json['montant']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirStatistiquesCommuneTransactionFoncieres otherTyped = other as ObtenirStatistiquesCommuneTransactionFoncieres;
    return id == otherTyped.id && 
    statut == otherTyped.statut && 
    montant == otherTyped.montant;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, statut.hashCode, montant.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['statut'] = 
    statutTransactionSerializer(statut)
    ;
    if (montant != null) {
      json['montant'] = nativeToJson<double?>(montant);
    }
    return json;
  }

  ObtenirStatistiquesCommuneTransactionFoncieres({
    required this.id,
    required this.statut,
    this.montant,
  });
}

@immutable
class ObtenirStatistiquesCommuneData {
  final List<ObtenirStatistiquesCommuneParcelles> parcelles;
  final List<ObtenirStatistiquesCommuneTaxeFoncieres> taxeFoncieres;
  final List<ObtenirStatistiquesCommuneTransactionFoncieres> transactionFoncieres;
  ObtenirStatistiquesCommuneData.fromJson(dynamic json):
  
  parcelles = (json['parcelles'] as List<dynamic>)
        .map((e) => ObtenirStatistiquesCommuneParcelles.fromJson(e))
        .toList(),
  taxeFoncieres = (json['taxeFoncieres'] as List<dynamic>)
        .map((e) => ObtenirStatistiquesCommuneTaxeFoncieres.fromJson(e))
        .toList(),
  transactionFoncieres = (json['transactionFoncieres'] as List<dynamic>)
        .map((e) => ObtenirStatistiquesCommuneTransactionFoncieres.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirStatistiquesCommuneData otherTyped = other as ObtenirStatistiquesCommuneData;
    return parcelles == otherTyped.parcelles && 
    taxeFoncieres == otherTyped.taxeFoncieres && 
    transactionFoncieres == otherTyped.transactionFoncieres;
    
  }
  @override
  int get hashCode => Object.hashAll([parcelles.hashCode, taxeFoncieres.hashCode, transactionFoncieres.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelles'] = parcelles.map((e) => e.toJson()).toList();
    json['taxeFoncieres'] = taxeFoncieres.map((e) => e.toJson()).toList();
    json['transactionFoncieres'] = transactionFoncieres.map((e) => e.toJson()).toList();
    return json;
  }

  ObtenirStatistiquesCommuneData({
    required this.parcelles,
    required this.taxeFoncieres,
    required this.transactionFoncieres,
  });
}

@immutable
class ObtenirStatistiquesCommuneVariables {
  final int communeId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ObtenirStatistiquesCommuneVariables.fromJson(Map<String, dynamic> json):
  
  communeId = nativeFromJson<int>(json['communeId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirStatistiquesCommuneVariables otherTyped = other as ObtenirStatistiquesCommuneVariables;
    return communeId == otherTyped.communeId;
    
  }
  @override
  int get hashCode => communeId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['communeId'] = nativeToJson<int>(communeId);
    return json;
  }

  ObtenirStatistiquesCommuneVariables({
    required this.communeId,
  });
}

