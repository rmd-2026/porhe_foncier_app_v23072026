part of 'porhe_foncier23072026.dart';

class ResoumettreTransactionVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  ResoumettreTransactionVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<ResoumettreTransactionData> dataDeserializer = (dynamic json)  => ResoumettreTransactionData.fromJson(jsonDecode(json));
  Serializer<ResoumettreTransactionVariables> varsSerializer = (ResoumettreTransactionVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<ResoumettreTransactionData, ResoumettreTransactionVariables>> execute() {
    return ref().execute();
  }

  MutationRef<ResoumettreTransactionData, ResoumettreTransactionVariables> ref() {
    ResoumettreTransactionVariables vars= ResoumettreTransactionVariables(id: id,);
    return _dataConnect.mutation("resoumettreTransaction", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ResoumettreTransactionTransactionFonciereUpdate {
  final int id;
  ResoumettreTransactionTransactionFonciereUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ResoumettreTransactionTransactionFonciereUpdate otherTyped = other as ResoumettreTransactionTransactionFonciereUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  ResoumettreTransactionTransactionFonciereUpdate({
    required this.id,
  });
}

@immutable
class ResoumettreTransactionData {
  final ResoumettreTransactionTransactionFonciereUpdate? transactionFonciere_update;
  ResoumettreTransactionData.fromJson(dynamic json):
  
  transactionFonciere_update = json['transactionFonciere_update'] == null ? null : ResoumettreTransactionTransactionFonciereUpdate.fromJson(json['transactionFonciere_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ResoumettreTransactionData otherTyped = other as ResoumettreTransactionData;
    return transactionFonciere_update == otherTyped.transactionFonciere_update;
    
  }
  @override
  int get hashCode => transactionFonciere_update.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (transactionFonciere_update != null) {
      json['transactionFonciere_update'] = transactionFonciere_update!.toJson();
    }
    return json;
  }

  ResoumettreTransactionData({
    this.transactionFonciere_update,
  });
}

@immutable
class ResoumettreTransactionVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ResoumettreTransactionVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ResoumettreTransactionVariables otherTyped = other as ResoumettreTransactionVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  ResoumettreTransactionVariables({
    required this.id,
  });
}

