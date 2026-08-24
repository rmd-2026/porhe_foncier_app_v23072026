part of 'porhe_foncier23072026.dart';

class ListerAbonnementsParUtilisateurVariablesBuilder {
  int utilisateurId;

  final FirebaseDataConnect _dataConnect;
  ListerAbonnementsParUtilisateurVariablesBuilder(this._dataConnect, {required  this.utilisateurId,});
  Deserializer<ListerAbonnementsParUtilisateurData> dataDeserializer = (dynamic json)  => ListerAbonnementsParUtilisateurData.fromJson(jsonDecode(json));
  Serializer<ListerAbonnementsParUtilisateurVariables> varsSerializer = (ListerAbonnementsParUtilisateurVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerAbonnementsParUtilisateurData, ListerAbonnementsParUtilisateurVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerAbonnementsParUtilisateurData, ListerAbonnementsParUtilisateurVariables> ref() {
    ListerAbonnementsParUtilisateurVariables vars= ListerAbonnementsParUtilisateurVariables(utilisateurId: utilisateurId,);
    return _dataConnect.query("listerAbonnementsParUtilisateur", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerAbonnementsParUtilisateurAbonnements {
  final int id;
  final EnumValue<NiveauAbonnement> niveau;
  final EnumValue<StatutAbonnement> statut;
  final DateTime dateDebut;
  final DateTime dateFin;
  ListerAbonnementsParUtilisateurAbonnements.fromJson(dynamic json):
  
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

    final ListerAbonnementsParUtilisateurAbonnements otherTyped = other as ListerAbonnementsParUtilisateurAbonnements;
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

  ListerAbonnementsParUtilisateurAbonnements({
    required this.id,
    required this.niveau,
    required this.statut,
    required this.dateDebut,
    required this.dateFin,
  });
}

@immutable
class ListerAbonnementsParUtilisateurData {
  final List<ListerAbonnementsParUtilisateurAbonnements> abonnements;
  ListerAbonnementsParUtilisateurData.fromJson(dynamic json):
  
  abonnements = (json['abonnements'] as List<dynamic>)
        .map((e) => ListerAbonnementsParUtilisateurAbonnements.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerAbonnementsParUtilisateurData otherTyped = other as ListerAbonnementsParUtilisateurData;
    return abonnements == otherTyped.abonnements;
    
  }
  @override
  int get hashCode => abonnements.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['abonnements'] = abonnements.map((e) => e.toJson()).toList();
    return json;
  }

  ListerAbonnementsParUtilisateurData({
    required this.abonnements,
  });
}

@immutable
class ListerAbonnementsParUtilisateurVariables {
  final int utilisateurId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerAbonnementsParUtilisateurVariables.fromJson(Map<String, dynamic> json):
  
  utilisateurId = nativeFromJson<int>(json['utilisateurId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerAbonnementsParUtilisateurVariables otherTyped = other as ListerAbonnementsParUtilisateurVariables;
    return utilisateurId == otherTyped.utilisateurId;
    
  }
  @override
  int get hashCode => utilisateurId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    return json;
  }

  ListerAbonnementsParUtilisateurVariables({
    required this.utilisateurId,
  });
}

