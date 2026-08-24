part of 'porhe_foncier23072026.dart';

class SupprimerTaxeFonciereVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  SupprimerTaxeFonciereVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<SupprimerTaxeFonciereData> dataDeserializer = (dynamic json)  => SupprimerTaxeFonciereData.fromJson(jsonDecode(json));
  Serializer<SupprimerTaxeFonciereVariables> varsSerializer = (SupprimerTaxeFonciereVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<SupprimerTaxeFonciereData, SupprimerTaxeFonciereVariables>> execute() {
    return ref().execute();
  }

  MutationRef<SupprimerTaxeFonciereData, SupprimerTaxeFonciereVariables> ref() {
    SupprimerTaxeFonciereVariables vars= SupprimerTaxeFonciereVariables(id: id,);
    return _dataConnect.mutation("supprimerTaxeFonciere", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class SupprimerTaxeFonciereTaxeFonciereDelete {
  final int id;
  SupprimerTaxeFonciereTaxeFonciereDelete.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SupprimerTaxeFonciereTaxeFonciereDelete otherTyped = other as SupprimerTaxeFonciereTaxeFonciereDelete;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  SupprimerTaxeFonciereTaxeFonciereDelete({
    required this.id,
  });
}

@immutable
class SupprimerTaxeFonciereData {
  final SupprimerTaxeFonciereTaxeFonciereDelete? taxeFonciere_delete;
  SupprimerTaxeFonciereData.fromJson(dynamic json):
  
  taxeFonciere_delete = json['taxeFonciere_delete'] == null ? null : SupprimerTaxeFonciereTaxeFonciereDelete.fromJson(json['taxeFonciere_delete']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SupprimerTaxeFonciereData otherTyped = other as SupprimerTaxeFonciereData;
    return taxeFonciere_delete == otherTyped.taxeFonciere_delete;
    
  }
  @override
  int get hashCode => taxeFonciere_delete.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (taxeFonciere_delete != null) {
      json['taxeFonciere_delete'] = taxeFonciere_delete!.toJson();
    }
    return json;
  }

  SupprimerTaxeFonciereData({
    this.taxeFonciere_delete,
  });
}

@immutable
class SupprimerTaxeFonciereVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  SupprimerTaxeFonciereVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SupprimerTaxeFonciereVariables otherTyped = other as SupprimerTaxeFonciereVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  SupprimerTaxeFonciereVariables({
    required this.id,
  });
}

