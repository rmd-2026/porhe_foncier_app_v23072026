part of 'porhe_foncier23072026.dart';

class ListerTransactionsRejeteesParCommuneVariablesBuilder {
  int communeId;

  final FirebaseDataConnect _dataConnect;
  ListerTransactionsRejeteesParCommuneVariablesBuilder(this._dataConnect, {required  this.communeId,});
  Deserializer<ListerTransactionsRejeteesParCommuneData> dataDeserializer = (dynamic json)  => ListerTransactionsRejeteesParCommuneData.fromJson(jsonDecode(json));
  Serializer<ListerTransactionsRejeteesParCommuneVariables> varsSerializer = (ListerTransactionsRejeteesParCommuneVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerTransactionsRejeteesParCommuneData, ListerTransactionsRejeteesParCommuneVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerTransactionsRejeteesParCommuneData, ListerTransactionsRejeteesParCommuneVariables> ref() {
    ListerTransactionsRejeteesParCommuneVariables vars= ListerTransactionsRejeteesParCommuneVariables(communeId: communeId,);
    return _dataConnect.query("listerTransactionsRejeteesParCommune", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerTransactionsRejeteesParCommuneTransactionFoncieres {
  final int id;
  final int parcelleId;
  final String? motifRejet;
  final Timestamp updatedAt;
  ListerTransactionsRejeteesParCommuneTransactionFoncieres.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  parcelleId = nativeFromJson<int>(json['parcelleId']),
  motifRejet = json['motifRejet'] == null ? null : nativeFromJson<String>(json['motifRejet']),
  updatedAt = Timestamp.fromJson(json['updatedAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTransactionsRejeteesParCommuneTransactionFoncieres otherTyped = other as ListerTransactionsRejeteesParCommuneTransactionFoncieres;
    return id == otherTyped.id && 
    parcelleId == otherTyped.parcelleId && 
    motifRejet == otherTyped.motifRejet && 
    updatedAt == otherTyped.updatedAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, parcelleId.hashCode, motifRejet.hashCode, updatedAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    if (motifRejet != null) {
      json['motifRejet'] = nativeToJson<String?>(motifRejet);
    }
    json['updatedAt'] = updatedAt.toJson();
    return json;
  }

  ListerTransactionsRejeteesParCommuneTransactionFoncieres({
    required this.id,
    required this.parcelleId,
    this.motifRejet,
    required this.updatedAt,
  });
}

@immutable
class ListerTransactionsRejeteesParCommuneData {
  final List<ListerTransactionsRejeteesParCommuneTransactionFoncieres> transactionFoncieres;
  ListerTransactionsRejeteesParCommuneData.fromJson(dynamic json):
  
  transactionFoncieres = (json['transactionFoncieres'] as List<dynamic>)
        .map((e) => ListerTransactionsRejeteesParCommuneTransactionFoncieres.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTransactionsRejeteesParCommuneData otherTyped = other as ListerTransactionsRejeteesParCommuneData;
    return transactionFoncieres == otherTyped.transactionFoncieres;
    
  }
  @override
  int get hashCode => transactionFoncieres.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['transactionFoncieres'] = transactionFoncieres.map((e) => e.toJson()).toList();
    return json;
  }

  ListerTransactionsRejeteesParCommuneData({
    required this.transactionFoncieres,
  });
}

@immutable
class ListerTransactionsRejeteesParCommuneVariables {
  final int communeId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerTransactionsRejeteesParCommuneVariables.fromJson(Map<String, dynamic> json):
  
  communeId = nativeFromJson<int>(json['communeId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTransactionsRejeteesParCommuneVariables otherTyped = other as ListerTransactionsRejeteesParCommuneVariables;
    return communeId == otherTyped.communeId;
    
  }
  @override
  int get hashCode => communeId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['communeId'] = nativeToJson<int>(communeId);
    return json;
  }

  ListerTransactionsRejeteesParCommuneVariables({
    required this.communeId,
  });
}

