part of 'porhe_foncier23072026.dart';

class AnnulerPaiementVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  AnnulerPaiementVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<AnnulerPaiementData> dataDeserializer = (dynamic json)  => AnnulerPaiementData.fromJson(jsonDecode(json));
  Serializer<AnnulerPaiementVariables> varsSerializer = (AnnulerPaiementVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<AnnulerPaiementData, AnnulerPaiementVariables>> execute() {
    return ref().execute();
  }

  MutationRef<AnnulerPaiementData, AnnulerPaiementVariables> ref() {
    AnnulerPaiementVariables vars= AnnulerPaiementVariables(id: id,);
    return _dataConnect.mutation("annulerPaiement", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class AnnulerPaiementPaiementUpdate {
  final int id;
  AnnulerPaiementPaiementUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AnnulerPaiementPaiementUpdate otherTyped = other as AnnulerPaiementPaiementUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  AnnulerPaiementPaiementUpdate({
    required this.id,
  });
}

@immutable
class AnnulerPaiementData {
  final AnnulerPaiementPaiementUpdate? paiement_update;
  AnnulerPaiementData.fromJson(dynamic json):
  
  paiement_update = json['paiement_update'] == null ? null : AnnulerPaiementPaiementUpdate.fromJson(json['paiement_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AnnulerPaiementData otherTyped = other as AnnulerPaiementData;
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

  AnnulerPaiementData({
    this.paiement_update,
  });
}

@immutable
class AnnulerPaiementVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  AnnulerPaiementVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AnnulerPaiementVariables otherTyped = other as AnnulerPaiementVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  AnnulerPaiementVariables({
    required this.id,
  });
}

