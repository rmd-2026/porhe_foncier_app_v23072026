part of 'porhe_foncier23072026.dart';

class VerifierAppartenanceCommuneVariablesBuilder {
  int utilisateurId;
  int communeId;

  final FirebaseDataConnect _dataConnect;
  VerifierAppartenanceCommuneVariablesBuilder(this._dataConnect, {required  this.utilisateurId,required  this.communeId,});
  Deserializer<VerifierAppartenanceCommuneData> dataDeserializer = (dynamic json)  => VerifierAppartenanceCommuneData.fromJson(jsonDecode(json));
  Serializer<VerifierAppartenanceCommuneVariables> varsSerializer = (VerifierAppartenanceCommuneVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<VerifierAppartenanceCommuneData, VerifierAppartenanceCommuneVariables>> execute() {
    return ref().execute();
  }

  QueryRef<VerifierAppartenanceCommuneData, VerifierAppartenanceCommuneVariables> ref() {
    VerifierAppartenanceCommuneVariables vars= VerifierAppartenanceCommuneVariables(utilisateurId: utilisateurId,communeId: communeId,);
    return _dataConnect.query("verifierAppartenanceCommune", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class VerifierAppartenanceCommuneUtilisateurRoles {
  final EnumValue<NomRole> nomRole;
  final int? communeId;
  VerifierAppartenanceCommuneUtilisateurRoles.fromJson(dynamic json):
  
  nomRole = nomRoleDeserializer(json['nomRole']),
  communeId = json['communeId'] == null ? null : nativeFromJson<int>(json['communeId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final VerifierAppartenanceCommuneUtilisateurRoles otherTyped = other as VerifierAppartenanceCommuneUtilisateurRoles;
    return nomRole == otherTyped.nomRole && 
    communeId == otherTyped.communeId;
    
  }
  @override
  int get hashCode => Object.hashAll([nomRole.hashCode, communeId.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['nomRole'] = 
    nomRoleSerializer(nomRole)
    ;
    if (communeId != null) {
      json['communeId'] = nativeToJson<int?>(communeId);
    }
    return json;
  }

  VerifierAppartenanceCommuneUtilisateurRoles({
    required this.nomRole,
    this.communeId,
  });
}

@immutable
class VerifierAppartenanceCommuneData {
  final List<VerifierAppartenanceCommuneUtilisateurRoles> utilisateurRoles;
  VerifierAppartenanceCommuneData.fromJson(dynamic json):
  
  utilisateurRoles = (json['utilisateurRoles'] as List<dynamic>)
        .map((e) => VerifierAppartenanceCommuneUtilisateurRoles.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final VerifierAppartenanceCommuneData otherTyped = other as VerifierAppartenanceCommuneData;
    return utilisateurRoles == otherTyped.utilisateurRoles;
    
  }
  @override
  int get hashCode => utilisateurRoles.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateurRoles'] = utilisateurRoles.map((e) => e.toJson()).toList();
    return json;
  }

  VerifierAppartenanceCommuneData({
    required this.utilisateurRoles,
  });
}

@immutable
class VerifierAppartenanceCommuneVariables {
  final int utilisateurId;
  final int communeId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  VerifierAppartenanceCommuneVariables.fromJson(Map<String, dynamic> json):
  
  utilisateurId = nativeFromJson<int>(json['utilisateurId']),
  communeId = nativeFromJson<int>(json['communeId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final VerifierAppartenanceCommuneVariables otherTyped = other as VerifierAppartenanceCommuneVariables;
    return utilisateurId == otherTyped.utilisateurId && 
    communeId == otherTyped.communeId;
    
  }
  @override
  int get hashCode => Object.hashAll([utilisateurId.hashCode, communeId.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    json['communeId'] = nativeToJson<int>(communeId);
    return json;
  }

  VerifierAppartenanceCommuneVariables({
    required this.utilisateurId,
    required this.communeId,
  });
}

