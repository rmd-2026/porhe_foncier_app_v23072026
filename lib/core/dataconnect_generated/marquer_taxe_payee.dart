part of 'porhe_foncier23072026.dart';

class MarquerTaxePayeeVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  MarquerTaxePayeeVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<MarquerTaxePayeeData> dataDeserializer = (dynamic json)  => MarquerTaxePayeeData.fromJson(jsonDecode(json));
  Serializer<MarquerTaxePayeeVariables> varsSerializer = (MarquerTaxePayeeVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<MarquerTaxePayeeData, MarquerTaxePayeeVariables>> execute() {
    return ref().execute();
  }

  MutationRef<MarquerTaxePayeeData, MarquerTaxePayeeVariables> ref() {
    MarquerTaxePayeeVariables vars= MarquerTaxePayeeVariables(id: id,);
    return _dataConnect.mutation("marquerTaxePayee", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class MarquerTaxePayeeTaxeFonciereUpdate {
  final int id;
  MarquerTaxePayeeTaxeFonciereUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MarquerTaxePayeeTaxeFonciereUpdate otherTyped = other as MarquerTaxePayeeTaxeFonciereUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  MarquerTaxePayeeTaxeFonciereUpdate({
    required this.id,
  });
}

@immutable
class MarquerTaxePayeeData {
  final MarquerTaxePayeeTaxeFonciereUpdate? taxeFonciere_update;
  MarquerTaxePayeeData.fromJson(dynamic json):
  
  taxeFonciere_update = json['taxeFonciere_update'] == null ? null : MarquerTaxePayeeTaxeFonciereUpdate.fromJson(json['taxeFonciere_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MarquerTaxePayeeData otherTyped = other as MarquerTaxePayeeData;
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

  MarquerTaxePayeeData({
    this.taxeFonciere_update,
  });
}

@immutable
class MarquerTaxePayeeVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  MarquerTaxePayeeVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MarquerTaxePayeeVariables otherTyped = other as MarquerTaxePayeeVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  MarquerTaxePayeeVariables({
    required this.id,
  });
}

