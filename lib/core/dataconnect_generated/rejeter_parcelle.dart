part of 'porhe_foncier23072026.dart';

class RejeterParcelleVariablesBuilder {
  int id;
  String motifRejet;

  final FirebaseDataConnect _dataConnect;
  RejeterParcelleVariablesBuilder(this._dataConnect, {required  this.id,required  this.motifRejet,});
  Deserializer<RejeterParcelleData> dataDeserializer = (dynamic json)  => RejeterParcelleData.fromJson(jsonDecode(json));
  Serializer<RejeterParcelleVariables> varsSerializer = (RejeterParcelleVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<RejeterParcelleData, RejeterParcelleVariables>> execute() {
    return ref().execute();
  }

  MutationRef<RejeterParcelleData, RejeterParcelleVariables> ref() {
    RejeterParcelleVariables vars= RejeterParcelleVariables(id: id,motifRejet: motifRejet,);
    return _dataConnect.mutation("rejeterParcelle", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class RejeterParcelleParcelleUpdate {
  final int id;
  RejeterParcelleParcelleUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RejeterParcelleParcelleUpdate otherTyped = other as RejeterParcelleParcelleUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  RejeterParcelleParcelleUpdate({
    required this.id,
  });
}

@immutable
class RejeterParcelleData {
  final RejeterParcelleParcelleUpdate? parcelle_update;
  RejeterParcelleData.fromJson(dynamic json):
  
  parcelle_update = json['parcelle_update'] == null ? null : RejeterParcelleParcelleUpdate.fromJson(json['parcelle_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RejeterParcelleData otherTyped = other as RejeterParcelleData;
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

  RejeterParcelleData({
    this.parcelle_update,
  });
}

@immutable
class RejeterParcelleVariables {
  final int id;
  final String motifRejet;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  RejeterParcelleVariables.fromJson(Map<String, dynamic> json):
  
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

    final RejeterParcelleVariables otherTyped = other as RejeterParcelleVariables;
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

  RejeterParcelleVariables({
    required this.id,
    required this.motifRejet,
  });
}

