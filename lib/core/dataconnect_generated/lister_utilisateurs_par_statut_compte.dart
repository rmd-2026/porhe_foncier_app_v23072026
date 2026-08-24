part of 'porhe_foncier23072026.dart';

class ListerUtilisateursParStatutCompteVariablesBuilder {
  StatutCompte statutCompte;

  final FirebaseDataConnect _dataConnect;
  ListerUtilisateursParStatutCompteVariablesBuilder(this._dataConnect, {required  this.statutCompte,});
  Deserializer<ListerUtilisateursParStatutCompteData> dataDeserializer = (dynamic json)  => ListerUtilisateursParStatutCompteData.fromJson(jsonDecode(json));
  Serializer<ListerUtilisateursParStatutCompteVariables> varsSerializer = (ListerUtilisateursParStatutCompteVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerUtilisateursParStatutCompteData, ListerUtilisateursParStatutCompteVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerUtilisateursParStatutCompteData, ListerUtilisateursParStatutCompteVariables> ref() {
    ListerUtilisateursParStatutCompteVariables vars= ListerUtilisateursParStatutCompteVariables(statutCompte: statutCompte,);
    return _dataConnect.query("listerUtilisateursParStatutCompte", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerUtilisateursParStatutCompteUtilisateurs {
  final int id;
  final String firebaseUid;
  final String? nom;
  final String? prenom;
  final String? email;
  final String? telephone;
  final EnumValue<StatutCompte> statutCompte;
  final String? motifStatut;
  final Timestamp createdAt;
  ListerUtilisateursParStatutCompteUtilisateurs.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  firebaseUid = nativeFromJson<String>(json['firebaseUid']),
  nom = json['nom'] == null ? null : nativeFromJson<String>(json['nom']),
  prenom = json['prenom'] == null ? null : nativeFromJson<String>(json['prenom']),
  email = json['email'] == null ? null : nativeFromJson<String>(json['email']),
  telephone = json['telephone'] == null ? null : nativeFromJson<String>(json['telephone']),
  statutCompte = statutCompteDeserializer(json['statutCompte']),
  motifStatut = json['motifStatut'] == null ? null : nativeFromJson<String>(json['motifStatut']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerUtilisateursParStatutCompteUtilisateurs otherTyped = other as ListerUtilisateursParStatutCompteUtilisateurs;
    return id == otherTyped.id && 
    firebaseUid == otherTyped.firebaseUid && 
    nom == otherTyped.nom && 
    prenom == otherTyped.prenom && 
    email == otherTyped.email && 
    telephone == otherTyped.telephone && 
    statutCompte == otherTyped.statutCompte && 
    motifStatut == otherTyped.motifStatut && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, firebaseUid.hashCode, nom.hashCode, prenom.hashCode, email.hashCode, telephone.hashCode, statutCompte.hashCode, motifStatut.hashCode, createdAt.hashCode]);
  

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
    json['statutCompte'] = 
    statutCompteSerializer(statutCompte)
    ;
    if (motifStatut != null) {
      json['motifStatut'] = nativeToJson<String?>(motifStatut);
    }
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListerUtilisateursParStatutCompteUtilisateurs({
    required this.id,
    required this.firebaseUid,
    this.nom,
    this.prenom,
    this.email,
    this.telephone,
    required this.statutCompte,
    this.motifStatut,
    required this.createdAt,
  });
}

@immutable
class ListerUtilisateursParStatutCompteData {
  final List<ListerUtilisateursParStatutCompteUtilisateurs> utilisateurs;
  ListerUtilisateursParStatutCompteData.fromJson(dynamic json):
  
  utilisateurs = (json['utilisateurs'] as List<dynamic>)
        .map((e) => ListerUtilisateursParStatutCompteUtilisateurs.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerUtilisateursParStatutCompteData otherTyped = other as ListerUtilisateursParStatutCompteData;
    return utilisateurs == otherTyped.utilisateurs;
    
  }
  @override
  int get hashCode => utilisateurs.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateurs'] = utilisateurs.map((e) => e.toJson()).toList();
    return json;
  }

  ListerUtilisateursParStatutCompteData({
    required this.utilisateurs,
  });
}

@immutable
class ListerUtilisateursParStatutCompteVariables {
  final StatutCompte statutCompte;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerUtilisateursParStatutCompteVariables.fromJson(Map<String, dynamic> json):
  
  statutCompte = StatutCompte.values.byName(json['statutCompte']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerUtilisateursParStatutCompteVariables otherTyped = other as ListerUtilisateursParStatutCompteVariables;
    return statutCompte == otherTyped.statutCompte;
    
  }
  @override
  int get hashCode => statutCompte.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['statutCompte'] = 
    statutCompte.name
    ;
    return json;
  }

  ListerUtilisateursParStatutCompteVariables({
    required this.statutCompte,
  });
}

