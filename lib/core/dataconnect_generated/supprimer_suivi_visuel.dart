part of 'porhe_foncier23072026.dart';

class SupprimerSuiviVisuelVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  SupprimerSuiviVisuelVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<SupprimerSuiviVisuelData> dataDeserializer = (dynamic json)  => SupprimerSuiviVisuelData.fromJson(jsonDecode(json));
  Serializer<SupprimerSuiviVisuelVariables> varsSerializer = (SupprimerSuiviVisuelVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<SupprimerSuiviVisuelData, SupprimerSuiviVisuelVariables>> execute() {
    return ref().execute();
  }

  MutationRef<SupprimerSuiviVisuelData, SupprimerSuiviVisuelVariables> ref() {
    SupprimerSuiviVisuelVariables vars= SupprimerSuiviVisuelVariables(id: id,);
    return _dataConnect.mutation("supprimerSuiviVisuel", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class SupprimerSuiviVisuelSuiviVisuelDelete {
  final int id;
  SupprimerSuiviVisuelSuiviVisuelDelete.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SupprimerSuiviVisuelSuiviVisuelDelete otherTyped = other as SupprimerSuiviVisuelSuiviVisuelDelete;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  SupprimerSuiviVisuelSuiviVisuelDelete({
    required this.id,
  });
}

@immutable
class SupprimerSuiviVisuelData {
  final SupprimerSuiviVisuelSuiviVisuelDelete? suiviVisuel_delete;
  SupprimerSuiviVisuelData.fromJson(dynamic json):
  
  suiviVisuel_delete = json['suiviVisuel_delete'] == null ? null : SupprimerSuiviVisuelSuiviVisuelDelete.fromJson(json['suiviVisuel_delete']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SupprimerSuiviVisuelData otherTyped = other as SupprimerSuiviVisuelData;
    return suiviVisuel_delete == otherTyped.suiviVisuel_delete;
    
  }
  @override
  int get hashCode => suiviVisuel_delete.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (suiviVisuel_delete != null) {
      json['suiviVisuel_delete'] = suiviVisuel_delete!.toJson();
    }
    return json;
  }

  SupprimerSuiviVisuelData({
    this.suiviVisuel_delete,
  });
}

@immutable
class SupprimerSuiviVisuelVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  SupprimerSuiviVisuelVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SupprimerSuiviVisuelVariables otherTyped = other as SupprimerSuiviVisuelVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  SupprimerSuiviVisuelVariables({
    required this.id,
  });
}

