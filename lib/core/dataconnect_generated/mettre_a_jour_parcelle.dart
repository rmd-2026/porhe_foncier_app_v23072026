part of 'porhe_foncier23072026.dart';

class MettreAJourParcelleVariablesBuilder {
  int id;
  Optional<double> _superficieM2 = Optional.optional(nativeFromJson, nativeToJson);
  Optional<double> _latitude = Optional.optional(nativeFromJson, nativeToJson);
  Optional<double> _longitude = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _adresseTerrain = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;  MettreAJourParcelleVariablesBuilder superficieM2(double? t) {
   _superficieM2.value = t;
   return this;
  }
  MettreAJourParcelleVariablesBuilder latitude(double? t) {
   _latitude.value = t;
   return this;
  }
  MettreAJourParcelleVariablesBuilder longitude(double? t) {
   _longitude.value = t;
   return this;
  }
  MettreAJourParcelleVariablesBuilder adresseTerrain(String? t) {
   _adresseTerrain.value = t;
   return this;
  }

  MettreAJourParcelleVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<MettreAJourParcelleData> dataDeserializer = (dynamic json)  => MettreAJourParcelleData.fromJson(jsonDecode(json));
  Serializer<MettreAJourParcelleVariables> varsSerializer = (MettreAJourParcelleVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<MettreAJourParcelleData, MettreAJourParcelleVariables>> execute() {
    return ref().execute();
  }

  MutationRef<MettreAJourParcelleData, MettreAJourParcelleVariables> ref() {
    MettreAJourParcelleVariables vars= MettreAJourParcelleVariables(id: id,superficieM2: _superficieM2,latitude: _latitude,longitude: _longitude,adresseTerrain: _adresseTerrain,);
    return _dataConnect.mutation("mettreAJourParcelle", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class MettreAJourParcelleParcelleUpdate {
  final int id;
  MettreAJourParcelleParcelleUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MettreAJourParcelleParcelleUpdate otherTyped = other as MettreAJourParcelleParcelleUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  MettreAJourParcelleParcelleUpdate({
    required this.id,
  });
}

@immutable
class MettreAJourParcelleData {
  final MettreAJourParcelleParcelleUpdate? parcelle_update;
  MettreAJourParcelleData.fromJson(dynamic json):
  
  parcelle_update = json['parcelle_update'] == null ? null : MettreAJourParcelleParcelleUpdate.fromJson(json['parcelle_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MettreAJourParcelleData otherTyped = other as MettreAJourParcelleData;
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

  MettreAJourParcelleData({
    this.parcelle_update,
  });
}

@immutable
class MettreAJourParcelleVariables {
  final int id;
  late final Optional<double>superficieM2;
  late final Optional<double>latitude;
  late final Optional<double>longitude;
  late final Optional<String>adresseTerrain;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  MettreAJourParcelleVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']) {
  
  
  
    superficieM2 = Optional.optional(nativeFromJson, nativeToJson);
    superficieM2.value = json['superficieM2'] == null ? null : nativeFromJson<double>(json['superficieM2']);
  
  
    latitude = Optional.optional(nativeFromJson, nativeToJson);
    latitude.value = json['latitude'] == null ? null : nativeFromJson<double>(json['latitude']);
  
  
    longitude = Optional.optional(nativeFromJson, nativeToJson);
    longitude.value = json['longitude'] == null ? null : nativeFromJson<double>(json['longitude']);
  
  
    adresseTerrain = Optional.optional(nativeFromJson, nativeToJson);
    adresseTerrain.value = json['adresseTerrain'] == null ? null : nativeFromJson<String>(json['adresseTerrain']);
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MettreAJourParcelleVariables otherTyped = other as MettreAJourParcelleVariables;
    return id == otherTyped.id && 
    superficieM2 == otherTyped.superficieM2 && 
    latitude == otherTyped.latitude && 
    longitude == otherTyped.longitude && 
    adresseTerrain == otherTyped.adresseTerrain;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, superficieM2.hashCode, latitude.hashCode, longitude.hashCode, adresseTerrain.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    if(superficieM2.state == OptionalState.set) {
      json['superficieM2'] = superficieM2.toJson();
    }
    if(latitude.state == OptionalState.set) {
      json['latitude'] = latitude.toJson();
    }
    if(longitude.state == OptionalState.set) {
      json['longitude'] = longitude.toJson();
    }
    if(adresseTerrain.state == OptionalState.set) {
      json['adresseTerrain'] = adresseTerrain.toJson();
    }
    return json;
  }

  MettreAJourParcelleVariables({
    required this.id,
    required this.superficieM2,
    required this.latitude,
    required this.longitude,
    required this.adresseTerrain,
  });
}

