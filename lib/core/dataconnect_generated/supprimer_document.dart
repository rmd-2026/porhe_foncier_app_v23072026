part of 'porhe_foncier23072026.dart';

class SupprimerDocumentVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  SupprimerDocumentVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<SupprimerDocumentData> dataDeserializer = (dynamic json)  => SupprimerDocumentData.fromJson(jsonDecode(json));
  Serializer<SupprimerDocumentVariables> varsSerializer = (SupprimerDocumentVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<SupprimerDocumentData, SupprimerDocumentVariables>> execute() {
    return ref().execute();
  }

  MutationRef<SupprimerDocumentData, SupprimerDocumentVariables> ref() {
    SupprimerDocumentVariables vars= SupprimerDocumentVariables(id: id,);
    return _dataConnect.mutation("supprimerDocument", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class SupprimerDocumentDocumentParcelleDelete {
  final int id;
  SupprimerDocumentDocumentParcelleDelete.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SupprimerDocumentDocumentParcelleDelete otherTyped = other as SupprimerDocumentDocumentParcelleDelete;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  SupprimerDocumentDocumentParcelleDelete({
    required this.id,
  });
}

@immutable
class SupprimerDocumentData {
  final SupprimerDocumentDocumentParcelleDelete? documentParcelle_delete;
  SupprimerDocumentData.fromJson(dynamic json):
  
  documentParcelle_delete = json['documentParcelle_delete'] == null ? null : SupprimerDocumentDocumentParcelleDelete.fromJson(json['documentParcelle_delete']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SupprimerDocumentData otherTyped = other as SupprimerDocumentData;
    return documentParcelle_delete == otherTyped.documentParcelle_delete;
    
  }
  @override
  int get hashCode => documentParcelle_delete.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (documentParcelle_delete != null) {
      json['documentParcelle_delete'] = documentParcelle_delete!.toJson();
    }
    return json;
  }

  SupprimerDocumentData({
    this.documentParcelle_delete,
  });
}

@immutable
class SupprimerDocumentVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  SupprimerDocumentVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SupprimerDocumentVariables otherTyped = other as SupprimerDocumentVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  SupprimerDocumentVariables({
    required this.id,
  });
}

