part of 'porhe_foncier23072026.dart';

class ListerAuditToutesVariablesBuilder {
  Optional<int> _limit = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _offset = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;
  ListerAuditToutesVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerAuditToutesVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ListerAuditToutesVariablesBuilder(this._dataConnect, );
  Deserializer<ListerAuditToutesData> dataDeserializer = (dynamic json)  => ListerAuditToutesData.fromJson(jsonDecode(json));
  Serializer<ListerAuditToutesVariables> varsSerializer = (ListerAuditToutesVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerAuditToutesData, ListerAuditToutesVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerAuditToutesData, ListerAuditToutesVariables> ref() {
    ListerAuditToutesVariables vars= ListerAuditToutesVariables(limit: _limit,offset: _offset,);
    return _dataConnect.query("listerAuditToutes", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerAuditToutesJournalAudits {
  final int id;
  final String typeEntite;
  final int entiteId;
  final String action;
  final String? motif;
  final String acteurFirebaseUid;
  final int? communeId;
  final String? donneesAvant;
  final String? donneesApres;
  final Timestamp createdAt;
  ListerAuditToutesJournalAudits.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  typeEntite = nativeFromJson<String>(json['typeEntite']),
  entiteId = nativeFromJson<int>(json['entiteId']),
  action = nativeFromJson<String>(json['action']),
  motif = json['motif'] == null ? null : nativeFromJson<String>(json['motif']),
  acteurFirebaseUid = nativeFromJson<String>(json['acteurFirebaseUid']),
  communeId = json['communeId'] == null ? null : nativeFromJson<int>(json['communeId']),
  donneesAvant = json['donneesAvant'] == null ? null : nativeFromJson<String>(json['donneesAvant']),
  donneesApres = json['donneesApres'] == null ? null : nativeFromJson<String>(json['donneesApres']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerAuditToutesJournalAudits otherTyped = other as ListerAuditToutesJournalAudits;
    return id == otherTyped.id && 
    typeEntite == otherTyped.typeEntite && 
    entiteId == otherTyped.entiteId && 
    action == otherTyped.action && 
    motif == otherTyped.motif && 
    acteurFirebaseUid == otherTyped.acteurFirebaseUid && 
    communeId == otherTyped.communeId && 
    donneesAvant == otherTyped.donneesAvant && 
    donneesApres == otherTyped.donneesApres && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, typeEntite.hashCode, entiteId.hashCode, action.hashCode, motif.hashCode, acteurFirebaseUid.hashCode, communeId.hashCode, donneesAvant.hashCode, donneesApres.hashCode, createdAt.hashCode]);
  

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
    if (donneesApres != null) {
      json['donneesApres'] = nativeToJson<String?>(donneesApres);
    }
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListerAuditToutesJournalAudits({
    required this.id,
    required this.typeEntite,
    required this.entiteId,
    required this.action,
    this.motif,
    required this.acteurFirebaseUid,
    this.communeId,
    this.donneesAvant,
    this.donneesApres,
    required this.createdAt,
  });
}

@immutable
class ListerAuditToutesData {
  final List<ListerAuditToutesJournalAudits> journalAudits;
  ListerAuditToutesData.fromJson(dynamic json):
  
  journalAudits = (json['journalAudits'] as List<dynamic>)
        .map((e) => ListerAuditToutesJournalAudits.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerAuditToutesData otherTyped = other as ListerAuditToutesData;
    return journalAudits == otherTyped.journalAudits;
    
  }
  @override
  int get hashCode => journalAudits.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['journalAudits'] = journalAudits.map((e) => e.toJson()).toList();
    return json;
  }

  ListerAuditToutesData({
    required this.journalAudits,
  });
}

@immutable
class ListerAuditToutesVariables {
  late final Optional<int>limit;
  late final Optional<int>offset;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerAuditToutesVariables.fromJson(Map<String, dynamic> json) {
  
  
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

    final ListerAuditToutesVariables otherTyped = other as ListerAuditToutesVariables;
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

  ListerAuditToutesVariables({
    required this.limit,
    required this.offset,
  });
}

