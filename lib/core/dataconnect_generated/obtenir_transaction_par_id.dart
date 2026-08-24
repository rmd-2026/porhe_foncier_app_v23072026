part of 'porhe_foncier23072026.dart';

class ObtenirTransactionParIdVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  ObtenirTransactionParIdVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<ObtenirTransactionParIdData> dataDeserializer = (dynamic json)  => ObtenirTransactionParIdData.fromJson(jsonDecode(json));
  Serializer<ObtenirTransactionParIdVariables> varsSerializer = (ObtenirTransactionParIdVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ObtenirTransactionParIdData, ObtenirTransactionParIdVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ObtenirTransactionParIdData, ObtenirTransactionParIdVariables> ref() {
    ObtenirTransactionParIdVariables vars= ObtenirTransactionParIdVariables(id: id,);
    return _dataConnect.query("obtenirTransactionParId", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ObtenirTransactionParIdTransactionFonciere {
  final int id;
  final int parcelleId;
  final int vendeurId;
  final int acheteurId;
  final EnumValue<TypeTransaction> typeTransaction;
  final double? montant;
  final EnumValue<StatutTransaction> statut;
  final String? motifRejet;
  final DateTime dateTransaction;
  final Timestamp createdAt;
  final Timestamp updatedAt;
  ObtenirTransactionParIdTransactionFonciere.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  parcelleId = nativeFromJson<int>(json['parcelleId']),
  vendeurId = nativeFromJson<int>(json['vendeurId']),
  acheteurId = nativeFromJson<int>(json['acheteurId']),
  typeTransaction = typeTransactionDeserializer(json['typeTransaction']),
  montant = json['montant'] == null ? null : nativeFromJson<double>(json['montant']),
  statut = statutTransactionDeserializer(json['statut']),
  motifRejet = json['motifRejet'] == null ? null : nativeFromJson<String>(json['motifRejet']),
  dateTransaction = nativeFromJson<DateTime>(json['dateTransaction']),
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

    final ObtenirTransactionParIdTransactionFonciere otherTyped = other as ObtenirTransactionParIdTransactionFonciere;
    return id == otherTyped.id && 
    parcelleId == otherTyped.parcelleId && 
    vendeurId == otherTyped.vendeurId && 
    acheteurId == otherTyped.acheteurId && 
    typeTransaction == otherTyped.typeTransaction && 
    montant == otherTyped.montant && 
    statut == otherTyped.statut && 
    motifRejet == otherTyped.motifRejet && 
    dateTransaction == otherTyped.dateTransaction && 
    createdAt == otherTyped.createdAt && 
    updatedAt == otherTyped.updatedAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, parcelleId.hashCode, vendeurId.hashCode, acheteurId.hashCode, typeTransaction.hashCode, montant.hashCode, statut.hashCode, motifRejet.hashCode, dateTransaction.hashCode, createdAt.hashCode, updatedAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    json['vendeurId'] = nativeToJson<int>(vendeurId);
    json['acheteurId'] = nativeToJson<int>(acheteurId);
    json['typeTransaction'] = 
    typeTransactionSerializer(typeTransaction)
    ;
    if (montant != null) {
      json['montant'] = nativeToJson<double?>(montant);
    }
    json['statut'] = 
    statutTransactionSerializer(statut)
    ;
    if (motifRejet != null) {
      json['motifRejet'] = nativeToJson<String?>(motifRejet);
    }
    json['dateTransaction'] = nativeToJson<DateTime>(dateTransaction);
    json['createdAt'] = createdAt.toJson();
    json['updatedAt'] = updatedAt.toJson();
    return json;
  }

  ObtenirTransactionParIdTransactionFonciere({
    required this.id,
    required this.parcelleId,
    required this.vendeurId,
    required this.acheteurId,
    required this.typeTransaction,
    this.montant,
    required this.statut,
    this.motifRejet,
    required this.dateTransaction,
    required this.createdAt,
    required this.updatedAt,
  });
}

@immutable
class ObtenirTransactionParIdData {
  final ObtenirTransactionParIdTransactionFonciere? transactionFonciere;
  ObtenirTransactionParIdData.fromJson(dynamic json):
  
  transactionFonciere = json['transactionFonciere'] == null ? null : ObtenirTransactionParIdTransactionFonciere.fromJson(json['transactionFonciere']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirTransactionParIdData otherTyped = other as ObtenirTransactionParIdData;
    return transactionFonciere == otherTyped.transactionFonciere;
    
  }
  @override
  int get hashCode => transactionFonciere.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (transactionFonciere != null) {
      json['transactionFonciere'] = transactionFonciere!.toJson();
    }
    return json;
  }

  ObtenirTransactionParIdData({
    this.transactionFonciere,
  });
}

@immutable
class ObtenirTransactionParIdVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ObtenirTransactionParIdVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirTransactionParIdVariables otherTyped = other as ObtenirTransactionParIdVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  ObtenirTransactionParIdVariables({
    required this.id,
  });
}

