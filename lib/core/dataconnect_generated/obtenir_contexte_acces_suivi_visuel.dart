part of 'porhe_foncier23072026.dart';

class ObtenirContexteAccesSuiviVisuelVariablesBuilder {
  int parcelleId;
  int utilisateurId;

  final FirebaseDataConnect _dataConnect;
  ObtenirContexteAccesSuiviVisuelVariablesBuilder(this._dataConnect, {required  this.parcelleId,required  this.utilisateurId,});
  Deserializer<ObtenirContexteAccesSuiviVisuelData> dataDeserializer = (dynamic json)  => ObtenirContexteAccesSuiviVisuelData.fromJson(jsonDecode(json));
  Serializer<ObtenirContexteAccesSuiviVisuelVariables> varsSerializer = (ObtenirContexteAccesSuiviVisuelVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ObtenirContexteAccesSuiviVisuelData, ObtenirContexteAccesSuiviVisuelVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ObtenirContexteAccesSuiviVisuelData, ObtenirContexteAccesSuiviVisuelVariables> ref() {
    ObtenirContexteAccesSuiviVisuelVariables vars= ObtenirContexteAccesSuiviVisuelVariables(parcelleId: parcelleId,utilisateurId: utilisateurId,);
    return _dataConnect.query("obtenirContexteAccesSuiviVisuel", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ObtenirContexteAccesSuiviVisuelAbonnements {
  final EnumValue<NiveauAbonnement> niveau;
  ObtenirContexteAccesSuiviVisuelAbonnements.fromJson(dynamic json):
  
  niveau = niveauAbonnementDeserializer(json['niveau']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirContexteAccesSuiviVisuelAbonnements otherTyped = other as ObtenirContexteAccesSuiviVisuelAbonnements;
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

  ObtenirContexteAccesSuiviVisuelAbonnements({
    required this.niveau,
  });
}

@immutable
class ObtenirContexteAccesSuiviVisuelSuiviVisuels {
  final int id;
  final EnumValue<TypeMedia> typeMedia;
  final String urlStockage;
  final Timestamp createdAt;
  ObtenirContexteAccesSuiviVisuelSuiviVisuels.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  typeMedia = typeMediaDeserializer(json['typeMedia']),
  urlStockage = nativeFromJson<String>(json['urlStockage']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirContexteAccesSuiviVisuelSuiviVisuels otherTyped = other as ObtenirContexteAccesSuiviVisuelSuiviVisuels;
    return id == otherTyped.id && 
    typeMedia == otherTyped.typeMedia && 
    urlStockage == otherTyped.urlStockage && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, typeMedia.hashCode, urlStockage.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['typeMedia'] = 
    typeMediaSerializer(typeMedia)
    ;
    json['urlStockage'] = nativeToJson<String>(urlStockage);
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ObtenirContexteAccesSuiviVisuelSuiviVisuels({
    required this.id,
    required this.typeMedia,
    required this.urlStockage,
    required this.createdAt,
  });
}

@immutable
class ObtenirContexteAccesSuiviVisuelData {
  final List<ObtenirContexteAccesSuiviVisuelAbonnements> abonnements;
  final List<ObtenirContexteAccesSuiviVisuelSuiviVisuels> suiviVisuels;
  ObtenirContexteAccesSuiviVisuelData.fromJson(dynamic json):
  
  abonnements = (json['abonnements'] as List<dynamic>)
        .map((e) => ObtenirContexteAccesSuiviVisuelAbonnements.fromJson(e))
        .toList(),
  suiviVisuels = (json['suiviVisuels'] as List<dynamic>)
        .map((e) => ObtenirContexteAccesSuiviVisuelSuiviVisuels.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirContexteAccesSuiviVisuelData otherTyped = other as ObtenirContexteAccesSuiviVisuelData;
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

  ObtenirContexteAccesSuiviVisuelData({
    required this.abonnements,
    required this.suiviVisuels,
  });
}

@immutable
class ObtenirContexteAccesSuiviVisuelVariables {
  final int parcelleId;
  final int utilisateurId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ObtenirContexteAccesSuiviVisuelVariables.fromJson(Map<String, dynamic> json):
  
  parcelleId = nativeFromJson<int>(json['parcelleId']),
  utilisateurId = nativeFromJson<int>(json['utilisateurId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirContexteAccesSuiviVisuelVariables otherTyped = other as ObtenirContexteAccesSuiviVisuelVariables;
    return parcelleId == otherTyped.parcelleId && 
    utilisateurId == otherTyped.utilisateurId;
    
  }
  @override
  int get hashCode => Object.hashAll([parcelleId.hashCode, utilisateurId.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    return json;
  }

  ObtenirContexteAccesSuiviVisuelVariables({
    required this.parcelleId,
    required this.utilisateurId,
  });
}

