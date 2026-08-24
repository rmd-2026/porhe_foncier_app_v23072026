part of 'porhe_foncier23072026.dart';

class ConfirmerPaiementAbonnementVariablesBuilder {
  int id;
  int abonnementId;

  final FirebaseDataConnect _dataConnect;
  ConfirmerPaiementAbonnementVariablesBuilder(this._dataConnect, {required  this.id,required  this.abonnementId,});
  Deserializer<ConfirmerPaiementAbonnementData> dataDeserializer = (dynamic json)  => ConfirmerPaiementAbonnementData.fromJson(jsonDecode(json));
  Serializer<ConfirmerPaiementAbonnementVariables> varsSerializer = (ConfirmerPaiementAbonnementVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<ConfirmerPaiementAbonnementData, ConfirmerPaiementAbonnementVariables>> execute() {
    return ref().execute();
  }

  MutationRef<ConfirmerPaiementAbonnementData, ConfirmerPaiementAbonnementVariables> ref() {
    ConfirmerPaiementAbonnementVariables vars= ConfirmerPaiementAbonnementVariables(id: id,abonnementId: abonnementId,);
    return _dataConnect.mutation("confirmerPaiementAbonnement", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ConfirmerPaiementAbonnementPaiementUpdate {
  final int id;
  ConfirmerPaiementAbonnementPaiementUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ConfirmerPaiementAbonnementPaiementUpdate otherTyped = other as ConfirmerPaiementAbonnementPaiementUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  ConfirmerPaiementAbonnementPaiementUpdate({
    required this.id,
  });
}

@immutable
class ConfirmerPaiementAbonnementAbonnementUpdate {
  final int id;
  ConfirmerPaiementAbonnementAbonnementUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ConfirmerPaiementAbonnementAbonnementUpdate otherTyped = other as ConfirmerPaiementAbonnementAbonnementUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  ConfirmerPaiementAbonnementAbonnementUpdate({
    required this.id,
  });
}

@immutable
class ConfirmerPaiementAbonnementData {
  final ConfirmerPaiementAbonnementPaiementUpdate? paiement_update;
  final ConfirmerPaiementAbonnementAbonnementUpdate? abonnement_update;
  ConfirmerPaiementAbonnementData.fromJson(dynamic json):
  
  paiement_update = json['paiement_update'] == null ? null : ConfirmerPaiementAbonnementPaiementUpdate.fromJson(json['paiement_update']),
  abonnement_update = json['abonnement_update'] == null ? null : ConfirmerPaiementAbonnementAbonnementUpdate.fromJson(json['abonnement_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ConfirmerPaiementAbonnementData otherTyped = other as ConfirmerPaiementAbonnementData;
    return paiement_update == otherTyped.paiement_update && 
    abonnement_update == otherTyped.abonnement_update;
    
  }
  @override
  int get hashCode => Object.hashAll([paiement_update.hashCode, abonnement_update.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (paiement_update != null) {
      json['paiement_update'] = paiement_update!.toJson();
    }
    if (abonnement_update != null) {
      json['abonnement_update'] = abonnement_update!.toJson();
    }
    return json;
  }

  ConfirmerPaiementAbonnementData({
    this.paiement_update,
    this.abonnement_update,
  });
}

@immutable
class ConfirmerPaiementAbonnementVariables {
  final int id;
  final int abonnementId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ConfirmerPaiementAbonnementVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']),
  abonnementId = nativeFromJson<int>(json['abonnementId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ConfirmerPaiementAbonnementVariables otherTyped = other as ConfirmerPaiementAbonnementVariables;
    return id == otherTyped.id && 
    abonnementId == otherTyped.abonnementId;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, abonnementId.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['abonnementId'] = nativeToJson<int>(abonnementId);
    return json;
  }

  ConfirmerPaiementAbonnementVariables({
    required this.id,
    required this.abonnementId,
  });
}

