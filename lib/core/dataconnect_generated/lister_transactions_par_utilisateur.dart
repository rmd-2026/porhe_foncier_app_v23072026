part of 'porhe_foncier23072026.dart';

class ListerTransactionsParUtilisateurVariablesBuilder {
  int utilisateurId;

  final FirebaseDataConnect _dataConnect;
  ListerTransactionsParUtilisateurVariablesBuilder(this._dataConnect, {required  this.utilisateurId,});
  Deserializer<ListerTransactionsParUtilisateurData> dataDeserializer = (dynamic json)  => ListerTransactionsParUtilisateurData.fromJson(jsonDecode(json));
  Serializer<ListerTransactionsParUtilisateurVariables> varsSerializer = (ListerTransactionsParUtilisateurVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerTransactionsParUtilisateurData, ListerTransactionsParUtilisateurVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerTransactionsParUtilisateurData, ListerTransactionsParUtilisateurVariables> ref() {
    ListerTransactionsParUtilisateurVariables vars= ListerTransactionsParUtilisateurVariables(utilisateurId: utilisateurId,);
    return _dataConnect.query("listerTransactionsParUtilisateur", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerTransactionsParUtilisateurTransactionFoncieres {
  final int id;
  final int parcelleId;
  final EnumValue<TypeTransaction> typeTransaction;
  final double? montant;
  final EnumValue<StatutTransaction> statut;
  final DateTime dateTransaction;
  ListerTransactionsParUtilisateurTransactionFoncieres.fromJson(dynamic json):
  
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

    final ListerTransactionsParUtilisateurTransactionFoncieres otherTyped = other as ListerTransactionsParUtilisateurTransactionFoncieres;
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

  ListerTransactionsParUtilisateurTransactionFoncieres({
    required this.id,
    required this.parcelleId,
    required this.typeTransaction,
    this.montant,
    required this.statut,
    required this.dateTransaction,
  });
}

@immutable
class ListerTransactionsParUtilisateurData {
  final List<ListerTransactionsParUtilisateurTransactionFoncieres> transactionFoncieres;
  ListerTransactionsParUtilisateurData.fromJson(dynamic json):
  
  transactionFoncieres = (json['transactionFoncieres'] as List<dynamic>)
        .map((e) => ListerTransactionsParUtilisateurTransactionFoncieres.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTransactionsParUtilisateurData otherTyped = other as ListerTransactionsParUtilisateurData;
    return transactionFoncieres == otherTyped.transactionFoncieres;
    
  }
  @override
  int get hashCode => transactionFoncieres.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['transactionFoncieres'] = transactionFoncieres.map((e) => e.toJson()).toList();
    return json;
  }

  ListerTransactionsParUtilisateurData({
    required this.transactionFoncieres,
  });
}

@immutable
class ListerTransactionsParUtilisateurVariables {
  final int utilisateurId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerTransactionsParUtilisateurVariables.fromJson(Map<String, dynamic> json):
  
  utilisateurId = nativeFromJson<int>(json['utilisateurId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTransactionsParUtilisateurVariables otherTyped = other as ListerTransactionsParUtilisateurVariables;
    return utilisateurId == otherTyped.utilisateurId;
    
  }
  @override
  int get hashCode => utilisateurId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    return json;
  }

  ListerTransactionsParUtilisateurVariables({
    required this.utilisateurId,
  });
}

