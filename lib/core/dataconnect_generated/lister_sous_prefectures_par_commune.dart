part of 'porhe_foncier23072026.dart';

class ListerSousPrefecturesParCommuneVariablesBuilder {
  int communeId;

  final FirebaseDataConnect _dataConnect;
  ListerSousPrefecturesParCommuneVariablesBuilder(this._dataConnect, {required  this.communeId,});
  Deserializer<ListerSousPrefecturesParCommuneData> dataDeserializer = (dynamic json)  => ListerSousPrefecturesParCommuneData.fromJson(jsonDecode(json));
  Serializer<ListerSousPrefecturesParCommuneVariables> varsSerializer = (ListerSousPrefecturesParCommuneVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerSousPrefecturesParCommuneData, ListerSousPrefecturesParCommuneVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerSousPrefecturesParCommuneData, ListerSousPrefecturesParCommuneVariables> ref() {
    ListerSousPrefecturesParCommuneVariables vars= ListerSousPrefecturesParCommuneVariables(communeId: communeId,);
    return _dataConnect.query("listerSousPrefecturesParCommune", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerSousPrefecturesParCommuneSousPrefectures {
  final int id;
  final String nom;
  final int communeId;
  ListerSousPrefecturesParCommuneSousPrefectures.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  nom = nativeFromJson<String>(json['nom']),
  communeId = nativeFromJson<int>(json['communeId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerSousPrefecturesParCommuneSousPrefectures otherTyped = other as ListerSousPrefecturesParCommuneSousPrefectures;
    return id == otherTyped.id && 
    nom == otherTyped.nom && 
    communeId == otherTyped.communeId;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, nom.hashCode, communeId.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['nom'] = nativeToJson<String>(nom);
    json['communeId'] = nativeToJson<int>(communeId);
    return json;
  }

  ListerSousPrefecturesParCommuneSousPrefectures({
    required this.id,
    required this.nom,
    required this.communeId,
  });
}

@immutable
class ListerSousPrefecturesParCommuneData {
  final List<ListerSousPrefecturesParCommuneSousPrefectures> sousPrefectures;
  ListerSousPrefecturesParCommuneData.fromJson(dynamic json):
  
  sousPrefectures = (json['sousPrefectures'] as List<dynamic>)
        .map((e) => ListerSousPrefecturesParCommuneSousPrefectures.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerSousPrefecturesParCommuneData otherTyped = other as ListerSousPrefecturesParCommuneData;
    return sousPrefectures == otherTyped.sousPrefectures;
    
  }
  @override
  int get hashCode => sousPrefectures.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['sousPrefectures'] = sousPrefectures.map((e) => e.toJson()).toList();
    return json;
  }

  ListerSousPrefecturesParCommuneData({
    required this.sousPrefectures,
  });
}

@immutable
class ListerSousPrefecturesParCommuneVariables {
  final int communeId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerSousPrefecturesParCommuneVariables.fromJson(Map<String, dynamic> json):
  
  communeId = nativeFromJson<int>(json['communeId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerSousPrefecturesParCommuneVariables otherTyped = other as ListerSousPrefecturesParCommuneVariables;
    return communeId == otherTyped.communeId;
    
  }
  @override
  int get hashCode => communeId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['communeId'] = nativeToJson<int>(communeId);
    return json;
  }

  ListerSousPrefecturesParCommuneVariables({
    required this.communeId,
  });
}

