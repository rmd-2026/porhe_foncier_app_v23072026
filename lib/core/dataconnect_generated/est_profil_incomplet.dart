part of 'porhe_foncier23072026.dart';

class EstProfilIncompletVariablesBuilder {
  String firebaseUid;

  final FirebaseDataConnect _dataConnect;
  EstProfilIncompletVariablesBuilder(this._dataConnect, {required  this.firebaseUid,});
  Deserializer<EstProfilIncompletData> dataDeserializer = (dynamic json)  => EstProfilIncompletData.fromJson(jsonDecode(json));
  Serializer<EstProfilIncompletVariables> varsSerializer = (EstProfilIncompletVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<EstProfilIncompletData, EstProfilIncompletVariables>> execute() {
    return ref().execute();
  }

  QueryRef<EstProfilIncompletData, EstProfilIncompletVariables> ref() {
    EstProfilIncompletVariables vars= EstProfilIncompletVariables(firebaseUid: firebaseUid,);
    return _dataConnect.query("estProfilIncomplet", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class EstProfilIncompletUtilisateur {
  final String? nom;
  final String? prenom;
  final String? telephone;
  final String? adresse;
  EstProfilIncompletUtilisateur.fromJson(dynamic json):
  
  nom = json['nom'] == null ? null : nativeFromJson<String>(json['nom']),
  prenom = json['prenom'] == null ? null : nativeFromJson<String>(json['prenom']),
  telephone = json['telephone'] == null ? null : nativeFromJson<String>(json['telephone']),
  adresse = json['adresse'] == null ? null : nativeFromJson<String>(json['adresse']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final EstProfilIncompletUtilisateur otherTyped = other as EstProfilIncompletUtilisateur;
    return nom == otherTyped.nom && 
    prenom == otherTyped.prenom && 
    telephone == otherTyped.telephone && 
    adresse == otherTyped.adresse;
    
  }
  @override
  int get hashCode => Object.hashAll([nom.hashCode, prenom.hashCode, telephone.hashCode, adresse.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (nom != null) {
      json['nom'] = nativeToJson<String?>(nom);
    }
    if (prenom != null) {
      json['prenom'] = nativeToJson<String?>(prenom);
    }
    if (telephone != null) {
      json['telephone'] = nativeToJson<String?>(telephone);
    }
    if (adresse != null) {
      json['adresse'] = nativeToJson<String?>(adresse);
    }
    return json;
  }

  EstProfilIncompletUtilisateur({
    this.nom,
    this.prenom,
    this.telephone,
    this.adresse,
  });
}

@immutable
class EstProfilIncompletData {
  final EstProfilIncompletUtilisateur? utilisateur;
  EstProfilIncompletData.fromJson(dynamic json):
  
  utilisateur = json['utilisateur'] == null ? null : EstProfilIncompletUtilisateur.fromJson(json['utilisateur']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final EstProfilIncompletData otherTyped = other as EstProfilIncompletData;
    return utilisateur == otherTyped.utilisateur;
    
  }
  @override
  int get hashCode => utilisateur.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (utilisateur != null) {
      json['utilisateur'] = utilisateur!.toJson();
    }
    return json;
  }

  EstProfilIncompletData({
    this.utilisateur,
  });
}

@immutable
class EstProfilIncompletVariables {
  final String firebaseUid;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  EstProfilIncompletVariables.fromJson(Map<String, dynamic> json):
  
  firebaseUid = nativeFromJson<String>(json['firebaseUid']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final EstProfilIncompletVariables otherTyped = other as EstProfilIncompletVariables;
    return firebaseUid == otherTyped.firebaseUid;
    
  }
  @override
  int get hashCode => firebaseUid.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['firebaseUid'] = nativeToJson<String>(firebaseUid);
    return json;
  }

  EstProfilIncompletVariables({
    required this.firebaseUid,
  });
}

