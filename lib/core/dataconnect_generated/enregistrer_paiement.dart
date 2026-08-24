part of 'porhe_foncier23072026.dart';

class EnregistrerPaiementVariablesBuilder {
  int utilisateurId;
  Optional<int> _taxeFonciereId = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _abonnementId = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _fraisEnregistrementId = Optional.optional(nativeFromJson, nativeToJson);
  MethodePaiement methodePaiement;
  double montant;
  Optional<String> _referenceTransaction = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;  EnregistrerPaiementVariablesBuilder taxeFonciereId(int? t) {
   _taxeFonciereId.value = t;
   return this;
  }
  EnregistrerPaiementVariablesBuilder abonnementId(int? t) {
   _abonnementId.value = t;
   return this;
  }
  EnregistrerPaiementVariablesBuilder fraisEnregistrementId(int? t) {
   _fraisEnregistrementId.value = t;
   return this;
  }
  EnregistrerPaiementVariablesBuilder referenceTransaction(String? t) {
   _referenceTransaction.value = t;
   return this;
  }

  EnregistrerPaiementVariablesBuilder(this._dataConnect, {required  this.utilisateurId,required  this.methodePaiement,required  this.montant,});
  Deserializer<EnregistrerPaiementData> dataDeserializer = (dynamic json)  => EnregistrerPaiementData.fromJson(jsonDecode(json));
  Serializer<EnregistrerPaiementVariables> varsSerializer = (EnregistrerPaiementVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<EnregistrerPaiementData, EnregistrerPaiementVariables>> execute() {
    return ref().execute();
  }

  MutationRef<EnregistrerPaiementData, EnregistrerPaiementVariables> ref() {
    EnregistrerPaiementVariables vars= EnregistrerPaiementVariables(utilisateurId: utilisateurId,taxeFonciereId: _taxeFonciereId,abonnementId: _abonnementId,fraisEnregistrementId: _fraisEnregistrementId,methodePaiement: methodePaiement,montant: montant,referenceTransaction: _referenceTransaction,);
    return _dataConnect.mutation("enregistrerPaiement", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class EnregistrerPaiementPaiementInsert {
  final int id;
  EnregistrerPaiementPaiementInsert.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final EnregistrerPaiementPaiementInsert otherTyped = other as EnregistrerPaiementPaiementInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  EnregistrerPaiementPaiementInsert({
    required this.id,
  });
}

@immutable
class EnregistrerPaiementData {
  final EnregistrerPaiementPaiementInsert paiement_insert;
  EnregistrerPaiementData.fromJson(dynamic json):
  
  paiement_insert = EnregistrerPaiementPaiementInsert.fromJson(json['paiement_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final EnregistrerPaiementData otherTyped = other as EnregistrerPaiementData;
    return paiement_insert == otherTyped.paiement_insert;
    
  }
  @override
  int get hashCode => paiement_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['paiement_insert'] = paiement_insert.toJson();
    return json;
  }

  EnregistrerPaiementData({
    required this.paiement_insert,
  });
}

@immutable
class EnregistrerPaiementVariables {
  final int utilisateurId;
  late final Optional<int>taxeFonciereId;
  late final Optional<int>abonnementId;
  late final Optional<int>fraisEnregistrementId;
  final MethodePaiement methodePaiement;
  final double montant;
  late final Optional<String>referenceTransaction;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  EnregistrerPaiementVariables.fromJson(Map<String, dynamic> json):
  
  utilisateurId = nativeFromJson<int>(json['utilisateurId']),
  methodePaiement = MethodePaiement.values.byName(json['methodePaiement']),
  montant = nativeFromJson<double>(json['montant']) {
  
  
  
    taxeFonciereId = Optional.optional(nativeFromJson, nativeToJson);
    taxeFonciereId.value = json['taxeFonciereId'] == null ? null : nativeFromJson<int>(json['taxeFonciereId']);
  
  
    abonnementId = Optional.optional(nativeFromJson, nativeToJson);
    abonnementId.value = json['abonnementId'] == null ? null : nativeFromJson<int>(json['abonnementId']);
  
  
    fraisEnregistrementId = Optional.optional(nativeFromJson, nativeToJson);
    fraisEnregistrementId.value = json['fraisEnregistrementId'] == null ? null : nativeFromJson<int>(json['fraisEnregistrementId']);
  
  
  
  
    referenceTransaction = Optional.optional(nativeFromJson, nativeToJson);
    referenceTransaction.value = json['referenceTransaction'] == null ? null : nativeFromJson<String>(json['referenceTransaction']);
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final EnregistrerPaiementVariables otherTyped = other as EnregistrerPaiementVariables;
    return utilisateurId == otherTyped.utilisateurId && 
    taxeFonciereId == otherTyped.taxeFonciereId && 
    abonnementId == otherTyped.abonnementId && 
    fraisEnregistrementId == otherTyped.fraisEnregistrementId && 
    methodePaiement == otherTyped.methodePaiement && 
    montant == otherTyped.montant && 
    referenceTransaction == otherTyped.referenceTransaction;
    
  }
  @override
  int get hashCode => Object.hashAll([utilisateurId.hashCode, taxeFonciereId.hashCode, abonnementId.hashCode, fraisEnregistrementId.hashCode, methodePaiement.hashCode, montant.hashCode, referenceTransaction.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    if(taxeFonciereId.state == OptionalState.set) {
      json['taxeFonciereId'] = taxeFonciereId.toJson();
    }
    if(abonnementId.state == OptionalState.set) {
      json['abonnementId'] = abonnementId.toJson();
    }
    if(fraisEnregistrementId.state == OptionalState.set) {
      json['fraisEnregistrementId'] = fraisEnregistrementId.toJson();
    }
    json['methodePaiement'] = 
    methodePaiement.name
    ;
    json['montant'] = nativeToJson<double>(montant);
    if(referenceTransaction.state == OptionalState.set) {
      json['referenceTransaction'] = referenceTransaction.toJson();
    }
    return json;
  }

  EnregistrerPaiementVariables({
    required this.utilisateurId,
    required this.taxeFonciereId,
    required this.abonnementId,
    required this.fraisEnregistrementId,
    required this.methodePaiement,
    required this.montant,
    required this.referenceTransaction,
  });
}

