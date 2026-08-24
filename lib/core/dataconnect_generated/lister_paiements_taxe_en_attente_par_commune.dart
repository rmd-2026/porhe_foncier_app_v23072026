part of 'porhe_foncier23072026.dart';

class ListerPaiementsTaxeEnAttenteParCommuneVariablesBuilder {
  int communeId;

  final FirebaseDataConnect _dataConnect;
  ListerPaiementsTaxeEnAttenteParCommuneVariablesBuilder(this._dataConnect, {required  this.communeId,});
  Deserializer<ListerPaiementsTaxeEnAttenteParCommuneData> dataDeserializer = (dynamic json)  => ListerPaiementsTaxeEnAttenteParCommuneData.fromJson(jsonDecode(json));
  Serializer<ListerPaiementsTaxeEnAttenteParCommuneVariables> varsSerializer = (ListerPaiementsTaxeEnAttenteParCommuneVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerPaiementsTaxeEnAttenteParCommuneData, ListerPaiementsTaxeEnAttenteParCommuneVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerPaiementsTaxeEnAttenteParCommuneData, ListerPaiementsTaxeEnAttenteParCommuneVariables> ref() {
    ListerPaiementsTaxeEnAttenteParCommuneVariables vars= ListerPaiementsTaxeEnAttenteParCommuneVariables(communeId: communeId,);
    return _dataConnect.query("listerPaiementsTaxeEnAttenteParCommune", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerPaiementsTaxeEnAttenteParCommunePaiements {
  final int id;
  final int utilisateurId;
  final int? taxeFonciereId;
  final EnumValue<MethodePaiement> methodePaiement;
  final double montant;
  final String? referenceTransaction;
  final Timestamp createdAt;
  ListerPaiementsTaxeEnAttenteParCommunePaiements.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  utilisateurId = nativeFromJson<int>(json['utilisateurId']),
  taxeFonciereId = json['taxeFonciereId'] == null ? null : nativeFromJson<int>(json['taxeFonciereId']),
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

    final ListerPaiementsTaxeEnAttenteParCommunePaiements otherTyped = other as ListerPaiementsTaxeEnAttenteParCommunePaiements;
    return id == otherTyped.id && 
    utilisateurId == otherTyped.utilisateurId && 
    taxeFonciereId == otherTyped.taxeFonciereId && 
    methodePaiement == otherTyped.methodePaiement && 
    montant == otherTyped.montant && 
    referenceTransaction == otherTyped.referenceTransaction && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, utilisateurId.hashCode, taxeFonciereId.hashCode, methodePaiement.hashCode, montant.hashCode, referenceTransaction.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    if (taxeFonciereId != null) {
      json['taxeFonciereId'] = nativeToJson<int?>(taxeFonciereId);
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

  ListerPaiementsTaxeEnAttenteParCommunePaiements({
    required this.id,
    required this.utilisateurId,
    this.taxeFonciereId,
    required this.methodePaiement,
    required this.montant,
    this.referenceTransaction,
    required this.createdAt,
  });
}

@immutable
class ListerPaiementsTaxeEnAttenteParCommuneData {
  final List<ListerPaiementsTaxeEnAttenteParCommunePaiements> paiements;
  ListerPaiementsTaxeEnAttenteParCommuneData.fromJson(dynamic json):
  
  paiements = (json['paiements'] as List<dynamic>)
        .map((e) => ListerPaiementsTaxeEnAttenteParCommunePaiements.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerPaiementsTaxeEnAttenteParCommuneData otherTyped = other as ListerPaiementsTaxeEnAttenteParCommuneData;
    return paiements == otherTyped.paiements;
    
  }
  @override
  int get hashCode => paiements.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['paiements'] = paiements.map((e) => e.toJson()).toList();
    return json;
  }

  ListerPaiementsTaxeEnAttenteParCommuneData({
    required this.paiements,
  });
}

@immutable
class ListerPaiementsTaxeEnAttenteParCommuneVariables {
  final int communeId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerPaiementsTaxeEnAttenteParCommuneVariables.fromJson(Map<String, dynamic> json):
  
  communeId = nativeFromJson<int>(json['communeId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerPaiementsTaxeEnAttenteParCommuneVariables otherTyped = other as ListerPaiementsTaxeEnAttenteParCommuneVariables;
    return communeId == otherTyped.communeId;
    
  }
  @override
  int get hashCode => communeId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['communeId'] = nativeToJson<int>(communeId);
    return json;
  }

  ListerPaiementsTaxeEnAttenteParCommuneVariables({
    required this.communeId,
  });
}

