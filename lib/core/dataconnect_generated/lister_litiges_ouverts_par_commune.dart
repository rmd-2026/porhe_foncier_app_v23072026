part of 'porhe_foncier23072026.dart';

class ListerLitigesOuvertsParCommuneVariablesBuilder {
  int communeId;

  final FirebaseDataConnect _dataConnect;
  ListerLitigesOuvertsParCommuneVariablesBuilder(this._dataConnect, {required  this.communeId,});
  Deserializer<ListerLitigesOuvertsParCommuneData> dataDeserializer = (dynamic json)  => ListerLitigesOuvertsParCommuneData.fromJson(jsonDecode(json));
  Serializer<ListerLitigesOuvertsParCommuneVariables> varsSerializer = (ListerLitigesOuvertsParCommuneVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerLitigesOuvertsParCommuneData, ListerLitigesOuvertsParCommuneVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerLitigesOuvertsParCommuneData, ListerLitigesOuvertsParCommuneVariables> ref() {
    ListerLitigesOuvertsParCommuneVariables vars= ListerLitigesOuvertsParCommuneVariables(communeId: communeId,);
    return _dataConnect.query("listerLitigesOuvertsParCommune", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerLitigesOuvertsParCommuneLitiges {
  final int id;
  final int parcelleId;
  final int plaignantId;
  final String motif;
  final Timestamp createdAt;
  ListerLitigesOuvertsParCommuneLitiges.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  parcelleId = nativeFromJson<int>(json['parcelleId']),
  plaignantId = nativeFromJson<int>(json['plaignantId']),
  motif = nativeFromJson<String>(json['motif']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerLitigesOuvertsParCommuneLitiges otherTyped = other as ListerLitigesOuvertsParCommuneLitiges;
    return id == otherTyped.id && 
    parcelleId == otherTyped.parcelleId && 
    plaignantId == otherTyped.plaignantId && 
    motif == otherTyped.motif && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, parcelleId.hashCode, plaignantId.hashCode, motif.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    json['plaignantId'] = nativeToJson<int>(plaignantId);
    json['motif'] = nativeToJson<String>(motif);
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListerLitigesOuvertsParCommuneLitiges({
    required this.id,
    required this.parcelleId,
    required this.plaignantId,
    required this.motif,
    required this.createdAt,
  });
}

@immutable
class ListerLitigesOuvertsParCommuneData {
  final List<ListerLitigesOuvertsParCommuneLitiges> litiges;
  ListerLitigesOuvertsParCommuneData.fromJson(dynamic json):
  
  litiges = (json['litiges'] as List<dynamic>)
        .map((e) => ListerLitigesOuvertsParCommuneLitiges.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerLitigesOuvertsParCommuneData otherTyped = other as ListerLitigesOuvertsParCommuneData;
    return litiges == otherTyped.litiges;
    
  }
  @override
  int get hashCode => litiges.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['litiges'] = litiges.map((e) => e.toJson()).toList();
    return json;
  }

  ListerLitigesOuvertsParCommuneData({
    required this.litiges,
  });
}

@immutable
class ListerLitigesOuvertsParCommuneVariables {
  final int communeId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerLitigesOuvertsParCommuneVariables.fromJson(Map<String, dynamic> json):
  
  communeId = nativeFromJson<int>(json['communeId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerLitigesOuvertsParCommuneVariables otherTyped = other as ListerLitigesOuvertsParCommuneVariables;
    return communeId == otherTyped.communeId;
    
  }
  @override
  int get hashCode => communeId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['communeId'] = nativeToJson<int>(communeId);
    return json;
  }

  ListerLitigesOuvertsParCommuneVariables({
    required this.communeId,
  });
}

