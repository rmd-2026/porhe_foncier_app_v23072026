part of 'porhe_foncier23072026.dart';

class CreerParcelleVariablesBuilder {
  String codeParcelle;
  int utilisateurId;
  int regionId;
  int communeId;
  Optional<int> _sousPrefectureId = Optional.optional(nativeFromJson, nativeToJson);
  Optional<double> _superficieM2 = Optional.optional(nativeFromJson, nativeToJson);
  Optional<double> _latitude = Optional.optional(nativeFromJson, nativeToJson);
  Optional<double> _longitude = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _adresseTerrain = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _qrCode = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;  CreerParcelleVariablesBuilder sousPrefectureId(int? t) {
   _sousPrefectureId.value = t;
   return this;
  }
  CreerParcelleVariablesBuilder superficieM2(double? t) {
   _superficieM2.value = t;
   return this;
  }
  CreerParcelleVariablesBuilder latitude(double? t) {
   _latitude.value = t;
   return this;
  }
  CreerParcelleVariablesBuilder longitude(double? t) {
   _longitude.value = t;
   return this;
  }
  CreerParcelleVariablesBuilder adresseTerrain(String? t) {
   _adresseTerrain.value = t;
   return this;
  }
  CreerParcelleVariablesBuilder qrCode(String? t) {
   _qrCode.value = t;
   return this;
  }

  CreerParcelleVariablesBuilder(this._dataConnect, {required  this.codeParcelle,required  this.utilisateurId,required  this.regionId,required  this.communeId,});
  Deserializer<CreerParcelleData> dataDeserializer = (dynamic json)  => CreerParcelleData.fromJson(jsonDecode(json));
  Serializer<CreerParcelleVariables> varsSerializer = (CreerParcelleVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreerParcelleData, CreerParcelleVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreerParcelleData, CreerParcelleVariables> ref() {
    CreerParcelleVariables vars= CreerParcelleVariables(codeParcelle: codeParcelle,utilisateurId: utilisateurId,regionId: regionId,communeId: communeId,sousPrefectureId: _sousPrefectureId,superficieM2: _superficieM2,latitude: _latitude,longitude: _longitude,adresseTerrain: _adresseTerrain,qrCode: _qrCode,);
    return _dataConnect.mutation("creerParcelle", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CreerParcelleParcelleInsert {
  final int id;
  CreerParcelleParcelleInsert.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreerParcelleParcelleInsert otherTyped = other as CreerParcelleParcelleInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  CreerParcelleParcelleInsert({
    required this.id,
  });
}

@immutable
class CreerParcelleData {
  final CreerParcelleParcelleInsert parcelle_insert;
  CreerParcelleData.fromJson(dynamic json):
  
  parcelle_insert = CreerParcelleParcelleInsert.fromJson(json['parcelle_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreerParcelleData otherTyped = other as CreerParcelleData;
    return parcelle_insert == otherTyped.parcelle_insert;
    
  }
  @override
  int get hashCode => parcelle_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelle_insert'] = parcelle_insert.toJson();
    return json;
  }

  CreerParcelleData({
    required this.parcelle_insert,
  });
}

@immutable
class CreerParcelleVariables {
  final String codeParcelle;
  final int utilisateurId;
  final int regionId;
  final int communeId;
  late final Optional<int>sousPrefectureId;
  late final Optional<double>superficieM2;
  late final Optional<double>latitude;
  late final Optional<double>longitude;
  late final Optional<String>adresseTerrain;
  late final Optional<String>qrCode;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreerParcelleVariables.fromJson(Map<String, dynamic> json):
  
  codeParcelle = nativeFromJson<String>(json['codeParcelle']),
  utilisateurId = nativeFromJson<int>(json['utilisateurId']),
  regionId = nativeFromJson<int>(json['regionId']),
  communeId = nativeFromJson<int>(json['communeId']) {
  
  
  
  
  
  
    sousPrefectureId = Optional.optional(nativeFromJson, nativeToJson);
    sousPrefectureId.value = json['sousPrefectureId'] == null ? null : nativeFromJson<int>(json['sousPrefectureId']);
  
  
    superficieM2 = Optional.optional(nativeFromJson, nativeToJson);
    superficieM2.value = json['superficieM2'] == null ? null : nativeFromJson<double>(json['superficieM2']);
  
  
    latitude = Optional.optional(nativeFromJson, nativeToJson);
    latitude.value = json['latitude'] == null ? null : nativeFromJson<double>(json['latitude']);
  
  
    longitude = Optional.optional(nativeFromJson, nativeToJson);
    longitude.value = json['longitude'] == null ? null : nativeFromJson<double>(json['longitude']);
  
  
    adresseTerrain = Optional.optional(nativeFromJson, nativeToJson);
    adresseTerrain.value = json['adresseTerrain'] == null ? null : nativeFromJson<String>(json['adresseTerrain']);
  
  
    qrCode = Optional.optional(nativeFromJson, nativeToJson);
    qrCode.value = json['qrCode'] == null ? null : nativeFromJson<String>(json['qrCode']);
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreerParcelleVariables otherTyped = other as CreerParcelleVariables;
    return codeParcelle == otherTyped.codeParcelle && 
    utilisateurId == otherTyped.utilisateurId && 
    regionId == otherTyped.regionId && 
    communeId == otherTyped.communeId && 
    sousPrefectureId == otherTyped.sousPrefectureId && 
    superficieM2 == otherTyped.superficieM2 && 
    latitude == otherTyped.latitude && 
    longitude == otherTyped.longitude && 
    adresseTerrain == otherTyped.adresseTerrain && 
    qrCode == otherTyped.qrCode;
    
  }
  @override
  int get hashCode => Object.hashAll([codeParcelle.hashCode, utilisateurId.hashCode, regionId.hashCode, communeId.hashCode, sousPrefectureId.hashCode, superficieM2.hashCode, latitude.hashCode, longitude.hashCode, adresseTerrain.hashCode, qrCode.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['codeParcelle'] = nativeToJson<String>(codeParcelle);
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    json['regionId'] = nativeToJson<int>(regionId);
    json['communeId'] = nativeToJson<int>(communeId);
    if(sousPrefectureId.state == OptionalState.set) {
      json['sousPrefectureId'] = sousPrefectureId.toJson();
    }
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
    if(qrCode.state == OptionalState.set) {
      json['qrCode'] = qrCode.toJson();
    }
    return json;
  }

  CreerParcelleVariables({
    required this.codeParcelle,
    required this.utilisateurId,
    required this.regionId,
    required this.communeId,
    required this.sousPrefectureId,
    required this.superficieM2,
    required this.latitude,
    required this.longitude,
    required this.adresseTerrain,
    required this.qrCode,
  });
}

