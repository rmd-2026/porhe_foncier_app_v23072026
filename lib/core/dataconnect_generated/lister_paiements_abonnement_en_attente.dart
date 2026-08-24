part of 'porhe_foncier23072026.dart';

class ListerPaiementsAbonnementEnAttenteVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  ListerPaiementsAbonnementEnAttenteVariablesBuilder(this._dataConnect, );
  Deserializer<ListerPaiementsAbonnementEnAttenteData> dataDeserializer = (dynamic json)  => ListerPaiementsAbonnementEnAttenteData.fromJson(jsonDecode(json));
  
  Future<QueryResult<ListerPaiementsAbonnementEnAttenteData, void>> execute() {
    return ref().execute();
  }

  QueryRef<ListerPaiementsAbonnementEnAttenteData, void> ref() {
    
    return _dataConnect.query("listerPaiementsAbonnementEnAttente", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class ListerPaiementsAbonnementEnAttentePaiements {
  final int id;
  final int utilisateurId;
  final int? abonnementId;
  final EnumValue<MethodePaiement> methodePaiement;
  final double montant;
  final String? referenceTransaction;
  final Timestamp createdAt;
  ListerPaiementsAbonnementEnAttentePaiements.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  utilisateurId = nativeFromJson<int>(json['utilisateurId']),
  abonnementId = json['abonnementId'] == null ? null : nativeFromJson<int>(json['abonnementId']),
  methodePaiement = methodePaiementDeserializer(json['methodePaiement']),
  montant = nativeFromJson<double>(json['montant']),
  referenceTransaction = json['referenceTransaction'] == null ? null : nativeFromJson<String>(json['referenceTransaction']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerPaiementsAbonnementEnAttentePaiements otherTyped = other as ListerPaiementsAbonnementEnAttentePaiements;
    return id == otherTyped.id && 
    utilisateurId == otherTyped.utilisateurId && 
    abonnementId == otherTyped.abonnementId && 
    methodePaiement == otherTyped.methodePaiement && 
    montant == otherTyped.montant && 
    referenceTransaction == otherTyped.referenceTransaction && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, utilisateurId.hashCode, abonnementId.hashCode, methodePaiement.hashCode, montant.hashCode, referenceTransaction.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    if (abonnementId != null) {
      json['abonnementId'] = nativeToJson<int?>(abonnementId);
    }
    json['methodePaiement'] = 
    methodePaiementSerializer(methodePaiement)
    ;
    json['montant'] = nativeToJson<double>(montant);
    if (referenceTransaction != null) {
      json['referenceTransaction'] = nativeToJson<String?>(referenceTransaction);
    }
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListerPaiementsAbonnementEnAttentePaiements({
    required this.id,
    required this.utilisateurId,
    this.abonnementId,
    required this.methodePaiement,
    required this.montant,
    this.referenceTransaction,
    required this.createdAt,
  });
}

@immutable
class ListerPaiementsAbonnementEnAttenteData {
  final List<ListerPaiementsAbonnementEnAttentePaiements> paiements;
  ListerPaiementsAbonnementEnAttenteData.fromJson(dynamic json):
  
  paiements = (json['paiements'] as List<dynamic>)
        .map((e) => ListerPaiementsAbonnementEnAttentePaiements.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerPaiementsAbonnementEnAttenteData otherTyped = other as ListerPaiementsAbonnementEnAttenteData;
    return paiements == otherTyped.paiements;
    
  }
  @override
  int get hashCode => paiements.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['paiements'] = paiements.map((e) => e.toJson()).toList();
    return json;
  }

  ListerPaiementsAbonnementEnAttenteData({
    required this.paiements,
  });
}

