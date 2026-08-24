part of 'porhe_foncier23072026.dart';

class RejeterFraisVariablesBuilder {
  int id;
  String motifRejet;

  final FirebaseDataConnect _dataConnect;
  RejeterFraisVariablesBuilder(this._dataConnect, {required  this.id,required  this.motifRejet,});
  Deserializer<RejeterFraisData> dataDeserializer = (dynamic json)  => RejeterFraisData.fromJson(jsonDecode(json));
  Serializer<RejeterFraisVariables> varsSerializer = (RejeterFraisVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<RejeterFraisData, RejeterFraisVariables>> execute() {
    return ref().execute();
  }

  MutationRef<RejeterFraisData, RejeterFraisVariables> ref() {
    RejeterFraisVariables vars= RejeterFraisVariables(id: id,motifRejet: motifRejet,);
    return _dataConnect.mutation("rejeterFrais", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class RejeterFraisFraisEnregistrementUpdate {
  final int id;
  RejeterFraisFraisEnregistrementUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RejeterFraisFraisEnregistrementUpdate otherTyped = other as RejeterFraisFraisEnregistrementUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  RejeterFraisFraisEnregistrementUpdate({
    required this.id,
  });
}

@immutable
class RejeterFraisData {
  final RejeterFraisFraisEnregistrementUpdate? fraisEnregistrement_update;
  RejeterFraisData.fromJson(dynamic json):
  
  fraisEnregistrement_update = json['fraisEnregistrement_update'] == null ? null : RejeterFraisFraisEnregistrementUpdate.fromJson(json['fraisEnregistrement_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RejeterFraisData otherTyped = other as RejeterFraisData;
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

  RejeterFraisData({
    this.fraisEnregistrement_update,
  });
}

@immutable
class RejeterFraisVariables {
  final int id;
  final String motifRejet;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  RejeterFraisVariables.fromJson(Map<String, dynamic> json):
  
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

    final RejeterFraisVariables otherTyped = other as RejeterFraisVariables;
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

  RejeterFraisVariables({
    required this.id,
    required this.motifRejet,
  });
}

