part of 'porhe_foncier23072026.dart';

class SupprimerLitigeVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  SupprimerLitigeVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<SupprimerLitigeData> dataDeserializer = (dynamic json)  => SupprimerLitigeData.fromJson(jsonDecode(json));
  Serializer<SupprimerLitigeVariables> varsSerializer = (SupprimerLitigeVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<SupprimerLitigeData, SupprimerLitigeVariables>> execute() {
    return ref().execute();
  }

  MutationRef<SupprimerLitigeData, SupprimerLitigeVariables> ref() {
    SupprimerLitigeVariables vars= SupprimerLitigeVariables(id: id,);
    return _dataConnect.mutation("supprimerLitige", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class SupprimerLitigeLitigeDelete {
  final int id;
  SupprimerLitigeLitigeDelete.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SupprimerLitigeLitigeDelete otherTyped = other as SupprimerLitigeLitigeDelete;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  SupprimerLitigeLitigeDelete({
    required this.id,
  });
}

@immutable
class SupprimerLitigeData {
  final SupprimerLitigeLitigeDelete? litige_delete;
  SupprimerLitigeData.fromJson(dynamic json):
  
  litige_delete = json['litige_delete'] == null ? null : SupprimerLitigeLitigeDelete.fromJson(json['litige_delete']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SupprimerLitigeData otherTyped = other as SupprimerLitigeData;
    return litige_delete == otherTyped.litige_delete;
    
  }
  @override
  int get hashCode => litige_delete.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (litige_delete != null) {
      json['litige_delete'] = litige_delete!.toJson();
    }
    return json;
  }

  SupprimerLitigeData({
    this.litige_delete,
  });
}

@immutable
class SupprimerLitigeVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  SupprimerLitigeVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SupprimerLitigeVariables otherTyped = other as SupprimerLitigeVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  SupprimerLitigeVariables({
    required this.id,
  });
}

