part of 'porhe_foncier23072026.dart';

class RejeterParcelleAvecMotifVariablesBuilder {
  int id;
  String motifRejet;

  final FirebaseDataConnect _dataConnect;
  RejeterParcelleAvecMotifVariablesBuilder(this._dataConnect, {required  this.id,required  this.motifRejet,});
  Deserializer<RejeterParcelleAvecMotifData> dataDeserializer = (dynamic json)  => RejeterParcelleAvecMotifData.fromJson(jsonDecode(json));
  Serializer<RejeterParcelleAvecMotifVariables> varsSerializer = (RejeterParcelleAvecMotifVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<RejeterParcelleAvecMotifData, RejeterParcelleAvecMotifVariables>> execute() {
    return ref().execute();
  }

  MutationRef<RejeterParcelleAvecMotifData, RejeterParcelleAvecMotifVariables> ref() {
    RejeterParcelleAvecMotifVariables vars= RejeterParcelleAvecMotifVariables(id: id,motifRejet: motifRejet,);
    return _dataConnect.mutation("rejeterParcelleAvecMotif", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class RejeterParcelleAvecMotifParcelleUpdate {
  final int id;
  RejeterParcelleAvecMotifParcelleUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RejeterParcelleAvecMotifParcelleUpdate otherTyped = other as RejeterParcelleAvecMotifParcelleUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  RejeterParcelleAvecMotifParcelleUpdate({
    required this.id,
  });
}

@immutable
class RejeterParcelleAvecMotifData {
  final RejeterParcelleAvecMotifParcelleUpdate? parcelle_update;
  RejeterParcelleAvecMotifData.fromJson(dynamic json):
  
  parcelle_update = json['parcelle_update'] == null ? null : RejeterParcelleAvecMotifParcelleUpdate.fromJson(json['parcelle_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RejeterParcelleAvecMotifData otherTyped = other as RejeterParcelleAvecMotifData;
    return parcelle_update == otherTyped.parcelle_update;
    
  }
  @override
  int get hashCode => parcelle_update.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (parcelle_update != null) {
      json['parcelle_update'] = parcelle_update!.toJson();
    }
    return json;
  }

  RejeterParcelleAvecMotifData({
    this.parcelle_update,
  });
}

@immutable
class RejeterParcelleAvecMotifVariables {
  final int id;
  final String motifRejet;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  RejeterParcelleAvecMotifVariables.fromJson(Map<String, dynamic> json):
  
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

    final RejeterParcelleAvecMotifVariables otherTyped = other as RejeterParcelleAvecMotifVariables;
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

  RejeterParcelleAvecMotifVariables({
    required this.id,
    required this.motifRejet,
  });
}

