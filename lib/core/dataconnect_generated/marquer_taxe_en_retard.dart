part of 'porhe_foncier23072026.dart';

class MarquerTaxeEnRetardVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  MarquerTaxeEnRetardVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<MarquerTaxeEnRetardData> dataDeserializer = (dynamic json)  => MarquerTaxeEnRetardData.fromJson(jsonDecode(json));
  Serializer<MarquerTaxeEnRetardVariables> varsSerializer = (MarquerTaxeEnRetardVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<MarquerTaxeEnRetardData, MarquerTaxeEnRetardVariables>> execute() {
    return ref().execute();
  }

  MutationRef<MarquerTaxeEnRetardData, MarquerTaxeEnRetardVariables> ref() {
    MarquerTaxeEnRetardVariables vars= MarquerTaxeEnRetardVariables(id: id,);
    return _dataConnect.mutation("marquerTaxeEnRetard", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class MarquerTaxeEnRetardTaxeFonciereUpdate {
  final int id;
  MarquerTaxeEnRetardTaxeFonciereUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MarquerTaxeEnRetardTaxeFonciereUpdate otherTyped = other as MarquerTaxeEnRetardTaxeFonciereUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  MarquerTaxeEnRetardTaxeFonciereUpdate({
    required this.id,
  });
}

@immutable
class MarquerTaxeEnRetardData {
  final MarquerTaxeEnRetardTaxeFonciereUpdate? taxeFonciere_update;
  MarquerTaxeEnRetardData.fromJson(dynamic json):
  
  taxeFonciere_update = json['taxeFonciere_update'] == null ? null : MarquerTaxeEnRetardTaxeFonciereUpdate.fromJson(json['taxeFonciere_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MarquerTaxeEnRetardData otherTyped = other as MarquerTaxeEnRetardData;
    return taxeFonciere_update == otherTyped.taxeFonciere_update;
    
  }
  @override
  int get hashCode => taxeFonciere_update.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (taxeFonciere_update != null) {
      json['taxeFonciere_update'] = taxeFonciere_update!.toJson();
    }
    return json;
  }

  MarquerTaxeEnRetardData({
    this.taxeFonciere_update,
  });
}

@immutable
class MarquerTaxeEnRetardVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  MarquerTaxeEnRetardVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MarquerTaxeEnRetardVariables otherTyped = other as MarquerTaxeEnRetardVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  MarquerTaxeEnRetardVariables({
    required this.id,
  });
}

