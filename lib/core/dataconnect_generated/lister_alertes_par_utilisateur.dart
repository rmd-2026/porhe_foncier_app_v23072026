part of 'porhe_foncier23072026.dart';

class ListerAlertesParUtilisateurVariablesBuilder {
  int utilisateurId;
  Optional<int> _limit = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _offset = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;  ListerAlertesParUtilisateurVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerAlertesParUtilisateurVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ListerAlertesParUtilisateurVariablesBuilder(this._dataConnect, {required  this.utilisateurId,});
  Deserializer<ListerAlertesParUtilisateurData> dataDeserializer = (dynamic json)  => ListerAlertesParUtilisateurData.fromJson(jsonDecode(json));
  Serializer<ListerAlertesParUtilisateurVariables> varsSerializer = (ListerAlertesParUtilisateurVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerAlertesParUtilisateurData, ListerAlertesParUtilisateurVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerAlertesParUtilisateurData, ListerAlertesParUtilisateurVariables> ref() {
    ListerAlertesParUtilisateurVariables vars= ListerAlertesParUtilisateurVariables(utilisateurId: utilisateurId,limit: _limit,offset: _offset,);
    return _dataConnect.query("listerAlertesParUtilisateur", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerAlertesParUtilisateurAlertes {
  final int id;
  final int? parcelleId;
  final EnumValue<TypeAlerte> typeAlerte;
  final String message;
  final bool lue;
  final Timestamp createdAt;
  ListerAlertesParUtilisateurAlertes.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  parcelleId = json['parcelleId'] == null ? null : nativeFromJson<int>(json['parcelleId']),
  typeAlerte = typeAlerteDeserializer(json['typeAlerte']),
  message = nativeFromJson<String>(json['message']),
  lue = nativeFromJson<bool>(json['lue']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerAlertesParUtilisateurAlertes otherTyped = other as ListerAlertesParUtilisateurAlertes;
    return id == otherTyped.id && 
    parcelleId == otherTyped.parcelleId && 
    typeAlerte == otherTyped.typeAlerte && 
    message == otherTyped.message && 
    lue == otherTyped.lue && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, parcelleId.hashCode, typeAlerte.hashCode, message.hashCode, lue.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    if (parcelleId != null) {
      json['parcelleId'] = nativeToJson<int?>(parcelleId);
    }
    json['typeAlerte'] = 
    typeAlerteSerializer(typeAlerte)
    ;
    json['message'] = nativeToJson<String>(message);
    json['lue'] = nativeToJson<bool>(lue);
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListerAlertesParUtilisateurAlertes({
    required this.id,
    this.parcelleId,
    required this.typeAlerte,
    required this.message,
    required this.lue,
    required this.createdAt,
  });
}

@immutable
class ListerAlertesParUtilisateurData {
  final List<ListerAlertesParUtilisateurAlertes> alertes;
  ListerAlertesParUtilisateurData.fromJson(dynamic json):
  
  alertes = (json['alertes'] as List<dynamic>)
        .map((e) => ListerAlertesParUtilisateurAlertes.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerAlertesParUtilisateurData otherTyped = other as ListerAlertesParUtilisateurData;
    return alertes == otherTyped.alertes;
    
  }
  @override
  int get hashCode => alertes.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['alertes'] = alertes.map((e) => e.toJson()).toList();
    return json;
  }

  ListerAlertesParUtilisateurData({
    required this.alertes,
  });
}

@immutable
class ListerAlertesParUtilisateurVariables {
  final int utilisateurId;
  late final Optional<int>limit;
  late final Optional<int>offset;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerAlertesParUtilisateurVariables.fromJson(Map<String, dynamic> json):
  
  utilisateurId = nativeFromJson<int>(json['utilisateurId']) {
  
  
  
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

    final ListerAlertesParUtilisateurVariables otherTyped = other as ListerAlertesParUtilisateurVariables;
    return utilisateurId == otherTyped.utilisateurId && 
    limit == otherTyped.limit && 
    offset == otherTyped.offset;
    
  }
  @override
  int get hashCode => Object.hashAll([utilisateurId.hashCode, limit.hashCode, offset.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    if(limit.state == OptionalState.set) {
      json['limit'] = limit.toJson();
    }
    if(offset.state == OptionalState.set) {
      json['offset'] = offset.toJson();
    }
    return json;
  }

  ListerAlertesParUtilisateurVariables({
    required this.utilisateurId,
    required this.limit,
    required this.offset,
  });
}

