part of 'porhe_foncier23072026.dart';

class ListerAuditParActeurVariablesBuilder {
  String acteurFirebaseUid;

  final FirebaseDataConnect _dataConnect;
  ListerAuditParActeurVariablesBuilder(this._dataConnect, {required  this.acteurFirebaseUid,});
  Deserializer<ListerAuditParActeurData> dataDeserializer = (dynamic json)  => ListerAuditParActeurData.fromJson(jsonDecode(json));
  Serializer<ListerAuditParActeurVariables> varsSerializer = (ListerAuditParActeurVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerAuditParActeurData, ListerAuditParActeurVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerAuditParActeurData, ListerAuditParActeurVariables> ref() {
    ListerAuditParActeurVariables vars= ListerAuditParActeurVariables(acteurFirebaseUid: acteurFirebaseUid,);
    return _dataConnect.query("listerAuditParActeur", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerAuditParActeurJournalAudits {
  final int id;
  final String typeEntite;
  final int entiteId;
  final String action;
  final String? motif;
  final int? communeId;
  final Timestamp createdAt;
  ListerAuditParActeurJournalAudits.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  typeEntite = nativeFromJson<String>(json['typeEntite']),
  entiteId = nativeFromJson<int>(json['entiteId']),
  action = nativeFromJson<String>(json['action']),
  motif = json['motif'] == null ? null : nativeFromJson<String>(json['motif']),
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

    final ListerAuditParActeurJournalAudits otherTyped = other as ListerAuditParActeurJournalAudits;
    return id == otherTyped.id && 
    typeEntite == otherTyped.typeEntite && 
    entiteId == otherTyped.entiteId && 
    action == otherTyped.action && 
    motif == otherTyped.motif && 
    communeId == otherTyped.communeId && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, typeEntite.hashCode, entiteId.hashCode, action.hashCode, motif.hashCode, communeId.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['typeEntite'] = nativeToJson<String>(typeEntite);
    json['entiteId'] = nativeToJson<int>(entiteId);
    json['action'] = nativeToJson<String>(action);
    if (motif != null) {
      json['motif'] = nativeToJson<String?>(motif);
    }
    if (communeId != null) {
      json['communeId'] = nativeToJson<int?>(communeId);
    }
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListerAuditParActeurJournalAudits({
    required this.id,
    required this.typeEntite,
    required this.entiteId,
    required this.action,
    this.motif,
    this.communeId,
    required this.createdAt,
  });
}

@immutable
class ListerAuditParActeurData {
  final List<ListerAuditParActeurJournalAudits> journalAudits;
  ListerAuditParActeurData.fromJson(dynamic json):
  
  journalAudits = (json['journalAudits'] as List<dynamic>)
        .map((e) => ListerAuditParActeurJournalAudits.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerAuditParActeurData otherTyped = other as ListerAuditParActeurData;
    return journalAudits == otherTyped.journalAudits;
    
  }
  @override
  int get hashCode => journalAudits.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['journalAudits'] = journalAudits.map((e) => e.toJson()).toList();
    return json;
  }

  ListerAuditParActeurData({
    required this.journalAudits,
  });
}

@immutable
class ListerAuditParActeurVariables {
  final String acteurFirebaseUid;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerAuditParActeurVariables.fromJson(Map<String, dynamic> json):
  
  acteurFirebaseUid = nativeFromJson<String>(json['acteurFirebaseUid']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerAuditParActeurVariables otherTyped = other as ListerAuditParActeurVariables;
    return acteurFirebaseUid == otherTyped.acteurFirebaseUid;
    
  }
  @override
  int get hashCode => acteurFirebaseUid.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['acteurFirebaseUid'] = nativeToJson<String>(acteurFirebaseUid);
    return json;
  }

  ListerAuditParActeurVariables({
    required this.acteurFirebaseUid,
  });
}

