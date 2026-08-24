part of 'porhe_foncier23072026.dart';

class CreerFraisEnregistrementVariablesBuilder {
  int parcelleId;
  TypeFrais typeFrais;
  double montant;

  final FirebaseDataConnect _dataConnect;
  CreerFraisEnregistrementVariablesBuilder(this._dataConnect, {required  this.parcelleId,required  this.typeFrais,required  this.montant,});
  Deserializer<CreerFraisEnregistrementData> dataDeserializer = (dynamic json)  => CreerFraisEnregistrementData.fromJson(jsonDecode(json));
  Serializer<CreerFraisEnregistrementVariables> varsSerializer = (CreerFraisEnregistrementVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreerFraisEnregistrementData, CreerFraisEnregistrementVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreerFraisEnregistrementData, CreerFraisEnregistrementVariables> ref() {
    CreerFraisEnregistrementVariables vars= CreerFraisEnregistrementVariables(parcelleId: parcelleId,typeFrais: typeFrais,montant: montant,);
    return _dataConnect.mutation("creerFraisEnregistrement", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CreerFraisEnregistrementFraisEnregistrementInsert {
  final int id;
  CreerFraisEnregistrementFraisEnregistrementInsert.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreerFraisEnregistrementFraisEnregistrementInsert otherTyped = other as CreerFraisEnregistrementFraisEnregistrementInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  CreerFraisEnregistrementFraisEnregistrementInsert({
    required this.id,
  });
}

@immutable
class CreerFraisEnregistrementData {
  final CreerFraisEnregistrementFraisEnregistrementInsert fraisEnregistrement_insert;
  CreerFraisEnregistrementData.fromJson(dynamic json):
  
  fraisEnregistrement_insert = CreerFraisEnregistrementFraisEnregistrementInsert.fromJson(json['fraisEnregistrement_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreerFraisEnregistrementData otherTyped = other as CreerFraisEnregistrementData;
    return fraisEnregistrement_insert == otherTyped.fraisEnregistrement_insert;
    
  }
  @override
  int get hashCode => fraisEnregistrement_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['fraisEnregistrement_insert'] = fraisEnregistrement_insert.toJson();
    return json;
  }

  CreerFraisEnregistrementData({
    required this.fraisEnregistrement_insert,
  });
}

@immutable
class CreerFraisEnregistrementVariables {
  final int parcelleId;
  final TypeFrais typeFrais;
  final double montant;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreerFraisEnregistrementVariables.fromJson(Map<String, dynamic> json):
  
  parcelleId = nativeFromJson<int>(json['parcelleId']),
  typeFrais = TypeFrais.values.byName(json['typeFrais']),
  montant = nativeFromJson<double>(json['montant']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreerFraisEnregistrementVariables otherTyped = other as CreerFraisEnregistrementVariables;
    return parcelleId == otherTyped.parcelleId && 
    typeFrais == otherTyped.typeFrais && 
    montant == otherTyped.montant;
    
  }
  @override
  int get hashCode => Object.hashAll([parcelleId.hashCode, typeFrais.hashCode, montant.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    json['typeFrais'] = 
    typeFrais.name
    ;
    json['montant'] = nativeToJson<double>(montant);
    return json;
  }

  CreerFraisEnregistrementVariables({
    required this.parcelleId,
    required this.typeFrais,
    required this.montant,
  });
}

