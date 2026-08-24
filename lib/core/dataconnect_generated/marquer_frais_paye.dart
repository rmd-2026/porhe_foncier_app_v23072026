part of 'porhe_foncier23072026.dart';

class MarquerFraisPayeVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  MarquerFraisPayeVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<MarquerFraisPayeData> dataDeserializer = (dynamic json)  => MarquerFraisPayeData.fromJson(jsonDecode(json));
  Serializer<MarquerFraisPayeVariables> varsSerializer = (MarquerFraisPayeVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<MarquerFraisPayeData, MarquerFraisPayeVariables>> execute() {
    return ref().execute();
  }

  MutationRef<MarquerFraisPayeData, MarquerFraisPayeVariables> ref() {
    MarquerFraisPayeVariables vars= MarquerFraisPayeVariables(id: id,);
    return _dataConnect.mutation("marquerFraisPaye", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class MarquerFraisPayeFraisEnregistrementUpdate {
  final int id;
  MarquerFraisPayeFraisEnregistrementUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MarquerFraisPayeFraisEnregistrementUpdate otherTyped = other as MarquerFraisPayeFraisEnregistrementUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  MarquerFraisPayeFraisEnregistrementUpdate({
    required this.id,
  });
}

@immutable
class MarquerFraisPayeData {
  final MarquerFraisPayeFraisEnregistrementUpdate? fraisEnregistrement_update;
  MarquerFraisPayeData.fromJson(dynamic json):
  
  fraisEnregistrement_update = json['fraisEnregistrement_update'] == null ? null : MarquerFraisPayeFraisEnregistrementUpdate.fromJson(json['fraisEnregistrement_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MarquerFraisPayeData otherTyped = other as MarquerFraisPayeData;
    return fraisEnregistrement_update == otherTyped.fraisEnregistrement_update;
    
  }
  @override
  int get hashCode => fraisEnregistrement_update.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (fraisEnregistrement_update != null) {
      json['fraisEnregistrement_update'] = fraisEnregistrement_update!.toJson();
    }
    return json;
  }

  MarquerFraisPayeData({
    this.fraisEnregistrement_update,
  });
}

@immutable
class MarquerFraisPayeVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  MarquerFraisPayeVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MarquerFraisPayeVariables otherTyped = other as MarquerFraisPayeVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  MarquerFraisPayeVariables({
    required this.id,
  });
}

