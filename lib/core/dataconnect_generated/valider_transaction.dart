part of 'porhe_foncier23072026.dart';

class ValiderTransactionVariablesBuilder {
  int id;
  int parcelleId;
  int nouveauUtilisateurId;

  final FirebaseDataConnect _dataConnect;
  ValiderTransactionVariablesBuilder(this._dataConnect, {required  this.id,required  this.parcelleId,required  this.nouveauUtilisateurId,});
  Deserializer<ValiderTransactionData> dataDeserializer = (dynamic json)  => ValiderTransactionData.fromJson(jsonDecode(json));
  Serializer<ValiderTransactionVariables> varsSerializer = (ValiderTransactionVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<ValiderTransactionData, ValiderTransactionVariables>> execute() {
    return ref().execute();
  }

  MutationRef<ValiderTransactionData, ValiderTransactionVariables> ref() {
    ValiderTransactionVariables vars= ValiderTransactionVariables(id: id,parcelleId: parcelleId,nouveauUtilisateurId: nouveauUtilisateurId,);
    return _dataConnect.mutation("validerTransaction", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ValiderTransactionTransactionFonciereUpdate {
  final int id;
  ValiderTransactionTransactionFonciereUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ValiderTransactionTransactionFonciereUpdate otherTyped = other as ValiderTransactionTransactionFonciereUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  ValiderTransactionTransactionFonciereUpdate({
    required this.id,
  });
}

@immutable
class ValiderTransactionParcelleUpdate {
  final int id;
  ValiderTransactionParcelleUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ValiderTransactionParcelleUpdate otherTyped = other as ValiderTransactionParcelleUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  ValiderTransactionParcelleUpdate({
    required this.id,
  });
}

@immutable
class ValiderTransactionData {
  final ValiderTransactionTransactionFonciereUpdate? transactionFonciere_update;
  final ValiderTransactionParcelleUpdate? parcelle_update;
  ValiderTransactionData.fromJson(dynamic json):
  
  transactionFonciere_update = json['transactionFonciere_update'] == null ? null : ValiderTransactionTransactionFonciereUpdate.fromJson(json['transactionFonciere_update']),
  parcelle_update = json['parcelle_update'] == null ? null : ValiderTransactionParcelleUpdate.fromJson(json['parcelle_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ValiderTransactionData otherTyped = other as ValiderTransactionData;
    return transactionFonciere_update == otherTyped.transactionFonciere_update && 
    parcelle_update == otherTyped.parcelle_update;
    
  }
  @override
  int get hashCode => Object.hashAll([transactionFonciere_update.hashCode, parcelle_update.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (transactionFonciere_update != null) {
      json['transactionFonciere_update'] = transactionFonciere_update!.toJson();
    }
    if (parcelle_update != null) {
      json['parcelle_update'] = parcelle_update!.toJson();
    }
    return json;
  }

  ValiderTransactionData({
    this.transactionFonciere_update,
    this.parcelle_update,
  });
}

@immutable
class ValiderTransactionVariables {
  final int id;
  final int parcelleId;
  final int nouveauUtilisateurId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ValiderTransactionVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']),
  parcelleId = nativeFromJson<int>(json['parcelleId']),
  nouveauUtilisateurId = nativeFromJson<int>(json['nouveauUtilisateurId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ValiderTransactionVariables otherTyped = other as ValiderTransactionVariables;
    return id == otherTyped.id && 
    parcelleId == otherTyped.parcelleId && 
    nouveauUtilisateurId == otherTyped.nouveauUtilisateurId;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, parcelleId.hashCode, nouveauUtilisateurId.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    json['nouveauUtilisateurId'] = nativeToJson<int>(nouveauUtilisateurId);
    return json;
  }

  ValiderTransactionVariables({
    required this.id,
    required this.parcelleId,
    required this.nouveauUtilisateurId,
  });
}

