part of 'porhe_foncier23072026.dart';

class ListerHistoriqueRejetsEtSuppressionsVariablesBuilder {
  Optional<int> _communeId = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _limit = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _offset = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;
  ListerHistoriqueRejetsEtSuppressionsVariablesBuilder communeId(int? t) {
   _communeId.value = t;
   return this;
  }
  ListerHistoriqueRejetsEtSuppressionsVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerHistoriqueRejetsEtSuppressionsVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ListerHistoriqueRejetsEtSuppressionsVariablesBuilder(this._dataConnect, );
  Deserializer<ListerHistoriqueRejetsEtSuppressionsData> dataDeserializer = (dynamic json)  => ListerHistoriqueRejetsEtSuppressionsData.fromJson(jsonDecode(json));
  Serializer<ListerHistoriqueRejetsEtSuppressionsVariables> varsSerializer = (ListerHistoriqueRejetsEtSuppressionsVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerHistoriqueRejetsEtSuppressionsData, ListerHistoriqueRejetsEtSuppressionsVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerHistoriqueRejetsEtSuppressionsData, ListerHistoriqueRejetsEtSuppressionsVariables> ref() {
    ListerHistoriqueRejetsEtSuppressionsVariables vars= ListerHistoriqueRejetsEtSuppressionsVariables(communeId: _communeId,limit: _limit,offset: _offset,);
    return _dataConnect.query("listerHistoriqueRejetsEtSuppressions", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerHistoriqueRejetsEtSuppressionsJournalAudits {
  final int id;
  final String typeEntite;
  final int entiteId;
  final String action;
  final String? motif;
  final String acteurFirebaseUid;
  final int? communeId;
  final String? donneesAvant;
  final Timestamp createdAt;
  ListerHistoriqueRejetsEtSuppressionsJournalAudits.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  typeEntite = nativeFromJson<String>(json['typeEntite']),
  entiteId = nativeFromJson<int>(json['entiteId']),
  action = nativeFromJson<String>(json['action']),
  motif = json['motif'] == null ? null : nativeFromJson<String>(json['motif']),
  acteurFirebaseUid = nativeFromJson<String>(json['acteurFirebaseUid']),
  communeId = json['communeId'] == null ? null : nativeFromJson<int>(json['communeId']),
  donneesAvant = json['donneesAvant'] == null ? null : nativeFromJson<String>(json['donneesAvant']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerHistoriqueRejetsEtSuppressionsJournalAudits otherTyped = other as ListerHistoriqueRejetsEtSuppressionsJournalAudits;
    return id == otherTyped.id && 
    typeEntite == otherTyped.typeEntite && 
    entiteId == otherTyped.entiteId && 
    action == otherTyped.action && 
    motif == otherTyped.motif && 
    acteurFirebaseUid == otherTyped.acteurFirebaseUid && 
    communeId == otherTyped.communeId && 
    donneesAvant == otherTyped.donneesAvant && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, typeEntite.hashCode, entiteId.hashCode, action.hashCode, motif.hashCode, acteurFirebaseUid.hashCode, communeId.hashCode, donneesAvant.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['typeEntite'] = nativeToJson<String>(typeEntite);
    json['entiteId'] = nativeToJson<int>(entiteId);
    json['action'] = nativeToJson<String>(action);
    if (motif != null) {
      json['motif'] = nativeToJson<String?>(motif);
    }
    json['acteurFirebaseUid'] = nativeToJson<String>(acteurFirebaseUid);
    if (communeId != null) {
      json['communeId'] = nativeToJson<int?>(communeId);
    }
    if (donneesAvant != null) {
      json['donneesAvant'] = nativeToJson<String?>(donneesAvant);
    }
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListerHistoriqueRejetsEtSuppressionsJournalAudits({
    required this.id,
    required this.typeEntite,
    required this.entiteId,
    required this.action,
    this.motif,
    required this.acteurFirebaseUid,
    this.communeId,
    this.donneesAvant,
    required this.createdAt,
  });
}

@immutable
class ListerHistoriqueRejetsEtSuppressionsData {
  final List<ListerHistoriqueRejetsEtSuppressionsJournalAudits> journalAudits;
  ListerHistoriqueRejetsEtSuppressionsData.fromJson(dynamic json):
  
  journalAudits = (json['journalAudits'] as List<dynamic>)
        .map((e) => ListerHistoriqueRejetsEtSuppressionsJournalAudits.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerHistoriqueRejetsEtSuppressionsData otherTyped = other as ListerHistoriqueRejetsEtSuppressionsData;
    return journalAudits == otherTyped.journalAudits;
    
  }
  @override
  int get hashCode => journalAudits.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['journalAudits'] = journalAudits.map((e) => e.toJson()).toList();
    return json;
  }

  ListerHistoriqueRejetsEtSuppressionsData({
    required this.journalAudits,
  });
}

@immutable
class ListerHistoriqueRejetsEtSuppressionsVariables {
  late final Optional<int>communeId;
  late final Optional<int>limit;
  late final Optional<int>offset;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerHistoriqueRejetsEtSuppressionsVariables.fromJson(Map<String, dynamic> json) {
  
  
    communeId = Optional.optional(nativeFromJson, nativeToJson);
    communeId.value = json['communeId'] == null ? null : nativeFromJson<int>(json['communeId']);
  
  
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

    final ListerHistoriqueRejetsEtSuppressionsVariables otherTyped = other as ListerHistoriqueRejetsEtSuppressionsVariables;
    return communeId == otherTyped.communeId && 
    limit == otherTyped.limit && 
    offset == otherTyped.offset;
    
  }
  @override
  int get hashCode => Object.hashAll([communeId.hashCode, limit.hashCode, offset.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if(communeId.state == OptionalState.set) {
      json['communeId'] = communeId.toJson();
    }
    if(limit.state == OptionalState.set) {
      json['limit'] = limit.toJson();
    }
    if(offset.state == OptionalState.set) {
      json['offset'] = offset.toJson();
    }
    return json;
  }

  ListerHistoriqueRejetsEtSuppressionsVariables({
    required this.communeId,
    required this.limit,
    required this.offset,
  });
}

