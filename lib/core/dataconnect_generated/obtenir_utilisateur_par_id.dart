part of 'porhe_foncier23072026.dart';

class ObtenirUtilisateurParIdVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  ObtenirUtilisateurParIdVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<ObtenirUtilisateurParIdData> dataDeserializer = (dynamic json)  => ObtenirUtilisateurParIdData.fromJson(jsonDecode(json));
  Serializer<ObtenirUtilisateurParIdVariables> varsSerializer = (ObtenirUtilisateurParIdVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ObtenirUtilisateurParIdData, ObtenirUtilisateurParIdVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ObtenirUtilisateurParIdData, ObtenirUtilisateurParIdVariables> ref() {
    ObtenirUtilisateurParIdVariables vars= ObtenirUtilisateurParIdVariables(id: id,);
    return _dataConnect.query("obtenirUtilisateurParId", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ObtenirUtilisateurParIdUtilisateurs {
  final int id;
  final String firebaseUid;
  final String? nom;
  final String? prenom;
  final String? email;
  final String? telephone;
  ObtenirUtilisateurParIdUtilisateurs.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  firebaseUid = nativeFromJson<String>(json['firebaseUid']),
  nom = json['nom'] == null ? null : nativeFromJson<String>(json['nom']),
  prenom = json['prenom'] == null ? null : nativeFromJson<String>(json['prenom']),
  email = json['email'] == null ? null : nativeFromJson<String>(json['email']),
  telephone = json['telephone'] == null ? null : nativeFromJson<String>(json['telephone']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirUtilisateurParIdUtilisateurs otherTyped = other as ObtenirUtilisateurParIdUtilisateurs;
    return id == otherTyped.id && 
    firebaseUid == otherTyped.firebaseUid && 
    nom == otherTyped.nom && 
    prenom == otherTyped.prenom && 
    email == otherTyped.email && 
    telephone == otherTyped.telephone;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, firebaseUid.hashCode, nom.hashCode, prenom.hashCode, email.hashCode, telephone.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['firebaseUid'] = nativeToJson<String>(firebaseUid);
    if (nom != null) {
      json['nom'] = nativeToJson<String?>(nom);
    }
    if (prenom != null) {
      json['prenom'] = nativeToJson<String?>(prenom);
    }
    if (email != null) {
      json['email'] = nativeToJson<String?>(email);
    }
    if (telephone != null) {
      json['telephone'] = nativeToJson<String?>(telephone);
    }
    return json;
  }

  ObtenirUtilisateurParIdUtilisateurs({
    required this.id,
    required this.firebaseUid,
    this.nom,
    this.prenom,
    this.email,
    this.telephone,
  });
}

@immutable
class ObtenirUtilisateurParIdData {
  final List<ObtenirUtilisateurParIdUtilisateurs> utilisateurs;
  ObtenirUtilisateurParIdData.fromJson(dynamic json):
  
  utilisateurs = (json['utilisateurs'] as List<dynamic>)
        .map((e) => ObtenirUtilisateurParIdUtilisateurs.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirUtilisateurParIdData otherTyped = other as ObtenirUtilisateurParIdData;
    return utilisateurs == otherTyped.utilisateurs;
    
  }
  @override
  int get hashCode => utilisateurs.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateurs'] = utilisateurs.map((e) => e.toJson()).toList();
    return json;
  }

  ObtenirUtilisateurParIdData({
    required this.utilisateurs,
  });
}

@immutable
class ObtenirUtilisateurParIdVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ObtenirUtilisateurParIdVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirUtilisateurParIdVariables otherTyped = other as ObtenirUtilisateurParIdVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  ObtenirUtilisateurParIdVariables({
    required this.id,
  });
}

