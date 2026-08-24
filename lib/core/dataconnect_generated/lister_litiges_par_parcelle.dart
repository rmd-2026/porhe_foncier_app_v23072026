part of 'porhe_foncier23072026.dart';

class ListerLitigesParParcelleVariablesBuilder {
  int parcelleId;

  final FirebaseDataConnect _dataConnect;
  ListerLitigesParParcelleVariablesBuilder(this._dataConnect, {required  this.parcelleId,});
  Deserializer<ListerLitigesParParcelleData> dataDeserializer = (dynamic json)  => ListerLitigesParParcelleData.fromJson(jsonDecode(json));
  Serializer<ListerLitigesParParcelleVariables> varsSerializer = (ListerLitigesParParcelleVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerLitigesParParcelleData, ListerLitigesParParcelleVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerLitigesParParcelleData, ListerLitigesParParcelleVariables> ref() {
    ListerLitigesParParcelleVariables vars= ListerLitigesParParcelleVariables(parcelleId: parcelleId,);
    return _dataConnect.query("listerLitigesParParcelle", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerLitigesParParcelleLitiges {
  final int id;
  final int plaignantId;
  final String motif;
  final EnumValue<StatutLitige> statut;
  final String? resolution;
  final Timestamp createdAt;
  final Timestamp updatedAt;
  ListerLitigesParParcelleLitiges.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
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

    final ListerLitigesParParcelleLitiges otherTyped = other as ListerLitigesParParcelleLitiges;
    return id == otherTyped.id && 
    plaignantId == otherTyped.plaignantId && 
    motif == otherTyped.motif && 
    statut == otherTyped.statut && 
    resolution == otherTyped.resolution && 
    createdAt == otherTyped.createdAt && 
    updatedAt == otherTyped.updatedAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, plaignantId.hashCode, motif.hashCode, statut.hashCode, resolution.hashCode, createdAt.hashCode, updatedAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
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

  ListerLitigesParParcelleLitiges({
    required this.id,
    required this.plaignantId,
    required this.motif,
    required this.statut,
    this.resolution,
    required this.createdAt,
    required this.updatedAt,
  });
}

@immutable
class ListerLitigesParParcelleData {
  final List<ListerLitigesParParcelleLitiges> litiges;
  ListerLitigesParParcelleData.fromJson(dynamic json):
  
  litiges = (json['litiges'] as List<dynamic>)
        .map((e) => ListerLitigesParParcelleLitiges.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerLitigesParParcelleData otherTyped = other as ListerLitigesParParcelleData;
    return litiges == otherTyped.litiges;
    
  }
  @override
  int get hashCode => litiges.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['litiges'] = litiges.map((e) => e.toJson()).toList();
    return json;
  }

  ListerLitigesParParcelleData({
    required this.litiges,
  });
}

@immutable
class ListerLitigesParParcelleVariables {
  final int parcelleId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerLitigesParParcelleVariables.fromJson(Map<String, dynamic> json):
  
  parcelleId = nativeFromJson<int>(json['parcelleId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerLitigesParParcelleVariables otherTyped = other as ListerLitigesParParcelleVariables;
    return parcelleId == otherTyped.parcelleId;
    
  }
  @override
  int get hashCode => parcelleId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    return json;
  }

  ListerLitigesParParcelleVariables({
    required this.parcelleId,
  });
}

