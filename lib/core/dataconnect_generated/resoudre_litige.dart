part of 'porhe_foncier23072026.dart';

class ResoudreLitigeVariablesBuilder {
  int id;
  String resolution;

  final FirebaseDataConnect _dataConnect;
  ResoudreLitigeVariablesBuilder(this._dataConnect, {required  this.id,required  this.resolution,});
  Deserializer<ResoudreLitigeData> dataDeserializer = (dynamic json)  => ResoudreLitigeData.fromJson(jsonDecode(json));
  Serializer<ResoudreLitigeVariables> varsSerializer = (ResoudreLitigeVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<ResoudreLitigeData, ResoudreLitigeVariables>> execute() {
    return ref().execute();
  }

  MutationRef<ResoudreLitigeData, ResoudreLitigeVariables> ref() {
    ResoudreLitigeVariables vars= ResoudreLitigeVariables(id: id,resolution: resolution,);
    return _dataConnect.mutation("resoudreLitige", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ResoudreLitigeLitigeUpdate {
  final int id;
  ResoudreLitigeLitigeUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ResoudreLitigeLitigeUpdate otherTyped = other as ResoudreLitigeLitigeUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  ResoudreLitigeLitigeUpdate({
    required this.id,
  });
}

@immutable
class ResoudreLitigeData {
  final ResoudreLitigeLitigeUpdate? litige_update;
  ResoudreLitigeData.fromJson(dynamic json):
  
  litige_update = json['litige_update'] == null ? null : ResoudreLitigeLitigeUpdate.fromJson(json['litige_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ResoudreLitigeData otherTyped = other as ResoudreLitigeData;
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

  ResoudreLitigeData({
    this.litige_update,
  });
}

@immutable
class ResoudreLitigeVariables {
  final int id;
  final String resolution;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ResoudreLitigeVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']),
  resolution = nativeFromJson<String>(json['resolution']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ResoudreLitigeVariables otherTyped = other as ResoudreLitigeVariables;
    return id == otherTyped.id && 
    resolution == otherTyped.resolution;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, resolution.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['resolution'] = nativeToJson<String>(resolution);
    return json;
  }

  ResoudreLitigeVariables({
    required this.id,
    required this.resolution,
  });
}

