part of 'porhe_foncier23072026.dart';

class CreerTransactionVariablesBuilder {
  int parcelleId;
  int vendeurId;
  int acheteurId;
  TypeTransaction typeTransaction;
  Optional<double> _montant = Optional.optional(nativeFromJson, nativeToJson);
  DateTime dateTransaction;

  final FirebaseDataConnect _dataConnect;  CreerTransactionVariablesBuilder montant(double? t) {
   _montant.value = t;
   return this;
  }

  CreerTransactionVariablesBuilder(this._dataConnect, {required  this.parcelleId,required  this.vendeurId,required  this.acheteurId,required  this.typeTransaction,required  this.dateTransaction,});
  Deserializer<CreerTransactionData> dataDeserializer = (dynamic json)  => CreerTransactionData.fromJson(jsonDecode(json));
  Serializer<CreerTransactionVariables> varsSerializer = (CreerTransactionVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreerTransactionData, CreerTransactionVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreerTransactionData, CreerTransactionVariables> ref() {
    CreerTransactionVariables vars= CreerTransactionVariables(parcelleId: parcelleId,vendeurId: vendeurId,acheteurId: acheteurId,typeTransaction: typeTransaction,montant: _montant,dateTransaction: dateTransaction,);
    return _dataConnect.mutation("creerTransaction", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CreerTransactionTransactionFonciereInsert {
  final int id;
  CreerTransactionTransactionFonciereInsert.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreerTransactionTransactionFonciereInsert otherTyped = other as CreerTransactionTransactionFonciereInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  CreerTransactionTransactionFonciereInsert({
    required this.id,
  });
}

@immutable
class CreerTransactionData {
  final CreerTransactionTransactionFonciereInsert transactionFonciere_insert;
  CreerTransactionData.fromJson(dynamic json):
  
  transactionFonciere_insert = CreerTransactionTransactionFonciereInsert.fromJson(json['transactionFonciere_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreerTransactionData otherTyped = other as CreerTransactionData;
    return transactionFonciere_insert == otherTyped.transactionFonciere_insert;
    
  }
  @override
  int get hashCode => transactionFonciere_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['transactionFonciere_insert'] = transactionFonciere_insert.toJson();
    return json;
  }

  CreerTransactionData({
    required this.transactionFonciere_insert,
  });
}

@immutable
class CreerTransactionVariables {
  final int parcelleId;
  final int vendeurId;
  final int acheteurId;
  final TypeTransaction typeTransaction;
  late final Optional<double>montant;
  final DateTime dateTransaction;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreerTransactionVariables.fromJson(Map<String, dynamic> json):
  
  parcelleId = nativeFromJson<int>(json['parcelleId']),
  vendeurId = nativeFromJson<int>(json['vendeurId']),
  acheteurId = nativeFromJson<int>(json['acheteurId']),
  typeTransaction = TypeTransaction.values.byName(json['typeTransaction']),
  dateTransaction = nativeFromJson<DateTime>(json['dateTransaction']) {
  
  
  
  
  
  
    montant = Optional.optional(nativeFromJson, nativeToJson);
    montant.value = json['montant'] == null ? null : nativeFromJson<double>(json['montant']);
  
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreerTransactionVariables otherTyped = other as CreerTransactionVariables;
    return parcelleId == otherTyped.parcelleId && 
    vendeurId == otherTyped.vendeurId && 
    acheteurId == otherTyped.acheteurId && 
    typeTransaction == otherTyped.typeTransaction && 
    montant == otherTyped.montant && 
    dateTransaction == otherTyped.dateTransaction;
    
  }
  @override
  int get hashCode => Object.hashAll([parcelleId.hashCode, vendeurId.hashCode, acheteurId.hashCode, typeTransaction.hashCode, montant.hashCode, dateTransaction.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    json['vendeurId'] = nativeToJson<int>(vendeurId);
    json['acheteurId'] = nativeToJson<int>(acheteurId);
    json['typeTransaction'] = 
    typeTransaction.name
    ;
    if(montant.state == OptionalState.set) {
      json['montant'] = montant.toJson();
    }
    json['dateTransaction'] = nativeToJson<DateTime>(dateTransaction);
    return json;
  }

  CreerTransactionVariables({
    required this.parcelleId,
    required this.vendeurId,
    required this.acheteurId,
    required this.typeTransaction,
    required this.montant,
    required this.dateTransaction,
  });
}

