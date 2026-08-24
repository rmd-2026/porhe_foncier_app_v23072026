part of 'porhe_foncier23072026.dart';

class ObtenirPaiementParIdVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  ObtenirPaiementParIdVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<ObtenirPaiementParIdData> dataDeserializer = (dynamic json)  => ObtenirPaiementParIdData.fromJson(jsonDecode(json));
  Serializer<ObtenirPaiementParIdVariables> varsSerializer = (ObtenirPaiementParIdVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ObtenirPaiementParIdData, ObtenirPaiementParIdVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ObtenirPaiementParIdData, ObtenirPaiementParIdVariables> ref() {
    ObtenirPaiementParIdVariables vars= ObtenirPaiementParIdVariables(id: id,);
    return _dataConnect.query("obtenirPaiementParId", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ObtenirPaiementParIdPaiement {
  final int id;
  final int utilisateurId;
  final int? taxeFonciereId;
  final int? abonnementId;
  final int? fraisEnregistrementId;
  final EnumValue<MethodePaiement> methodePaiement;
  final double montant;
  final String? referenceTransaction;
  final EnumValue<StatutPaiement> statut;
  final Timestamp createdAt;
  final Timestamp updatedAt;
  ObtenirPaiementParIdPaiement.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  utilisateurId = nativeFromJson<int>(json['utilisateurId']),
  taxeFonciereId = json['taxeFonciereId'] == null ? null : nativeFromJson<int>(json['taxeFonciereId']),
  abonnementId = json['abonnementId'] == null ? null : nativeFromJson<int>(json['abonnementId']),
  fraisEnregistrementId = json['fraisEnregistrementId'] == null ? null : nativeFromJson<int>(json['fraisEnregistrementId']),
  methodePaiement = methodePaiementDeserializer(json['methodePaiement']),
  montant = nativeFromJson<double>(json['montant']),
  referenceTransaction = json['referenceTransaction'] == null ? null : nativeFromJson<String>(json['referenceTransaction']),
  statut = statutPaiementDeserializer(json['statut']),
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

    final ObtenirPaiementParIdPaiement otherTyped = other as ObtenirPaiementParIdPaiement;
    return id == otherTyped.id && 
    utilisateurId == otherTyped.utilisateurId && 
    taxeFonciereId == otherTyped.taxeFonciereId && 
    abonnementId == otherTyped.abonnementId && 
    fraisEnregistrementId == otherTyped.fraisEnregistrementId && 
    methodePaiement == otherTyped.methodePaiement && 
    montant == otherTyped.montant && 
    referenceTransaction == otherTyped.referenceTransaction && 
    statut == otherTyped.statut && 
    createdAt == otherTyped.createdAt && 
    updatedAt == otherTyped.updatedAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, utilisateurId.hashCode, taxeFonciereId.hashCode, abonnementId.hashCode, fraisEnregistrementId.hashCode, methodePaiement.hashCode, montant.hashCode, referenceTransaction.hashCode, statut.hashCode, createdAt.hashCode, updatedAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    if (taxeFonciereId != null) {
      json['taxeFonciereId'] = nativeToJson<int?>(taxeFonciereId);
    }
    if (abonnementId != null) {
      json['abonnementId'] = nativeToJson<int?>(abonnementId);
    }
    if (fraisEnregistrementId != null) {
      json['fraisEnregistrementId'] = nativeToJson<int?>(fraisEnregistrementId);
    }
    json['methodePaiement'] = 
    methodePaiementSerializer(methodePaiement)
    ;
    json['montant'] = nativeToJson<double>(montant);
    if (referenceTransaction != null) {
      json['referenceTransaction'] = nativeToJson<String?>(referenceTransaction);
    }
    json['statut'] = 
    statutPaiementSerializer(statut)
    ;
    json['createdAt'] = createdAt.toJson();
    json['updatedAt'] = updatedAt.toJson();
    return json;
  }

  ObtenirPaiementParIdPaiement({
    required this.id,
    required this.utilisateurId,
    this.taxeFonciereId,
    this.abonnementId,
    this.fraisEnregistrementId,
    required this.methodePaiement,
    required this.montant,
    this.referenceTransaction,
    required this.statut,
    required this.createdAt,
    required this.updatedAt,
  });
}

@immutable
class ObtenirPaiementParIdData {
  final ObtenirPaiementParIdPaiement? paiement;
  ObtenirPaiementParIdData.fromJson(dynamic json):
  
  paiement = json['paiement'] == null ? null : ObtenirPaiementParIdPaiement.fromJson(json['paiement']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirPaiementParIdData otherTyped = other as ObtenirPaiementParIdData;
    return paiement == otherTyped.paiement;
    
  }
  @override
  int get hashCode => paiement.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (paiement != null) {
      json['paiement'] = paiement!.toJson();
    }
    return json;
  }

  ObtenirPaiementParIdData({
    this.paiement,
  });
}

@immutable
class ObtenirPaiementParIdVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ObtenirPaiementParIdVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirPaiementParIdVariables otherTyped = other as ObtenirPaiementParIdVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  ObtenirPaiementParIdVariables({
    required this.id,
  });
}

