part of 'porhe_foncier23072026.dart';

class ObtenirProfilParFirebaseUidVariablesBuilder {
  String firebaseUid;

  final FirebaseDataConnect _dataConnect;
  ObtenirProfilParFirebaseUidVariablesBuilder(this._dataConnect, {required  this.firebaseUid,});
  Deserializer<ObtenirProfilParFirebaseUidData> dataDeserializer = (dynamic json)  => ObtenirProfilParFirebaseUidData.fromJson(jsonDecode(json));
  Serializer<ObtenirProfilParFirebaseUidVariables> varsSerializer = (ObtenirProfilParFirebaseUidVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ObtenirProfilParFirebaseUidData, ObtenirProfilParFirebaseUidVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ObtenirProfilParFirebaseUidData, ObtenirProfilParFirebaseUidVariables> ref() {
    ObtenirProfilParFirebaseUidVariables vars= ObtenirProfilParFirebaseUidVariables(firebaseUid: firebaseUid,);
    return _dataConnect.query("obtenirProfilParFirebaseUid", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ObtenirProfilParFirebaseUidUtilisateur {
  final int id;
  final String firebaseUid;
  final String? nom;
  final String? prenom;
  final EnumValue<Civilite>? civilite;
  final DateTime? dateNaissance;
  final String? lieuNaissance;
  final String? nationalite;
  final EnumValue<TypePieceIdentite>? typePieceIdentite;
  final String? numeroPieceIdentite;
  final DateTime? pieceIdentiteValideDe;
  final DateTime? pieceIdentiteValideA;
  final String? email;
  final String? telephone;
  final String? adresse;
  final String? photoUrl;
  final EnumValue<StatutCompte> statutCompte;
  final String? motifStatut;
  final Timestamp createdAt;
  final Timestamp updatedAt;
  ObtenirProfilParFirebaseUidUtilisateur.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  firebaseUid = nativeFromJson<String>(json['firebaseUid']),
  nom = json['nom'] == null ? null : nativeFromJson<String>(json['nom']),
  prenom = json['prenom'] == null ? null : nativeFromJson<String>(json['prenom']),
  civilite = json['civilite'] == null ? null : civiliteDeserializer(json['civilite']),
  dateNaissance = json['dateNaissance'] == null ? null : nativeFromJson<DateTime>(json['dateNaissance']),
  lieuNaissance = json['lieuNaissance'] == null ? null : nativeFromJson<String>(json['lieuNaissance']),
  nationalite = json['nationalite'] == null ? null : nativeFromJson<String>(json['nationalite']),
  typePieceIdentite = json['typePieceIdentite'] == null ? null : typePieceIdentiteDeserializer(json['typePieceIdentite']),
  numeroPieceIdentite = json['numeroPieceIdentite'] == null ? null : nativeFromJson<String>(json['numeroPieceIdentite']),
  pieceIdentiteValideDe = json['pieceIdentiteValideDe'] == null ? null : nativeFromJson<DateTime>(json['pieceIdentiteValideDe']),
  pieceIdentiteValideA = json['pieceIdentiteValideA'] == null ? null : nativeFromJson<DateTime>(json['pieceIdentiteValideA']),
  email = json['email'] == null ? null : nativeFromJson<String>(json['email']),
  telephone = json['telephone'] == null ? null : nativeFromJson<String>(json['telephone']),
  adresse = json['adresse'] == null ? null : nativeFromJson<String>(json['adresse']),
  photoUrl = json['photoUrl'] == null ? null : nativeFromJson<String>(json['photoUrl']),
  statutCompte = statutCompteDeserializer(json['statutCompte']),
  motifStatut = json['motifStatut'] == null ? null : nativeFromJson<String>(json['motifStatut']),
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

    final ObtenirProfilParFirebaseUidUtilisateur otherTyped = other as ObtenirProfilParFirebaseUidUtilisateur;
    return id == otherTyped.id && 
    firebaseUid == otherTyped.firebaseUid && 
    nom == otherTyped.nom && 
    prenom == otherTyped.prenom && 
    civilite == otherTyped.civilite && 
    dateNaissance == otherTyped.dateNaissance && 
    lieuNaissance == otherTyped.lieuNaissance && 
    nationalite == otherTyped.nationalite && 
    typePieceIdentite == otherTyped.typePieceIdentite && 
    numeroPieceIdentite == otherTyped.numeroPieceIdentite && 
    pieceIdentiteValideDe == otherTyped.pieceIdentiteValideDe && 
    pieceIdentiteValideA == otherTyped.pieceIdentiteValideA && 
    email == otherTyped.email && 
    telephone == otherTyped.telephone && 
    adresse == otherTyped.adresse && 
    photoUrl == otherTyped.photoUrl && 
    statutCompte == otherTyped.statutCompte && 
    motifStatut == otherTyped.motifStatut && 
    createdAt == otherTyped.createdAt && 
    updatedAt == otherTyped.updatedAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, firebaseUid.hashCode, nom.hashCode, prenom.hashCode, civilite.hashCode, dateNaissance.hashCode, lieuNaissance.hashCode, nationalite.hashCode, typePieceIdentite.hashCode, numeroPieceIdentite.hashCode, pieceIdentiteValideDe.hashCode, pieceIdentiteValideA.hashCode, email.hashCode, telephone.hashCode, adresse.hashCode, photoUrl.hashCode, statutCompte.hashCode, motifStatut.hashCode, createdAt.hashCode, updatedAt.hashCode]);
  

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
    if (civilite != null) {
      json['civilite'] = 
    civiliteSerializer(civilite!)
    ;
    }
    if (dateNaissance != null) {
      json['dateNaissance'] = nativeToJson<DateTime?>(dateNaissance);
    }
    if (lieuNaissance != null) {
      json['lieuNaissance'] = nativeToJson<String?>(lieuNaissance);
    }
    if (nationalite != null) {
      json['nationalite'] = nativeToJson<String?>(nationalite);
    }
    if (typePieceIdentite != null) {
      json['typePieceIdentite'] = 
    typePieceIdentiteSerializer(typePieceIdentite!)
    ;
    }
    if (numeroPieceIdentite != null) {
      json['numeroPieceIdentite'] = nativeToJson<String?>(numeroPieceIdentite);
    }
    if (pieceIdentiteValideDe != null) {
      json['pieceIdentiteValideDe'] = nativeToJson<DateTime?>(pieceIdentiteValideDe);
    }
    if (pieceIdentiteValideA != null) {
      json['pieceIdentiteValideA'] = nativeToJson<DateTime?>(pieceIdentiteValideA);
    }
    if (email != null) {
      json['email'] = nativeToJson<String?>(email);
    }
    if (telephone != null) {
      json['telephone'] = nativeToJson<String?>(telephone);
    }
    if (adresse != null) {
      json['adresse'] = nativeToJson<String?>(adresse);
    }
    if (photoUrl != null) {
      json['photoUrl'] = nativeToJson<String?>(photoUrl);
    }
    json['statutCompte'] = 
    statutCompteSerializer(statutCompte)
    ;
    if (motifStatut != null) {
      json['motifStatut'] = nativeToJson<String?>(motifStatut);
    }
    json['createdAt'] = createdAt.toJson();
    json['updatedAt'] = updatedAt.toJson();
    return json;
  }

  ObtenirProfilParFirebaseUidUtilisateur({
    required this.id,
    required this.firebaseUid,
    this.nom,
    this.prenom,
    this.civilite,
    this.dateNaissance,
    this.lieuNaissance,
    this.nationalite,
    this.typePieceIdentite,
    this.numeroPieceIdentite,
    this.pieceIdentiteValideDe,
    this.pieceIdentiteValideA,
    this.email,
    this.telephone,
    this.adresse,
    this.photoUrl,
    required this.statutCompte,
    this.motifStatut,
    required this.createdAt,
    required this.updatedAt,
  });
}

@immutable
class ObtenirProfilParFirebaseUidData {
  final ObtenirProfilParFirebaseUidUtilisateur? utilisateur;
  ObtenirProfilParFirebaseUidData.fromJson(dynamic json):
  
  utilisateur = json['utilisateur'] == null ? null : ObtenirProfilParFirebaseUidUtilisateur.fromJson(json['utilisateur']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirProfilParFirebaseUidData otherTyped = other as ObtenirProfilParFirebaseUidData;
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

  ObtenirProfilParFirebaseUidData({
    this.utilisateur,
  });
}

@immutable
class ObtenirProfilParFirebaseUidVariables {
  final String firebaseUid;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ObtenirProfilParFirebaseUidVariables.fromJson(Map<String, dynamic> json):
  
  firebaseUid = nativeFromJson<String>(json['firebaseUid']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirProfilParFirebaseUidVariables otherTyped = other as ObtenirProfilParFirebaseUidVariables;
    return firebaseUid == otherTyped.firebaseUid;
    
  }
  @override
  int get hashCode => firebaseUid.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['firebaseUid'] = nativeToJson<String>(firebaseUid);
    return json;
  }

  ObtenirProfilParFirebaseUidVariables({
    required this.firebaseUid,
  });
}

