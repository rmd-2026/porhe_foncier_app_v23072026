part of 'porhe_foncier23072026.dart';

class CreerAlerteVariablesBuilder {
  int utilisateurId;
  Optional<int> _parcelleId = Optional.optional(nativeFromJson, nativeToJson);
  TypeAlerte typeAlerte;
  String message;

  final FirebaseDataConnect _dataConnect;  CreerAlerteVariablesBuilder parcelleId(int? t) {
   _parcelleId.value = t;
   return this;
  }

  CreerAlerteVariablesBuilder(this._dataConnect, {required  this.utilisateurId,required  this.typeAlerte,required  this.message,});
  Deserializer<CreerAlerteData> dataDeserializer = (dynamic json)  => CreerAlerteData.fromJson(jsonDecode(json));
  Serializer<CreerAlerteVariables> varsSerializer = (CreerAlerteVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreerAlerteData, CreerAlerteVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreerAlerteData, CreerAlerteVariables> ref() {
    CreerAlerteVariables vars= CreerAlerteVariables(utilisateurId: utilisateurId,parcelleId: _parcelleId,typeAlerte: typeAlerte,message: message,);
    return _dataConnect.mutation("creerAlerte", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CreerAlerteAlerteInsert {
  final int id;
  CreerAlerteAlerteInsert.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreerAlerteAlerteInsert otherTyped = other as CreerAlerteAlerteInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  CreerAlerteAlerteInsert({
    required this.id,
  });
}

@immutable
class CreerAlerteData {
  final CreerAlerteAlerteInsert alerte_insert;
  CreerAlerteData.fromJson(dynamic json):
  
  alerte_insert = CreerAlerteAlerteInsert.fromJson(json['alerte_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreerAlerteData otherTyped = other as CreerAlerteData;
    return alerte_insert == otherTyped.alerte_insert;
    
  }
  @override
  int get hashCode => alerte_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['alerte_insert'] = alerte_insert.toJson();
    return json;
  }

  CreerAlerteData({
    required this.alerte_insert,
  });
}

@immutable
class CreerAlerteVariables {
  final int utilisateurId;
  late final Optional<int>parcelleId;
  final TypeAlerte typeAlerte;
  final String message;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreerAlerteVariables.fromJson(Map<String, dynamic> json):
  
  utilisateurId = nativeFromJson<int>(json['utilisateurId']),
  typeAlerte = TypeAlerte.values.byName(json['typeAlerte']),
  message = nativeFromJson<String>(json['message']) {
  
  
  
    parcelleId = Optional.optional(nativeFromJson, nativeToJson);
    parcelleId.value = json['parcelleId'] == null ? null : nativeFromJson<int>(json['parcelleId']);
  
  
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreerAlerteVariables otherTyped = other as CreerAlerteVariables;
    return utilisateurId == otherTyped.utilisateurId && 
    parcelleId == otherTyped.parcelleId && 
    typeAlerte == otherTyped.typeAlerte && 
    message == otherTyped.message;
    
  }
  @override
  int get hashCode => Object.hashAll([utilisateurId.hashCode, parcelleId.hashCode, typeAlerte.hashCode, message.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    if(parcelleId.state == OptionalState.set) {
      json['parcelleId'] = parcelleId.toJson();
    }
    json['typeAlerte'] = 
    typeAlerte.name
    ;
    json['message'] = nativeToJson<String>(message);
    return json;
  }

  CreerAlerteVariables({
    required this.utilisateurId,
    required this.parcelleId,
    required this.typeAlerte,
    required this.message,
  });
}

