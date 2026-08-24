part of 'porhe_foncier23072026.dart';

class ListerCommunesParRegionVariablesBuilder {
  int regionId;

  final FirebaseDataConnect _dataConnect;
  ListerCommunesParRegionVariablesBuilder(this._dataConnect, {required  this.regionId,});
  Deserializer<ListerCommunesParRegionData> dataDeserializer = (dynamic json)  => ListerCommunesParRegionData.fromJson(jsonDecode(json));
  Serializer<ListerCommunesParRegionVariables> varsSerializer = (ListerCommunesParRegionVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerCommunesParRegionData, ListerCommunesParRegionVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerCommunesParRegionData, ListerCommunesParRegionVariables> ref() {
    ListerCommunesParRegionVariables vars= ListerCommunesParRegionVariables(regionId: regionId,);
    return _dataConnect.query("listerCommunesParRegion", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerCommunesParRegionCommunes {
  final int id;
  final String nom;
  final int regionId;
  ListerCommunesParRegionCommunes.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  nom = nativeFromJson<String>(json['nom']),
  regionId = nativeFromJson<int>(json['regionId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerCommunesParRegionCommunes otherTyped = other as ListerCommunesParRegionCommunes;
    return id == otherTyped.id && 
    nom == otherTyped.nom && 
    regionId == otherTyped.regionId;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, nom.hashCode, regionId.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['nom'] = nativeToJson<String>(nom);
    json['regionId'] = nativeToJson<int>(regionId);
    return json;
  }

  ListerCommunesParRegionCommunes({
    required this.id,
    required this.nom,
    required this.regionId,
  });
}

@immutable
class ListerCommunesParRegionData {
  final List<ListerCommunesParRegionCommunes> communes;
  ListerCommunesParRegionData.fromJson(dynamic json):
  
  communes = (json['communes'] as List<dynamic>)
        .map((e) => ListerCommunesParRegionCommunes.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerCommunesParRegionData otherTyped = other as ListerCommunesParRegionData;
    return communes == otherTyped.communes;
    
  }
  @override
  int get hashCode => communes.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['communes'] = communes.map((e) => e.toJson()).toList();
    return json;
  }

  ListerCommunesParRegionData({
    required this.communes,
  });
}

@immutable
class ListerCommunesParRegionVariables {
  final int regionId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerCommunesParRegionVariables.fromJson(Map<String, dynamic> json):
  
  regionId = nativeFromJson<int>(json['regionId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerCommunesParRegionVariables otherTyped = other as ListerCommunesParRegionVariables;
    return regionId == otherTyped.regionId;
    
  }
  @override
  int get hashCode => regionId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['regionId'] = nativeToJson<int>(regionId);
    return json;
  }

  ListerCommunesParRegionVariables({
    required this.regionId,
  });
}

