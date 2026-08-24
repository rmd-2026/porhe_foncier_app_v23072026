part of 'porhe_foncier23072026.dart';

class AssignerRoleUtilisateurParDefautVariablesBuilder {
  int utilisateurId;

  final FirebaseDataConnect _dataConnect;
  AssignerRoleUtilisateurParDefautVariablesBuilder(this._dataConnect, {required  this.utilisateurId,});
  Deserializer<AssignerRoleUtilisateurParDefautData> dataDeserializer = (dynamic json)  => AssignerRoleUtilisateurParDefautData.fromJson(jsonDecode(json));
  Serializer<AssignerRoleUtilisateurParDefautVariables> varsSerializer = (AssignerRoleUtilisateurParDefautVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<AssignerRoleUtilisateurParDefautData, AssignerRoleUtilisateurParDefautVariables>> execute() {
    return ref().execute();
  }

  MutationRef<AssignerRoleUtilisateurParDefautData, AssignerRoleUtilisateurParDefautVariables> ref() {
    AssignerRoleUtilisateurParDefautVariables vars= AssignerRoleUtilisateurParDefautVariables(utilisateurId: utilisateurId,);
    return _dataConnect.mutation("assignerRoleUtilisateurParDefaut", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class AssignerRoleUtilisateurParDefautUtilisateurRoleUpsert {
  final int utilisateurId;
  AssignerRoleUtilisateurParDefautUtilisateurRoleUpsert.fromJson(dynamic json):
  
  utilisateurId = nativeFromJson<int>(json['utilisateurId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AssignerRoleUtilisateurParDefautUtilisateurRoleUpsert otherTyped = other as AssignerRoleUtilisateurParDefautUtilisateurRoleUpsert;
    return utilisateurId == otherTyped.utilisateurId;
    
  }
  @override
  int get hashCode => utilisateurId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    return json;
  }

  AssignerRoleUtilisateurParDefautUtilisateurRoleUpsert({
    required this.utilisateurId,
  });
}

@immutable
class AssignerRoleUtilisateurParDefautData {
  final AssignerRoleUtilisateurParDefautUtilisateurRoleUpsert utilisateurRole_upsert;
  AssignerRoleUtilisateurParDefautData.fromJson(dynamic json):
  
  utilisateurRole_upsert = AssignerRoleUtilisateurParDefautUtilisateurRoleUpsert.fromJson(json['utilisateurRole_upsert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AssignerRoleUtilisateurParDefautData otherTyped = other as AssignerRoleUtilisateurParDefautData;
    return utilisateurRole_upsert == otherTyped.utilisateurRole_upsert;
    
  }
  @override
  int get hashCode => utilisateurRole_upsert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateurRole_upsert'] = utilisateurRole_upsert.toJson();
    return json;
  }

  AssignerRoleUtilisateurParDefautData({
    required this.utilisateurRole_upsert,
  });
}

@immutable
class AssignerRoleUtilisateurParDefautVariables {
  final int utilisateurId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  AssignerRoleUtilisateurParDefautVariables.fromJson(Map<String, dynamic> json):
  
  utilisateurId = nativeFromJson<int>(json['utilisateurId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AssignerRoleUtilisateurParDefautVariables otherTyped = other as AssignerRoleUtilisateurParDefautVariables;
    return utilisateurId == otherTyped.utilisateurId;
    
  }
  @override
  int get hashCode => utilisateurId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    return json;
  }

  AssignerRoleUtilisateurParDefautVariables({
    required this.utilisateurId,
  });
}

