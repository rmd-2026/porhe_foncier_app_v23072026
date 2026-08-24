part of 'porhe_foncier23072026.dart';

class EnregistrerAuditVariablesBuilder {
  String typeEntite;
  int entiteId;
  String action;
  String acteurFirebaseUid;
  Optional<String> _motif = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _communeId = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _donneesAvant = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _donneesApres = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;  EnregistrerAuditVariablesBuilder motif(String? t) {
   _motif.value = t;
   return this;
  }
  EnregistrerAuditVariablesBuilder communeId(int? t) {
   _communeId.value = t;
   return this;
  }
  EnregistrerAuditVariablesBuilder donneesAvant(String? t) {
   _donneesAvant.value = t;
   return this;
  }
  EnregistrerAuditVariablesBuilder donneesApres(String? t) {
   _donneesApres.value = t;
   return this;
  }

  EnregistrerAuditVariablesBuilder(this._dataConnect, {required  this.typeEntite,required  this.entiteId,required  this.action,required  this.acteurFirebaseUid,});
  Deserializer<EnregistrerAuditData> dataDeserializer = (dynamic json)  => EnregistrerAuditData.fromJson(jsonDecode(json));
  Serializer<EnregistrerAuditVariables> varsSerializer = (EnregistrerAuditVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<EnregistrerAuditData, EnregistrerAuditVariables>> execute() {
    return ref().execute();
  }

  MutationRef<EnregistrerAuditData, EnregistrerAuditVariables> ref() {
    EnregistrerAuditVariables vars= EnregistrerAuditVariables(typeEntite: typeEntite,entiteId: entiteId,action: action,acteurFirebaseUid: acteurFirebaseUid,motif: _motif,communeId: _communeId,donneesAvant: _donneesAvant,donneesApres: _donneesApres,);
    return _dataConnect.mutation("enregistrerAudit", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class EnregistrerAuditJournalAuditInsert {
  final int id;
  EnregistrerAuditJournalAuditInsert.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final EnregistrerAuditJournalAuditInsert otherTyped = other as EnregistrerAuditJournalAuditInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  EnregistrerAuditJournalAuditInsert({
    required this.id,
  });
}

@immutable
class EnregistrerAuditData {
  final EnregistrerAuditJournalAuditInsert journalAudit_insert;
  EnregistrerAuditData.fromJson(dynamic json):
  
  journalAudit_insert = EnregistrerAuditJournalAuditInsert.fromJson(json['journalAudit_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final EnregistrerAuditData otherTyped = other as EnregistrerAuditData;
    return journalAudit_insert == otherTyped.journalAudit_insert;
    
  }
  @override
  int get hashCode => journalAudit_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['journalAudit_insert'] = journalAudit_insert.toJson();
    return json;
  }

  EnregistrerAuditData({
    required this.journalAudit_insert,
  });
}

@immutable
class EnregistrerAuditVariables {
  final String typeEntite;
  final int entiteId;
  final String action;
  final String acteurFirebaseUid;
  late final Optional<String>motif;
  late final Optional<int>communeId;
  late final Optional<String>donneesAvant;
  late final Optional<String>donneesApres;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  EnregistrerAuditVariables.fromJson(Map<String, dynamic> json):
  
  typeEntite = nativeFromJson<String>(json['typeEntite']),
  entiteId = nativeFromJson<int>(json['entiteId']),
  action = nativeFromJson<String>(json['action']),
  acteurFirebaseUid = nativeFromJson<String>(json['acteurFirebaseUid']) {
  
  
  
  
  
  
    motif = Optional.optional(nativeFromJson, nativeToJson);
    motif.value = json['motif'] == null ? null : nativeFromJson<String>(json['motif']);
  
  
    communeId = Optional.optional(nativeFromJson, nativeToJson);
    communeId.value = json['communeId'] == null ? null : nativeFromJson<int>(json['communeId']);
  
  
    donneesAvant = Optional.optional(nativeFromJson, nativeToJson);
    donneesAvant.value = json['donneesAvant'] == null ? null : nativeFromJson<String>(json['donneesAvant']);
  
  
    donneesApres = Optional.optional(nativeFromJson, nativeToJson);
    donneesApres.value = json['donneesApres'] == null ? null : nativeFromJson<String>(json['donneesApres']);
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final EnregistrerAuditVariables otherTyped = other as EnregistrerAuditVariables;
    return typeEntite == otherTyped.typeEntite && 
    entiteId == otherTyped.entiteId && 
    action == otherTyped.action && 
    acteurFirebaseUid == otherTyped.acteurFirebaseUid && 
    motif == otherTyped.motif && 
    communeId == otherTyped.communeId && 
    donneesAvant == otherTyped.donneesAvant && 
    donneesApres == otherTyped.donneesApres;
    
  }
  @override
  int get hashCode => Object.hashAll([typeEntite.hashCode, entiteId.hashCode, action.hashCode, acteurFirebaseUid.hashCode, motif.hashCode, communeId.hashCode, donneesAvant.hashCode, donneesApres.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['typeEntite'] = nativeToJson<String>(typeEntite);
    json['entiteId'] = nativeToJson<int>(entiteId);
    json['action'] = nativeToJson<String>(action);
    json['acteurFirebaseUid'] = nativeToJson<String>(acteurFirebaseUid);
    if(motif.state == OptionalState.set) {
      json['motif'] = motif.toJson();
    }
    if(communeId.state == OptionalState.set) {
      json['communeId'] = communeId.toJson();
    }
    if(donneesAvant.state == OptionalState.set) {
      json['donneesAvant'] = donneesAvant.toJson();
    }
    if(donneesApres.state == OptionalState.set) {
      json['donneesApres'] = donneesApres.toJson();
    }
    return json;
  }

  EnregistrerAuditVariables({
    required this.typeEntite,
    required this.entiteId,
    required this.action,
    required this.acteurFirebaseUid,
    required this.motif,
    required this.communeId,
    required this.donneesAvant,
    required this.donneesApres,
  });
}

