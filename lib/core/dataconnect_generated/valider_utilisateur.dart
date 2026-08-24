part of 'porhe_foncier23072026.dart';

class ValiderUtilisateurVariablesBuilder {
  String firebaseUid;

  final FirebaseDataConnect _dataConnect;
  ValiderUtilisateurVariablesBuilder(this._dataConnect, {required  this.firebaseUid,});
  Deserializer<ValiderUtilisateurData> dataDeserializer = (dynamic json)  => ValiderUtilisateurData.fromJson(jsonDecode(json));
  Serializer<ValiderUtilisateurVariables> varsSerializer = (ValiderUtilisateurVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<ValiderUtilisateurData, ValiderUtilisateurVariables>> execute() {
    return ref().execute();
  }

  MutationRef<ValiderUtilisateurData, ValiderUtilisateurVariables> ref() {
    ValiderUtilisateurVariables vars= ValiderUtilisateurVariables(firebaseUid: firebaseUid,);
    return _dataConnect.mutation("validerUtilisateur", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ValiderUtilisateurUtilisateurUpdate {
  final String firebaseUid;
  ValiderUtilisateurUtilisateurUpdate.fromJson(dynamic json):
  
  firebaseUid = nativeFromJson<String>(json['firebaseUid']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ValiderUtilisateurUtilisateurUpdate otherTyped = other as ValiderUtilisateurUtilisateurUpdate;
    return firebaseUid == otherTyped.firebaseUid;
    
  }
  @override
  int get hashCode => firebaseUid.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['firebaseUid'] = nativeToJson<String>(firebaseUid);
    return json;
  }

  ValiderUtilisateurUtilisateurUpdate({
    required this.firebaseUid,
  });
}

@immutable
class ValiderUtilisateurData {
  final ValiderUtilisateurUtilisateurUpdate? utilisateur_update;
  ValiderUtilisateurData.fromJson(dynamic json):
  
  utilisateur_update = json['utilisateur_update'] == null ? null : ValiderUtilisateurUtilisateurUpdate.fromJson(json['utilisateur_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ValiderUtilisateurData otherTyped = other as ValiderUtilisateurData;
    return utilisateur_update == otherTyped.utilisateur_update;
    
  }
  @override
  int get hashCode => utilisateur_update.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (utilisateur_update != null) {
      json['utilisateur_update'] = utilisateur_update!.toJson();
    }
    return json;
  }

  ValiderUtilisateurData({
    this.utilisateur_update,
  });
}

@immutable
class ValiderUtilisateurVariables {
  final String firebaseUid;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ValiderUtilisateurVariables.fromJson(Map<String, dynamic> json):
  
  firebaseUid = nativeFromJson<String>(json['firebaseUid']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ValiderUtilisateurVariables otherTyped = other as ValiderUtilisateurVariables;
    return firebaseUid == otherTyped.firebaseUid;
    
  }
  @override
  int get hashCode => firebaseUid.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['firebaseUid'] = nativeToJson<String>(firebaseUid);
    return json;
  }

  ValiderUtilisateurVariables({
    required this.firebaseUid,
  });
}

