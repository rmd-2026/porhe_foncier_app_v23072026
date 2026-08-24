part of 'porhe_foncier23072026.dart';

class ListerTaxesEnRetardParCommuneVariablesBuilder {
  int communeId;

  final FirebaseDataConnect _dataConnect;
  ListerTaxesEnRetardParCommuneVariablesBuilder(this._dataConnect, {required  this.communeId,});
  Deserializer<ListerTaxesEnRetardParCommuneData> dataDeserializer = (dynamic json)  => ListerTaxesEnRetardParCommuneData.fromJson(jsonDecode(json));
  Serializer<ListerTaxesEnRetardParCommuneVariables> varsSerializer = (ListerTaxesEnRetardParCommuneVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerTaxesEnRetardParCommuneData, ListerTaxesEnRetardParCommuneVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerTaxesEnRetardParCommuneData, ListerTaxesEnRetardParCommuneVariables> ref() {
    ListerTaxesEnRetardParCommuneVariables vars= ListerTaxesEnRetardParCommuneVariables(communeId: communeId,);
    return _dataConnect.query("listerTaxesEnRetardParCommune", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerTaxesEnRetardParCommuneTaxeFoncieres {
  final int id;
  final int parcelleId;
  final int anneeFiscale;
  final double montantDu;
  final DateTime dateEcheance;
  ListerTaxesEnRetardParCommuneTaxeFoncieres.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  parcelleId = nativeFromJson<int>(json['parcelleId']),
  anneeFiscale = nativeFromJson<int>(json['anneeFiscale']),
  montantDu = nativeFromJson<double>(json['montantDu']),
  dateEcheance = nativeFromJson<DateTime>(json['dateEcheance']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTaxesEnRetardParCommuneTaxeFoncieres otherTyped = other as ListerTaxesEnRetardParCommuneTaxeFoncieres;
    return id == otherTyped.id && 
    parcelleId == otherTyped.parcelleId && 
    anneeFiscale == otherTyped.anneeFiscale && 
    montantDu == otherTyped.montantDu && 
    dateEcheance == otherTyped.dateEcheance;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, parcelleId.hashCode, anneeFiscale.hashCode, montantDu.hashCode, dateEcheance.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    json['anneeFiscale'] = nativeToJson<int>(anneeFiscale);
    json['montantDu'] = nativeToJson<double>(montantDu);
    json['dateEcheance'] = nativeToJson<DateTime>(dateEcheance);
    return json;
  }

  ListerTaxesEnRetardParCommuneTaxeFoncieres({
    required this.id,
    required this.parcelleId,
    required this.anneeFiscale,
    required this.montantDu,
    required this.dateEcheance,
  });
}

@immutable
class ListerTaxesEnRetardParCommuneData {
  final List<ListerTaxesEnRetardParCommuneTaxeFoncieres> taxeFoncieres;
  ListerTaxesEnRetardParCommuneData.fromJson(dynamic json):
  
  taxeFoncieres = (json['taxeFoncieres'] as List<dynamic>)
        .map((e) => ListerTaxesEnRetardParCommuneTaxeFoncieres.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTaxesEnRetardParCommuneData otherTyped = other as ListerTaxesEnRetardParCommuneData;
    return taxeFoncieres == otherTyped.taxeFoncieres;
    
  }
  @override
  int get hashCode => taxeFoncieres.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['taxeFoncieres'] = taxeFoncieres.map((e) => e.toJson()).toList();
    return json;
  }

  ListerTaxesEnRetardParCommuneData({
    required this.taxeFoncieres,
  });
}

@immutable
class ListerTaxesEnRetardParCommuneVariables {
  final int communeId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerTaxesEnRetardParCommuneVariables.fromJson(Map<String, dynamic> json):
  
  communeId = nativeFromJson<int>(json['communeId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTaxesEnRetardParCommuneVariables otherTyped = other as ListerTaxesEnRetardParCommuneVariables;
    return communeId == otherTyped.communeId;
    
  }
  @override
  int get hashCode => communeId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['communeId'] = nativeToJson<int>(communeId);
    return json;
  }

  ListerTaxesEnRetardParCommuneVariables({
    required this.communeId,
  });
}

