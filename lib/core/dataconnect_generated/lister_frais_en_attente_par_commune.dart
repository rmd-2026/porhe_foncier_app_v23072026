part of 'porhe_foncier23072026.dart';

class ListerFraisEnAttenteParCommuneVariablesBuilder {
  int communeId;

  final FirebaseDataConnect _dataConnect;
  ListerFraisEnAttenteParCommuneVariablesBuilder(this._dataConnect, {required  this.communeId,});
  Deserializer<ListerFraisEnAttenteParCommuneData> dataDeserializer = (dynamic json)  => ListerFraisEnAttenteParCommuneData.fromJson(jsonDecode(json));
  Serializer<ListerFraisEnAttenteParCommuneVariables> varsSerializer = (ListerFraisEnAttenteParCommuneVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerFraisEnAttenteParCommuneData, ListerFraisEnAttenteParCommuneVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerFraisEnAttenteParCommuneData, ListerFraisEnAttenteParCommuneVariables> ref() {
    ListerFraisEnAttenteParCommuneVariables vars= ListerFraisEnAttenteParCommuneVariables(communeId: communeId,);
    return _dataConnect.query("listerFraisEnAttenteParCommune", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerFraisEnAttenteParCommuneFraisEnregistrements {
  final int id;
  final int parcelleId;
  final EnumValue<TypeFrais> typeFrais;
  final double montant;
  final Timestamp createdAt;
  ListerFraisEnAttenteParCommuneFraisEnregistrements.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  parcelleId = nativeFromJson<int>(json['parcelleId']),
  typeFrais = typeFraisDeserializer(json['typeFrais']),
  montant = nativeFromJson<double>(json['montant']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerFraisEnAttenteParCommuneFraisEnregistrements otherTyped = other as ListerFraisEnAttenteParCommuneFraisEnregistrements;
    return id == otherTyped.id && 
    parcelleId == otherTyped.parcelleId && 
    typeFrais == otherTyped.typeFrais && 
    montant == otherTyped.montant && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, parcelleId.hashCode, typeFrais.hashCode, montant.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    json['typeFrais'] = 
    typeFraisSerializer(typeFrais)
    ;
    json['montant'] = nativeToJson<double>(montant);
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListerFraisEnAttenteParCommuneFraisEnregistrements({
    required this.id,
    required this.parcelleId,
    required this.typeFrais,
    required this.montant,
    required this.createdAt,
  });
}

@immutable
class ListerFraisEnAttenteParCommuneData {
  final List<ListerFraisEnAttenteParCommuneFraisEnregistrements> fraisEnregistrements;
  ListerFraisEnAttenteParCommuneData.fromJson(dynamic json):
  
  fraisEnregistrements = (json['fraisEnregistrements'] as List<dynamic>)
        .map((e) => ListerFraisEnAttenteParCommuneFraisEnregistrements.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerFraisEnAttenteParCommuneData otherTyped = other as ListerFraisEnAttenteParCommuneData;
    return fraisEnregistrements == otherTyped.fraisEnregistrements;
    
  }
  @override
  int get hashCode => fraisEnregistrements.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['fraisEnregistrements'] = fraisEnregistrements.map((e) => e.toJson()).toList();
    return json;
  }

  ListerFraisEnAttenteParCommuneData({
    required this.fraisEnregistrements,
  });
}

@immutable
class ListerFraisEnAttenteParCommuneVariables {
  final int communeId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerFraisEnAttenteParCommuneVariables.fromJson(Map<String, dynamic> json):
  
  communeId = nativeFromJson<int>(json['communeId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerFraisEnAttenteParCommuneVariables otherTyped = other as ListerFraisEnAttenteParCommuneVariables;
    return communeId == otherTyped.communeId;
    
  }
  @override
  int get hashCode => communeId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['communeId'] = nativeToJson<int>(communeId);
    return json;
  }

  ListerFraisEnAttenteParCommuneVariables({
    required this.communeId,
  });
}

