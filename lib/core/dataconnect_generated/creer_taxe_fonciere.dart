part of 'porhe_foncier23072026.dart';

class CreerTaxeFonciereVariablesBuilder {
  int parcelleId;
  int anneeFiscale;
  double montantDu;
  DateTime dateEcheance;

  final FirebaseDataConnect _dataConnect;
  CreerTaxeFonciereVariablesBuilder(this._dataConnect, {required  this.parcelleId,required  this.anneeFiscale,required  this.montantDu,required  this.dateEcheance,});
  Deserializer<CreerTaxeFonciereData> dataDeserializer = (dynamic json)  => CreerTaxeFonciereData.fromJson(jsonDecode(json));
  Serializer<CreerTaxeFonciereVariables> varsSerializer = (CreerTaxeFonciereVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreerTaxeFonciereData, CreerTaxeFonciereVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreerTaxeFonciereData, CreerTaxeFonciereVariables> ref() {
    CreerTaxeFonciereVariables vars= CreerTaxeFonciereVariables(parcelleId: parcelleId,anneeFiscale: anneeFiscale,montantDu: montantDu,dateEcheance: dateEcheance,);
    return _dataConnect.mutation("creerTaxeFonciere", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CreerTaxeFonciereTaxeFonciereInsert {
  final int id;
  CreerTaxeFonciereTaxeFonciereInsert.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreerTaxeFonciereTaxeFonciereInsert otherTyped = other as CreerTaxeFonciereTaxeFonciereInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  CreerTaxeFonciereTaxeFonciereInsert({
    required this.id,
  });
}

@immutable
class CreerTaxeFonciereData {
  final CreerTaxeFonciereTaxeFonciereInsert taxeFonciere_insert;
  CreerTaxeFonciereData.fromJson(dynamic json):
  
  taxeFonciere_insert = CreerTaxeFonciereTaxeFonciereInsert.fromJson(json['taxeFonciere_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreerTaxeFonciereData otherTyped = other as CreerTaxeFonciereData;
    return taxeFonciere_insert == otherTyped.taxeFonciere_insert;
    
  }
  @override
  int get hashCode => taxeFonciere_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['taxeFonciere_insert'] = taxeFonciere_insert.toJson();
    return json;
  }

  CreerTaxeFonciereData({
    required this.taxeFonciere_insert,
  });
}

@immutable
class CreerTaxeFonciereVariables {
  final int parcelleId;
  final int anneeFiscale;
  final double montantDu;
  final DateTime dateEcheance;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreerTaxeFonciereVariables.fromJson(Map<String, dynamic> json):
  
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

    final CreerTaxeFonciereVariables otherTyped = other as CreerTaxeFonciereVariables;
    return parcelleId == otherTyped.parcelleId && 
    anneeFiscale == otherTyped.anneeFiscale && 
    montantDu == otherTyped.montantDu && 
    dateEcheance == otherTyped.dateEcheance;
    
  }
  @override
  int get hashCode => Object.hashAll([parcelleId.hashCode, anneeFiscale.hashCode, montantDu.hashCode, dateEcheance.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    json['anneeFiscale'] = nativeToJson<int>(anneeFiscale);
    json['montantDu'] = nativeToJson<double>(montantDu);
    json['dateEcheance'] = nativeToJson<DateTime>(dateEcheance);
    return json;
  }

  CreerTaxeFonciereVariables({
    required this.parcelleId,
    required this.anneeFiscale,
    required this.montantDu,
    required this.dateEcheance,
  });
}

