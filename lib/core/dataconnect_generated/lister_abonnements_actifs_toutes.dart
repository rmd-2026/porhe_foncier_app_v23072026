part of 'porhe_foncier23072026.dart';

class ListerAbonnementsActifsToutesVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  ListerAbonnementsActifsToutesVariablesBuilder(this._dataConnect, );
  Deserializer<ListerAbonnementsActifsToutesData> dataDeserializer = (dynamic json)  => ListerAbonnementsActifsToutesData.fromJson(jsonDecode(json));
  
  Future<QueryResult<ListerAbonnementsActifsToutesData, void>> execute() {
    return ref().execute();
  }

  QueryRef<ListerAbonnementsActifsToutesData, void> ref() {
    
    return _dataConnect.query("listerAbonnementsActifsToutes", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class ListerAbonnementsActifsToutesAbonnements {
  final int id;
  final int utilisateurId;
  final EnumValue<NiveauAbonnement> niveau;
  final DateTime dateDebut;
  final DateTime dateFin;
  ListerAbonnementsActifsToutesAbonnements.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  utilisateurId = nativeFromJson<int>(json['utilisateurId']),
  niveau = niveauAbonnementDeserializer(json['niveau']),
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

    final ListerAbonnementsActifsToutesAbonnements otherTyped = other as ListerAbonnementsActifsToutesAbonnements;
    return id == otherTyped.id && 
    utilisateurId == otherTyped.utilisateurId && 
    niveau == otherTyped.niveau && 
    dateDebut == otherTyped.dateDebut && 
    dateFin == otherTyped.dateFin;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, utilisateurId.hashCode, niveau.hashCode, dateDebut.hashCode, dateFin.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    json['niveau'] = 
    niveauAbonnementSerializer(niveau)
    ;
    json['dateDebut'] = nativeToJson<DateTime>(dateDebut);
    json['dateFin'] = nativeToJson<DateTime>(dateFin);
    return json;
  }

  ListerAbonnementsActifsToutesAbonnements({
    required this.id,
    required this.utilisateurId,
    required this.niveau,
    required this.dateDebut,
    required this.dateFin,
  });
}

@immutable
class ListerAbonnementsActifsToutesData {
  final List<ListerAbonnementsActifsToutesAbonnements> abonnements;
  ListerAbonnementsActifsToutesData.fromJson(dynamic json):
  
  abonnements = (json['abonnements'] as List<dynamic>)
        .map((e) => ListerAbonnementsActifsToutesAbonnements.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerAbonnementsActifsToutesData otherTyped = other as ListerAbonnementsActifsToutesData;
    return abonnements == otherTyped.abonnements;
    
  }
  @override
  int get hashCode => abonnements.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['abonnements'] = abonnements.map((e) => e.toJson()).toList();
    return json;
  }

  ListerAbonnementsActifsToutesData({
    required this.abonnements,
  });
}

