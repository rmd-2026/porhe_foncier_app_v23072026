part of 'porhe_foncier23072026.dart';

class ListerSousPrefecturesVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  ListerSousPrefecturesVariablesBuilder(this._dataConnect, );
  Deserializer<ListerSousPrefecturesData> dataDeserializer = (dynamic json)  => ListerSousPrefecturesData.fromJson(jsonDecode(json));
  
  Future<QueryResult<ListerSousPrefecturesData, void>> execute() {
    return ref().execute();
  }

  QueryRef<ListerSousPrefecturesData, void> ref() {
    
    return _dataConnect.query("listerSousPrefectures", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class ListerSousPrefecturesSousPrefectures {
  final int id;
  final String nom;
  final int communeId;
  ListerSousPrefecturesSousPrefectures.fromJson(dynamic json):
  
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

    final ListerSousPrefecturesSousPrefectures otherTyped = other as ListerSousPrefecturesSousPrefectures;
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

  ListerSousPrefecturesSousPrefectures({
    required this.id,
    required this.nom,
    required this.communeId,
  });
}

@immutable
class ListerSousPrefecturesData {
  final List<ListerSousPrefecturesSousPrefectures> sousPrefectures;
  ListerSousPrefecturesData.fromJson(dynamic json):
  
  sousPrefectures = (json['sousPrefectures'] as List<dynamic>)
        .map((e) => ListerSousPrefecturesSousPrefectures.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerSousPrefecturesData otherTyped = other as ListerSousPrefecturesData;
    return sousPrefectures == otherTyped.sousPrefectures;
    
  }
  @override
  int get hashCode => sousPrefectures.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['sousPrefectures'] = sousPrefectures.map((e) => e.toJson()).toList();
    return json;
  }

  ListerSousPrefecturesData({
    required this.sousPrefectures,
  });
}

