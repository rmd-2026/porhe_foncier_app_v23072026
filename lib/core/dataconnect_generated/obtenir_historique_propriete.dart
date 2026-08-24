part of 'porhe_foncier23072026.dart';

class ObtenirHistoriqueProprieteVariablesBuilder {
  int parcelleId;

  final FirebaseDataConnect _dataConnect;
  ObtenirHistoriqueProprieteVariablesBuilder(this._dataConnect, {required  this.parcelleId,});
  Deserializer<ObtenirHistoriqueProprieteData> dataDeserializer = (dynamic json)  => ObtenirHistoriqueProprieteData.fromJson(jsonDecode(json));
  Serializer<ObtenirHistoriqueProprieteVariables> varsSerializer = (ObtenirHistoriqueProprieteVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ObtenirHistoriqueProprieteData, ObtenirHistoriqueProprieteVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ObtenirHistoriqueProprieteData, ObtenirHistoriqueProprieteVariables> ref() {
    ObtenirHistoriqueProprieteVariables vars= ObtenirHistoriqueProprieteVariables(parcelleId: parcelleId,);
    return _dataConnect.query("obtenirHistoriquePropriete", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ObtenirHistoriqueProprieteTransactionFoncieres {
  final int id;
  final int vendeurId;
  final int acheteurId;
  final EnumValue<TypeTransaction> typeTransaction;
  final double? montant;
  final DateTime dateTransaction;
  ObtenirHistoriqueProprieteTransactionFoncieres.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  vendeurId = nativeFromJson<int>(json['vendeurId']),
  acheteurId = nativeFromJson<int>(json['acheteurId']),
  typeTransaction = typeTransactionDeserializer(json['typeTransaction']),
  montant = json['montant'] == null ? null : nativeFromJson<double>(json['montant']),
  dateTransaction = nativeFromJson<DateTime>(json['dateTransaction']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirHistoriqueProprieteTransactionFoncieres otherTyped = other as ObtenirHistoriqueProprieteTransactionFoncieres;
    return id == otherTyped.id && 
    vendeurId == otherTyped.vendeurId && 
    acheteurId == otherTyped.acheteurId && 
    typeTransaction == otherTyped.typeTransaction && 
    montant == otherTyped.montant && 
    dateTransaction == otherTyped.dateTransaction;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, vendeurId.hashCode, acheteurId.hashCode, typeTransaction.hashCode, montant.hashCode, dateTransaction.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['vendeurId'] = nativeToJson<int>(vendeurId);
    json['acheteurId'] = nativeToJson<int>(acheteurId);
    json['typeTransaction'] = 
    typeTransactionSerializer(typeTransaction)
    ;
    if (montant != null) {
      json['montant'] = nativeToJson<double?>(montant);
    }
    json['dateTransaction'] = nativeToJson<DateTime>(dateTransaction);
    return json;
  }

  ObtenirHistoriqueProprieteTransactionFoncieres({
    required this.id,
    required this.vendeurId,
    required this.acheteurId,
    required this.typeTransaction,
    this.montant,
    required this.dateTransaction,
  });
}

@immutable
class ObtenirHistoriqueProprieteData {
  final List<ObtenirHistoriqueProprieteTransactionFoncieres> transactionFoncieres;
  ObtenirHistoriqueProprieteData.fromJson(dynamic json):
  
  transactionFoncieres = (json['transactionFoncieres'] as List<dynamic>)
        .map((e) => ObtenirHistoriqueProprieteTransactionFoncieres.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirHistoriqueProprieteData otherTyped = other as ObtenirHistoriqueProprieteData;
    return transactionFoncieres == otherTyped.transactionFoncieres;
    
  }
  @override
  int get hashCode => transactionFoncieres.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['transactionFoncieres'] = transactionFoncieres.map((e) => e.toJson()).toList();
    return json;
  }

  ObtenirHistoriqueProprieteData({
    required this.transactionFoncieres,
  });
}

@immutable
class ObtenirHistoriqueProprieteVariables {
  final int parcelleId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ObtenirHistoriqueProprieteVariables.fromJson(Map<String, dynamic> json):
  
  parcelleId = nativeFromJson<int>(json['parcelleId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirHistoriqueProprieteVariables otherTyped = other as ObtenirHistoriqueProprieteVariables;
    return parcelleId == otherTyped.parcelleId;
    
  }
  @override
  int get hashCode => parcelleId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    return json;
  }

  ObtenirHistoriqueProprieteVariables({
    required this.parcelleId,
  });
}

