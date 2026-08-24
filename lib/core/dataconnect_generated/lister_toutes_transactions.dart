part of 'porhe_foncier23072026.dart';

class ListerToutesTransactionsVariablesBuilder {
  Optional<int> _limit = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _offset = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;
  ListerToutesTransactionsVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerToutesTransactionsVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ListerToutesTransactionsVariablesBuilder(this._dataConnect, );
  Deserializer<ListerToutesTransactionsData> dataDeserializer = (dynamic json)  => ListerToutesTransactionsData.fromJson(jsonDecode(json));
  Serializer<ListerToutesTransactionsVariables> varsSerializer = (ListerToutesTransactionsVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerToutesTransactionsData, ListerToutesTransactionsVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerToutesTransactionsData, ListerToutesTransactionsVariables> ref() {
    ListerToutesTransactionsVariables vars= ListerToutesTransactionsVariables(limit: _limit,offset: _offset,);
    return _dataConnect.query("listerToutesTransactions", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerToutesTransactionsTransactionFoncieres {
  final int id;
  final int parcelleId;
  final EnumValue<TypeTransaction> typeTransaction;
  final double? montant;
  final EnumValue<StatutTransaction> statut;
  final DateTime dateTransaction;
  ListerToutesTransactionsTransactionFoncieres.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  parcelleId = nativeFromJson<int>(json['parcelleId']),
  typeTransaction = typeTransactionDeserializer(json['typeTransaction']),
  montant = json['montant'] == null ? null : nativeFromJson<double>(json['montant']),
  statut = statutTransactionDeserializer(json['statut']),
  dateTransaction = nativeFromJson<DateTime>(json['dateTransaction']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerToutesTransactionsTransactionFoncieres otherTyped = other as ListerToutesTransactionsTransactionFoncieres;
    return id == otherTyped.id && 
    parcelleId == otherTyped.parcelleId && 
    typeTransaction == otherTyped.typeTransaction && 
    montant == otherTyped.montant && 
    statut == otherTyped.statut && 
    dateTransaction == otherTyped.dateTransaction;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, parcelleId.hashCode, typeTransaction.hashCode, montant.hashCode, statut.hashCode, dateTransaction.hashCode]);
  

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
    json['statut'] = 
    statutTransactionSerializer(statut)
    ;
    json['dateTransaction'] = nativeToJson<DateTime>(dateTransaction);
    return json;
  }

  ListerToutesTransactionsTransactionFoncieres({
    required this.id,
    required this.parcelleId,
    required this.typeTransaction,
    this.montant,
    required this.statut,
    required this.dateTransaction,
  });
}

@immutable
class ListerToutesTransactionsData {
  final List<ListerToutesTransactionsTransactionFoncieres> transactionFoncieres;
  ListerToutesTransactionsData.fromJson(dynamic json):
  
  transactionFoncieres = (json['transactionFoncieres'] as List<dynamic>)
        .map((e) => ListerToutesTransactionsTransactionFoncieres.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerToutesTransactionsData otherTyped = other as ListerToutesTransactionsData;
    return transactionFoncieres == otherTyped.transactionFoncieres;
    
  }
  @override
  int get hashCode => transactionFoncieres.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['transactionFoncieres'] = transactionFoncieres.map((e) => e.toJson()).toList();
    return json;
  }

  ListerToutesTransactionsData({
    required this.transactionFoncieres,
  });
}

@immutable
class ListerToutesTransactionsVariables {
  late final Optional<int>limit;
  late final Optional<int>offset;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerToutesTransactionsVariables.fromJson(Map<String, dynamic> json) {
  
  
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

    final ListerToutesTransactionsVariables otherTyped = other as ListerToutesTransactionsVariables;
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

  ListerToutesTransactionsVariables({
    required this.limit,
    required this.offset,
  });
}

