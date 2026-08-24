part of 'porhe_foncier23072026.dart';

class ListerTaxesEcheanceDepasseeVariablesBuilder {
  int communeId;
  DateTime dateActuelle;

  final FirebaseDataConnect _dataConnect;
  ListerTaxesEcheanceDepasseeVariablesBuilder(this._dataConnect, {required  this.communeId,required  this.dateActuelle,});
  Deserializer<ListerTaxesEcheanceDepasseeData> dataDeserializer = (dynamic json)  => ListerTaxesEcheanceDepasseeData.fromJson(jsonDecode(json));
  Serializer<ListerTaxesEcheanceDepasseeVariables> varsSerializer = (ListerTaxesEcheanceDepasseeVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerTaxesEcheanceDepasseeData, ListerTaxesEcheanceDepasseeVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerTaxesEcheanceDepasseeData, ListerTaxesEcheanceDepasseeVariables> ref() {
    ListerTaxesEcheanceDepasseeVariables vars= ListerTaxesEcheanceDepasseeVariables(communeId: communeId,dateActuelle: dateActuelle,);
    return _dataConnect.query("listerTaxesEcheanceDepassee", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerTaxesEcheanceDepasseeTaxeFoncieres {
  final int id;
  final int parcelleId;
  final int anneeFiscale;
  final double montantDu;
  final DateTime dateEcheance;
  ListerTaxesEcheanceDepasseeTaxeFoncieres.fromJson(dynamic json):
  
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

    final ListerTaxesEcheanceDepasseeTaxeFoncieres otherTyped = other as ListerTaxesEcheanceDepasseeTaxeFoncieres;
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

  ListerTaxesEcheanceDepasseeTaxeFoncieres({
    required this.id,
    required this.parcelleId,
    required this.anneeFiscale,
    required this.montantDu,
    required this.dateEcheance,
  });
}

@immutable
class ListerTaxesEcheanceDepasseeData {
  final List<ListerTaxesEcheanceDepasseeTaxeFoncieres> taxeFoncieres;
  ListerTaxesEcheanceDepasseeData.fromJson(dynamic json):
  
  taxeFoncieres = (json['taxeFoncieres'] as List<dynamic>)
        .map((e) => ListerTaxesEcheanceDepasseeTaxeFoncieres.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTaxesEcheanceDepasseeData otherTyped = other as ListerTaxesEcheanceDepasseeData;
    return taxeFoncieres == otherTyped.taxeFoncieres;
    
  }
  @override
  int get hashCode => taxeFoncieres.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['taxeFoncieres'] = taxeFoncieres.map((e) => e.toJson()).toList();
    return json;
  }

  ListerTaxesEcheanceDepasseeData({
    required this.taxeFoncieres,
  });
}

@immutable
class ListerTaxesEcheanceDepasseeVariables {
  final int communeId;
  final DateTime dateActuelle;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerTaxesEcheanceDepasseeVariables.fromJson(Map<String, dynamic> json):
  
  communeId = nativeFromJson<int>(json['communeId']),
  dateActuelle = nativeFromJson<DateTime>(json['dateActuelle']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTaxesEcheanceDepasseeVariables otherTyped = other as ListerTaxesEcheanceDepasseeVariables;
    return communeId == otherTyped.communeId && 
    dateActuelle == otherTyped.dateActuelle;
    
  }
  @override
  int get hashCode => Object.hashAll([communeId.hashCode, dateActuelle.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['communeId'] = nativeToJson<int>(communeId);
    json['dateActuelle'] = nativeToJson<DateTime>(dateActuelle);
    return json;
  }

  ListerTaxesEcheanceDepasseeVariables({
    required this.communeId,
    required this.dateActuelle,
  });
}

