part of 'porhe_foncier23072026.dart';

class AssignerRoleGlobalVariablesBuilder {
  int utilisateurId;
  NomRole nomRole;

  final FirebaseDataConnect _dataConnect;
  AssignerRoleGlobalVariablesBuilder(this._dataConnect, {required  this.utilisateurId,required  this.nomRole,});
  Deserializer<AssignerRoleGlobalData> dataDeserializer = (dynamic json)  => AssignerRoleGlobalData.fromJson(jsonDecode(json));
  Serializer<AssignerRoleGlobalVariables> varsSerializer = (AssignerRoleGlobalVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<AssignerRoleGlobalData, AssignerRoleGlobalVariables>> execute() {
    return ref().execute();
  }

  MutationRef<AssignerRoleGlobalData, AssignerRoleGlobalVariables> ref() {
    AssignerRoleGlobalVariables vars= AssignerRoleGlobalVariables(utilisateurId: utilisateurId,nomRole: nomRole,);
    return _dataConnect.mutation("assignerRoleGlobal", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class AssignerRoleGlobalUtilisateurRoleUpsert {
  final int utilisateurId;
  AssignerRoleGlobalUtilisateurRoleUpsert.fromJson(dynamic json):
  
  utilisateurId = nativeFromJson<int>(json['utilisateurId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AssignerRoleGlobalUtilisateurRoleUpsert otherTyped = other as AssignerRoleGlobalUtilisateurRoleUpsert;
    return utilisateurId == otherTyped.utilisateurId;
    
  }
  @override
  int get hashCode => utilisateurId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    return json;
  }

  AssignerRoleGlobalUtilisateurRoleUpsert({
    required this.utilisateurId,
  });
}

@immutable
class AssignerRoleGlobalData {
  final AssignerRoleGlobalUtilisateurRoleUpsert utilisateurRole_upsert;
  AssignerRoleGlobalData.fromJson(dynamic json):
  
  utilisateurRole_upsert = AssignerRoleGlobalUtilisateurRoleUpsert.fromJson(json['utilisateurRole_upsert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AssignerRoleGlobalData otherTyped = other as AssignerRoleGlobalData;
    return utilisateurRole_upsert == otherTyped.utilisateurRole_upsert;
    
  }
  @override
  int get hashCode => utilisateurRole_upsert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateurRole_upsert'] = utilisateurRole_upsert.toJson();
    return json;
  }

  AssignerRoleGlobalData({
    required this.utilisateurRole_upsert,
  });
}

@immutable
class AssignerRoleGlobalVariables {
  final int utilisateurId;
  final NomRole nomRole;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  AssignerRoleGlobalVariables.fromJson(Map<String, dynamic> json):
  
  utilisateurId = nativeFromJson<int>(json['utilisateurId']),
  nomRole = NomRole.values.byName(json['nomRole']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AssignerRoleGlobalVariables otherTyped = other as AssignerRoleGlobalVariables;
    return utilisateurId == otherTyped.utilisateurId && 
    nomRole == otherTyped.nomRole;
    
  }
  @override
  int get hashCode => Object.hashAll([utilisateurId.hashCode, nomRole.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    json['nomRole'] = 
    nomRole.name
    ;
    return json;
  }

  AssignerRoleGlobalVariables({
    required this.utilisateurId,
    required this.nomRole,
  });
}

