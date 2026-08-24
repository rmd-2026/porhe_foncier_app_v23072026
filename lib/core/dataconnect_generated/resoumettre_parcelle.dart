part of 'porhe_foncier23072026.dart';

class ResoumettreParcelleVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  ResoumettreParcelleVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<ResoumettreParcelleData> dataDeserializer = (dynamic json)  => ResoumettreParcelleData.fromJson(jsonDecode(json));
  Serializer<ResoumettreParcelleVariables> varsSerializer = (ResoumettreParcelleVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<ResoumettreParcelleData, ResoumettreParcelleVariables>> execute() {
    return ref().execute();
  }

  MutationRef<ResoumettreParcelleData, ResoumettreParcelleVariables> ref() {
    ResoumettreParcelleVariables vars= ResoumettreParcelleVariables(id: id,);
    return _dataConnect.mutation("resoumettreParcelle", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ResoumettreParcelleParcelleUpdate {
  final int id;
  ResoumettreParcelleParcelleUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ResoumettreParcelleParcelleUpdate otherTyped = other as ResoumettreParcelleParcelleUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  ResoumettreParcelleParcelleUpdate({
    required this.id,
  });
}

@immutable
class ResoumettreParcelleData {
  final ResoumettreParcelleParcelleUpdate? parcelle_update;
  ResoumettreParcelleData.fromJson(dynamic json):
  
  parcelle_update = json['parcelle_update'] == null ? null : ResoumettreParcelleParcelleUpdate.fromJson(json['parcelle_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ResoumettreParcelleData otherTyped = other as ResoumettreParcelleData;
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

  ResoumettreParcelleData({
    this.parcelle_update,
  });
}

@immutable
class ResoumettreParcelleVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ResoumettreParcelleVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ResoumettreParcelleVariables otherTyped = other as ResoumettreParcelleVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  ResoumettreParcelleVariables({
    required this.id,
  });
}

