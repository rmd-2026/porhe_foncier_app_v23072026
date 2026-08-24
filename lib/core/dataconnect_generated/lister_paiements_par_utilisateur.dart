part of 'porhe_foncier23072026.dart';

class ListerPaiementsParUtilisateurVariablesBuilder {
  int utilisateurId;

  final FirebaseDataConnect _dataConnect;
  ListerPaiementsParUtilisateurVariablesBuilder(this._dataConnect, {required  this.utilisateurId,});
  Deserializer<ListerPaiementsParUtilisateurData> dataDeserializer = (dynamic json)  => ListerPaiementsParUtilisateurData.fromJson(jsonDecode(json));
  Serializer<ListerPaiementsParUtilisateurVariables> varsSerializer = (ListerPaiementsParUtilisateurVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerPaiementsParUtilisateurData, ListerPaiementsParUtilisateurVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerPaiementsParUtilisateurData, ListerPaiementsParUtilisateurVariables> ref() {
    ListerPaiementsParUtilisateurVariables vars= ListerPaiementsParUtilisateurVariables(utilisateurId: utilisateurId,);
    return _dataConnect.query("listerPaiementsParUtilisateur", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerPaiementsParUtilisateurPaiements {
  final int id;
  final int? taxeFonciereId;
  final int? abonnementId;
  final int? fraisEnregistrementId;
  final EnumValue<MethodePaiement> methodePaiement;
  final double montant;
  final String? referenceTransaction;
  final EnumValue<StatutPaiement> statut;
  final Timestamp createdAt;
  ListerPaiementsParUtilisateurPaiements.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  taxeFonciereId = json['taxeFonciereId'] == null ? null : nativeFromJson<int>(json['taxeFonciereId']),
  abonnementId = json['abonnementId'] == null ? null : nativeFromJson<int>(json['abonnementId']),
  fraisEnregistrementId = json['fraisEnregistrementId'] == null ? null : nativeFromJson<int>(json['fraisEnregistrementId']),
  methodePaiement = methodePaiementDeserializer(json['methodePaiement']),
  montant = nativeFromJson<double>(json['montant']),
  referenceTransaction = json['referenceTransaction'] == null ? null : nativeFromJson<String>(json['referenceTransaction']),
  statut = statutPaiementDeserializer(json['statut']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerPaiementsParUtilisateurPaiements otherTyped = other as ListerPaiementsParUtilisateurPaiements;
    return id == otherTyped.id && 
    taxeFonciereId == otherTyped.taxeFonciereId && 
    abonnementId == otherTyped.abonnementId && 
    fraisEnregistrementId == otherTyped.fraisEnregistrementId && 
    methodePaiement == otherTyped.methodePaiement && 
    montant == otherTyped.montant && 
    referenceTransaction == otherTyped.referenceTransaction && 
    statut == otherTyped.statut && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, taxeFonciereId.hashCode, abonnementId.hashCode, fraisEnregistrementId.hashCode, methodePaiement.hashCode, montant.hashCode, referenceTransaction.hashCode, statut.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
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
    return json;
  }

  ListerPaiementsParUtilisateurPaiements({
    required this.id,
    this.taxeFonciereId,
    this.abonnementId,
    this.fraisEnregistrementId,
    required this.methodePaiement,
    required this.montant,
    this.referenceTransaction,
    required this.statut,
    required this.createdAt,
  });
}

@immutable
class ListerPaiementsParUtilisateurData {
  final List<ListerPaiementsParUtilisateurPaiements> paiements;
  ListerPaiementsParUtilisateurData.fromJson(dynamic json):
  
  paiements = (json['paiements'] as List<dynamic>)
        .map((e) => ListerPaiementsParUtilisateurPaiements.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerPaiementsParUtilisateurData otherTyped = other as ListerPaiementsParUtilisateurData;
    return paiements == otherTyped.paiements;
    
  }
  @override
  int get hashCode => paiements.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['paiements'] = paiements.map((e) => e.toJson()).toList();
    return json;
  }

  ListerPaiementsParUtilisateurData({
    required this.paiements,
  });
}

@immutable
class ListerPaiementsParUtilisateurVariables {
  final int utilisateurId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerPaiementsParUtilisateurVariables.fromJson(Map<String, dynamic> json):
  
  utilisateurId = nativeFromJson<int>(json['utilisateurId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerPaiementsParUtilisateurVariables otherTyped = other as ListerPaiementsParUtilisateurVariables;
    return utilisateurId == otherTyped.utilisateurId;
    
  }
  @override
  int get hashCode => utilisateurId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    return json;
  }

  ListerPaiementsParUtilisateurVariables({
    required this.utilisateurId,
  });
}

