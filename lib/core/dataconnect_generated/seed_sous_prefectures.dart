part of 'porhe_foncier23072026.dart';

class SeedSousPrefecturesVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  SeedSousPrefecturesVariablesBuilder(this._dataConnect, );
  Deserializer<SeedSousPrefecturesData> dataDeserializer = (dynamic json)  => SeedSousPrefecturesData.fromJson(jsonDecode(json));
  
  Future<OperationResult<SeedSousPrefecturesData, void>> execute() {
    return ref().execute();
  }

  MutationRef<SeedSousPrefecturesData, void> ref() {
    
    return _dataConnect.mutation("seedSousPrefectures", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class SeedSousPrefecturesSousPrefectureInsertMany {
  final int id;
  SeedSousPrefecturesSousPrefectureInsertMany.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SeedSousPrefecturesSousPrefectureInsertMany otherTyped = other as SeedSousPrefecturesSousPrefectureInsertMany;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  SeedSousPrefecturesSousPrefectureInsertMany({
    required this.id,
  });
}

@immutable
class SeedSousPrefecturesData {
  final List<SeedSousPrefecturesSousPrefectureInsertMany> sousPrefecture_insertMany;
  SeedSousPrefecturesData.fromJson(dynamic json):
  
  sousPrefecture_insertMany = (json['sousPrefecture_insertMany'] as List<dynamic>)
        .map((e) => SeedSousPrefecturesSousPrefectureInsertMany.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SeedSousPrefecturesData otherTyped = other as SeedSousPrefecturesData;
    return sousPrefecture_insertMany == otherTyped.sousPrefecture_insertMany;
    
  }
  @override
  int get hashCode => sousPrefecture_insertMany.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['sousPrefecture_insertMany'] = sousPrefecture_insertMany.map((e) => e.toJson()).toList();
    return json;
  }

  SeedSousPrefecturesData({
    required this.sousPrefecture_insertMany,
  });
}

