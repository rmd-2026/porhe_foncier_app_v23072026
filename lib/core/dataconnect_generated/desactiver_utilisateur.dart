part of 'porhe_foncier23072026.dart';

class DesactiverUtilisateurVariablesBuilder {
  String firebaseUid;
  String motifStatut;

  final FirebaseDataConnect _dataConnect;
  DesactiverUtilisateurVariablesBuilder(this._dataConnect, {required  this.firebaseUid,required  this.motifStatut,});
  Deserializer<DesactiverUtilisateurData> dataDeserializer = (dynamic json)  => DesactiverUtilisateurData.fromJson(jsonDecode(json));
  Serializer<DesactiverUtilisateurVariables> varsSerializer = (DesactiverUtilisateurVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<DesactiverUtilisateurData, DesactiverUtilisateurVariables>> execute() {
    return ref().execute();
  }

  MutationRef<DesactiverUtilisateurData, DesactiverUtilisateurVariables> ref() {
    DesactiverUtilisateurVariables vars= DesactiverUtilisateurVariables(firebaseUid: firebaseUid,motifStatut: motifStatut,);
    return _dataConnect.mutation("desactiverUtilisateur", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class DesactiverUtilisateurUtilisateurUpdate {
  final String firebaseUid;
  DesactiverUtilisateurUtilisateurUpdate.fromJson(dynamic json):
  
  firebaseUid = nativeFromJson<String>(json['firebaseUid']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final DesactiverUtilisateurUtilisateurUpdate otherTyped = other as DesactiverUtilisateurUtilisateurUpdate;
    return firebaseUid == otherTyped.firebaseUid;
    
  }
  @override
  int get hashCode => firebaseUid.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['firebaseUid'] = nativeToJson<String>(firebaseUid);
    return json;
  }

  DesactiverUtilisateurUtilisateurUpdate({
    required this.firebaseUid,
  });
}

@immutable
class DesactiverUtilisateurData {
  final DesactiverUtilisateurUtilisateurUpdate? utilisateur_update;
  DesactiverUtilisateurData.fromJson(dynamic json):
  
  utilisateur_update = json['utilisateur_update'] == null ? null : DesactiverUtilisateurUtilisateurUpdate.fromJson(json['utilisateur_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final DesactiverUtilisateurData otherTyped = other as DesactiverUtilisateurData;
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

  DesactiverUtilisateurData({
    this.utilisateur_update,
  });
}

@immutable
class DesactiverUtilisateurVariables {
  final String firebaseUid;
  final String motifStatut;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  DesactiverUtilisateurVariables.fromJson(Map<String, dynamic> json):
  
  firebaseUid = nativeFromJson<String>(json['firebaseUid']),
  motifStatut = nativeFromJson<String>(json['motifStatut']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final DesactiverUtilisateurVariables otherTyped = other as DesactiverUtilisateurVariables;
    return firebaseUid == otherTyped.firebaseUid && 
    motifStatut == otherTyped.motifStatut;
    
  }
  @override
  int get hashCode => Object.hashAll([firebaseUid.hashCode, motifStatut.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['firebaseUid'] = nativeToJson<String>(firebaseUid);
    json['motifStatut'] = nativeToJson<String>(motifStatut);
    return json;
  }

  DesactiverUtilisateurVariables({
    required this.firebaseUid,
    required this.motifStatut,
  });
}

