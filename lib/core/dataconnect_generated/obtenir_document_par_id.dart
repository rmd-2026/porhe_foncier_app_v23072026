part of 'porhe_foncier23072026.dart';

class ObtenirDocumentParIdVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  ObtenirDocumentParIdVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<ObtenirDocumentParIdData> dataDeserializer = (dynamic json)  => ObtenirDocumentParIdData.fromJson(jsonDecode(json));
  Serializer<ObtenirDocumentParIdVariables> varsSerializer = (ObtenirDocumentParIdVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ObtenirDocumentParIdData, ObtenirDocumentParIdVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ObtenirDocumentParIdData, ObtenirDocumentParIdVariables> ref() {
    ObtenirDocumentParIdVariables vars= ObtenirDocumentParIdVariables(id: id,);
    return _dataConnect.query("obtenirDocumentParId", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ObtenirDocumentParIdDocumentParcelle {
  final int id;
  final int parcelleId;
  final EnumValue<TypeDocument> typeDocument;
  final String nomFichier;
  final String urlStockage;
  final String uploadeParFirebaseUid;
  final Timestamp createdAt;
  final Timestamp updatedAt;
  ObtenirDocumentParIdDocumentParcelle.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  parcelleId = nativeFromJson<int>(json['parcelleId']),
  typeDocument = typeDocumentDeserializer(json['typeDocument']),
  nomFichier = nativeFromJson<String>(json['nomFichier']),
  urlStockage = nativeFromJson<String>(json['urlStockage']),
  uploadeParFirebaseUid = nativeFromJson<String>(json['uploadeParFirebaseUid']),
  createdAt = Timestamp.fromJson(json['createdAt']),
  updatedAt = Timestamp.fromJson(json['updatedAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirDocumentParIdDocumentParcelle otherTyped = other as ObtenirDocumentParIdDocumentParcelle;
    return id == otherTyped.id && 
    parcelleId == otherTyped.parcelleId && 
    typeDocument == otherTyped.typeDocument && 
    nomFichier == otherTyped.nomFichier && 
    urlStockage == otherTyped.urlStockage && 
    uploadeParFirebaseUid == otherTyped.uploadeParFirebaseUid && 
    createdAt == otherTyped.createdAt && 
    updatedAt == otherTyped.updatedAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, parcelleId.hashCode, typeDocument.hashCode, nomFichier.hashCode, urlStockage.hashCode, uploadeParFirebaseUid.hashCode, createdAt.hashCode, updatedAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    json['typeDocument'] = 
    typeDocumentSerializer(typeDocument)
    ;
    json['nomFichier'] = nativeToJson<String>(nomFichier);
    json['urlStockage'] = nativeToJson<String>(urlStockage);
    json['uploadeParFirebaseUid'] = nativeToJson<String>(uploadeParFirebaseUid);
    json['createdAt'] = createdAt.toJson();
    json['updatedAt'] = updatedAt.toJson();
    return json;
  }

  ObtenirDocumentParIdDocumentParcelle({
    required this.id,
    required this.parcelleId,
    required this.typeDocument,
    required this.nomFichier,
    required this.urlStockage,
    required this.uploadeParFirebaseUid,
    required this.createdAt,
    required this.updatedAt,
  });
}

@immutable
class ObtenirDocumentParIdData {
  final ObtenirDocumentParIdDocumentParcelle? documentParcelle;
  ObtenirDocumentParIdData.fromJson(dynamic json):
  
  documentParcelle = json['documentParcelle'] == null ? null : ObtenirDocumentParIdDocumentParcelle.fromJson(json['documentParcelle']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirDocumentParIdData otherTyped = other as ObtenirDocumentParIdData;
    return documentParcelle == otherTyped.documentParcelle;
    
  }
  @override
  int get hashCode => documentParcelle.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (documentParcelle != null) {
      json['documentParcelle'] = documentParcelle!.toJson();
    }
    return json;
  }

  ObtenirDocumentParIdData({
    this.documentParcelle,
  });
}

@immutable
class ObtenirDocumentParIdVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ObtenirDocumentParIdVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirDocumentParIdVariables otherTyped = other as ObtenirDocumentParIdVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  ObtenirDocumentParIdVariables({
    required this.id,
  });
}

