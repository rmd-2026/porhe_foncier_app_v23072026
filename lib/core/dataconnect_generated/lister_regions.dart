part of 'porhe_foncier23072026.dart';

class ListerRegionsVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  ListerRegionsVariablesBuilder(this._dataConnect, );
  Deserializer<ListerRegionsData> dataDeserializer = (dynamic json)  => ListerRegionsData.fromJson(jsonDecode(json));
  
  Future<QueryResult<ListerRegionsData, void>> execute() {
    return ref().execute();
  }

  QueryRef<ListerRegionsData, void> ref() {
    
    return _dataConnect.query("listerRegions", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class ListerRegionsRegions {
  final int id;
  final String nom;
  ListerRegionsRegions.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  nom = nativeFromJson<String>(json['nom']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerRegionsRegions otherTyped = other as ListerRegionsRegions;
    return id == otherTyped.id && 
    nom == otherTyped.nom;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, nom.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['nom'] = nativeToJson<String>(nom);
    return json;
  }

  ListerRegionsRegions({
    required this.id,
    required this.nom,
  });
}

@immutable
class ListerRegionsData {
  final List<ListerRegionsRegions> regions;
  ListerRegionsData.fromJson(dynamic json):
  
  regions = (json['regions'] as List<dynamic>)
        .map((e) => ListerRegionsRegions.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerRegionsData otherTyped = other as ListerRegionsData;
    return regions == otherTyped.regions;
    
  }
  @override
  int get hashCode => regions.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['regions'] = regions.map((e) => e.toJson()).toList();
    return json;
  }

  ListerRegionsData({
    required this.regions,
  });
}

