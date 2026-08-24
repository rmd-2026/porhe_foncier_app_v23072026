part of 'porhe_foncier23072026.dart';

class SupprimerAbonnementVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  SupprimerAbonnementVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<SupprimerAbonnementData> dataDeserializer = (dynamic json)  => SupprimerAbonnementData.fromJson(jsonDecode(json));
  Serializer<SupprimerAbonnementVariables> varsSerializer = (SupprimerAbonnementVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<SupprimerAbonnementData, SupprimerAbonnementVariables>> execute() {
    return ref().execute();
  }

  MutationRef<SupprimerAbonnementData, SupprimerAbonnementVariables> ref() {
    SupprimerAbonnementVariables vars= SupprimerAbonnementVariables(id: id,);
    return _dataConnect.mutation("supprimerAbonnement", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class SupprimerAbonnementAbonnementDelete {
  final int id;
  SupprimerAbonnementAbonnementDelete.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SupprimerAbonnementAbonnementDelete otherTyped = other as SupprimerAbonnementAbonnementDelete;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  SupprimerAbonnementAbonnementDelete({
    required this.id,
  });
}

@immutable
class SupprimerAbonnementData {
  final SupprimerAbonnementAbonnementDelete? abonnement_delete;
  SupprimerAbonnementData.fromJson(dynamic json):
  
  abonnement_delete = json['abonnement_delete'] == null ? null : SupprimerAbonnementAbonnementDelete.fromJson(json['abonnement_delete']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SupprimerAbonnementData otherTyped = other as SupprimerAbonnementData;
    return abonnement_delete == otherTyped.abonnement_delete;
    
  }
  @override
  int get hashCode => abonnement_delete.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (abonnement_delete != null) {
      json['abonnement_delete'] = abonnement_delete!.toJson();
    }
    return json;
  }

  SupprimerAbonnementData({
    this.abonnement_delete,
  });
}

@immutable
class SupprimerAbonnementVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  SupprimerAbonnementVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SupprimerAbonnementVariables otherTyped = other as SupprimerAbonnementVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  SupprimerAbonnementVariables({
    required this.id,
  });
}

