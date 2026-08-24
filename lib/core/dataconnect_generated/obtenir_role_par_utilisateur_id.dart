part of 'porhe_foncier23072026.dart';

class ObtenirRoleParUtilisateurIdVariablesBuilder {
  int utilisateurId;

  final FirebaseDataConnect _dataConnect;
  ObtenirRoleParUtilisateurIdVariablesBuilder(this._dataConnect, {required  this.utilisateurId,});
  Deserializer<ObtenirRoleParUtilisateurIdData> dataDeserializer = (dynamic json)  => ObtenirRoleParUtilisateurIdData.fromJson(jsonDecode(json));
  Serializer<ObtenirRoleParUtilisateurIdVariables> varsSerializer = (ObtenirRoleParUtilisateurIdVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ObtenirRoleParUtilisateurIdData, ObtenirRoleParUtilisateurIdVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ObtenirRoleParUtilisateurIdData, ObtenirRoleParUtilisateurIdVariables> ref() {
    ObtenirRoleParUtilisateurIdVariables vars= ObtenirRoleParUtilisateurIdVariables(utilisateurId: utilisateurId,);
    return _dataConnect.query("obtenirRoleParUtilisateurId", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ObtenirRoleParUtilisateurIdUtilisateurRole {
  final int id;
  final EnumValue<NomRole> nomRole;
  final int? communeId;
  final Timestamp createdAt;
  final Timestamp updatedAt;
  ObtenirRoleParUtilisateurIdUtilisateurRole.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  nomRole = nomRoleDeserializer(json['nomRole']),
  communeId = json['communeId'] == null ? null : nativeFromJson<int>(json['communeId']),
  createdAt = Timestamp.fromJson(json['createdAt']),
  updatedAt = Timestamp.fromJson(json['updatedAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirRoleParUtilisateurIdUtilisateurRole otherTyped = other as ObtenirRoleParUtilisateurIdUtilisateurRole;
    return id == otherTyped.id && 
    nomRole == otherTyped.nomRole && 
    communeId == otherTyped.communeId && 
    createdAt == otherTyped.createdAt && 
    updatedAt == otherTyped.updatedAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, nomRole.hashCode, communeId.hashCode, createdAt.hashCode, updatedAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['nomRole'] = 
    nomRoleSerializer(nomRole)
    ;
    if (communeId != null) {
      json['communeId'] = nativeToJson<int?>(communeId);
    }
    json['createdAt'] = createdAt.toJson();
    json['updatedAt'] = updatedAt.toJson();
    return json;
  }

  ObtenirRoleParUtilisateurIdUtilisateurRole({
    required this.id,
    required this.nomRole,
    this.communeId,
    required this.createdAt,
    required this.updatedAt,
  });
}

@immutable
class ObtenirRoleParUtilisateurIdData {
  final ObtenirRoleParUtilisateurIdUtilisateurRole? utilisateurRole;
  ObtenirRoleParUtilisateurIdData.fromJson(dynamic json):
  
  utilisateurRole = json['utilisateurRole'] == null ? null : ObtenirRoleParUtilisateurIdUtilisateurRole.fromJson(json['utilisateurRole']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirRoleParUtilisateurIdData otherTyped = other as ObtenirRoleParUtilisateurIdData;
    return utilisateurRole == otherTyped.utilisateurRole;
    
  }
  @override
  int get hashCode => utilisateurRole.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (utilisateurRole != null) {
      json['utilisateurRole'] = utilisateurRole!.toJson();
    }
    return json;
  }

  ObtenirRoleParUtilisateurIdData({
    this.utilisateurRole,
  });
}

@immutable
class ObtenirRoleParUtilisateurIdVariables {
  final int utilisateurId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ObtenirRoleParUtilisateurIdVariables.fromJson(Map<String, dynamic> json):
  
  utilisateurId = nativeFromJson<int>(json['utilisateurId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirRoleParUtilisateurIdVariables otherTyped = other as ObtenirRoleParUtilisateurIdVariables;
    return utilisateurId == otherTyped.utilisateurId;
    
  }
  @override
  int get hashCode => utilisateurId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    return json;
  }

  ObtenirRoleParUtilisateurIdVariables({
    required this.utilisateurId,
  });
}

