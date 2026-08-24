part of 'porhe_foncier23072026.dart';

class ListerToutesParcellesVariablesBuilder {
  Optional<int> _limit = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _offset = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;
  ListerToutesParcellesVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerToutesParcellesVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ListerToutesParcellesVariablesBuilder(this._dataConnect, );
  Deserializer<ListerToutesParcellesData> dataDeserializer = (dynamic json)  => ListerToutesParcellesData.fromJson(jsonDecode(json));
  Serializer<ListerToutesParcellesVariables> varsSerializer = (ListerToutesParcellesVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerToutesParcellesData, ListerToutesParcellesVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerToutesParcellesData, ListerToutesParcellesVariables> ref() {
    ListerToutesParcellesVariables vars= ListerToutesParcellesVariables(limit: _limit,offset: _offset,);
    return _dataConnect.query("listerToutesParcelles", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerToutesParcellesParcelles {
  final int id;
  final String codeParcelle;
  final int utilisateurId;
  final int communeId;
  final EnumValue<StatutParcelle> statut;
  final Timestamp createdAt;
  ListerToutesParcellesParcelles.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  codeParcelle = nativeFromJson<String>(json['codeParcelle']),
  utilisateurId = nativeFromJson<int>(json['utilisateurId']),
  communeId = nativeFromJson<int>(json['communeId']),
  statut = statutParcelleDeserializer(json['statut']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerToutesParcellesParcelles otherTyped = other as ListerToutesParcellesParcelles;
    return id == otherTyped.id && 
    codeParcelle == otherTyped.codeParcelle && 
    utilisateurId == otherTyped.utilisateurId && 
    communeId == otherTyped.communeId && 
    statut == otherTyped.statut && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, codeParcelle.hashCode, utilisateurId.hashCode, communeId.hashCode, statut.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['codeParcelle'] = nativeToJson<String>(codeParcelle);
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    json['communeId'] = nativeToJson<int>(communeId);
    json['statut'] = 
    statutParcelleSerializer(statut)
    ;
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListerToutesParcellesParcelles({
    required this.id,
    required this.codeParcelle,
    required this.utilisateurId,
    required this.communeId,
    required this.statut,
    required this.createdAt,
  });
}

@immutable
class ListerToutesParcellesData {
  final List<ListerToutesParcellesParcelles> parcelles;
  ListerToutesParcellesData.fromJson(dynamic json):
  
  parcelles = (json['parcelles'] as List<dynamic>)
        .map((e) => ListerToutesParcellesParcelles.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerToutesParcellesData otherTyped = other as ListerToutesParcellesData;
    return parcelles == otherTyped.parcelles;
    
  }
  @override
  int get hashCode => parcelles.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelles'] = parcelles.map((e) => e.toJson()).toList();
    return json;
  }

  ListerToutesParcellesData({
    required this.parcelles,
  });
}

@immutable
class ListerToutesParcellesVariables {
  late final Optional<int>limit;
  late final Optional<int>offset;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerToutesParcellesVariables.fromJson(Map<String, dynamic> json) {
  
  
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

    final ListerToutesParcellesVariables otherTyped = other as ListerToutesParcellesVariables;
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

  ListerToutesParcellesVariables({
    required this.limit,
    required this.offset,
  });
}

