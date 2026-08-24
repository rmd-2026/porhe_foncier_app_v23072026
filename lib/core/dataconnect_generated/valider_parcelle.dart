part of 'porhe_foncier23072026.dart';

class ValiderParcelleVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  ValiderParcelleVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<ValiderParcelleData> dataDeserializer = (dynamic json)  => ValiderParcelleData.fromJson(jsonDecode(json));
  Serializer<ValiderParcelleVariables> varsSerializer = (ValiderParcelleVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<ValiderParcelleData, ValiderParcelleVariables>> execute() {
    return ref().execute();
  }

  MutationRef<ValiderParcelleData, ValiderParcelleVariables> ref() {
    ValiderParcelleVariables vars= ValiderParcelleVariables(id: id,);
    return _dataConnect.mutation("validerParcelle", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ValiderParcelleParcelleUpdate {
  final int id;
  ValiderParcelleParcelleUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ValiderParcelleParcelleUpdate otherTyped = other as ValiderParcelleParcelleUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  ValiderParcelleParcelleUpdate({
    required this.id,
  });
}

@immutable
class ValiderParcelleData {
  final ValiderParcelleParcelleUpdate? parcelle_update;
  ValiderParcelleData.fromJson(dynamic json):
  
  parcelle_update = json['parcelle_update'] == null ? null : ValiderParcelleParcelleUpdate.fromJson(json['parcelle_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ValiderParcelleData otherTyped = other as ValiderParcelleData;
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

  ValiderParcelleData({
    this.parcelle_update,
  });
}

@immutable
class ValiderParcelleVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ValiderParcelleVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ValiderParcelleVariables otherTyped = other as ValiderParcelleVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  ValiderParcelleVariables({
    required this.id,
  });
}

