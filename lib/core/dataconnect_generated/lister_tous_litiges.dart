part of 'porhe_foncier23072026.dart';

class ListerTousLitigesVariablesBuilder {
  Optional<int> _limit = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _offset = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;
  ListerTousLitigesVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerTousLitigesVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ListerTousLitigesVariablesBuilder(this._dataConnect, );
  Deserializer<ListerTousLitigesData> dataDeserializer = (dynamic json)  => ListerTousLitigesData.fromJson(jsonDecode(json));
  Serializer<ListerTousLitigesVariables> varsSerializer = (ListerTousLitigesVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerTousLitigesData, ListerTousLitigesVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerTousLitigesData, ListerTousLitigesVariables> ref() {
    ListerTousLitigesVariables vars= ListerTousLitigesVariables(limit: _limit,offset: _offset,);
    return _dataConnect.query("listerTousLitiges", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerTousLitigesLitiges {
  final int id;
  final int parcelleId;
  final int plaignantId;
  final EnumValue<StatutLitige> statut;
  final Timestamp createdAt;
  ListerTousLitigesLitiges.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  parcelleId = nativeFromJson<int>(json['parcelleId']),
  plaignantId = nativeFromJson<int>(json['plaignantId']),
  statut = statutLitigeDeserializer(json['statut']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTousLitigesLitiges otherTyped = other as ListerTousLitigesLitiges;
    return id == otherTyped.id && 
    parcelleId == otherTyped.parcelleId && 
    plaignantId == otherTyped.plaignantId && 
    statut == otherTyped.statut && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, parcelleId.hashCode, plaignantId.hashCode, statut.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    json['plaignantId'] = nativeToJson<int>(plaignantId);
    json['statut'] = 
    statutLitigeSerializer(statut)
    ;
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListerTousLitigesLitiges({
    required this.id,
    required this.parcelleId,
    required this.plaignantId,
    required this.statut,
    required this.createdAt,
  });
}

@immutable
class ListerTousLitigesData {
  final List<ListerTousLitigesLitiges> litiges;
  ListerTousLitigesData.fromJson(dynamic json):
  
  litiges = (json['litiges'] as List<dynamic>)
        .map((e) => ListerTousLitigesLitiges.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTousLitigesData otherTyped = other as ListerTousLitigesData;
    return litiges == otherTyped.litiges;
    
  }
  @override
  int get hashCode => litiges.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['litiges'] = litiges.map((e) => e.toJson()).toList();
    return json;
  }

  ListerTousLitigesData({
    required this.litiges,
  });
}

@immutable
class ListerTousLitigesVariables {
  late final Optional<int>limit;
  late final Optional<int>offset;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerTousLitigesVariables.fromJson(Map<String, dynamic> json) {
  
  
    limit = Optional.optional(nativeFromJson, nativeToJson);
    limit.value = json['limit'] == null ? null : nativeFromJson<int>(json['limit']);
  
  
    offset = Optional.optional(nativeFromJson, nativeToJson);
    offset.value = json['offset'] == null ? null : nativeFromJson<int>(json['offset']);
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTousLitigesVariables otherTyped = other as ListerTousLitigesVariables;
    return limit == otherTyped.limit && 
    offset == otherTyped.offset;
    
  }
  @override
  int get hashCode => Object.hashAll([limit.hashCode, offset.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if(limit.state == OptionalState.set) {
      json['limit'] = limit.toJson();
    }
    if(offset.state == OptionalState.set) {
      json['offset'] = offset.toJson();
    }
    return json;
  }

  ListerTousLitigesVariables({
    required this.limit,
    required this.offset,
  });
}

