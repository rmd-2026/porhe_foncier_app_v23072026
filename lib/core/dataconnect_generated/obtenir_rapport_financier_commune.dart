part of 'porhe_foncier23072026.dart';

class ObtenirRapportFinancierCommuneVariablesBuilder {
  int communeId;

  final FirebaseDataConnect _dataConnect;
  ObtenirRapportFinancierCommuneVariablesBuilder(this._dataConnect, {required  this.communeId,});
  Deserializer<ObtenirRapportFinancierCommuneData> dataDeserializer = (dynamic json)  => ObtenirRapportFinancierCommuneData.fromJson(jsonDecode(json));
  Serializer<ObtenirRapportFinancierCommuneVariables> varsSerializer = (ObtenirRapportFinancierCommuneVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ObtenirRapportFinancierCommuneData, ObtenirRapportFinancierCommuneVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ObtenirRapportFinancierCommuneData, ObtenirRapportFinancierCommuneVariables> ref() {
    ObtenirRapportFinancierCommuneVariables vars= ObtenirRapportFinancierCommuneVariables(communeId: communeId,);
    return _dataConnect.query("obtenirRapportFinancierCommune", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ObtenirRapportFinancierCommuneTaxeFoncieres {
  final int id;
  final double montantDu;
  final EnumValue<StatutPaiement> statut;
  final int anneeFiscale;
  ObtenirRapportFinancierCommuneTaxeFoncieres.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  montantDu = nativeFromJson<double>(json['montantDu']),
  statut = statutPaiementDeserializer(json['statut']),
  anneeFiscale = nativeFromJson<int>(json['anneeFiscale']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirRapportFinancierCommuneTaxeFoncieres otherTyped = other as ObtenirRapportFinancierCommuneTaxeFoncieres;
    return id == otherTyped.id && 
    montantDu == otherTyped.montantDu && 
    statut == otherTyped.statut && 
    anneeFiscale == otherTyped.anneeFiscale;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, montantDu.hashCode, statut.hashCode, anneeFiscale.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['montantDu'] = nativeToJson<double>(montantDu);
    json['statut'] = 
    statutPaiementSerializer(statut)
    ;
    json['anneeFiscale'] = nativeToJson<int>(anneeFiscale);
    return json;
  }

  ObtenirRapportFinancierCommuneTaxeFoncieres({
    required this.id,
    required this.montantDu,
    required this.statut,
    required this.anneeFiscale,
  });
}

@immutable
class ObtenirRapportFinancierCommuneData {
  final List<ObtenirRapportFinancierCommuneTaxeFoncieres> taxeFoncieres;
  ObtenirRapportFinancierCommuneData.fromJson(dynamic json):
  
  taxeFoncieres = (json['taxeFoncieres'] as List<dynamic>)
        .map((e) => ObtenirRapportFinancierCommuneTaxeFoncieres.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirRapportFinancierCommuneData otherTyped = other as ObtenirRapportFinancierCommuneData;
    return taxeFoncieres == otherTyped.taxeFoncieres;
    
  }
  @override
  int get hashCode => taxeFoncieres.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['taxeFoncieres'] = taxeFoncieres.map((e) => e.toJson()).toList();
    return json;
  }

  ObtenirRapportFinancierCommuneData({
    required this.taxeFoncieres,
  });
}

@immutable
class ObtenirRapportFinancierCommuneVariables {
  final int communeId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ObtenirRapportFinancierCommuneVariables.fromJson(Map<String, dynamic> json):
  
  communeId = nativeFromJson<int>(json['communeId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirRapportFinancierCommuneVariables otherTyped = other as ObtenirRapportFinancierCommuneVariables;
    return communeId == otherTyped.communeId;
    
  }
  @override
  int get hashCode => communeId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['communeId'] = nativeToJson<int>(communeId);
    return json;
  }

  ObtenirRapportFinancierCommuneVariables({
    required this.communeId,
  });
}

