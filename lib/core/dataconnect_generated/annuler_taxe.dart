part of 'porhe_foncier23072026.dart';

class AnnulerTaxeVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  AnnulerTaxeVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<AnnulerTaxeData> dataDeserializer = (dynamic json)  => AnnulerTaxeData.fromJson(jsonDecode(json));
  Serializer<AnnulerTaxeVariables> varsSerializer = (AnnulerTaxeVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<AnnulerTaxeData, AnnulerTaxeVariables>> execute() {
    return ref().execute();
  }

  MutationRef<AnnulerTaxeData, AnnulerTaxeVariables> ref() {
    AnnulerTaxeVariables vars= AnnulerTaxeVariables(id: id,);
    return _dataConnect.mutation("annulerTaxe", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class AnnulerTaxeTaxeFonciereUpdate {
  final int id;
  AnnulerTaxeTaxeFonciereUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AnnulerTaxeTaxeFonciereUpdate otherTyped = other as AnnulerTaxeTaxeFonciereUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  AnnulerTaxeTaxeFonciereUpdate({
    required this.id,
  });
}

@immutable
class AnnulerTaxeData {
  final AnnulerTaxeTaxeFonciereUpdate? taxeFonciere_update;
  AnnulerTaxeData.fromJson(dynamic json):
  
  taxeFonciere_update = json['taxeFonciere_update'] == null ? null : AnnulerTaxeTaxeFonciereUpdate.fromJson(json['taxeFonciere_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AnnulerTaxeData otherTyped = other as AnnulerTaxeData;
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

  AnnulerTaxeData({
    this.taxeFonciere_update,
  });
}

@immutable
class AnnulerTaxeVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  AnnulerTaxeVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AnnulerTaxeVariables otherTyped = other as AnnulerTaxeVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  AnnulerTaxeVariables({
    required this.id,
  });
}

