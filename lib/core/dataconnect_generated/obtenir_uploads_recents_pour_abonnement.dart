part of 'porhe_foncier23072026.dart';

class ObtenirUploadsRecentsPourAbonnementVariablesBuilder {
  int parcelleId;
  int utilisateurId;
  Timestamp depuis;

  final FirebaseDataConnect _dataConnect;
  ObtenirUploadsRecentsPourAbonnementVariablesBuilder(this._dataConnect, {required  this.parcelleId,required  this.utilisateurId,required  this.depuis,});
  Deserializer<ObtenirUploadsRecentsPourAbonnementData> dataDeserializer = (dynamic json)  => ObtenirUploadsRecentsPourAbonnementData.fromJson(jsonDecode(json));
  Serializer<ObtenirUploadsRecentsPourAbonnementVariables> varsSerializer = (ObtenirUploadsRecentsPourAbonnementVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ObtenirUploadsRecentsPourAbonnementData, ObtenirUploadsRecentsPourAbonnementVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ObtenirUploadsRecentsPourAbonnementData, ObtenirUploadsRecentsPourAbonnementVariables> ref() {
    ObtenirUploadsRecentsPourAbonnementVariables vars= ObtenirUploadsRecentsPourAbonnementVariables(parcelleId: parcelleId,utilisateurId: utilisateurId,depuis: depuis,);
    return _dataConnect.query("obtenirUploadsRecentsPourAbonnement", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ObtenirUploadsRecentsPourAbonnementAbonnements {
  final EnumValue<NiveauAbonnement> niveau;
  ObtenirUploadsRecentsPourAbonnementAbonnements.fromJson(dynamic json):
  
  niveau = niveauAbonnementDeserializer(json['niveau']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirUploadsRecentsPourAbonnementAbonnements otherTyped = other as ObtenirUploadsRecentsPourAbonnementAbonnements;
    return niveau == otherTyped.niveau;
    
  }
  @override
  int get hashCode => niveau.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['niveau'] = 
    niveauAbonnementSerializer(niveau)
    ;
    return json;
  }

  ObtenirUploadsRecentsPourAbonnementAbonnements({
    required this.niveau,
  });
}

@immutable
class ObtenirUploadsRecentsPourAbonnementSuiviVisuels {
  final int id;
  final EnumValue<TypeMedia> typeMedia;
  final Timestamp createdAt;
  ObtenirUploadsRecentsPourAbonnementSuiviVisuels.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  typeMedia = typeMediaDeserializer(json['typeMedia']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirUploadsRecentsPourAbonnementSuiviVisuels otherTyped = other as ObtenirUploadsRecentsPourAbonnementSuiviVisuels;
    return id == otherTyped.id && 
    typeMedia == otherTyped.typeMedia && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, typeMedia.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['typeMedia'] = 
    typeMediaSerializer(typeMedia)
    ;
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ObtenirUploadsRecentsPourAbonnementSuiviVisuels({
    required this.id,
    required this.typeMedia,
    required this.createdAt,
  });
}

@immutable
class ObtenirUploadsRecentsPourAbonnementData {
  final List<ObtenirUploadsRecentsPourAbonnementAbonnements> abonnements;
  final List<ObtenirUploadsRecentsPourAbonnementSuiviVisuels> suiviVisuels;
  ObtenirUploadsRecentsPourAbonnementData.fromJson(dynamic json):
  
  abonnements = (json['abonnements'] as List<dynamic>)
        .map((e) => ObtenirUploadsRecentsPourAbonnementAbonnements.fromJson(e))
        .toList(),
  suiviVisuels = (json['suiviVisuels'] as List<dynamic>)
        .map((e) => ObtenirUploadsRecentsPourAbonnementSuiviVisuels.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirUploadsRecentsPourAbonnementData otherTyped = other as ObtenirUploadsRecentsPourAbonnementData;
    return abonnements == otherTyped.abonnements && 
    suiviVisuels == otherTyped.suiviVisuels;
    
  }
  @override
  int get hashCode => Object.hashAll([abonnements.hashCode, suiviVisuels.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['abonnements'] = abonnements.map((e) => e.toJson()).toList();
    json['suiviVisuels'] = suiviVisuels.map((e) => e.toJson()).toList();
    return json;
  }

  ObtenirUploadsRecentsPourAbonnementData({
    required this.abonnements,
    required this.suiviVisuels,
  });
}

@immutable
class ObtenirUploadsRecentsPourAbonnementVariables {
  final int parcelleId;
  final int utilisateurId;
  final Timestamp depuis;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ObtenirUploadsRecentsPourAbonnementVariables.fromJson(Map<String, dynamic> json):
  
  parcelleId = nativeFromJson<int>(json['parcelleId']),
  utilisateurId = nativeFromJson<int>(json['utilisateurId']),
  depuis = Timestamp.fromJson(json['depuis']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirUploadsRecentsPourAbonnementVariables otherTyped = other as ObtenirUploadsRecentsPourAbonnementVariables;
    return parcelleId == otherTyped.parcelleId && 
    utilisateurId == otherTyped.utilisateurId && 
    depuis == otherTyped.depuis;
    
  }
  @override
  int get hashCode => Object.hashAll([parcelleId.hashCode, utilisateurId.hashCode, depuis.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    json['depuis'] = depuis.toJson();
    return json;
  }

  ObtenirUploadsRecentsPourAbonnementVariables({
    required this.parcelleId,
    required this.utilisateurId,
    required this.depuis,
  });
}

