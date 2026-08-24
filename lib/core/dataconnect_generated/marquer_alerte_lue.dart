part of 'porhe_foncier23072026.dart';

class MarquerAlerteLueVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  MarquerAlerteLueVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<MarquerAlerteLueData> dataDeserializer = (dynamic json)  => MarquerAlerteLueData.fromJson(jsonDecode(json));
  Serializer<MarquerAlerteLueVariables> varsSerializer = (MarquerAlerteLueVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<MarquerAlerteLueData, MarquerAlerteLueVariables>> execute() {
    return ref().execute();
  }

  MutationRef<MarquerAlerteLueData, MarquerAlerteLueVariables> ref() {
    MarquerAlerteLueVariables vars= MarquerAlerteLueVariables(id: id,);
    return _dataConnect.mutation("marquerAlerteLue", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class MarquerAlerteLueAlerteUpdate {
  final int id;
  MarquerAlerteLueAlerteUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MarquerAlerteLueAlerteUpdate otherTyped = other as MarquerAlerteLueAlerteUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  MarquerAlerteLueAlerteUpdate({
    required this.id,
  });
}

@immutable
class MarquerAlerteLueData {
  final MarquerAlerteLueAlerteUpdate? alerte_update;
  MarquerAlerteLueData.fromJson(dynamic json):
  
  alerte_update = json['alerte_update'] == null ? null : MarquerAlerteLueAlerteUpdate.fromJson(json['alerte_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MarquerAlerteLueData otherTyped = other as MarquerAlerteLueData;
    return alerte_update == otherTyped.alerte_update;
    
  }
  @override
  int get hashCode => alerte_update.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (alerte_update != null) {
      json['alerte_update'] = alerte_update!.toJson();
    }
    return json;
  }

  MarquerAlerteLueData({
    this.alerte_update,
  });
}

@immutable
class MarquerAlerteLueVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  MarquerAlerteLueVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MarquerAlerteLueVariables otherTyped = other as MarquerAlerteLueVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  MarquerAlerteLueVariables({
    required this.id,
  });
}

