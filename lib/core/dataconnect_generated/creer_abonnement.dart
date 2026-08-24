part of 'porhe_foncier23072026.dart';

class CreerAbonnementVariablesBuilder {
  int utilisateurId;
  NiveauAbonnement niveau;
  DateTime dateDebut;
  DateTime dateFin;

  final FirebaseDataConnect _dataConnect;
  CreerAbonnementVariablesBuilder(this._dataConnect, {required  this.utilisateurId,required  this.niveau,required  this.dateDebut,required  this.dateFin,});
  Deserializer<CreerAbonnementData> dataDeserializer = (dynamic json)  => CreerAbonnementData.fromJson(jsonDecode(json));
  Serializer<CreerAbonnementVariables> varsSerializer = (CreerAbonnementVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreerAbonnementData, CreerAbonnementVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreerAbonnementData, CreerAbonnementVariables> ref() {
    CreerAbonnementVariables vars= CreerAbonnementVariables(utilisateurId: utilisateurId,niveau: niveau,dateDebut: dateDebut,dateFin: dateFin,);
    return _dataConnect.mutation("creerAbonnement", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CreerAbonnementAbonnementInsert {
  final int id;
  CreerAbonnementAbonnementInsert.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreerAbonnementAbonnementInsert otherTyped = other as CreerAbonnementAbonnementInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  CreerAbonnementAbonnementInsert({
    required this.id,
  });
}

@immutable
class CreerAbonnementData {
  final CreerAbonnementAbonnementInsert abonnement_insert;
  CreerAbonnementData.fromJson(dynamic json):
  
  abonnement_insert = CreerAbonnementAbonnementInsert.fromJson(json['abonnement_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreerAbonnementData otherTyped = other as CreerAbonnementData;
    return abonnement_insert == otherTyped.abonnement_insert;
    
  }
  @override
  int get hashCode => abonnement_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['abonnement_insert'] = abonnement_insert.toJson();
    return json;
  }

  CreerAbonnementData({
    required this.abonnement_insert,
  });
}

@immutable
class CreerAbonnementVariables {
  final int utilisateurId;
  final NiveauAbonnement niveau;
  final DateTime dateDebut;
  final DateTime dateFin;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreerAbonnementVariables.fromJson(Map<String, dynamic> json):
  
  utilisateurId = nativeFromJson<int>(json['utilisateurId']),
  niveau = NiveauAbonnement.values.byName(json['niveau']),
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

    final CreerAbonnementVariables otherTyped = other as CreerAbonnementVariables;
    return utilisateurId == otherTyped.utilisateurId && 
    niveau == otherTyped.niveau && 
    dateDebut == otherTyped.dateDebut && 
    dateFin == otherTyped.dateFin;
    
  }
  @override
  int get hashCode => Object.hashAll([utilisateurId.hashCode, niveau.hashCode, dateDebut.hashCode, dateFin.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    json['niveau'] = 
    niveau.name
    ;
    json['dateDebut'] = nativeToJson<DateTime>(dateDebut);
    json['dateFin'] = nativeToJson<DateTime>(dateFin);
    return json;
  }

  CreerAbonnementVariables({
    required this.utilisateurId,
    required this.niveau,
    required this.dateDebut,
    required this.dateFin,
  });
}

