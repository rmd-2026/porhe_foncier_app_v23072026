part of 'porhe_foncier23072026.dart';

class AssignerRoleCommuneVariablesBuilder {
  int utilisateurId;
  NomRole nomRole;
  int communeId;

  final FirebaseDataConnect _dataConnect;
  AssignerRoleCommuneVariablesBuilder(this._dataConnect, {required  this.utilisateurId,required  this.nomRole,required  this.communeId,});
  Deserializer<AssignerRoleCommuneData> dataDeserializer = (dynamic json)  => AssignerRoleCommuneData.fromJson(jsonDecode(json));
  Serializer<AssignerRoleCommuneVariables> varsSerializer = (AssignerRoleCommuneVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<AssignerRoleCommuneData, AssignerRoleCommuneVariables>> execute() {
    return ref().execute();
  }

  MutationRef<AssignerRoleCommuneData, AssignerRoleCommuneVariables> ref() {
    AssignerRoleCommuneVariables vars= AssignerRoleCommuneVariables(utilisateurId: utilisateurId,nomRole: nomRole,communeId: communeId,);
    return _dataConnect.mutation("assignerRoleCommune", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class AssignerRoleCommuneUtilisateurRoleUpsert {
  final int utilisateurId;
  AssignerRoleCommuneUtilisateurRoleUpsert.fromJson(dynamic json):
  
  utilisateurId = nativeFromJson<int>(json['utilisateurId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AssignerRoleCommuneUtilisateurRoleUpsert otherTyped = other as AssignerRoleCommuneUtilisateurRoleUpsert;
    return utilisateurId == otherTyped.utilisateurId;
    
  }
  @override
  int get hashCode => utilisateurId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    return json;
  }

  AssignerRoleCommuneUtilisateurRoleUpsert({
    required this.utilisateurId,
  });
}

@immutable
class AssignerRoleCommuneData {
  final AssignerRoleCommuneUtilisateurRoleUpsert utilisateurRole_upsert;
  AssignerRoleCommuneData.fromJson(dynamic json):
  
  utilisateurRole_upsert = AssignerRoleCommuneUtilisateurRoleUpsert.fromJson(json['utilisateurRole_upsert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AssignerRoleCommuneData otherTyped = other as AssignerRoleCommuneData;
    return utilisateurRole_upsert == otherTyped.utilisateurRole_upsert;
    
  }
  @override
  int get hashCode => utilisateurRole_upsert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateurRole_upsert'] = utilisateurRole_upsert.toJson();
    return json;
  }

  AssignerRoleCommuneData({
    required this.utilisateurRole_upsert,
  });
}

@immutable
class AssignerRoleCommuneVariables {
  final int utilisateurId;
  final NomRole nomRole;
  final int communeId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  AssignerRoleCommuneVariables.fromJson(Map<String, dynamic> json):
  
  utilisateurId = nativeFromJson<int>(json['utilisateurId']),
  nomRole = NomRole.values.byName(json['nomRole']),
  communeId = nativeFromJson<int>(json['communeId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AssignerRoleCommuneVariables otherTyped = other as AssignerRoleCommuneVariables;
    return utilisateurId == otherTyped.utilisateurId && 
    nomRole == otherTyped.nomRole && 
    communeId == otherTyped.communeId;
    
  }
  @override
  int get hashCode => Object.hashAll([utilisateurId.hashCode, nomRole.hashCode, communeId.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    json['nomRole'] = 
    nomRole.name
    ;
    json['communeId'] = nativeToJson<int>(communeId);
    return json;
  }

  AssignerRoleCommuneVariables({
    required this.utilisateurId,
    required this.nomRole,
    required this.communeId,
  });
}

