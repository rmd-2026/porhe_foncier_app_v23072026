part of 'porhe_foncier23072026.dart';

class TransfererParcelleEntreCommunesVariablesBuilder {
  int id;
  int nouvelleRegionId;
  int nouvelleCommuneId;
  Optional<int> _nouvelleSousPrefectureId = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;  TransfererParcelleEntreCommunesVariablesBuilder nouvelleSousPrefectureId(int? t) {
   _nouvelleSousPrefectureId.value = t;
   return this;
  }

  TransfererParcelleEntreCommunesVariablesBuilder(this._dataConnect, {required  this.id,required  this.nouvelleRegionId,required  this.nouvelleCommuneId,});
  Deserializer<TransfererParcelleEntreCommunesData> dataDeserializer = (dynamic json)  => TransfererParcelleEntreCommunesData.fromJson(jsonDecode(json));
  Serializer<TransfererParcelleEntreCommunesVariables> varsSerializer = (TransfererParcelleEntreCommunesVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<TransfererParcelleEntreCommunesData, TransfererParcelleEntreCommunesVariables>> execute() {
    return ref().execute();
  }

  MutationRef<TransfererParcelleEntreCommunesData, TransfererParcelleEntreCommunesVariables> ref() {
    TransfererParcelleEntreCommunesVariables vars= TransfererParcelleEntreCommunesVariables(id: id,nouvelleRegionId: nouvelleRegionId,nouvelleCommuneId: nouvelleCommuneId,nouvelleSousPrefectureId: _nouvelleSousPrefectureId,);
    return _dataConnect.mutation("transfererParcelleEntreCommunes", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class TransfererParcelleEntreCommunesParcelleUpdate {
  final int id;
  TransfererParcelleEntreCommunesParcelleUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final TransfererParcelleEntreCommunesParcelleUpdate otherTyped = other as TransfererParcelleEntreCommunesParcelleUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  TransfererParcelleEntreCommunesParcelleUpdate({
    required this.id,
  });
}

@immutable
class TransfererParcelleEntreCommunesData {
  final TransfererParcelleEntreCommunesParcelleUpdate? parcelle_update;
  TransfererParcelleEntreCommunesData.fromJson(dynamic json):
  
  parcelle_update = json['parcelle_update'] == null ? null : TransfererParcelleEntreCommunesParcelleUpdate.fromJson(json['parcelle_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final TransfererParcelleEntreCommunesData otherTyped = other as TransfererParcelleEntreCommunesData;
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

  TransfererParcelleEntreCommunesData({
    this.parcelle_update,
  });
}

@immutable
class TransfererParcelleEntreCommunesVariables {
  final int id;
  final int nouvelleRegionId;
  final int nouvelleCommuneId;
  late final Optional<int>nouvelleSousPrefectureId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  TransfererParcelleEntreCommunesVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']),
  nouvelleRegionId = nativeFromJson<int>(json['nouvelleRegionId']),
  nouvelleCommuneId = nativeFromJson<int>(json['nouvelleCommuneId']) {
  
  
  
  
  
    nouvelleSousPrefectureId = Optional.optional(nativeFromJson, nativeToJson);
    nouvelleSousPrefectureId.value = json['nouvelleSousPrefectureId'] == null ? null : nativeFromJson<int>(json['nouvelleSousPrefectureId']);
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final TransfererParcelleEntreCommunesVariables otherTyped = other as TransfererParcelleEntreCommunesVariables;
    return id == otherTyped.id && 
    nouvelleRegionId == otherTyped.nouvelleRegionId && 
    nouvelleCommuneId == otherTyped.nouvelleCommuneId && 
    nouvelleSousPrefectureId == otherTyped.nouvelleSousPrefectureId;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, nouvelleRegionId.hashCode, nouvelleCommuneId.hashCode, nouvelleSousPrefectureId.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['nouvelleRegionId'] = nativeToJson<int>(nouvelleRegionId);
    json['nouvelleCommuneId'] = nativeToJson<int>(nouvelleCommuneId);
    if(nouvelleSousPrefectureId.state == OptionalState.set) {
      json['nouvelleSousPrefectureId'] = nouvelleSousPrefectureId.toJson();
    }
    return json;
  }

  TransfererParcelleEntreCommunesVariables({
    required this.id,
    required this.nouvelleRegionId,
    required this.nouvelleCommuneId,
    required this.nouvelleSousPrefectureId,
  });
}

