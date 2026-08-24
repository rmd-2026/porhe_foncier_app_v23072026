part of 'porhe_foncier23072026.dart';

class ListerSuiviVisuelRecentParParcelleVariablesBuilder {
  int parcelleId;

  final FirebaseDataConnect _dataConnect;
  ListerSuiviVisuelRecentParParcelleVariablesBuilder(this._dataConnect, {required  this.parcelleId,});
  Deserializer<ListerSuiviVisuelRecentParParcelleData> dataDeserializer = (dynamic json)  => ListerSuiviVisuelRecentParParcelleData.fromJson(jsonDecode(json));
  Serializer<ListerSuiviVisuelRecentParParcelleVariables> varsSerializer = (ListerSuiviVisuelRecentParParcelleVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerSuiviVisuelRecentParParcelleData, ListerSuiviVisuelRecentParParcelleVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerSuiviVisuelRecentParParcelleData, ListerSuiviVisuelRecentParParcelleVariables> ref() {
    ListerSuiviVisuelRecentParParcelleVariables vars= ListerSuiviVisuelRecentParParcelleVariables(parcelleId: parcelleId,);
    return _dataConnect.query("listerSuiviVisuelRecentParParcelle", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerSuiviVisuelRecentParParcelleSuiviVisuels {
  final int id;
  final EnumValue<TypeMedia> typeMedia;
  final String urlStockage;
  final Timestamp createdAt;
  ListerSuiviVisuelRecentParParcelleSuiviVisuels.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  typeMedia = typeMediaDeserializer(json['typeMedia']),
  urlStockage = nativeFromJson<String>(json['urlStockage']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerSuiviVisuelRecentParParcelleSuiviVisuels otherTyped = other as ListerSuiviVisuelRecentParParcelleSuiviVisuels;
    return id == otherTyped.id && 
    typeMedia == otherTyped.typeMedia && 
    urlStockage == otherTyped.urlStockage && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, typeMedia.hashCode, urlStockage.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['typeMedia'] = 
    typeMediaSerializer(typeMedia)
    ;
    json['urlStockage'] = nativeToJson<String>(urlStockage);
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListerSuiviVisuelRecentParParcelleSuiviVisuels({
    required this.id,
    required this.typeMedia,
    required this.urlStockage,
    required this.createdAt,
  });
}

@immutable
class ListerSuiviVisuelRecentParParcelleData {
  final List<ListerSuiviVisuelRecentParParcelleSuiviVisuels> suiviVisuels;
  ListerSuiviVisuelRecentParParcelleData.fromJson(dynamic json):
  
  suiviVisuels = (json['suiviVisuels'] as List<dynamic>)
        .map((e) => ListerSuiviVisuelRecentParParcelleSuiviVisuels.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerSuiviVisuelRecentParParcelleData otherTyped = other as ListerSuiviVisuelRecentParParcelleData;
    return suiviVisuels == otherTyped.suiviVisuels;
    
  }
  @override
  int get hashCode => suiviVisuels.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['suiviVisuels'] = suiviVisuels.map((e) => e.toJson()).toList();
    return json;
  }

  ListerSuiviVisuelRecentParParcelleData({
    required this.suiviVisuels,
  });
}

@immutable
class ListerSuiviVisuelRecentParParcelleVariables {
  final int parcelleId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerSuiviVisuelRecentParParcelleVariables.fromJson(Map<String, dynamic> json):
  
  parcelleId = nativeFromJson<int>(json['parcelleId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerSuiviVisuelRecentParParcelleVariables otherTyped = other as ListerSuiviVisuelRecentParParcelleVariables;
    return parcelleId == otherTyped.parcelleId;
    
  }
  @override
  int get hashCode => parcelleId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    return json;
  }

  ListerSuiviVisuelRecentParParcelleVariables({
    required this.parcelleId,
  });
}

