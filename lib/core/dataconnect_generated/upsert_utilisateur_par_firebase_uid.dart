part of 'porhe_foncier23072026.dart';

class UpsertUtilisateurParFirebaseUidVariablesBuilder {
  String firebaseUid;
  Optional<String> _nom = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _prenom = Optional.optional(nativeFromJson, nativeToJson);
  Optional<Civilite> _civilite = Optional.optional((data) => Civilite.values.byName(data), enumSerializer);
  Optional<DateTime> _dateNaissance = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _lieuNaissance = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _nationalite = Optional.optional(nativeFromJson, nativeToJson);
  Optional<TypePieceIdentite> _typePieceIdentite = Optional.optional((data) => TypePieceIdentite.values.byName(data), enumSerializer);
  Optional<String> _numeroPieceIdentite = Optional.optional(nativeFromJson, nativeToJson);
  Optional<DateTime> _pieceIdentiteValideDe = Optional.optional(nativeFromJson, nativeToJson);
  Optional<DateTime> _pieceIdentiteValideA = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _email = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _telephone = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _adresse = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _photoUrl = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;  UpsertUtilisateurParFirebaseUidVariablesBuilder nom(String? t) {
   _nom.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder prenom(String? t) {
   _prenom.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder civilite(Civilite? t) {
   _civilite.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder dateNaissance(DateTime? t) {
   _dateNaissance.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder lieuNaissance(String? t) {
   _lieuNaissance.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder nationalite(String? t) {
   _nationalite.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder typePieceIdentite(TypePieceIdentite? t) {
   _typePieceIdentite.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder numeroPieceIdentite(String? t) {
   _numeroPieceIdentite.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder pieceIdentiteValideDe(DateTime? t) {
   _pieceIdentiteValideDe.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder pieceIdentiteValideA(DateTime? t) {
   _pieceIdentiteValideA.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder email(String? t) {
   _email.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder telephone(String? t) {
   _telephone.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder adresse(String? t) {
   _adresse.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder photoUrl(String? t) {
   _photoUrl.value = t;
   return this;
  }

  UpsertUtilisateurParFirebaseUidVariablesBuilder(this._dataConnect, {required  this.firebaseUid,});
  Deserializer<UpsertUtilisateurParFirebaseUidData> dataDeserializer = (dynamic json)  => UpsertUtilisateurParFirebaseUidData.fromJson(jsonDecode(json));
  Serializer<UpsertUtilisateurParFirebaseUidVariables> varsSerializer = (UpsertUtilisateurParFirebaseUidVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpsertUtilisateurParFirebaseUidData, UpsertUtilisateurParFirebaseUidVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpsertUtilisateurParFirebaseUidData, UpsertUtilisateurParFirebaseUidVariables> ref() {
    UpsertUtilisateurParFirebaseUidVariables vars= UpsertUtilisateurParFirebaseUidVariables(firebaseUid: firebaseUid,nom: _nom,prenom: _prenom,civilite: _civilite,dateNaissance: _dateNaissance,lieuNaissance: _lieuNaissance,nationalite: _nationalite,typePieceIdentite: _typePieceIdentite,numeroPieceIdentite: _numeroPieceIdentite,pieceIdentiteValideDe: _pieceIdentiteValideDe,pieceIdentiteValideA: _pieceIdentiteValideA,email: _email,telephone: _telephone,adresse: _adresse,photoUrl: _photoUrl,);
    return _dataConnect.mutation("upsertUtilisateurParFirebaseUid", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class UpsertUtilisateurParFirebaseUidUtilisateurUpsert {
  final String firebaseUid;
  UpsertUtilisateurParFirebaseUidUtilisateurUpsert.fromJson(dynamic json):
  
  firebaseUid = nativeFromJson<String>(json['firebaseUid']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpsertUtilisateurParFirebaseUidUtilisateurUpsert otherTyped = other as UpsertUtilisateurParFirebaseUidUtilisateurUpsert;
    return firebaseUid == otherTyped.firebaseUid;
    
  }
  @override
  int get hashCode => firebaseUid.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['firebaseUid'] = nativeToJson<String>(firebaseUid);
    return json;
  }

  UpsertUtilisateurParFirebaseUidUtilisateurUpsert({
    required this.firebaseUid,
  });
}

@immutable
class UpsertUtilisateurParFirebaseUidData {
  final UpsertUtilisateurParFirebaseUidUtilisateurUpsert utilisateur_upsert;
  UpsertUtilisateurParFirebaseUidData.fromJson(dynamic json):
  
  utilisateur_upsert = UpsertUtilisateurParFirebaseUidUtilisateurUpsert.fromJson(json['utilisateur_upsert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpsertUtilisateurParFirebaseUidData otherTyped = other as UpsertUtilisateurParFirebaseUidData;
    return utilisateur_upsert == otherTyped.utilisateur_upsert;
    
  }
  @override
  int get hashCode => utilisateur_upsert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateur_upsert'] = utilisateur_upsert.toJson();
    return json;
  }

  UpsertUtilisateurParFirebaseUidData({
    required this.utilisateur_upsert,
  });
}

@immutable
class UpsertUtilisateurParFirebaseUidVariables {
  final String firebaseUid;
  late final Optional<String>nom;
  late final Optional<String>prenom;
  late final Optional<Civilite>civilite;
  late final Optional<DateTime>dateNaissance;
  late final Optional<String>lieuNaissance;
  late final Optional<String>nationalite;
  late final Optional<TypePieceIdentite>typePieceIdentite;
  late final Optional<String>numeroPieceIdentite;
  late final Optional<DateTime>pieceIdentiteValideDe;
  late final Optional<DateTime>pieceIdentiteValideA;
  late final Optional<String>email;
  late final Optional<String>telephone;
  late final Optional<String>adresse;
  late final Optional<String>photoUrl;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpsertUtilisateurParFirebaseUidVariables.fromJson(Map<String, dynamic> json):
  
  firebaseUid = nativeFromJson<String>(json['firebaseUid']) {
  
  
  
    nom = Optional.optional(nativeFromJson, nativeToJson);
    nom.value = json['nom'] == null ? null : nativeFromJson<String>(json['nom']);
  
  
    prenom = Optional.optional(nativeFromJson, nativeToJson);
    prenom.value = json['prenom'] == null ? null : nativeFromJson<String>(json['prenom']);
  
  
    civilite = Optional.optional((data) => Civilite.values.byName(data), enumSerializer);
    civilite.value = json['civilite'] == null ? null : Civilite.values.byName(json['civilite']);
  
  
    dateNaissance = Optional.optional(nativeFromJson, nativeToJson);
    dateNaissance.value = json['dateNaissance'] == null ? null : nativeFromJson<DateTime>(json['dateNaissance']);
  
  
    lieuNaissance = Optional.optional(nativeFromJson, nativeToJson);
    lieuNaissance.value = json['lieuNaissance'] == null ? null : nativeFromJson<String>(json['lieuNaissance']);
  
  
    nationalite = Optional.optional(nativeFromJson, nativeToJson);
    nationalite.value = json['nationalite'] == null ? null : nativeFromJson<String>(json['nationalite']);
  
  
    typePieceIdentite = Optional.optional((data) => TypePieceIdentite.values.byName(data), enumSerializer);
    typePieceIdentite.value = json['typePieceIdentite'] == null ? null : TypePieceIdentite.values.byName(json['typePieceIdentite']);
  
  
    numeroPieceIdentite = Optional.optional(nativeFromJson, nativeToJson);
    numeroPieceIdentite.value = json['numeroPieceIdentite'] == null ? null : nativeFromJson<String>(json['numeroPieceIdentite']);
  
  
    pieceIdentiteValideDe = Optional.optional(nativeFromJson, nativeToJson);
    pieceIdentiteValideDe.value = json['pieceIdentiteValideDe'] == null ? null : nativeFromJson<DateTime>(json['pieceIdentiteValideDe']);
  
  
    pieceIdentiteValideA = Optional.optional(nativeFromJson, nativeToJson);
    pieceIdentiteValideA.value = json['pieceIdentiteValideA'] == null ? null : nativeFromJson<DateTime>(json['pieceIdentiteValideA']);
  
  
    email = Optional.optional(nativeFromJson, nativeToJson);
    email.value = json['email'] == null ? null : nativeFromJson<String>(json['email']);
  
  
    telephone = Optional.optional(nativeFromJson, nativeToJson);
    telephone.value = json['telephone'] == null ? null : nativeFromJson<String>(json['telephone']);
  
  
    adresse = Optional.optional(nativeFromJson, nativeToJson);
    adresse.value = json['adresse'] == null ? null : nativeFromJson<String>(json['adresse']);
  
  
    photoUrl = Optional.optional(nativeFromJson, nativeToJson);
    photoUrl.value = json['photoUrl'] == null ? null : nativeFromJson<String>(json['photoUrl']);
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpsertUtilisateurParFirebaseUidVariables otherTyped = other as UpsertUtilisateurParFirebaseUidVariables;
    return firebaseUid == otherTyped.firebaseUid && 
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
    photoUrl == otherTyped.photoUrl;
    
  }
  @override
  int get hashCode => Object.hashAll([firebaseUid.hashCode, nom.hashCode, prenom.hashCode, civilite.hashCode, dateNaissance.hashCode, lieuNaissance.hashCode, nationalite.hashCode, typePieceIdentite.hashCode, numeroPieceIdentite.hashCode, pieceIdentiteValideDe.hashCode, pieceIdentiteValideA.hashCode, email.hashCode, telephone.hashCode, adresse.hashCode, photoUrl.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['firebaseUid'] = nativeToJson<String>(firebaseUid);
    if(nom.state == OptionalState.set) {
      json['nom'] = nom.toJson();
    }
    if(prenom.state == OptionalState.set) {
      json['prenom'] = prenom.toJson();
    }
    if(civilite.state == OptionalState.set) {
      json['civilite'] = civilite.toJson();
    }
    if(dateNaissance.state == OptionalState.set) {
      json['dateNaissance'] = dateNaissance.toJson();
    }
    if(lieuNaissance.state == OptionalState.set) {
      json['lieuNaissance'] = lieuNaissance.toJson();
    }
    if(nationalite.state == OptionalState.set) {
      json['nationalite'] = nationalite.toJson();
    }
    if(typePieceIdentite.state == OptionalState.set) {
      json['typePieceIdentite'] = typePieceIdentite.toJson();
    }
    if(numeroPieceIdentite.state == OptionalState.set) {
      json['numeroPieceIdentite'] = numeroPieceIdentite.toJson();
    }
    if(pieceIdentiteValideDe.state == OptionalState.set) {
      json['pieceIdentiteValideDe'] = pieceIdentiteValideDe.toJson();
    }
    if(pieceIdentiteValideA.state == OptionalState.set) {
      json['pieceIdentiteValideA'] = pieceIdentiteValideA.toJson();
    }
    if(email.state == OptionalState.set) {
      json['email'] = email.toJson();
    }
    if(telephone.state == OptionalState.set) {
      json['telephone'] = telephone.toJson();
    }
    if(adresse.state == OptionalState.set) {
      json['adresse'] = adresse.toJson();
    }
    if(photoUrl.state == OptionalState.set) {
      json['photoUrl'] = photoUrl.toJson();
    }
    return json;
  }

  UpsertUtilisateurParFirebaseUidVariables({
    required this.firebaseUid,
    required this.nom,
    required this.prenom,
    required this.civilite,
    required this.dateNaissance,
    required this.lieuNaissance,
    required this.nationalite,
    required this.typePieceIdentite,
    required this.numeroPieceIdentite,
    required this.pieceIdentiteValideDe,
    required this.pieceIdentiteValideA,
    required this.email,
    required this.telephone,
    required this.adresse,
    required this.photoUrl,
  });
}

