part of 'porhe_foncier23072026.dart';

class SupprimerParcelleVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  SupprimerParcelleVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<SupprimerParcelleData> dataDeserializer = (dynamic json)  => SupprimerParcelleData.fromJson(jsonDecode(json));
  Serializer<SupprimerParcelleVariables> varsSerializer = (SupprimerParcelleVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<SupprimerParcelleData, SupprimerParcelleVariables>> execute() {
    return ref().execute();
  }

  MutationRef<SupprimerParcelleData, SupprimerParcelleVariables> ref() {
    SupprimerParcelleVariables vars= SupprimerParcelleVariables(id: id,);
    return _dataConnect.mutation("supprimerParcelle", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class SupprimerParcelleParcelleDelete {
  final int id;
  SupprimerParcelleParcelleDelete.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SupprimerParcelleParcelleDelete otherTyped = other as SupprimerParcelleParcelleDelete;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  SupprimerParcelleParcelleDelete({
    required this.id,
  });
}

@immutable
class SupprimerParcelleData {
  final SupprimerParcelleParcelleDelete? parcelle_delete;
  SupprimerParcelleData.fromJson(dynamic json):
  
  parcelle_delete = json['parcelle_delete'] == null ? null : SupprimerParcelleParcelleDelete.fromJson(json['parcelle_delete']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SupprimerParcelleData otherTyped = other as SupprimerParcelleData;
    return parcelle_delete == otherTyped.parcelle_delete;
    
  }
  @override
  int get hashCode => parcelle_delete.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (parcelle_delete != null) {
      json['parcelle_delete'] = parcelle_delete!.toJson();
    }
    return json;
  }

  SupprimerParcelleData({
    this.parcelle_delete,
  });
}

@immutable
class SupprimerParcelleVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  SupprimerParcelleVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SupprimerParcelleVariables otherTyped = other as SupprimerParcelleVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  SupprimerParcelleVariables({
    required this.id,
  });
}

