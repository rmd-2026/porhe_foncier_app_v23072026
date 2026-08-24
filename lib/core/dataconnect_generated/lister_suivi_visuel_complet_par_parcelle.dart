part of 'porhe_foncier23072026.dart';

class ListerSuiviVisuelCompletParParcelleVariablesBuilder {
  int parcelleId;

  final FirebaseDataConnect _dataConnect;
  ListerSuiviVisuelCompletParParcelleVariablesBuilder(this._dataConnect, {required  this.parcelleId,});
  Deserializer<ListerSuiviVisuelCompletParParcelleData> dataDeserializer = (dynamic json)  => ListerSuiviVisuelCompletParParcelleData.fromJson(jsonDecode(json));
  Serializer<ListerSuiviVisuelCompletParParcelleVariables> varsSerializer = (ListerSuiviVisuelCompletParParcelleVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerSuiviVisuelCompletParParcelleData, ListerSuiviVisuelCompletParParcelleVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerSuiviVisuelCompletParParcelleData, ListerSuiviVisuelCompletParParcelleVariables> ref() {
    ListerSuiviVisuelCompletParParcelleVariables vars= ListerSuiviVisuelCompletParParcelleVariables(parcelleId: parcelleId,);
    return _dataConnect.query("listerSuiviVisuelCompletParParcelle", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerSuiviVisuelCompletParParcelleSuiviVisuels {
  final int id;
  final EnumValue<TypeMedia> typeMedia;
  final String urlStockage;
  final double? latitude;
  final double? longitude;
  final String uploadeParFirebaseUid;
  final Timestamp createdAt;
  ListerSuiviVisuelCompletParParcelleSuiviVisuels.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  typeMedia = typeMediaDeserializer(json['typeMedia']),
  urlStockage = nativeFromJson<String>(json['urlStockage']),
  latitude = json['latitude'] == null ? null : nativeFromJson<double>(json['latitude']),
  longitude = json['longitude'] == null ? null : nativeFromJson<double>(json['longitude']),
  uploadeParFirebaseUid = nativeFromJson<String>(json['uploadeParFirebaseUid']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerSuiviVisuelCompletParParcelleSuiviVisuels otherTyped = other as ListerSuiviVisuelCompletParParcelleSuiviVisuels;
    return id == otherTyped.id && 
    typeMedia == otherTyped.typeMedia && 
    urlStockage == otherTyped.urlStockage && 
    latitude == otherTyped.latitude && 
    longitude == otherTyped.longitude && 
    uploadeParFirebaseUid == otherTyped.uploadeParFirebaseUid && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, typeMedia.hashCode, urlStockage.hashCode, latitude.hashCode, longitude.hashCode, uploadeParFirebaseUid.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['typeMedia'] = 
    typeMediaSerializer(typeMedia)
    ;
    json['urlStockage'] = nativeToJson<String>(urlStockage);
    if (latitude != null) {
      json['latitude'] = nativeToJson<double?>(latitude);
    }
    if (longitude != null) {
      json['longitude'] = nativeToJson<double?>(longitude);
    }
    json['uploadeParFirebaseUid'] = nativeToJson<String>(uploadeParFirebaseUid);
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListerSuiviVisuelCompletParParcelleSuiviVisuels({
    required this.id,
    required this.typeMedia,
    required this.urlStockage,
    this.latitude,
    this.longitude,
    required this.uploadeParFirebaseUid,
    required this.createdAt,
  });
}

@immutable
class ListerSuiviVisuelCompletParParcelleData {
  final List<ListerSuiviVisuelCompletParParcelleSuiviVisuels> suiviVisuels;
  ListerSuiviVisuelCompletParParcelleData.fromJson(dynamic json):
  
  suiviVisuels = (json['suiviVisuels'] as List<dynamic>)
        .map((e) => ListerSuiviVisuelCompletParParcelleSuiviVisuels.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerSuiviVisuelCompletParParcelleData otherTyped = other as ListerSuiviVisuelCompletParParcelleData;
    return suiviVisuels == otherTyped.suiviVisuels;
    
  }
  @override
  int get hashCode => suiviVisuels.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['suiviVisuels'] = suiviVisuels.map((e) => e.toJson()).toList();
    return json;
  }

  ListerSuiviVisuelCompletParParcelleData({
    required this.suiviVisuels,
  });
}

@immutable
class ListerSuiviVisuelCompletParParcelleVariables {
  final int parcelleId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerSuiviVisuelCompletParParcelleVariables.fromJson(Map<String, dynamic> json):
  
  parcelleId = nativeFromJson<int>(json['parcelleId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerSuiviVisuelCompletParParcelleVariables otherTyped = other as ListerSuiviVisuelCompletParParcelleVariables;
    return parcelleId == otherTyped.parcelleId;
    
  }
  @override
  int get hashCode => parcelleId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    return json;
  }

  ListerSuiviVisuelCompletParParcelleVariables({
    required this.parcelleId,
  });
}

