part of 'porhe_foncier23072026.dart';

class ObtenirLitigeParIdVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  ObtenirLitigeParIdVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<ObtenirLitigeParIdData> dataDeserializer = (dynamic json)  => ObtenirLitigeParIdData.fromJson(jsonDecode(json));
  Serializer<ObtenirLitigeParIdVariables> varsSerializer = (ObtenirLitigeParIdVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ObtenirLitigeParIdData, ObtenirLitigeParIdVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ObtenirLitigeParIdData, ObtenirLitigeParIdVariables> ref() {
    ObtenirLitigeParIdVariables vars= ObtenirLitigeParIdVariables(id: id,);
    return _dataConnect.query("obtenirLitigeParId", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ObtenirLitigeParIdLitige {
  final int id;
  final int parcelleId;
  final int? transactionFonciereId;
  final int plaignantId;
  final String motif;
  final EnumValue<StatutLitige> statut;
  final String? resolution;
  final Timestamp createdAt;
  final Timestamp updatedAt;
  ObtenirLitigeParIdLitige.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  parcelleId = nativeFromJson<int>(json['parcelleId']),
  transactionFonciereId = json['transactionFonciereId'] == null ? null : nativeFromJson<int>(json['transactionFonciereId']),
  plaignantId = nativeFromJson<int>(json['plaignantId']),
  motif = nativeFromJson<String>(json['motif']),
  statut = statutLitigeDeserializer(json['statut']),
  resolution = json['resolution'] == null ? null : nativeFromJson<String>(json['resolution']),
  createdAt = Timestamp.fromJson(json['createdAt']),
  updatedAt = Timestamp.fromJson(json['updatedAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirLitigeParIdLitige otherTyped = other as ObtenirLitigeParIdLitige;
    return id == otherTyped.id && 
    parcelleId == otherTyped.parcelleId && 
    transactionFonciereId == otherTyped.transactionFonciereId && 
    plaignantId == otherTyped.plaignantId && 
    motif == otherTyped.motif && 
    statut == otherTyped.statut && 
    resolution == otherTyped.resolution && 
    createdAt == otherTyped.createdAt && 
    updatedAt == otherTyped.updatedAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, parcelleId.hashCode, transactionFonciereId.hashCode, plaignantId.hashCode, motif.hashCode, statut.hashCode, resolution.hashCode, createdAt.hashCode, updatedAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    if (transactionFonciereId != null) {
      json['transactionFonciereId'] = nativeToJson<int?>(transactionFonciereId);
    }
    json['plaignantId'] = nativeToJson<int>(plaignantId);
    json['motif'] = nativeToJson<String>(motif);
    json['statut'] = 
    statutLitigeSerializer(statut)
    ;
    if (resolution != null) {
      json['resolution'] = nativeToJson<String?>(resolution);
    }
    json['createdAt'] = createdAt.toJson();
    json['updatedAt'] = updatedAt.toJson();
    return json;
  }

  ObtenirLitigeParIdLitige({
    required this.id,
    required this.parcelleId,
    this.transactionFonciereId,
    required this.plaignantId,
    required this.motif,
    required this.statut,
    this.resolution,
    required this.createdAt,
    required this.updatedAt,
  });
}

@immutable
class ObtenirLitigeParIdData {
  final ObtenirLitigeParIdLitige? litige;
  ObtenirLitigeParIdData.fromJson(dynamic json):
  
  litige = json['litige'] == null ? null : ObtenirLitigeParIdLitige.fromJson(json['litige']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirLitigeParIdData otherTyped = other as ObtenirLitigeParIdData;
    return litige == otherTyped.litige;
    
  }
  @override
  int get hashCode => litige.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (litige != null) {
      json['litige'] = litige!.toJson();
    }
    return json;
  }

  ObtenirLitigeParIdData({
    this.litige,
  });
}

@immutable
class ObtenirLitigeParIdVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ObtenirLitigeParIdVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirLitigeParIdVariables otherTyped = other as ObtenirLitigeParIdVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  ObtenirLitigeParIdVariables({
    required this.id,
  });
}

