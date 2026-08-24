part of 'porhe_foncier23072026.dart';

class SupprimerFraisEnregistrementVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  SupprimerFraisEnregistrementVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<SupprimerFraisEnregistrementData> dataDeserializer = (dynamic json)  => SupprimerFraisEnregistrementData.fromJson(jsonDecode(json));
  Serializer<SupprimerFraisEnregistrementVariables> varsSerializer = (SupprimerFraisEnregistrementVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<SupprimerFraisEnregistrementData, SupprimerFraisEnregistrementVariables>> execute() {
    return ref().execute();
  }

  MutationRef<SupprimerFraisEnregistrementData, SupprimerFraisEnregistrementVariables> ref() {
    SupprimerFraisEnregistrementVariables vars= SupprimerFraisEnregistrementVariables(id: id,);
    return _dataConnect.mutation("supprimerFraisEnregistrement", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class SupprimerFraisEnregistrementFraisEnregistrementDelete {
  final int id;
  SupprimerFraisEnregistrementFraisEnregistrementDelete.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SupprimerFraisEnregistrementFraisEnregistrementDelete otherTyped = other as SupprimerFraisEnregistrementFraisEnregistrementDelete;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  SupprimerFraisEnregistrementFraisEnregistrementDelete({
    required this.id,
  });
}

@immutable
class SupprimerFraisEnregistrementData {
  final SupprimerFraisEnregistrementFraisEnregistrementDelete? fraisEnregistrement_delete;
  SupprimerFraisEnregistrementData.fromJson(dynamic json):
  
  fraisEnregistrement_delete = json['fraisEnregistrement_delete'] == null ? null : SupprimerFraisEnregistrementFraisEnregistrementDelete.fromJson(json['fraisEnregistrement_delete']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SupprimerFraisEnregistrementData otherTyped = other as SupprimerFraisEnregistrementData;
    return fraisEnregistrement_delete == otherTyped.fraisEnregistrement_delete;
    
  }
  @override
  int get hashCode => fraisEnregistrement_delete.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (fraisEnregistrement_delete != null) {
      json['fraisEnregistrement_delete'] = fraisEnregistrement_delete!.toJson();
    }
    return json;
  }

  SupprimerFraisEnregistrementData({
    this.fraisEnregistrement_delete,
  });
}

@immutable
class SupprimerFraisEnregistrementVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  SupprimerFraisEnregistrementVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SupprimerFraisEnregistrementVariables otherTyped = other as SupprimerFraisEnregistrementVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  SupprimerFraisEnregistrementVariables({
    required this.id,
  });
}

