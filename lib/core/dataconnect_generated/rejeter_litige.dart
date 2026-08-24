part of 'porhe_foncier23072026.dart';

class RejeterLitigeVariablesBuilder {
  int id;
  String resolution;

  final FirebaseDataConnect _dataConnect;
  RejeterLitigeVariablesBuilder(this._dataConnect, {required  this.id,required  this.resolution,});
  Deserializer<RejeterLitigeData> dataDeserializer = (dynamic json)  => RejeterLitigeData.fromJson(jsonDecode(json));
  Serializer<RejeterLitigeVariables> varsSerializer = (RejeterLitigeVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<RejeterLitigeData, RejeterLitigeVariables>> execute() {
    return ref().execute();
  }

  MutationRef<RejeterLitigeData, RejeterLitigeVariables> ref() {
    RejeterLitigeVariables vars= RejeterLitigeVariables(id: id,resolution: resolution,);
    return _dataConnect.mutation("rejeterLitige", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class RejeterLitigeLitigeUpdate {
  final int id;
  RejeterLitigeLitigeUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RejeterLitigeLitigeUpdate otherTyped = other as RejeterLitigeLitigeUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  RejeterLitigeLitigeUpdate({
    required this.id,
  });
}

@immutable
class RejeterLitigeData {
  final RejeterLitigeLitigeUpdate? litige_update;
  RejeterLitigeData.fromJson(dynamic json):
  
  litige_update = json['litige_update'] == null ? null : RejeterLitigeLitigeUpdate.fromJson(json['litige_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RejeterLitigeData otherTyped = other as RejeterLitigeData;
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

  RejeterLitigeData({
    this.litige_update,
  });
}

@immutable
class RejeterLitigeVariables {
  final int id;
  final String resolution;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  RejeterLitigeVariables.fromJson(Map<String, dynamic> json):
  
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

    final RejeterLitigeVariables otherTyped = other as RejeterLitigeVariables;
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

  RejeterLitigeVariables({
    required this.id,
    required this.resolution,
  });
}

