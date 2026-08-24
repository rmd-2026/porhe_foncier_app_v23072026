part of 'porhe_foncier23072026.dart';

class ListerTransactionsEnAttenteParCommuneVariablesBuilder {
  int communeId;

  final FirebaseDataConnect _dataConnect;
  ListerTransactionsEnAttenteParCommuneVariablesBuilder(this._dataConnect, {required  this.communeId,});
  Deserializer<ListerTransactionsEnAttenteParCommuneData> dataDeserializer = (dynamic json)  => ListerTransactionsEnAttenteParCommuneData.fromJson(jsonDecode(json));
  Serializer<ListerTransactionsEnAttenteParCommuneVariables> varsSerializer = (ListerTransactionsEnAttenteParCommuneVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerTransactionsEnAttenteParCommuneData, ListerTransactionsEnAttenteParCommuneVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerTransactionsEnAttenteParCommuneData, ListerTransactionsEnAttenteParCommuneVariables> ref() {
    ListerTransactionsEnAttenteParCommuneVariables vars= ListerTransactionsEnAttenteParCommuneVariables(communeId: communeId,);
    return _dataConnect.query("listerTransactionsEnAttenteParCommune", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerTransactionsEnAttenteParCommuneTransactionFoncieres {
  final int id;
  final int parcelleId;
  final EnumValue<TypeTransaction> typeTransaction;
  final double? montant;
  final DateTime dateTransaction;
  final Timestamp createdAt;
  ListerTransactionsEnAttenteParCommuneTransactionFoncieres.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  parcelleId = nativeFromJson<int>(json['parcelleId']),
  typeTransaction = typeTransactionDeserializer(json['typeTransaction']),
  montant = json['montant'] == null ? null : nativeFromJson<double>(json['montant']),
  dateTransaction = nativeFromJson<DateTime>(json['dateTransaction']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTransactionsEnAttenteParCommuneTransactionFoncieres otherTyped = other as ListerTransactionsEnAttenteParCommuneTransactionFoncieres;
    return id == otherTyped.id && 
    parcelleId == otherTyped.parcelleId && 
    typeTransaction == otherTyped.typeTransaction && 
    montant == otherTyped.montant && 
    dateTransaction == otherTyped.dateTransaction && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, parcelleId.hashCode, typeTransaction.hashCode, montant.hashCode, dateTransaction.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    json['typeTransaction'] = 
    typeTransactionSerializer(typeTransaction)
    ;
    if (montant != null) {
      json['montant'] = nativeToJson<double?>(montant);
    }
    json['dateTransaction'] = nativeToJson<DateTime>(dateTransaction);
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListerTransactionsEnAttenteParCommuneTransactionFoncieres({
    required this.id,
    required this.parcelleId,
    required this.typeTransaction,
    this.montant,
    required this.dateTransaction,
    required this.createdAt,
  });
}

@immutable
class ListerTransactionsEnAttenteParCommuneData {
  final List<ListerTransactionsEnAttenteParCommuneTransactionFoncieres> transactionFoncieres;
  ListerTransactionsEnAttenteParCommuneData.fromJson(dynamic json):
  
  transactionFoncieres = (json['transactionFoncieres'] as List<dynamic>)
        .map((e) => ListerTransactionsEnAttenteParCommuneTransactionFoncieres.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTransactionsEnAttenteParCommuneData otherTyped = other as ListerTransactionsEnAttenteParCommuneData;
    return transactionFoncieres == otherTyped.transactionFoncieres;
    
  }
  @override
  int get hashCode => transactionFoncieres.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['transactionFoncieres'] = transactionFoncieres.map((e) => e.toJson()).toList();
    return json;
  }

  ListerTransactionsEnAttenteParCommuneData({
    required this.transactionFoncieres,
  });
}

@immutable
class ListerTransactionsEnAttenteParCommuneVariables {
  final int communeId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerTransactionsEnAttenteParCommuneVariables.fromJson(Map<String, dynamic> json):
  
  communeId = nativeFromJson<int>(json['communeId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTransactionsEnAttenteParCommuneVariables otherTyped = other as ListerTransactionsEnAttenteParCommuneVariables;
    return communeId == otherTyped.communeId;
    
  }
  @override
  int get hashCode => communeId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['communeId'] = nativeToJson<int>(communeId);
    return json;
  }

  ListerTransactionsEnAttenteParCommuneVariables({
    required this.communeId,
  });
}

