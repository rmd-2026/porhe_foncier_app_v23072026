part of 'porhe_foncier23072026.dart';

class ObtenirAbonnementActifParUtilisateurVariablesBuilder {
  int utilisateurId;

  final FirebaseDataConnect _dataConnect;
  ObtenirAbonnementActifParUtilisateurVariablesBuilder(this._dataConnect, {required  this.utilisateurId,});
  Deserializer<ObtenirAbonnementActifParUtilisateurData> dataDeserializer = (dynamic json)  => ObtenirAbonnementActifParUtilisateurData.fromJson(jsonDecode(json));
  Serializer<ObtenirAbonnementActifParUtilisateurVariables> varsSerializer = (ObtenirAbonnementActifParUtilisateurVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ObtenirAbonnementActifParUtilisateurData, ObtenirAbonnementActifParUtilisateurVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ObtenirAbonnementActifParUtilisateurData, ObtenirAbonnementActifParUtilisateurVariables> ref() {
    ObtenirAbonnementActifParUtilisateurVariables vars= ObtenirAbonnementActifParUtilisateurVariables(utilisateurId: utilisateurId,);
    return _dataConnect.query("obtenirAbonnementActifParUtilisateur", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ObtenirAbonnementActifParUtilisateurAbonnements {
  final int id;
  final EnumValue<NiveauAbonnement> niveau;
  final EnumValue<StatutAbonnement> statut;
  final DateTime dateDebut;
  final DateTime dateFin;
  ObtenirAbonnementActifParUtilisateurAbonnements.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  niveau = niveauAbonnementDeserializer(json['niveau']),
  statut = statutAbonnementDeserializer(json['statut']),
  dateDebut = nativeFromJson<DateTime>(json['dateDebut']),
  dateFin = nativeFromJson<DateTime>(json['dateFin']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirAbonnementActifParUtilisateurAbonnements otherTyped = other as ObtenirAbonnementActifParUtilisateurAbonnements;
    return id == otherTyped.id && 
    niveau == otherTyped.niveau && 
    statut == otherTyped.statut && 
    dateDebut == otherTyped.dateDebut && 
    dateFin == otherTyped.dateFin;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, niveau.hashCode, statut.hashCode, dateDebut.hashCode, dateFin.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['niveau'] = 
    niveauAbonnementSerializer(niveau)
    ;
    json['statut'] = 
    statutAbonnementSerializer(statut)
    ;
    json['dateDebut'] = nativeToJson<DateTime>(dateDebut);
    json['dateFin'] = nativeToJson<DateTime>(dateFin);
    return json;
  }

  ObtenirAbonnementActifParUtilisateurAbonnements({
    required this.id,
    required this.niveau,
    required this.statut,
    required this.dateDebut,
    required this.dateFin,
  });
}

@immutable
class ObtenirAbonnementActifParUtilisateurData {
  final List<ObtenirAbonnementActifParUtilisateurAbonnements> abonnements;
  ObtenirAbonnementActifParUtilisateurData.fromJson(dynamic json):
  
  abonnements = (json['abonnements'] as List<dynamic>)
        .map((e) => ObtenirAbonnementActifParUtilisateurAbonnements.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirAbonnementActifParUtilisateurData otherTyped = other as ObtenirAbonnementActifParUtilisateurData;
    return abonnements == otherTyped.abonnements;
    
  }
  @override
  int get hashCode => abonnements.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['abonnements'] = abonnements.map((e) => e.toJson()).toList();
    return json;
  }

  ObtenirAbonnementActifParUtilisateurData({
    required this.abonnements,
  });
}

@immutable
class ObtenirAbonnementActifParUtilisateurVariables {
  final int utilisateurId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ObtenirAbonnementActifParUtilisateurVariables.fromJson(Map<String, dynamic> json):
  
  utilisateurId = nativeFromJson<int>(json['utilisateurId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirAbonnementActifParUtilisateurVariables otherTyped = other as ObtenirAbonnementActifParUtilisateurVariables;
    return utilisateurId == otherTyped.utilisateurId;
    
  }
  @override
  int get hashCode => utilisateurId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    return json;
  }

  ObtenirAbonnementActifParUtilisateurVariables({
    required this.utilisateurId,
  });
}

