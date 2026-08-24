part of 'porhe_foncier23072026.dart';

class SupprimerAlerteVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  SupprimerAlerteVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<SupprimerAlerteData> dataDeserializer = (dynamic json)  => SupprimerAlerteData.fromJson(jsonDecode(json));
  Serializer<SupprimerAlerteVariables> varsSerializer = (SupprimerAlerteVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<SupprimerAlerteData, SupprimerAlerteVariables>> execute() {
    return ref().execute();
  }

  MutationRef<SupprimerAlerteData, SupprimerAlerteVariables> ref() {
    SupprimerAlerteVariables vars= SupprimerAlerteVariables(id: id,);
    return _dataConnect.mutation("supprimerAlerte", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class SupprimerAlerteAlerteDelete {
  final int id;
  SupprimerAlerteAlerteDelete.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SupprimerAlerteAlerteDelete otherTyped = other as SupprimerAlerteAlerteDelete;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  SupprimerAlerteAlerteDelete({
    required this.id,
  });
}

@immutable
class SupprimerAlerteData {
  final SupprimerAlerteAlerteDelete? alerte_delete;
  SupprimerAlerteData.fromJson(dynamic json):
  
  alerte_delete = json['alerte_delete'] == null ? null : SupprimerAlerteAlerteDelete.fromJson(json['alerte_delete']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SupprimerAlerteData otherTyped = other as SupprimerAlerteData;
    return alerte_delete == otherTyped.alerte_delete;
    
  }
  @override
  int get hashCode => alerte_delete.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (alerte_delete != null) {
      json['alerte_delete'] = alerte_delete!.toJson();
    }
    return json;
  }

  SupprimerAlerteData({
    this.alerte_delete,
  });
}

@immutable
class SupprimerAlerteVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  SupprimerAlerteVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SupprimerAlerteVariables otherTyped = other as SupprimerAlerteVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  SupprimerAlerteVariables({
    required this.id,
  });
}

