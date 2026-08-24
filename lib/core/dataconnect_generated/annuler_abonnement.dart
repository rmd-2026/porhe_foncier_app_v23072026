part of 'porhe_foncier23072026.dart';

class AnnulerAbonnementVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  AnnulerAbonnementVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<AnnulerAbonnementData> dataDeserializer = (dynamic json)  => AnnulerAbonnementData.fromJson(jsonDecode(json));
  Serializer<AnnulerAbonnementVariables> varsSerializer = (AnnulerAbonnementVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<AnnulerAbonnementData, AnnulerAbonnementVariables>> execute() {
    return ref().execute();
  }

  MutationRef<AnnulerAbonnementData, AnnulerAbonnementVariables> ref() {
    AnnulerAbonnementVariables vars= AnnulerAbonnementVariables(id: id,);
    return _dataConnect.mutation("annulerAbonnement", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class AnnulerAbonnementAbonnementUpdate {
  final int id;
  AnnulerAbonnementAbonnementUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AnnulerAbonnementAbonnementUpdate otherTyped = other as AnnulerAbonnementAbonnementUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  AnnulerAbonnementAbonnementUpdate({
    required this.id,
  });
}

@immutable
class AnnulerAbonnementData {
  final AnnulerAbonnementAbonnementUpdate? abonnement_update;
  AnnulerAbonnementData.fromJson(dynamic json):
  
  abonnement_update = json['abonnement_update'] == null ? null : AnnulerAbonnementAbonnementUpdate.fromJson(json['abonnement_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AnnulerAbonnementData otherTyped = other as AnnulerAbonnementData;
    return abonnement_update == otherTyped.abonnement_update;
    
  }
  @override
  int get hashCode => abonnement_update.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (abonnement_update != null) {
      json['abonnement_update'] = abonnement_update!.toJson();
    }
    return json;
  }

  AnnulerAbonnementData({
    this.abonnement_update,
  });
}

@immutable
class AnnulerAbonnementVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  AnnulerAbonnementVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AnnulerAbonnementVariables otherTyped = other as AnnulerAbonnementVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  AnnulerAbonnementVariables({
    required this.id,
  });
}

