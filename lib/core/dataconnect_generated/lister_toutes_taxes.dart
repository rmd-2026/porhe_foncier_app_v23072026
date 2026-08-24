part of 'porhe_foncier23072026.dart';

class ListerToutesTaxesVariablesBuilder {
  Optional<int> _limit = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _offset = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;
  ListerToutesTaxesVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerToutesTaxesVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ListerToutesTaxesVariablesBuilder(this._dataConnect, );
  Deserializer<ListerToutesTaxesData> dataDeserializer = (dynamic json)  => ListerToutesTaxesData.fromJson(jsonDecode(json));
  Serializer<ListerToutesTaxesVariables> varsSerializer = (ListerToutesTaxesVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerToutesTaxesData, ListerToutesTaxesVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerToutesTaxesData, ListerToutesTaxesVariables> ref() {
    ListerToutesTaxesVariables vars= ListerToutesTaxesVariables(limit: _limit,offset: _offset,);
    return _dataConnect.query("listerToutesTaxes", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerToutesTaxesTaxeFoncieres {
  final int id;
  final int parcelleId;
  final int anneeFiscale;
  final double montantDu;
  final EnumValue<StatutPaiement> statut;
  final DateTime dateEcheance;
  ListerToutesTaxesTaxeFoncieres.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  parcelleId = nativeFromJson<int>(json['parcelleId']),
  anneeFiscale = nativeFromJson<int>(json['anneeFiscale']),
  montantDu = nativeFromJson<double>(json['montantDu']),
  statut = statutPaiementDeserializer(json['statut']),
  dateEcheance = nativeFromJson<DateTime>(json['dateEcheance']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerToutesTaxesTaxeFoncieres otherTyped = other as ListerToutesTaxesTaxeFoncieres;
    return id == otherTyped.id && 
    parcelleId == otherTyped.parcelleId && 
    anneeFiscale == otherTyped.anneeFiscale && 
    montantDu == otherTyped.montantDu && 
    statut == otherTyped.statut && 
    dateEcheance == otherTyped.dateEcheance;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, parcelleId.hashCode, anneeFiscale.hashCode, montantDu.hashCode, statut.hashCode, dateEcheance.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    json['anneeFiscale'] = nativeToJson<int>(anneeFiscale);
    json['montantDu'] = nativeToJson<double>(montantDu);
    json['statut'] = 
    statutPaiementSerializer(statut)
    ;
    json['dateEcheance'] = nativeToJson<DateTime>(dateEcheance);
    return json;
  }

  ListerToutesTaxesTaxeFoncieres({
    required this.id,
    required this.parcelleId,
    required this.anneeFiscale,
    required this.montantDu,
    required this.statut,
    required this.dateEcheance,
  });
}

@immutable
class ListerToutesTaxesData {
  final List<ListerToutesTaxesTaxeFoncieres> taxeFoncieres;
  ListerToutesTaxesData.fromJson(dynamic json):
  
  taxeFoncieres = (json['taxeFoncieres'] as List<dynamic>)
        .map((e) => ListerToutesTaxesTaxeFoncieres.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerToutesTaxesData otherTyped = other as ListerToutesTaxesData;
    return taxeFoncieres == otherTyped.taxeFoncieres;
    
  }
  @override
  int get hashCode => taxeFoncieres.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['taxeFoncieres'] = taxeFoncieres.map((e) => e.toJson()).toList();
    return json;
  }

  ListerToutesTaxesData({
    required this.taxeFoncieres,
  });
}

@immutable
class ListerToutesTaxesVariables {
  late final Optional<int>limit;
  late final Optional<int>offset;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerToutesTaxesVariables.fromJson(Map<String, dynamic> json) {
  
  
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

    final ListerToutesTaxesVariables otherTyped = other as ListerToutesTaxesVariables;
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

  ListerToutesTaxesVariables({
    required this.limit,
    required this.offset,
  });
}

