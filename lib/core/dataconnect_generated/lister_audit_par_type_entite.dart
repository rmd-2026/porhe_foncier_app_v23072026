part of 'porhe_foncier23072026.dart';

class ListerAuditParTypeEntiteVariablesBuilder {
  String typeEntite;

  final FirebaseDataConnect _dataConnect;
  ListerAuditParTypeEntiteVariablesBuilder(this._dataConnect, {required  this.typeEntite,});
  Deserializer<ListerAuditParTypeEntiteData> dataDeserializer = (dynamic json)  => ListerAuditParTypeEntiteData.fromJson(jsonDecode(json));
  Serializer<ListerAuditParTypeEntiteVariables> varsSerializer = (ListerAuditParTypeEntiteVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerAuditParTypeEntiteData, ListerAuditParTypeEntiteVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerAuditParTypeEntiteData, ListerAuditParTypeEntiteVariables> ref() {
    ListerAuditParTypeEntiteVariables vars= ListerAuditParTypeEntiteVariables(typeEntite: typeEntite,);
    return _dataConnect.query("listerAuditParTypeEntite", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerAuditParTypeEntiteJournalAudits {
  final int id;
  final int entiteId;
  final String action;
  final String? motif;
  final String acteurFirebaseUid;
  final int? communeId;
  final Timestamp createdAt;
  ListerAuditParTypeEntiteJournalAudits.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  entiteId = nativeFromJson<int>(json['entiteId']),
  action = nativeFromJson<String>(json['action']),
  motif = json['motif'] == null ? null : nativeFromJson<String>(json['motif']),
  acteurFirebaseUid = nativeFromJson<String>(json['acteurFirebaseUid']),
  communeId = json['communeId'] == null ? null : nativeFromJson<int>(json['communeId']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerAuditParTypeEntiteJournalAudits otherTyped = other as ListerAuditParTypeEntiteJournalAudits;
    return id == otherTyped.id && 
    entiteId == otherTyped.entiteId && 
    action == otherTyped.action && 
    motif == otherTyped.motif && 
    acteurFirebaseUid == otherTyped.acteurFirebaseUid && 
    communeId == otherTyped.communeId && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, entiteId.hashCode, action.hashCode, motif.hashCode, acteurFirebaseUid.hashCode, communeId.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['entiteId'] = nativeToJson<int>(entiteId);
    json['action'] = nativeToJson<String>(action);
    if (motif != null) {
      json['motif'] = nativeToJson<String?>(motif);
    }
    json['acteurFirebaseUid'] = nativeToJson<String>(acteurFirebaseUid);
    if (communeId != null) {
      json['communeId'] = nativeToJson<int?>(communeId);
    }
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListerAuditParTypeEntiteJournalAudits({
    required this.id,
    required this.entiteId,
    required this.action,
    this.motif,
    required this.acteurFirebaseUid,
    this.communeId,
    required this.createdAt,
  });
}

@immutable
class ListerAuditParTypeEntiteData {
  final List<ListerAuditParTypeEntiteJournalAudits> journalAudits;
  ListerAuditParTypeEntiteData.fromJson(dynamic json):
  
  journalAudits = (json['journalAudits'] as List<dynamic>)
        .map((e) => ListerAuditParTypeEntiteJournalAudits.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerAuditParTypeEntiteData otherTyped = other as ListerAuditParTypeEntiteData;
    return journalAudits == otherTyped.journalAudits;
    
  }
  @override
  int get hashCode => journalAudits.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['journalAudits'] = journalAudits.map((e) => e.toJson()).toList();
    return json;
  }

  ListerAuditParTypeEntiteData({
    required this.journalAudits,
  });
}

@immutable
class ListerAuditParTypeEntiteVariables {
  final String typeEntite;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerAuditParTypeEntiteVariables.fromJson(Map<String, dynamic> json):
  
  typeEntite = nativeFromJson<String>(json['typeEntite']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerAuditParTypeEntiteVariables otherTyped = other as ListerAuditParTypeEntiteVariables;
    return typeEntite == otherTyped.typeEntite;
    
  }
  @override
  int get hashCode => typeEntite.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['typeEntite'] = nativeToJson<String>(typeEntite);
    return json;
  }

  ListerAuditParTypeEntiteVariables({
    required this.typeEntite,
  });
}

