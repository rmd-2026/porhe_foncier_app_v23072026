part of 'porhe_foncier23072026.dart';

class ListerTransactionsParParcelleVariablesBuilder {
  int parcelleId;

  final FirebaseDataConnect _dataConnect;
  ListerTransactionsParParcelleVariablesBuilder(this._dataConnect, {required  this.parcelleId,});
  Deserializer<ListerTransactionsParParcelleData> dataDeserializer = (dynamic json)  => ListerTransactionsParParcelleData.fromJson(jsonDecode(json));
  Serializer<ListerTransactionsParParcelleVariables> varsSerializer = (ListerTransactionsParParcelleVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerTransactionsParParcelleData, ListerTransactionsParParcelleVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerTransactionsParParcelleData, ListerTransactionsParParcelleVariables> ref() {
    ListerTransactionsParParcelleVariables vars= ListerTransactionsParParcelleVariables(parcelleId: parcelleId,);
    return _dataConnect.query("listerTransactionsParParcelle", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerTransactionsParParcelleTransactionFoncieres {
  final int id;
  final EnumValue<TypeTransaction> typeTransaction;
  final double? montant;
  final EnumValue<StatutTransaction> statut;
  final DateTime dateTransaction;
  ListerTransactionsParParcelleTransactionFoncieres.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
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

    final ListerTransactionsParParcelleTransactionFoncieres otherTyped = other as ListerTransactionsParParcelleTransactionFoncieres;
    return id == otherTyped.id && 
    typeTransaction == otherTyped.typeTransaction && 
    montant == otherTyped.montant && 
    statut == otherTyped.statut && 
    dateTransaction == otherTyped.dateTransaction;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, typeTransaction.hashCode, montant.hashCode, statut.hashCode, dateTransaction.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
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

  ListerTransactionsParParcelleTransactionFoncieres({
    required this.id,
    required this.typeTransaction,
    this.montant,
    required this.statut,
    required this.dateTransaction,
  });
}

@immutable
class ListerTransactionsParParcelleData {
  final List<ListerTransactionsParParcelleTransactionFoncieres> transactionFoncieres;
  ListerTransactionsParParcelleData.fromJson(dynamic json):
  
  transactionFoncieres = (json['transactionFoncieres'] as List<dynamic>)
        .map((e) => ListerTransactionsParParcelleTransactionFoncieres.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTransactionsParParcelleData otherTyped = other as ListerTransactionsParParcelleData;
    return transactionFoncieres == otherTyped.transactionFoncieres;
    
  }
  @override
  int get hashCode => transactionFoncieres.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['transactionFoncieres'] = transactionFoncieres.map((e) => e.toJson()).toList();
    return json;
  }

  ListerTransactionsParParcelleData({
    required this.transactionFoncieres,
  });
}

@immutable
class ListerTransactionsParParcelleVariables {
  final int parcelleId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerTransactionsParParcelleVariables.fromJson(Map<String, dynamic> json):
  
  parcelleId = nativeFromJson<int>(json['parcelleId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTransactionsParParcelleVariables otherTyped = other as ListerTransactionsParParcelleVariables;
    return parcelleId == otherTyped.parcelleId;
    
  }
  @override
  int get hashCode => parcelleId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    return json;
  }

  ListerTransactionsParParcelleVariables({
    required this.parcelleId,
  });
}

