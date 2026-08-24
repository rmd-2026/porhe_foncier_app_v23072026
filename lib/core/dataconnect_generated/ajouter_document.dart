part of 'porhe_foncier23072026.dart';

class AjouterDocumentVariablesBuilder {
  int parcelleId;
  TypeDocument typeDocument;
  String nomFichier;
  String urlStockage;
  String uploadeParFirebaseUid;

  final FirebaseDataConnect _dataConnect;
  AjouterDocumentVariablesBuilder(this._dataConnect, {required  this.parcelleId,required  this.typeDocument,required  this.nomFichier,required  this.urlStockage,required  this.uploadeParFirebaseUid,});
  Deserializer<AjouterDocumentData> dataDeserializer = (dynamic json)  => AjouterDocumentData.fromJson(jsonDecode(json));
  Serializer<AjouterDocumentVariables> varsSerializer = (AjouterDocumentVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<AjouterDocumentData, AjouterDocumentVariables>> execute() {
    return ref().execute();
  }

  MutationRef<AjouterDocumentData, AjouterDocumentVariables> ref() {
    AjouterDocumentVariables vars= AjouterDocumentVariables(parcelleId: parcelleId,typeDocument: typeDocument,nomFichier: nomFichier,urlStockage: urlStockage,uploadeParFirebaseUid: uploadeParFirebaseUid,);
    return _dataConnect.mutation("ajouterDocument", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class AjouterDocumentDocumentParcelleInsert {
  final int id;
  AjouterDocumentDocumentParcelleInsert.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AjouterDocumentDocumentParcelleInsert otherTyped = other as AjouterDocumentDocumentParcelleInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  AjouterDocumentDocumentParcelleInsert({
    required this.id,
  });
}

@immutable
class AjouterDocumentData {
  final AjouterDocumentDocumentParcelleInsert documentParcelle_insert;
  AjouterDocumentData.fromJson(dynamic json):
  
  documentParcelle_insert = AjouterDocumentDocumentParcelleInsert.fromJson(json['documentParcelle_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AjouterDocumentData otherTyped = other as AjouterDocumentData;
    return documentParcelle_insert == otherTyped.documentParcelle_insert;
    
  }
  @override
  int get hashCode => documentParcelle_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['documentParcelle_insert'] = documentParcelle_insert.toJson();
    return json;
  }

  AjouterDocumentData({
    required this.documentParcelle_insert,
  });
}

@immutable
class AjouterDocumentVariables {
  final int parcelleId;
  final TypeDocument typeDocument;
  final String nomFichier;
  final String urlStockage;
  final String uploadeParFirebaseUid;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  AjouterDocumentVariables.fromJson(Map<String, dynamic> json):
  
  parcelleId = nativeFromJson<int>(json['parcelleId']),
  typeDocument = TypeDocument.values.byName(json['typeDocument']),
  nomFichier = nativeFromJson<String>(json['nomFichier']),
  urlStockage = nativeFromJson<String>(json['urlStockage']),
  uploadeParFirebaseUid = nativeFromJson<String>(json['uploadeParFirebaseUid']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AjouterDocumentVariables otherTyped = other as AjouterDocumentVariables;
    return parcelleId == otherTyped.parcelleId && 
    typeDocument == otherTyped.typeDocument && 
    nomFichier == otherTyped.nomFichier && 
    urlStockage == otherTyped.urlStockage && 
    uploadeParFirebaseUid == otherTyped.uploadeParFirebaseUid;
    
  }
  @override
  int get hashCode => Object.hashAll([parcelleId.hashCode, typeDocument.hashCode, nomFichier.hashCode, urlStockage.hashCode, uploadeParFirebaseUid.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    json['typeDocument'] = 
    typeDocument.name
    ;
    json['nomFichier'] = nativeToJson<String>(nomFichier);
    json['urlStockage'] = nativeToJson<String>(urlStockage);
    json['uploadeParFirebaseUid'] = nativeToJson<String>(uploadeParFirebaseUid);
    return json;
  }

  AjouterDocumentVariables({
    required this.parcelleId,
    required this.typeDocument,
    required this.nomFichier,
    required this.urlStockage,
    required this.uploadeParFirebaseUid,
  });
}

