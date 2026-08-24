part of 'porhe_foncier23072026.dart';

class ListerParcellesDansZoneVariablesBuilder {
  double latMin;
  double latMax;
  double lonMin;
  double lonMax;

  final FirebaseDataConnect _dataConnect;
  ListerParcellesDansZoneVariablesBuilder(this._dataConnect, {required  this.latMin,required  this.latMax,required  this.lonMin,required  this.lonMax,});
  Deserializer<ListerParcellesDansZoneData> dataDeserializer = (dynamic json)  => ListerParcellesDansZoneData.fromJson(jsonDecode(json));
  Serializer<ListerParcellesDansZoneVariables> varsSerializer = (ListerParcellesDansZoneVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerParcellesDansZoneData, ListerParcellesDansZoneVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerParcellesDansZoneData, ListerParcellesDansZoneVariables> ref() {
    ListerParcellesDansZoneVariables vars= ListerParcellesDansZoneVariables(latMin: latMin,latMax: latMax,lonMin: lonMin,lonMax: lonMax,);
    return _dataConnect.query("listerParcellesDansZone", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerParcellesDansZoneParcelles {
  final int id;
  final String codeParcelle;
  final double? latitude;
  final double? longitude;
  final EnumValue<StatutParcelle> statut;
  final int communeId;
  ListerParcellesDansZoneParcelles.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  codeParcelle = nativeFromJson<String>(json['codeParcelle']),
  latitude = json['latitude'] == null ? null : nativeFromJson<double>(json['latitude']),
  longitude = json['longitude'] == null ? null : nativeFromJson<double>(json['longitude']),
  statut = statutParcelleDeserializer(json['statut']),
  communeId = nativeFromJson<int>(json['communeId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerParcellesDansZoneParcelles otherTyped = other as ListerParcellesDansZoneParcelles;
    return id == otherTyped.id && 
    codeParcelle == otherTyped.codeParcelle && 
    latitude == otherTyped.latitude && 
    longitude == otherTyped.longitude && 
    statut == otherTyped.statut && 
    communeId == otherTyped.communeId;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, codeParcelle.hashCode, latitude.hashCode, longitude.hashCode, statut.hashCode, communeId.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['codeParcelle'] = nativeToJson<String>(codeParcelle);
    if (latitude != null) {
      json['latitude'] = nativeToJson<double?>(latitude);
    }
    if (longitude != null) {
      json['longitude'] = nativeToJson<double?>(longitude);
    }
    json['statut'] = 
    statutParcelleSerializer(statut)
    ;
    json['communeId'] = nativeToJson<int>(communeId);
    return json;
  }

  ListerParcellesDansZoneParcelles({
    required this.id,
    required this.codeParcelle,
    this.latitude,
    this.longitude,
    required this.statut,
    required this.communeId,
  });
}

@immutable
class ListerParcellesDansZoneData {
  final List<ListerParcellesDansZoneParcelles> parcelles;
  ListerParcellesDansZoneData.fromJson(dynamic json):
  
  parcelles = (json['parcelles'] as List<dynamic>)
        .map((e) => ListerParcellesDansZoneParcelles.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerParcellesDansZoneData otherTyped = other as ListerParcellesDansZoneData;
    return parcelles == otherTyped.parcelles;
    
  }
  @override
  int get hashCode => parcelles.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelles'] = parcelles.map((e) => e.toJson()).toList();
    return json;
  }

  ListerParcellesDansZoneData({
    required this.parcelles,
  });
}

@immutable
class ListerParcellesDansZoneVariables {
  final double latMin;
  final double latMax;
  final double lonMin;
  final double lonMax;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerParcellesDansZoneVariables.fromJson(Map<String, dynamic> json):
  
  latMin = nativeFromJson<double>(json['latMin']),
  latMax = nativeFromJson<double>(json['latMax']),
  lonMin = nativeFromJson<double>(json['lonMin']),
  lonMax = nativeFromJson<double>(json['lonMax']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerParcellesDansZoneVariables otherTyped = other as ListerParcellesDansZoneVariables;
    return latMin == otherTyped.latMin && 
    latMax == otherTyped.latMax && 
    lonMin == otherTyped.lonMin && 
    lonMax == otherTyped.lonMax;
    
  }
  @override
  int get hashCode => Object.hashAll([latMin.hashCode, latMax.hashCode, lonMin.hashCode, lonMax.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['latMin'] = nativeToJson<double>(latMin);
    json['latMax'] = nativeToJson<double>(latMax);
    json['lonMin'] = nativeToJson<double>(lonMin);
    json['lonMax'] = nativeToJson<double>(lonMax);
    return json;
  }

  ListerParcellesDansZoneVariables({
    required this.latMin,
    required this.latMax,
    required this.lonMin,
    required this.lonMax,
  });
}

