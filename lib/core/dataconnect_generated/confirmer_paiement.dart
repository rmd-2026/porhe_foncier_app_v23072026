part of 'porhe_foncier23072026.dart';

class ConfirmerPaiementVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  ConfirmerPaiementVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<ConfirmerPaiementData> dataDeserializer = (dynamic json)  => ConfirmerPaiementData.fromJson(jsonDecode(json));
  Serializer<ConfirmerPaiementVariables> varsSerializer = (ConfirmerPaiementVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<ConfirmerPaiementData, ConfirmerPaiementVariables>> execute() {
    return ref().execute();
  }

  MutationRef<ConfirmerPaiementData, ConfirmerPaiementVariables> ref() {
    ConfirmerPaiementVariables vars= ConfirmerPaiementVariables(id: id,);
    return _dataConnect.mutation("confirmerPaiement", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ConfirmerPaiementPaiementUpdate {
  final int id;
  ConfirmerPaiementPaiementUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ConfirmerPaiementPaiementUpdate otherTyped = other as ConfirmerPaiementPaiementUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  ConfirmerPaiementPaiementUpdate({
    required this.id,
  });
}

@immutable
class ConfirmerPaiementData {
  final ConfirmerPaiementPaiementUpdate? paiement_update;
  ConfirmerPaiementData.fromJson(dynamic json):
  
  paiement_update = json['paiement_update'] == null ? null : ConfirmerPaiementPaiementUpdate.fromJson(json['paiement_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ConfirmerPaiementData otherTyped = other as ConfirmerPaiementData;
    return paiement_update == otherTyped.paiement_update;
    
  }
  @override
  int get hashCode => paiement_update.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (paiement_update != null) {
      json['paiement_update'] = paiement_update!.toJson();
    }
    return json;
  }

  ConfirmerPaiementData({
    this.paiement_update,
  });
}

@immutable
class ConfirmerPaiementVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ConfirmerPaiementVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ConfirmerPaiementVariables otherTyped = other as ConfirmerPaiementVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  ConfirmerPaiementVariables({
    required this.id,
  });
}

