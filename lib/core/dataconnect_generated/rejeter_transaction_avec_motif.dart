part of 'porhe_foncier23072026.dart';

class RejeterTransactionAvecMotifVariablesBuilder {
  int id;
  String motifRejet;

  final FirebaseDataConnect _dataConnect;
  RejeterTransactionAvecMotifVariablesBuilder(this._dataConnect, {required  this.id,required  this.motifRejet,});
  Deserializer<RejeterTransactionAvecMotifData> dataDeserializer = (dynamic json)  => RejeterTransactionAvecMotifData.fromJson(jsonDecode(json));
  Serializer<RejeterTransactionAvecMotifVariables> varsSerializer = (RejeterTransactionAvecMotifVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<RejeterTransactionAvecMotifData, RejeterTransactionAvecMotifVariables>> execute() {
    return ref().execute();
  }

  MutationRef<RejeterTransactionAvecMotifData, RejeterTransactionAvecMotifVariables> ref() {
    RejeterTransactionAvecMotifVariables vars= RejeterTransactionAvecMotifVariables(id: id,motifRejet: motifRejet,);
    return _dataConnect.mutation("rejeterTransactionAvecMotif", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class RejeterTransactionAvecMotifTransactionFonciereUpdate {
  final int id;
  RejeterTransactionAvecMotifTransactionFonciereUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RejeterTransactionAvecMotifTransactionFonciereUpdate otherTyped = other as RejeterTransactionAvecMotifTransactionFonciereUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  RejeterTransactionAvecMotifTransactionFonciereUpdate({
    required this.id,
  });
}

@immutable
class RejeterTransactionAvecMotifData {
  final RejeterTransactionAvecMotifTransactionFonciereUpdate? transactionFonciere_update;
  RejeterTransactionAvecMotifData.fromJson(dynamic json):
  
  transactionFonciere_update = json['transactionFonciere_update'] == null ? null : RejeterTransactionAvecMotifTransactionFonciereUpdate.fromJson(json['transactionFonciere_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RejeterTransactionAvecMotifData otherTyped = other as RejeterTransactionAvecMotifData;
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

  RejeterTransactionAvecMotifData({
    this.transactionFonciere_update,
  });
}

@immutable
class RejeterTransactionAvecMotifVariables {
  final int id;
  final String motifRejet;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  RejeterTransactionAvecMotifVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']),
  motifRejet = nativeFromJson<String>(json['motifRejet']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RejeterTransactionAvecMotifVariables otherTyped = other as RejeterTransactionAvecMotifVariables;
    return id == otherTyped.id && 
    motifRejet == otherTyped.motifRejet;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, motifRejet.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['motifRejet'] = nativeToJson<String>(motifRejet);
    return json;
  }

  RejeterTransactionAvecMotifVariables({
    required this.id,
    required this.motifRejet,
  });
}

