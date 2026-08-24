part of 'porhe_foncier23072026.dart';

class ListerTaxesParParcelleVariablesBuilder {
  int parcelleId;

  final FirebaseDataConnect _dataConnect;
  ListerTaxesParParcelleVariablesBuilder(this._dataConnect, {required  this.parcelleId,});
  Deserializer<ListerTaxesParParcelleData> dataDeserializer = (dynamic json)  => ListerTaxesParParcelleData.fromJson(jsonDecode(json));
  Serializer<ListerTaxesParParcelleVariables> varsSerializer = (ListerTaxesParParcelleVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerTaxesParParcelleData, ListerTaxesParParcelleVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerTaxesParParcelleData, ListerTaxesParParcelleVariables> ref() {
    ListerTaxesParParcelleVariables vars= ListerTaxesParParcelleVariables(parcelleId: parcelleId,);
    return _dataConnect.query("listerTaxesParParcelle", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerTaxesParParcelleTaxeFoncieres {
  final int id;
  final int anneeFiscale;
  final double montantDu;
  final DateTime dateEcheance;
  final EnumValue<StatutPaiement> statut;
  ListerTaxesParParcelleTaxeFoncieres.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  anneeFiscale = nativeFromJson<int>(json['anneeFiscale']),
  montantDu = nativeFromJson<double>(json['montantDu']),
  dateEcheance = nativeFromJson<DateTime>(json['dateEcheance']),
  statut = statutPaiementDeserializer(json['statut']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTaxesParParcelleTaxeFoncieres otherTyped = other as ListerTaxesParParcelleTaxeFoncieres;
    return id == otherTyped.id && 
    anneeFiscale == otherTyped.anneeFiscale && 
    montantDu == otherTyped.montantDu && 
    dateEcheance == otherTyped.dateEcheance && 
    statut == otherTyped.statut;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, anneeFiscale.hashCode, montantDu.hashCode, dateEcheance.hashCode, statut.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['anneeFiscale'] = nativeToJson<int>(anneeFiscale);
    json['montantDu'] = nativeToJson<double>(montantDu);
    json['dateEcheance'] = nativeToJson<DateTime>(dateEcheance);
    json['statut'] = 
    statutPaiementSerializer(statut)
    ;
    return json;
  }

  ListerTaxesParParcelleTaxeFoncieres({
    required this.id,
    required this.anneeFiscale,
    required this.montantDu,
    required this.dateEcheance,
    required this.statut,
  });
}

@immutable
class ListerTaxesParParcelleData {
  final List<ListerTaxesParParcelleTaxeFoncieres> taxeFoncieres;
  ListerTaxesParParcelleData.fromJson(dynamic json):
  
  taxeFoncieres = (json['taxeFoncieres'] as List<dynamic>)
        .map((e) => ListerTaxesParParcelleTaxeFoncieres.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTaxesParParcelleData otherTyped = other as ListerTaxesParParcelleData;
    return taxeFoncieres == otherTyped.taxeFoncieres;
    
  }
  @override
  int get hashCode => taxeFoncieres.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['taxeFoncieres'] = taxeFoncieres.map((e) => e.toJson()).toList();
    return json;
  }

  ListerTaxesParParcelleData({
    required this.taxeFoncieres,
  });
}

@immutable
class ListerTaxesParParcelleVariables {
  final int parcelleId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerTaxesParParcelleVariables.fromJson(Map<String, dynamic> json):
  
  parcelleId = nativeFromJson<int>(json['parcelleId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTaxesParParcelleVariables otherTyped = other as ListerTaxesParParcelleVariables;
    return parcelleId == otherTyped.parcelleId;
    
  }
  @override
  int get hashCode => parcelleId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    return json;
  }

  ListerTaxesParParcelleVariables({
    required this.parcelleId,
  });
}

