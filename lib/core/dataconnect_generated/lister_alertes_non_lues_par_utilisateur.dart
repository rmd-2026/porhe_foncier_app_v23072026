part of 'porhe_foncier23072026.dart';

class ListerAlertesNonLuesParUtilisateurVariablesBuilder {
  int utilisateurId;

  final FirebaseDataConnect _dataConnect;
  ListerAlertesNonLuesParUtilisateurVariablesBuilder(this._dataConnect, {required  this.utilisateurId,});
  Deserializer<ListerAlertesNonLuesParUtilisateurData> dataDeserializer = (dynamic json)  => ListerAlertesNonLuesParUtilisateurData.fromJson(jsonDecode(json));
  Serializer<ListerAlertesNonLuesParUtilisateurVariables> varsSerializer = (ListerAlertesNonLuesParUtilisateurVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerAlertesNonLuesParUtilisateurData, ListerAlertesNonLuesParUtilisateurVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerAlertesNonLuesParUtilisateurData, ListerAlertesNonLuesParUtilisateurVariables> ref() {
    ListerAlertesNonLuesParUtilisateurVariables vars= ListerAlertesNonLuesParUtilisateurVariables(utilisateurId: utilisateurId,);
    return _dataConnect.query("listerAlertesNonLuesParUtilisateur", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerAlertesNonLuesParUtilisateurAlertes {
  final int id;
  final int? parcelleId;
  final EnumValue<TypeAlerte> typeAlerte;
  final String message;
  final Timestamp createdAt;
  ListerAlertesNonLuesParUtilisateurAlertes.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  parcelleId = json['parcelleId'] == null ? null : nativeFromJson<int>(json['parcelleId']),
  typeAlerte = typeAlerteDeserializer(json['typeAlerte']),
  message = nativeFromJson<String>(json['message']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerAlertesNonLuesParUtilisateurAlertes otherTyped = other as ListerAlertesNonLuesParUtilisateurAlertes;
    return id == otherTyped.id && 
    parcelleId == otherTyped.parcelleId && 
    typeAlerte == otherTyped.typeAlerte && 
    message == otherTyped.message && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, parcelleId.hashCode, typeAlerte.hashCode, message.hashCode, createdAt.hashCode]);
  

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
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListerAlertesNonLuesParUtilisateurAlertes({
    required this.id,
    this.parcelleId,
    required this.typeAlerte,
    required this.message,
    required this.createdAt,
  });
}

@immutable
class ListerAlertesNonLuesParUtilisateurData {
  final List<ListerAlertesNonLuesParUtilisateurAlertes> alertes;
  ListerAlertesNonLuesParUtilisateurData.fromJson(dynamic json):
  
  alertes = (json['alertes'] as List<dynamic>)
        .map((e) => ListerAlertesNonLuesParUtilisateurAlertes.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerAlertesNonLuesParUtilisateurData otherTyped = other as ListerAlertesNonLuesParUtilisateurData;
    return alertes == otherTyped.alertes;
    
  }
  @override
  int get hashCode => alertes.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['alertes'] = alertes.map((e) => e.toJson()).toList();
    return json;
  }

  ListerAlertesNonLuesParUtilisateurData({
    required this.alertes,
  });
}

@immutable
class ListerAlertesNonLuesParUtilisateurVariables {
  final int utilisateurId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerAlertesNonLuesParUtilisateurVariables.fromJson(Map<String, dynamic> json):
  
  utilisateurId = nativeFromJson<int>(json['utilisateurId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerAlertesNonLuesParUtilisateurVariables otherTyped = other as ListerAlertesNonLuesParUtilisateurVariables;
    return utilisateurId == otherTyped.utilisateurId;
    
  }
  @override
  int get hashCode => utilisateurId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    return json;
  }

  ListerAlertesNonLuesParUtilisateurVariables({
    required this.utilisateurId,
  });
}

