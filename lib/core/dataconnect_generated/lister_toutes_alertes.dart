part of 'porhe_foncier23072026.dart';

class ListerToutesAlertesVariablesBuilder {
  Optional<int> _limit = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _offset = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;
  ListerToutesAlertesVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerToutesAlertesVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ListerToutesAlertesVariablesBuilder(this._dataConnect, );
  Deserializer<ListerToutesAlertesData> dataDeserializer = (dynamic json)  => ListerToutesAlertesData.fromJson(jsonDecode(json));
  Serializer<ListerToutesAlertesVariables> varsSerializer = (ListerToutesAlertesVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerToutesAlertesData, ListerToutesAlertesVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerToutesAlertesData, ListerToutesAlertesVariables> ref() {
    ListerToutesAlertesVariables vars= ListerToutesAlertesVariables(limit: _limit,offset: _offset,);
    return _dataConnect.query("listerToutesAlertes", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerToutesAlertesAlertes {
  final int id;
  final int utilisateurId;
  final int? parcelleId;
  final EnumValue<TypeAlerte> typeAlerte;
  final bool lue;
  final Timestamp createdAt;
  ListerToutesAlertesAlertes.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  utilisateurId = nativeFromJson<int>(json['utilisateurId']),
  parcelleId = json['parcelleId'] == null ? null : nativeFromJson<int>(json['parcelleId']),
  typeAlerte = typeAlerteDeserializer(json['typeAlerte']),
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

    final ListerToutesAlertesAlertes otherTyped = other as ListerToutesAlertesAlertes;
    return id == otherTyped.id && 
    utilisateurId == otherTyped.utilisateurId && 
    parcelleId == otherTyped.parcelleId && 
    typeAlerte == otherTyped.typeAlerte && 
    lue == otherTyped.lue && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, utilisateurId.hashCode, parcelleId.hashCode, typeAlerte.hashCode, lue.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    if (parcelleId != null) {
      json['parcelleId'] = nativeToJson<int?>(parcelleId);
    }
    json['typeAlerte'] = 
    typeAlerteSerializer(typeAlerte)
    ;
    json['lue'] = nativeToJson<bool>(lue);
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListerToutesAlertesAlertes({
    required this.id,
    required this.utilisateurId,
    this.parcelleId,
    required this.typeAlerte,
    required this.lue,
    required this.createdAt,
  });
}

@immutable
class ListerToutesAlertesData {
  final List<ListerToutesAlertesAlertes> alertes;
  ListerToutesAlertesData.fromJson(dynamic json):
  
  alertes = (json['alertes'] as List<dynamic>)
        .map((e) => ListerToutesAlertesAlertes.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerToutesAlertesData otherTyped = other as ListerToutesAlertesData;
    return alertes == otherTyped.alertes;
    
  }
  @override
  int get hashCode => alertes.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['alertes'] = alertes.map((e) => e.toJson()).toList();
    return json;
  }

  ListerToutesAlertesData({
    required this.alertes,
  });
}

@immutable
class ListerToutesAlertesVariables {
  late final Optional<int>limit;
  late final Optional<int>offset;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerToutesAlertesVariables.fromJson(Map<String, dynamic> json) {
  
  
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

    final ListerToutesAlertesVariables otherTyped = other as ListerToutesAlertesVariables;
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

  ListerToutesAlertesVariables({
    required this.limit,
    required this.offset,
  });
}

