part of 'porhe_foncier23072026.dart';

class PasserLitigeEnExamenVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  PasserLitigeEnExamenVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<PasserLitigeEnExamenData> dataDeserializer = (dynamic json)  => PasserLitigeEnExamenData.fromJson(jsonDecode(json));
  Serializer<PasserLitigeEnExamenVariables> varsSerializer = (PasserLitigeEnExamenVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<PasserLitigeEnExamenData, PasserLitigeEnExamenVariables>> execute() {
    return ref().execute();
  }

  MutationRef<PasserLitigeEnExamenData, PasserLitigeEnExamenVariables> ref() {
    PasserLitigeEnExamenVariables vars= PasserLitigeEnExamenVariables(id: id,);
    return _dataConnect.mutation("passerLitigeEnExamen", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class PasserLitigeEnExamenLitigeUpdate {
  final int id;
  PasserLitigeEnExamenLitigeUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final PasserLitigeEnExamenLitigeUpdate otherTyped = other as PasserLitigeEnExamenLitigeUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  PasserLitigeEnExamenLitigeUpdate({
    required this.id,
  });
}

@immutable
class PasserLitigeEnExamenData {
  final PasserLitigeEnExamenLitigeUpdate? litige_update;
  PasserLitigeEnExamenData.fromJson(dynamic json):
  
  litige_update = json['litige_update'] == null ? null : PasserLitigeEnExamenLitigeUpdate.fromJson(json['litige_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final PasserLitigeEnExamenData otherTyped = other as PasserLitigeEnExamenData;
    return litige_update == otherTyped.litige_update;
    
  }
  @override
  int get hashCode => litige_update.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (litige_update != null) {
      json['litige_update'] = litige_update!.toJson();
    }
    return json;
  }

  PasserLitigeEnExamenData({
    this.litige_update,
  });
}

@immutable
class PasserLitigeEnExamenVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  PasserLitigeEnExamenVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final PasserLitigeEnExamenVariables otherTyped = other as PasserLitigeEnExamenVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  PasserLitigeEnExamenVariables({
    required this.id,
  });
}

