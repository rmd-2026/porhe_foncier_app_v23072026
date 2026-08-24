part of 'porhe_foncier23072026.dart';

class SeedCommunesVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  SeedCommunesVariablesBuilder(this._dataConnect, );
  Deserializer<SeedCommunesData> dataDeserializer = (dynamic json)  => SeedCommunesData.fromJson(jsonDecode(json));
  
  Future<OperationResult<SeedCommunesData, void>> execute() {
    return ref().execute();
  }

  MutationRef<SeedCommunesData, void> ref() {
    
    return _dataConnect.mutation("seedCommunes", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class SeedCommunesCommuneInsertMany {
  final int id;
  SeedCommunesCommuneInsertMany.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SeedCommunesCommuneInsertMany otherTyped = other as SeedCommunesCommuneInsertMany;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  SeedCommunesCommuneInsertMany({
    required this.id,
  });
}

@immutable
class SeedCommunesData {
  final List<SeedCommunesCommuneInsertMany> commune_insertMany;
  SeedCommunesData.fromJson(dynamic json):
  
  commune_insertMany = (json['commune_insertMany'] as List<dynamic>)
        .map((e) => SeedCommunesCommuneInsertMany.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SeedCommunesData otherTyped = other as SeedCommunesData;
    return commune_insertMany == otherTyped.commune_insertMany;
    
  }
  @override
  int get hashCode => commune_insertMany.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['commune_insertMany'] = commune_insertMany.map((e) => e.toJson()).toList();
    return json;
  }

  SeedCommunesData({
    required this.commune_insertMany,
  });
}

