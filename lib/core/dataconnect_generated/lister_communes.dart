part of 'porhe_foncier23072026.dart';

class ListerCommunesVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  ListerCommunesVariablesBuilder(this._dataConnect, );
  Deserializer<ListerCommunesData> dataDeserializer = (dynamic json)  => ListerCommunesData.fromJson(jsonDecode(json));
  
  Future<QueryResult<ListerCommunesData, void>> execute() {
    return ref().execute();
  }

  QueryRef<ListerCommunesData, void> ref() {
    
    return _dataConnect.query("listerCommunes", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class ListerCommunesCommunes {
  final int id;
  final String nom;
  final int regionId;
  ListerCommunesCommunes.fromJson(dynamic json):
  
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

    final ListerCommunesCommunes otherTyped = other as ListerCommunesCommunes;
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

  ListerCommunesCommunes({
    required this.id,
    required this.nom,
    required this.regionId,
  });
}

@immutable
class ListerCommunesData {
  final List<ListerCommunesCommunes> communes;
  ListerCommunesData.fromJson(dynamic json):
  
  communes = (json['communes'] as List<dynamic>)
        .map((e) => ListerCommunesCommunes.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerCommunesData otherTyped = other as ListerCommunesData;
    return communes == otherTyped.communes;
    
  }
  @override
  int get hashCode => communes.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['communes'] = communes.map((e) => e.toJson()).toList();
    return json;
  }

  ListerCommunesData({
    required this.communes,
  });
}

