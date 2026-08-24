part of 'porhe_foncier23072026.dart';

class ListerDocumentsParParcelleVariablesBuilder {
  int parcelleId;

  final FirebaseDataConnect _dataConnect;
  ListerDocumentsParParcelleVariablesBuilder(this._dataConnect, {required  this.parcelleId,});
  Deserializer<ListerDocumentsParParcelleData> dataDeserializer = (dynamic json)  => ListerDocumentsParParcelleData.fromJson(jsonDecode(json));
  Serializer<ListerDocumentsParParcelleVariables> varsSerializer = (ListerDocumentsParParcelleVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerDocumentsParParcelleData, ListerDocumentsParParcelleVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerDocumentsParParcelleData, ListerDocumentsParParcelleVariables> ref() {
    ListerDocumentsParParcelleVariables vars= ListerDocumentsParParcelleVariables(parcelleId: parcelleId,);
    return _dataConnect.query("listerDocumentsParParcelle", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerDocumentsParParcelleDocumentParcelles {
  final int id;
  final EnumValue<TypeDocument> typeDocument;
  final String nomFichier;
  final String urlStockage;
  final String uploadeParFirebaseUid;
  final Timestamp createdAt;
  ListerDocumentsParParcelleDocumentParcelles.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  typeDocument = typeDocumentDeserializer(json['typeDocument']),
  nomFichier = nativeFromJson<String>(json['nomFichier']),
  urlStockage = nativeFromJson<String>(json['urlStockage']),
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

    final ListerDocumentsParParcelleDocumentParcelles otherTyped = other as ListerDocumentsParParcelleDocumentParcelles;
    return id == otherTyped.id && 
    typeDocument == otherTyped.typeDocument && 
    nomFichier == otherTyped.nomFichier && 
    urlStockage == otherTyped.urlStockage && 
    uploadeParFirebaseUid == otherTyped.uploadeParFirebaseUid && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, typeDocument.hashCode, nomFichier.hashCode, urlStockage.hashCode, uploadeParFirebaseUid.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['typeDocument'] = 
    typeDocumentSerializer(typeDocument)
    ;
    json['nomFichier'] = nativeToJson<String>(nomFichier);
    json['urlStockage'] = nativeToJson<String>(urlStockage);
    json['uploadeParFirebaseUid'] = nativeToJson<String>(uploadeParFirebaseUid);
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListerDocumentsParParcelleDocumentParcelles({
    required this.id,
    required this.typeDocument,
    required this.nomFichier,
    required this.urlStockage,
    required this.uploadeParFirebaseUid,
    required this.createdAt,
  });
}

@immutable
class ListerDocumentsParParcelleData {
  final List<ListerDocumentsParParcelleDocumentParcelles> documentParcelles;
  ListerDocumentsParParcelleData.fromJson(dynamic json):
  
  documentParcelles = (json['documentParcelles'] as List<dynamic>)
        .map((e) => ListerDocumentsParParcelleDocumentParcelles.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerDocumentsParParcelleData otherTyped = other as ListerDocumentsParParcelleData;
    return documentParcelles == otherTyped.documentParcelles;
    
  }
  @override
  int get hashCode => documentParcelles.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['documentParcelles'] = documentParcelles.map((e) => e.toJson()).toList();
    return json;
  }

  ListerDocumentsParParcelleData({
    required this.documentParcelles,
  });
}

@immutable
class ListerDocumentsParParcelleVariables {
  final int parcelleId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerDocumentsParParcelleVariables.fromJson(Map<String, dynamic> json):
  
  parcelleId = nativeFromJson<int>(json['parcelleId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerDocumentsParParcelleVariables otherTyped = other as ListerDocumentsParParcelleVariables;
    return parcelleId == otherTyped.parcelleId;
    
  }
  @override
  int get hashCode => parcelleId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    return json;
  }

  ListerDocumentsParParcelleVariables({
    required this.parcelleId,
  });
}

