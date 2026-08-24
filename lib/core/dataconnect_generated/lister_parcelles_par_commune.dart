part of 'porhe_foncier23072026.dart';

class ListerParcellesParCommuneVariablesBuilder {
  int communeId;
  Optional<int> _limit = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _offset = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;  ListerParcellesParCommuneVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerParcellesParCommuneVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ListerParcellesParCommuneVariablesBuilder(this._dataConnect, {required  this.communeId,});
  Deserializer<ListerParcellesParCommuneData> dataDeserializer = (dynamic json)  => ListerParcellesParCommuneData.fromJson(jsonDecode(json));
  Serializer<ListerParcellesParCommuneVariables> varsSerializer = (ListerParcellesParCommuneVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerParcellesParCommuneData, ListerParcellesParCommuneVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerParcellesParCommuneData, ListerParcellesParCommuneVariables> ref() {
    ListerParcellesParCommuneVariables vars= ListerParcellesParCommuneVariables(communeId: communeId,limit: _limit,offset: _offset,);
    return _dataConnect.query("listerParcellesParCommune", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerParcellesParCommuneParcelles {
  final int id;
  final String codeParcelle;
  final int utilisateurId;
  final double? superficieM2;
  final EnumValue<StatutParcelle> statut;
  final Timestamp createdAt;
  ListerParcellesParCommuneParcelles.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  codeParcelle = nativeFromJson<String>(json['codeParcelle']),
  utilisateurId = nativeFromJson<int>(json['utilisateurId']),
  superficieM2 = json['superficieM2'] == null ? null : nativeFromJson<double>(json['superficieM2']),
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

    final ListerParcellesParCommuneParcelles otherTyped = other as ListerParcellesParCommuneParcelles;
    return id == otherTyped.id && 
    codeParcelle == otherTyped.codeParcelle && 
    utilisateurId == otherTyped.utilisateurId && 
    superficieM2 == otherTyped.superficieM2 && 
    statut == otherTyped.statut && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, codeParcelle.hashCode, utilisateurId.hashCode, superficieM2.hashCode, statut.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['codeParcelle'] = nativeToJson<String>(codeParcelle);
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    if (superficieM2 != null) {
      json['superficieM2'] = nativeToJson<double?>(superficieM2);
    }
    json['statut'] = 
    statutParcelleSerializer(statut)
    ;
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListerParcellesParCommuneParcelles({
    required this.id,
    required this.codeParcelle,
    required this.utilisateurId,
    this.superficieM2,
    required this.statut,
    required this.createdAt,
  });
}

@immutable
class ListerParcellesParCommuneData {
  final List<ListerParcellesParCommuneParcelles> parcelles;
  ListerParcellesParCommuneData.fromJson(dynamic json):
  
  parcelles = (json['parcelles'] as List<dynamic>)
        .map((e) => ListerParcellesParCommuneParcelles.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerParcellesParCommuneData otherTyped = other as ListerParcellesParCommuneData;
    return parcelles == otherTyped.parcelles;
    
  }
  @override
  int get hashCode => parcelles.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelles'] = parcelles.map((e) => e.toJson()).toList();
    return json;
  }

  ListerParcellesParCommuneData({
    required this.parcelles,
  });
}

@immutable
class ListerParcellesParCommuneVariables {
  final int communeId;
  late final Optional<int>limit;
  late final Optional<int>offset;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerParcellesParCommuneVariables.fromJson(Map<String, dynamic> json):
  
  communeId = nativeFromJson<int>(json['communeId']) {
  
  
  
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

    final ListerParcellesParCommuneVariables otherTyped = other as ListerParcellesParCommuneVariables;
    return communeId == otherTyped.communeId && 
    limit == otherTyped.limit && 
    offset == otherTyped.offset;
    
  }
  @override
  int get hashCode => Object.hashAll([communeId.hashCode, limit.hashCode, offset.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['communeId'] = nativeToJson<int>(communeId);
    if(limit.state == OptionalState.set) {
      json['limit'] = limit.toJson();
    }
    if(offset.state == OptionalState.set) {
      json['offset'] = offset.toJson();
    }
    return json;
  }

  ListerParcellesParCommuneVariables({
    required this.communeId,
    required this.limit,
    required this.offset,
  });
}

