part of 'porhe_foncier23072026.dart';

class RenouvelerAbonnementVariablesBuilder {
  int id;
  DateTime dateFin;

  final FirebaseDataConnect _dataConnect;
  RenouvelerAbonnementVariablesBuilder(this._dataConnect, {required  this.id,required  this.dateFin,});
  Deserializer<RenouvelerAbonnementData> dataDeserializer = (dynamic json)  => RenouvelerAbonnementData.fromJson(jsonDecode(json));
  Serializer<RenouvelerAbonnementVariables> varsSerializer = (RenouvelerAbonnementVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<RenouvelerAbonnementData, RenouvelerAbonnementVariables>> execute() {
    return ref().execute();
  }

  MutationRef<RenouvelerAbonnementData, RenouvelerAbonnementVariables> ref() {
    RenouvelerAbonnementVariables vars= RenouvelerAbonnementVariables(id: id,dateFin: dateFin,);
    return _dataConnect.mutation("renouvelerAbonnement", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class RenouvelerAbonnementAbonnementUpdate {
  final int id;
  RenouvelerAbonnementAbonnementUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RenouvelerAbonnementAbonnementUpdate otherTyped = other as RenouvelerAbonnementAbonnementUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  RenouvelerAbonnementAbonnementUpdate({
    required this.id,
  });
}

@immutable
class RenouvelerAbonnementData {
  final RenouvelerAbonnementAbonnementUpdate? abonnement_update;
  RenouvelerAbonnementData.fromJson(dynamic json):
  
  abonnement_update = json['abonnement_update'] == null ? null : RenouvelerAbonnementAbonnementUpdate.fromJson(json['abonnement_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RenouvelerAbonnementData otherTyped = other as RenouvelerAbonnementData;
    return abonnement_update == otherTyped.abonnement_update;
    
  }
  @override
  int get hashCode => abonnement_update.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (abonnement_update != null) {
      json['abonnement_update'] = abonnement_update!.toJson();
    }
    return json;
  }

  RenouvelerAbonnementData({
    this.abonnement_update,
  });
}

@immutable
class RenouvelerAbonnementVariables {
  final int id;
  final DateTime dateFin;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  RenouvelerAbonnementVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']),
  dateFin = nativeFromJson<DateTime>(json['dateFin']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RenouvelerAbonnementVariables otherTyped = other as RenouvelerAbonnementVariables;
    return id == otherTyped.id && 
    dateFin == otherTyped.dateFin;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, dateFin.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['dateFin'] = nativeToJson<DateTime>(dateFin);
    return json;
  }

  RenouvelerAbonnementVariables({
    required this.id,
    required this.dateFin,
  });
}

