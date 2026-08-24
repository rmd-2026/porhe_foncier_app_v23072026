part of 'porhe_foncier23072026.dart';

class ListerTousPaiementsVariablesBuilder {
  Optional<int> _limit = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _offset = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;
  ListerTousPaiementsVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerTousPaiementsVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ListerTousPaiementsVariablesBuilder(this._dataConnect, );
  Deserializer<ListerTousPaiementsData> dataDeserializer = (dynamic json)  => ListerTousPaiementsData.fromJson(jsonDecode(json));
  Serializer<ListerTousPaiementsVariables> varsSerializer = (ListerTousPaiementsVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerTousPaiementsData, ListerTousPaiementsVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerTousPaiementsData, ListerTousPaiementsVariables> ref() {
    ListerTousPaiementsVariables vars= ListerTousPaiementsVariables(limit: _limit,offset: _offset,);
    return _dataConnect.query("listerTousPaiements", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerTousPaiementsPaiements {
  final int id;
  final int utilisateurId;
  final EnumValue<MethodePaiement> methodePaiement;
  final double montant;
  final EnumValue<StatutPaiement> statut;
  final Timestamp createdAt;
  ListerTousPaiementsPaiements.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  utilisateurId = nativeFromJson<int>(json['utilisateurId']),
  methodePaiement = methodePaiementDeserializer(json['methodePaiement']),
  montant = nativeFromJson<double>(json['montant']),
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

    final ListerTousPaiementsPaiements otherTyped = other as ListerTousPaiementsPaiements;
    return id == otherTyped.id && 
    utilisateurId == otherTyped.utilisateurId && 
    methodePaiement == otherTyped.methodePaiement && 
    montant == otherTyped.montant && 
    statut == otherTyped.statut && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, utilisateurId.hashCode, methodePaiement.hashCode, montant.hashCode, statut.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    json['methodePaiement'] = 
    methodePaiementSerializer(methodePaiement)
    ;
    json['montant'] = nativeToJson<double>(montant);
    json['statut'] = 
    statutPaiementSerializer(statut)
    ;
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListerTousPaiementsPaiements({
    required this.id,
    required this.utilisateurId,
    required this.methodePaiement,
    required this.montant,
    required this.statut,
    required this.createdAt,
  });
}

@immutable
class ListerTousPaiementsData {
  final List<ListerTousPaiementsPaiements> paiements;
  ListerTousPaiementsData.fromJson(dynamic json):
  
  paiements = (json['paiements'] as List<dynamic>)
        .map((e) => ListerTousPaiementsPaiements.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTousPaiementsData otherTyped = other as ListerTousPaiementsData;
    return paiements == otherTyped.paiements;
    
  }
  @override
  int get hashCode => paiements.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['paiements'] = paiements.map((e) => e.toJson()).toList();
    return json;
  }

  ListerTousPaiementsData({
    required this.paiements,
  });
}

@immutable
class ListerTousPaiementsVariables {
  late final Optional<int>limit;
  late final Optional<int>offset;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerTousPaiementsVariables.fromJson(Map<String, dynamic> json) {
  
  
    limit = Optional.optional(nativeFromJson, nativeToJson);
    limit.value = json['limit'] == null ? null : nativeFromJson<int>(json['limit']);
  
  
    offset = Optional.optional(nativeFromJson, nativeToJson);
    offset.value = json['offset'] == null ? null : nativeFromJson<int>(json['offset']);
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTousPaiementsVariables otherTyped = other as ListerTousPaiementsVariables;
    return limit == otherTyped.limit && 
    offset == otherTyped.offset;
    
  }
  @override
  int get hashCode => Object.hashAll([limit.hashCode, offset.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if(limit.state == OptionalState.set) {
      json['limit'] = limit.toJson();
    }
    if(offset.state == OptionalState.set) {
      json['offset'] = offset.toJson();
    }
    return json;
  }

  ListerTousPaiementsVariables({
    required this.limit,
    required this.offset,
  });
}

