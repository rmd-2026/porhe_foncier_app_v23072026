part of 'porhe_foncier23072026.dart';

class AjouterSuiviVisuelVariablesBuilder {
  int parcelleId;
  TypeMedia typeMedia;
  String urlStockage;
  Optional<double> _latitude = Optional.optional(nativeFromJson, nativeToJson);
  Optional<double> _longitude = Optional.optional(nativeFromJson, nativeToJson);
  String uploadeParFirebaseUid;

  final FirebaseDataConnect _dataConnect;  AjouterSuiviVisuelVariablesBuilder latitude(double? t) {
   _latitude.value = t;
   return this;
  }
  AjouterSuiviVisuelVariablesBuilder longitude(double? t) {
   _longitude.value = t;
   return this;
  }

  AjouterSuiviVisuelVariablesBuilder(this._dataConnect, {required  this.parcelleId,required  this.typeMedia,required  this.urlStockage,required  this.uploadeParFirebaseUid,});
  Deserializer<AjouterSuiviVisuelData> dataDeserializer = (dynamic json)  => AjouterSuiviVisuelData.fromJson(jsonDecode(json));
  Serializer<AjouterSuiviVisuelVariables> varsSerializer = (AjouterSuiviVisuelVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<AjouterSuiviVisuelData, AjouterSuiviVisuelVariables>> execute() {
    return ref().execute();
  }

  MutationRef<AjouterSuiviVisuelData, AjouterSuiviVisuelVariables> ref() {
    AjouterSuiviVisuelVariables vars= AjouterSuiviVisuelVariables(parcelleId: parcelleId,typeMedia: typeMedia,urlStockage: urlStockage,latitude: _latitude,longitude: _longitude,uploadeParFirebaseUid: uploadeParFirebaseUid,);
    return _dataConnect.mutation("ajouterSuiviVisuel", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class AjouterSuiviVisuelSuiviVisuelInsert {
  final int id;
  AjouterSuiviVisuelSuiviVisuelInsert.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AjouterSuiviVisuelSuiviVisuelInsert otherTyped = other as AjouterSuiviVisuelSuiviVisuelInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  AjouterSuiviVisuelSuiviVisuelInsert({
    required this.id,
  });
}

@immutable
class AjouterSuiviVisuelData {
  final AjouterSuiviVisuelSuiviVisuelInsert suiviVisuel_insert;
  AjouterSuiviVisuelData.fromJson(dynamic json):
  
  suiviVisuel_insert = AjouterSuiviVisuelSuiviVisuelInsert.fromJson(json['suiviVisuel_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AjouterSuiviVisuelData otherTyped = other as AjouterSuiviVisuelData;
    return suiviVisuel_insert == otherTyped.suiviVisuel_insert;
    
  }
  @override
  int get hashCode => suiviVisuel_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['suiviVisuel_insert'] = suiviVisuel_insert.toJson();
    return json;
  }

  AjouterSuiviVisuelData({
    required this.suiviVisuel_insert,
  });
}

@immutable
class AjouterSuiviVisuelVariables {
  final int parcelleId;
  final TypeMedia typeMedia;
  final String urlStockage;
  late final Optional<double>latitude;
  late final Optional<double>longitude;
  final String uploadeParFirebaseUid;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  AjouterSuiviVisuelVariables.fromJson(Map<String, dynamic> json):
  
  parcelleId = nativeFromJson<int>(json['parcelleId']),
  typeMedia = TypeMedia.values.byName(json['typeMedia']),
  urlStockage = nativeFromJson<String>(json['urlStockage']),
  uploadeParFirebaseUid = nativeFromJson<String>(json['uploadeParFirebaseUid']) {
  
  
  
  
  
    latitude = Optional.optional(nativeFromJson, nativeToJson);
    latitude.value = json['latitude'] == null ? null : nativeFromJson<double>(json['latitude']);
  
  
    longitude = Optional.optional(nativeFromJson, nativeToJson);
    longitude.value = json['longitude'] == null ? null : nativeFromJson<double>(json['longitude']);
  
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AjouterSuiviVisuelVariables otherTyped = other as AjouterSuiviVisuelVariables;
    return parcelleId == otherTyped.parcelleId && 
    typeMedia == otherTyped.typeMedia && 
    urlStockage == otherTyped.urlStockage && 
    latitude == otherTyped.latitude && 
    longitude == otherTyped.longitude && 
    uploadeParFirebaseUid == otherTyped.uploadeParFirebaseUid;
    
  }
  @override
  int get hashCode => Object.hashAll([parcelleId.hashCode, typeMedia.hashCode, urlStockage.hashCode, latitude.hashCode, longitude.hashCode, uploadeParFirebaseUid.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    json['typeMedia'] = 
    typeMedia.name
    ;
    json['urlStockage'] = nativeToJson<String>(urlStockage);
    if(latitude.state == OptionalState.set) {
      json['latitude'] = latitude.toJson();
    }
    if(longitude.state == OptionalState.set) {
      json['longitude'] = longitude.toJson();
    }
    json['uploadeParFirebaseUid'] = nativeToJson<String>(uploadeParFirebaseUid);
    return json;
  }

  AjouterSuiviVisuelVariables({
    required this.parcelleId,
    required this.typeMedia,
    required this.urlStockage,
    required this.latitude,
    required this.longitude,
    required this.uploadeParFirebaseUid,
  });
}

