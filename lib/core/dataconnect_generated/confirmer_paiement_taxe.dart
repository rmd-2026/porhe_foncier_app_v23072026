part of 'porhe_foncier23072026.dart';

class ConfirmerPaiementTaxeVariablesBuilder {
  int id;
  int taxeFonciereId;

  final FirebaseDataConnect _dataConnect;
  ConfirmerPaiementTaxeVariablesBuilder(this._dataConnect, {required  this.id,required  this.taxeFonciereId,});
  Deserializer<ConfirmerPaiementTaxeData> dataDeserializer = (dynamic json)  => ConfirmerPaiementTaxeData.fromJson(jsonDecode(json));
  Serializer<ConfirmerPaiementTaxeVariables> varsSerializer = (ConfirmerPaiementTaxeVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<ConfirmerPaiementTaxeData, ConfirmerPaiementTaxeVariables>> execute() {
    return ref().execute();
  }

  MutationRef<ConfirmerPaiementTaxeData, ConfirmerPaiementTaxeVariables> ref() {
    ConfirmerPaiementTaxeVariables vars= ConfirmerPaiementTaxeVariables(id: id,taxeFonciereId: taxeFonciereId,);
    return _dataConnect.mutation("confirmerPaiementTaxe", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ConfirmerPaiementTaxePaiementUpdate {
  final int id;
  ConfirmerPaiementTaxePaiementUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ConfirmerPaiementTaxePaiementUpdate otherTyped = other as ConfirmerPaiementTaxePaiementUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  ConfirmerPaiementTaxePaiementUpdate({
    required this.id,
  });
}

@immutable
class ConfirmerPaiementTaxeTaxeFonciereUpdate {
  final int id;
  ConfirmerPaiementTaxeTaxeFonciereUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ConfirmerPaiementTaxeTaxeFonciereUpdate otherTyped = other as ConfirmerPaiementTaxeTaxeFonciereUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  ConfirmerPaiementTaxeTaxeFonciereUpdate({
    required this.id,
  });
}

@immutable
class ConfirmerPaiementTaxeData {
  final ConfirmerPaiementTaxePaiementUpdate? paiement_update;
  final ConfirmerPaiementTaxeTaxeFonciereUpdate? taxeFonciere_update;
  ConfirmerPaiementTaxeData.fromJson(dynamic json):
  
  paiement_update = json['paiement_update'] == null ? null : ConfirmerPaiementTaxePaiementUpdate.fromJson(json['paiement_update']),
  taxeFonciere_update = json['taxeFonciere_update'] == null ? null : ConfirmerPaiementTaxeTaxeFonciereUpdate.fromJson(json['taxeFonciere_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ConfirmerPaiementTaxeData otherTyped = other as ConfirmerPaiementTaxeData;
    return paiement_update == otherTyped.paiement_update && 
    taxeFonciere_update == otherTyped.taxeFonciere_update;
    
  }
  @override
  int get hashCode => Object.hashAll([paiement_update.hashCode, taxeFonciere_update.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (paiement_update != null) {
      json['paiement_update'] = paiement_update!.toJson();
    }
    if (taxeFonciere_update != null) {
      json['taxeFonciere_update'] = taxeFonciere_update!.toJson();
    }
    return json;
  }

  ConfirmerPaiementTaxeData({
    this.paiement_update,
    this.taxeFonciere_update,
  });
}

@immutable
class ConfirmerPaiementTaxeVariables {
  final int id;
  final int taxeFonciereId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ConfirmerPaiementTaxeVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']),
  taxeFonciereId = nativeFromJson<int>(json['taxeFonciereId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ConfirmerPaiementTaxeVariables otherTyped = other as ConfirmerPaiementTaxeVariables;
    return id == otherTyped.id && 
    taxeFonciereId == otherTyped.taxeFonciereId;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, taxeFonciereId.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['taxeFonciereId'] = nativeToJson<int>(taxeFonciereId);
    return json;
  }

  ConfirmerPaiementTaxeVariables({
    required this.id,
    required this.taxeFonciereId,
  });
}

