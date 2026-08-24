part of 'porhe_foncier23072026.dart';

class SeedRegionsVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  SeedRegionsVariablesBuilder(this._dataConnect, );
  Deserializer<SeedRegionsData> dataDeserializer = (dynamic json)  => SeedRegionsData.fromJson(jsonDecode(json));
  
  Future<OperationResult<SeedRegionsData, void>> execute() {
    return ref().execute();
  }

  MutationRef<SeedRegionsData, void> ref() {
    
    return _dataConnect.mutation("seedRegions", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class SeedRegionsRegionInsertMany {
  final int id;
  SeedRegionsRegionInsertMany.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SeedRegionsRegionInsertMany otherTyped = other as SeedRegionsRegionInsertMany;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  SeedRegionsRegionInsertMany({
    required this.id,
  });
}

@immutable
class SeedRegionsData {
  final List<SeedRegionsRegionInsertMany> region_insertMany;
  SeedRegionsData.fromJson(dynamic json):
  
  region_insertMany = (json['region_insertMany'] as List<dynamic>)
        .map((e) => SeedRegionsRegionInsertMany.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SeedRegionsData otherTyped = other as SeedRegionsData;
    return region_insertMany == otherTyped.region_insertMany;
    
  }
  @override
  int get hashCode => region_insertMany.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['region_insertMany'] = region_insertMany.map((e) => e.toJson()).toList();
    return json;
  }

  SeedRegionsData({
    required this.region_insertMany,
  });
}

