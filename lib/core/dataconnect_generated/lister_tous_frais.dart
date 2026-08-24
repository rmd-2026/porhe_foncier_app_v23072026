part of 'porhe_foncier23072026.dart';

class ListerTousFraisVariablesBuilder {
  Optional<int> _limit = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _offset = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;
  ListerTousFraisVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerTousFraisVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ListerTousFraisVariablesBuilder(this._dataConnect, );
  Deserializer<ListerTousFraisData> dataDeserializer = (dynamic json)  => ListerTousFraisData.fromJson(jsonDecode(json));
  Serializer<ListerTousFraisVariables> varsSerializer = (ListerTousFraisVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerTousFraisData, ListerTousFraisVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerTousFraisData, ListerTousFraisVariables> ref() {
    ListerTousFraisVariables vars= ListerTousFraisVariables(limit: _limit,offset: _offset,);
    return _dataConnect.query("listerTousFrais", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerTousFraisFraisEnregistrements {
  final int id;
  final int parcelleId;
  final EnumValue<TypeFrais> typeFrais;
  final double montant;
  final EnumValue<StatutPaiement> statut;
  final Timestamp createdAt;
  ListerTousFraisFraisEnregistrements.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  parcelleId = nativeFromJson<int>(json['parcelleId']),
  typeFrais = typeFraisDeserializer(json['typeFrais']),
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

    final ListerTousFraisFraisEnregistrements otherTyped = other as ListerTousFraisFraisEnregistrements;
    return id == otherTyped.id && 
    parcelleId == otherTyped.parcelleId && 
    typeFrais == otherTyped.typeFrais && 
    montant == otherTyped.montant && 
    statut == otherTyped.statut && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, parcelleId.hashCode, typeFrais.hashCode, montant.hashCode, statut.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    json['typeFrais'] = 
    typeFraisSerializer(typeFrais)
    ;
    json['montant'] = nativeToJson<double>(montant);
    json['statut'] = 
    statutPaiementSerializer(statut)
    ;
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListerTousFraisFraisEnregistrements({
    required this.id,
    required this.parcelleId,
    required this.typeFrais,
    required this.montant,
    required this.statut,
    required this.createdAt,
  });
}

@immutable
class ListerTousFraisData {
  final List<ListerTousFraisFraisEnregistrements> fraisEnregistrements;
  ListerTousFraisData.fromJson(dynamic json):
  
  fraisEnregistrements = (json['fraisEnregistrements'] as List<dynamic>)
        .map((e) => ListerTousFraisFraisEnregistrements.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTousFraisData otherTyped = other as ListerTousFraisData;
    return fraisEnregistrements == otherTyped.fraisEnregistrements;
    
  }
  @override
  int get hashCode => fraisEnregistrements.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['fraisEnregistrements'] = fraisEnregistrements.map((e) => e.toJson()).toList();
    return json;
  }

  ListerTousFraisData({
    required this.fraisEnregistrements,
  });
}

@immutable
class ListerTousFraisVariables {
  late final Optional<int>limit;
  late final Optional<int>offset;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerTousFraisVariables.fromJson(Map<String, dynamic> json) {
  
  
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

    final ListerTousFraisVariables otherTyped = other as ListerTousFraisVariables;
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

  ListerTousFraisVariables({
    required this.limit,
    required this.offset,
  });
}

