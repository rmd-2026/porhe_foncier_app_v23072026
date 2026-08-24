part of 'porhe_foncier23072026.dart';

class ListerTousUtilisateursVariablesBuilder {
  Optional<int> _limit = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _offset = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;
  ListerTousUtilisateursVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerTousUtilisateursVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ListerTousUtilisateursVariablesBuilder(this._dataConnect, );
  Deserializer<ListerTousUtilisateursData> dataDeserializer = (dynamic json)  => ListerTousUtilisateursData.fromJson(jsonDecode(json));
  Serializer<ListerTousUtilisateursVariables> varsSerializer = (ListerTousUtilisateursVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerTousUtilisateursData, ListerTousUtilisateursVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerTousUtilisateursData, ListerTousUtilisateursVariables> ref() {
    ListerTousUtilisateursVariables vars= ListerTousUtilisateursVariables(limit: _limit,offset: _offset,);
    return _dataConnect.query("listerTousUtilisateurs", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerTousUtilisateursUtilisateurs {
  final int id;
  final String firebaseUid;
  final String? nom;
  final String? prenom;
  final String? email;
  final String? telephone;
  final EnumValue<StatutCompte> statutCompte;
  final Timestamp createdAt;
  ListerTousUtilisateursUtilisateurs.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  firebaseUid = nativeFromJson<String>(json['firebaseUid']),
  nom = json['nom'] == null ? null : nativeFromJson<String>(json['nom']),
  prenom = json['prenom'] == null ? null : nativeFromJson<String>(json['prenom']),
  email = json['email'] == null ? null : nativeFromJson<String>(json['email']),
  telephone = json['telephone'] == null ? null : nativeFromJson<String>(json['telephone']),
  statutCompte = statutCompteDeserializer(json['statutCompte']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTousUtilisateursUtilisateurs otherTyped = other as ListerTousUtilisateursUtilisateurs;
    return id == otherTyped.id && 
    firebaseUid == otherTyped.firebaseUid && 
    nom == otherTyped.nom && 
    prenom == otherTyped.prenom && 
    email == otherTyped.email && 
    telephone == otherTyped.telephone && 
    statutCompte == otherTyped.statutCompte && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, firebaseUid.hashCode, nom.hashCode, prenom.hashCode, email.hashCode, telephone.hashCode, statutCompte.hashCode, createdAt.hashCode]);
  

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
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListerTousUtilisateursUtilisateurs({
    required this.id,
    required this.firebaseUid,
    this.nom,
    this.prenom,
    this.email,
    this.telephone,
    required this.statutCompte,
    required this.createdAt,
  });
}

@immutable
class ListerTousUtilisateursData {
  final List<ListerTousUtilisateursUtilisateurs> utilisateurs;
  ListerTousUtilisateursData.fromJson(dynamic json):
  
  utilisateurs = (json['utilisateurs'] as List<dynamic>)
        .map((e) => ListerTousUtilisateursUtilisateurs.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTousUtilisateursData otherTyped = other as ListerTousUtilisateursData;
    return utilisateurs == otherTyped.utilisateurs;
    
  }
  @override
  int get hashCode => utilisateurs.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateurs'] = utilisateurs.map((e) => e.toJson()).toList();
    return json;
  }

  ListerTousUtilisateursData({
    required this.utilisateurs,
  });
}

@immutable
class ListerTousUtilisateursVariables {
  late final Optional<int>limit;
  late final Optional<int>offset;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerTousUtilisateursVariables.fromJson(Map<String, dynamic> json) {
  
  
    limit = Optional.optional(nativeFromJson, nativeToJson);
    limit.value = json['limit'] == null ? null : nativeFromJson<int>(json['limit']);
  
  
    offset = Optional.optional(nativeFromJson, nativeToJson);
    offset.value = json['offset'] == null ? null : nativeFromJson<int>(json['offset']);
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTousUtilisateursVariables otherTyped = other as ListerTousUtilisateursVariables;
    return limit == otherTyped.limit && 
    offset == otherTyped.offset;
    
  }
  @override
  int get hashCode => Object.hashAll([limit.hashCode, offset.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if(limit.state == OptionalState.set) {
      json['limit'] = limit.toJson();
    }
    if(offset.state == OptionalState.set) {
      json['offset'] = offset.toJson();
    }
    return json;
  }

  ListerTousUtilisateursVariables({
    required this.limit,
    required this.offset,
  });
}

