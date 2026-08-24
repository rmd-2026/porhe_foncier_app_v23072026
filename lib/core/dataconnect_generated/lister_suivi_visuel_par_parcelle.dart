part of 'porhe_foncier23072026.dart';

class ListerSuiviVisuelParParcelleVariablesBuilder {
  int parcelleId;

  final FirebaseDataConnect _dataConnect;
  ListerSuiviVisuelParParcelleVariablesBuilder(this._dataConnect, {required  this.parcelleId,});
  Deserializer<ListerSuiviVisuelParParcelleData> dataDeserializer = (dynamic json)  => ListerSuiviVisuelParParcelleData.fromJson(jsonDecode(json));
  Serializer<ListerSuiviVisuelParParcelleVariables> varsSerializer = (ListerSuiviVisuelParParcelleVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerSuiviVisuelParParcelleData, ListerSuiviVisuelParParcelleVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerSuiviVisuelParParcelleData, ListerSuiviVisuelParParcelleVariables> ref() {
    ListerSuiviVisuelParParcelleVariables vars= ListerSuiviVisuelParParcelleVariables(parcelleId: parcelleId,);
    return _dataConnect.query("listerSuiviVisuelParParcelle", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerSuiviVisuelParParcelleSuiviVisuels {
  final int id;
  final EnumValue<TypeMedia> typeMedia;
  final String urlStockage;
  final double? latitude;
  final double? longitude;
  final String uploadeParFirebaseUid;
  final Timestamp createdAt;
  ListerSuiviVisuelParParcelleSuiviVisuels.fromJson(dynamic json):
  
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

    final ListerSuiviVisuelParParcelleSuiviVisuels otherTyped = other as ListerSuiviVisuelParParcelleSuiviVisuels;
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

  ListerSuiviVisuelParParcelleSuiviVisuels({
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
class ListerSuiviVisuelParParcelleData {
  final List<ListerSuiviVisuelParParcelleSuiviVisuels> suiviVisuels;
  ListerSuiviVisuelParParcelleData.fromJson(dynamic json):
  
  suiviVisuels = (json['suiviVisuels'] as List<dynamic>)
        .map((e) => ListerSuiviVisuelParParcelleSuiviVisuels.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerSuiviVisuelParParcelleData otherTyped = other as ListerSuiviVisuelParParcelleData;
    return suiviVisuels == otherTyped.suiviVisuels;
    
  }
  @override
  int get hashCode => suiviVisuels.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['suiviVisuels'] = suiviVisuels.map((e) => e.toJson()).toList();
    return json;
  }

  ListerSuiviVisuelParParcelleData({
    required this.suiviVisuels,
  });
}

@immutable
class ListerSuiviVisuelParParcelleVariables {
  final int parcelleId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerSuiviVisuelParParcelleVariables.fromJson(Map<String, dynamic> json):
  
  parcelleId = nativeFromJson<int>(json['parcelleId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerSuiviVisuelParParcelleVariables otherTyped = other as ListerSuiviVisuelParParcelleVariables;
    return parcelleId == otherTyped.parcelleId;
    
  }
  @override
  int get hashCode => parcelleId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    return json;
  }

  ListerSuiviVisuelParParcelleVariables({
    required this.parcelleId,
  });
}

