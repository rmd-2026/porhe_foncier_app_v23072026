part of 'porhe_foncier23072026.dart';

class ListerTousDocumentsVariablesBuilder {
  Optional<int> _limit = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _offset = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;
  ListerTousDocumentsVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerTousDocumentsVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ListerTousDocumentsVariablesBuilder(this._dataConnect, );
  Deserializer<ListerTousDocumentsData> dataDeserializer = (dynamic json)  => ListerTousDocumentsData.fromJson(jsonDecode(json));
  Serializer<ListerTousDocumentsVariables> varsSerializer = (ListerTousDocumentsVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerTousDocumentsData, ListerTousDocumentsVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerTousDocumentsData, ListerTousDocumentsVariables> ref() {
    ListerTousDocumentsVariables vars= ListerTousDocumentsVariables(limit: _limit,offset: _offset,);
    return _dataConnect.query("listerTousDocuments", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerTousDocumentsDocumentParcelles {
  final int id;
  final int parcelleId;
  final EnumValue<TypeDocument> typeDocument;
  final String nomFichier;
  final Timestamp createdAt;
  ListerTousDocumentsDocumentParcelles.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  parcelleId = nativeFromJson<int>(json['parcelleId']),
  typeDocument = typeDocumentDeserializer(json['typeDocument']),
  nomFichier = nativeFromJson<String>(json['nomFichier']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTousDocumentsDocumentParcelles otherTyped = other as ListerTousDocumentsDocumentParcelles;
    return id == otherTyped.id && 
    parcelleId == otherTyped.parcelleId && 
    typeDocument == otherTyped.typeDocument && 
    nomFichier == otherTyped.nomFichier && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, parcelleId.hashCode, typeDocument.hashCode, nomFichier.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    json['typeDocument'] = 
    typeDocumentSerializer(typeDocument)
    ;
    json['nomFichier'] = nativeToJson<String>(nomFichier);
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListerTousDocumentsDocumentParcelles({
    required this.id,
    required this.parcelleId,
    required this.typeDocument,
    required this.nomFichier,
    required this.createdAt,
  });
}

@immutable
class ListerTousDocumentsData {
  final List<ListerTousDocumentsDocumentParcelles> documentParcelles;
  ListerTousDocumentsData.fromJson(dynamic json):
  
  documentParcelles = (json['documentParcelles'] as List<dynamic>)
        .map((e) => ListerTousDocumentsDocumentParcelles.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTousDocumentsData otherTyped = other as ListerTousDocumentsData;
    return documentParcelles == otherTyped.documentParcelles;
    
  }
  @override
  int get hashCode => documentParcelles.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['documentParcelles'] = documentParcelles.map((e) => e.toJson()).toList();
    return json;
  }

  ListerTousDocumentsData({
    required this.documentParcelles,
  });
}

@immutable
class ListerTousDocumentsVariables {
  late final Optional<int>limit;
  late final Optional<int>offset;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerTousDocumentsVariables.fromJson(Map<String, dynamic> json) {
  
  
    limit = Optional.optional(nativeFromJson, nativeToJson);
    limit.value = json['limit'] == null ? null : nativeFromJson<int>(json['limit']);
  
  
    offset = Optional.optional(nativeFromJson, nativeToJson);
    offset.value = json['offset'] == null ? null : nativeFromJson<int>(json['offset']);
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTousDocumentsVariables otherTyped = other as ListerTousDocumentsVariables;
    return limit == otherTyped.limit && 
    offset == otherTyped.offset;
    
  }
  @override
  int get hashCode => Object.hashAll([limit.hashCode, offset.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if(limit.state == OptionalState.set) {
      json['limit'] = limit.toJson();
    }
    if(offset.state == OptionalState.set) {
      json['offset'] = offset.toJson();
    }
    return json;
  }

  ListerTousDocumentsVariables({
    required this.limit,
    required this.offset,
  });
}

