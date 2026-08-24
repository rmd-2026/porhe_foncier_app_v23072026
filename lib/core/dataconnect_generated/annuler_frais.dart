part of 'porhe_foncier23072026.dart';

class AnnulerFraisVariablesBuilder {
  int id;
  String motifRejet;

  final FirebaseDataConnect _dataConnect;
  AnnulerFraisVariablesBuilder(this._dataConnect, {required  this.id,required  this.motifRejet,});
  Deserializer<AnnulerFraisData> dataDeserializer = (dynamic json)  => AnnulerFraisData.fromJson(jsonDecode(json));
  Serializer<AnnulerFraisVariables> varsSerializer = (AnnulerFraisVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<AnnulerFraisData, AnnulerFraisVariables>> execute() {
    return ref().execute();
  }

  MutationRef<AnnulerFraisData, AnnulerFraisVariables> ref() {
    AnnulerFraisVariables vars= AnnulerFraisVariables(id: id,motifRejet: motifRejet,);
    return _dataConnect.mutation("annulerFrais", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class AnnulerFraisFraisEnregistrementUpdate {
  final int id;
  AnnulerFraisFraisEnregistrementUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AnnulerFraisFraisEnregistrementUpdate otherTyped = other as AnnulerFraisFraisEnregistrementUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  AnnulerFraisFraisEnregistrementUpdate({
    required this.id,
  });
}

@immutable
class AnnulerFraisData {
  final AnnulerFraisFraisEnregistrementUpdate? fraisEnregistrement_update;
  AnnulerFraisData.fromJson(dynamic json):
  
  fraisEnregistrement_update = json['fraisEnregistrement_update'] == null ? null : AnnulerFraisFraisEnregistrementUpdate.fromJson(json['fraisEnregistrement_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AnnulerFraisData otherTyped = other as AnnulerFraisData;
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

  AnnulerFraisData({
    this.fraisEnregistrement_update,
  });
}

@immutable
class AnnulerFraisVariables {
  final int id;
  final String motifRejet;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  AnnulerFraisVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']),
  motifRejet = nativeFromJson<String>(json['motifRejet']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AnnulerFraisVariables otherTyped = other as AnnulerFraisVariables;
    return id == otherTyped.id && 
    motifRejet == otherTyped.motifRejet;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, motifRejet.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['motifRejet'] = nativeToJson<String>(motifRejet);
    return json;
  }

  AnnulerFraisVariables({
    required this.id,
    required this.motifRejet,
  });
}

