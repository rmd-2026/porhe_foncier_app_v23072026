part of 'porhe_foncier23072026.dart';

class MettreAJourProfilVariablesBuilder {
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
  Optional<String> _telephone = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _adresse = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _photoUrl = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;  MettreAJourProfilVariablesBuilder nom(String? t) {
   _nom.value = t;
   return this;
  }
  MettreAJourProfilVariablesBuilder prenom(String? t) {
   _prenom.value = t;
   return this;
  }
  MettreAJourProfilVariablesBuilder civilite(Civilite? t) {
   _civilite.value = t;
   return this;
  }
  MettreAJourProfilVariablesBuilder dateNaissance(DateTime? t) {
   _dateNaissance.value = t;
   return this;
  }
  MettreAJourProfilVariablesBuilder lieuNaissance(String? t) {
   _lieuNaissance.value = t;
   return this;
  }
  MettreAJourProfilVariablesBuilder nationalite(String? t) {
   _nationalite.value = t;
   return this;
  }
  MettreAJourProfilVariablesBuilder typePieceIdentite(TypePieceIdentite? t) {
   _typePieceIdentite.value = t;
   return this;
  }
  MettreAJourProfilVariablesBuilder numeroPieceIdentite(String? t) {
   _numeroPieceIdentite.value = t;
   return this;
  }
  MettreAJourProfilVariablesBuilder pieceIdentiteValideDe(DateTime? t) {
   _pieceIdentiteValideDe.value = t;
   return this;
  }
  MettreAJourProfilVariablesBuilder pieceIdentiteValideA(DateTime? t) {
   _pieceIdentiteValideA.value = t;
   return this;
  }
  MettreAJourProfilVariablesBuilder telephone(String? t) {
   _telephone.value = t;
   return this;
  }
  MettreAJourProfilVariablesBuilder adresse(String? t) {
   _adresse.value = t;
   return this;
  }
  MettreAJourProfilVariablesBuilder photoUrl(String? t) {
   _photoUrl.value = t;
   return this;
  }

  MettreAJourProfilVariablesBuilder(this._dataConnect, {required  this.firebaseUid,});
  Deserializer<MettreAJourProfilData> dataDeserializer = (dynamic json)  => MettreAJourProfilData.fromJson(jsonDecode(json));
  Serializer<MettreAJourProfilVariables> varsSerializer = (MettreAJourProfilVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<MettreAJourProfilData, MettreAJourProfilVariables>> execute() {
    return ref().execute();
  }

  MutationRef<MettreAJourProfilData, MettreAJourProfilVariables> ref() {
    MettreAJourProfilVariables vars= MettreAJourProfilVariables(firebaseUid: firebaseUid,nom: _nom,prenom: _prenom,civilite: _civilite,dateNaissance: _dateNaissance,lieuNaissance: _lieuNaissance,nationalite: _nationalite,typePieceIdentite: _typePieceIdentite,numeroPieceIdentite: _numeroPieceIdentite,pieceIdentiteValideDe: _pieceIdentiteValideDe,pieceIdentiteValideA: _pieceIdentiteValideA,telephone: _telephone,adresse: _adresse,photoUrl: _photoUrl,);
    return _dataConnect.mutation("mettreAJourProfil", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class MettreAJourProfilUtilisateurUpdate {
  final String firebaseUid;
  MettreAJourProfilUtilisateurUpdate.fromJson(dynamic json):
  
  firebaseUid = nativeFromJson<String>(json['firebaseUid']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MettreAJourProfilUtilisateurUpdate otherTyped = other as MettreAJourProfilUtilisateurUpdate;
    return firebaseUid == otherTyped.firebaseUid;
    
  }
  @override
  int get hashCode => firebaseUid.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['firebaseUid'] = nativeToJson<String>(firebaseUid);
    return json;
  }

  MettreAJourProfilUtilisateurUpdate({
    required this.firebaseUid,
  });
}

@immutable
class MettreAJourProfilData {
  final MettreAJourProfilUtilisateurUpdate? utilisateur_update;
  MettreAJourProfilData.fromJson(dynamic json):
  
  utilisateur_update = json['utilisateur_update'] == null ? null : MettreAJourProfilUtilisateurUpdate.fromJson(json['utilisateur_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MettreAJourProfilData otherTyped = other as MettreAJourProfilData;
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

  MettreAJourProfilData({
    this.utilisateur_update,
  });
}

@immutable
class MettreAJourProfilVariables {
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
  late final Optional<String>telephone;
  late final Optional<String>adresse;
  late final Optional<String>photoUrl;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  MettreAJourProfilVariables.fromJson(Map<String, dynamic> json):
  
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

    final MettreAJourProfilVariables otherTyped = other as MettreAJourProfilVariables;
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
    telephone == otherTyped.telephone && 
    adresse == otherTyped.adresse && 
    photoUrl == otherTyped.photoUrl;
    
  }
  @override
  int get hashCode => Object.hashAll([firebaseUid.hashCode, nom.hashCode, prenom.hashCode, civilite.hashCode, dateNaissance.hashCode, lieuNaissance.hashCode, nationalite.hashCode, typePieceIdentite.hashCode, numeroPieceIdentite.hashCode, pieceIdentiteValideDe.hashCode, pieceIdentiteValideA.hashCode, telephone.hashCode, adresse.hashCode, photoUrl.hashCode]);
  

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

  MettreAJourProfilVariables({
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
    required this.telephone,
    required this.adresse,
    required this.photoUrl,
  });
}

