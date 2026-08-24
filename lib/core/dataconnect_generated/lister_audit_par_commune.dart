part of 'porhe_foncier23072026.dart';

class ListerAuditParCommuneVariablesBuilder {
  int communeId;

  final FirebaseDataConnect _dataConnect;
  ListerAuditParCommuneVariablesBuilder(this._dataConnect, {required  this.communeId,});
  Deserializer<ListerAuditParCommuneData> dataDeserializer = (dynamic json)  => ListerAuditParCommuneData.fromJson(jsonDecode(json));
  Serializer<ListerAuditParCommuneVariables> varsSerializer = (ListerAuditParCommuneVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerAuditParCommuneData, ListerAuditParCommuneVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerAuditParCommuneData, ListerAuditParCommuneVariables> ref() {
    ListerAuditParCommuneVariables vars= ListerAuditParCommuneVariables(communeId: communeId,);
    return _dataConnect.query("listerAuditParCommune", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerAuditParCommuneJournalAudits {
  final int id;
  final String typeEntite;
  final int entiteId;
  final String action;
  final String? motif;
  final String acteurFirebaseUid;
  final String? donneesAvant;
  final String? donneesApres;
  final Timestamp createdAt;
  ListerAuditParCommuneJournalAudits.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  typeEntite = nativeFromJson<String>(json['typeEntite']),
  entiteId = nativeFromJson<int>(json['entiteId']),
  action = nativeFromJson<String>(json['action']),
  motif = json['motif'] == null ? null : nativeFromJson<String>(json['motif']),
  acteurFirebaseUid = nativeFromJson<String>(json['acteurFirebaseUid']),
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

    final ListerAuditParCommuneJournalAudits otherTyped = other as ListerAuditParCommuneJournalAudits;
    return id == otherTyped.id && 
    typeEntite == otherTyped.typeEntite && 
    entiteId == otherTyped.entiteId && 
    action == otherTyped.action && 
    motif == otherTyped.motif && 
    acteurFirebaseUid == otherTyped.acteurFirebaseUid && 
    donneesAvant == otherTyped.donneesAvant && 
    donneesApres == otherTyped.donneesApres && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, typeEntite.hashCode, entiteId.hashCode, action.hashCode, motif.hashCode, acteurFirebaseUid.hashCode, donneesAvant.hashCode, donneesApres.hashCode, createdAt.hashCode]);
  

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
    if (donneesAvant != null) {
      json['donneesAvant'] = nativeToJson<String?>(donneesAvant);
    }
    if (donneesApres != null) {
      json['donneesApres'] = nativeToJson<String?>(donneesApres);
    }
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListerAuditParCommuneJournalAudits({
    required this.id,
    required this.typeEntite,
    required this.entiteId,
    required this.action,
    this.motif,
    required this.acteurFirebaseUid,
    this.donneesAvant,
    this.donneesApres,
    required this.createdAt,
  });
}

@immutable
class ListerAuditParCommuneData {
  final List<ListerAuditParCommuneJournalAudits> journalAudits;
  ListerAuditParCommuneData.fromJson(dynamic json):
  
  journalAudits = (json['journalAudits'] as List<dynamic>)
        .map((e) => ListerAuditParCommuneJournalAudits.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerAuditParCommuneData otherTyped = other as ListerAuditParCommuneData;
    return journalAudits == otherTyped.journalAudits;
    
  }
  @override
  int get hashCode => journalAudits.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['journalAudits'] = journalAudits.map((e) => e.toJson()).toList();
    return json;
  }

  ListerAuditParCommuneData({
    required this.journalAudits,
  });
}

@immutable
class ListerAuditParCommuneVariables {
  final int communeId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerAuditParCommuneVariables.fromJson(Map<String, dynamic> json):
  
  communeId = nativeFromJson<int>(json['communeId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerAuditParCommuneVariables otherTyped = other as ListerAuditParCommuneVariables;
    return communeId == otherTyped.communeId;
    
  }
  @override
  int get hashCode => communeId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['communeId'] = nativeToJson<int>(communeId);
    return json;
  }

  ListerAuditParCommuneVariables({
    required this.communeId,
  });
}

