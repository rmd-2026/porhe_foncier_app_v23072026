part of 'porhe_foncier23072026.dart';

class ListerTousAbonnementsVariablesBuilder {
  Optional<int> _limit = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _offset = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;
  ListerTousAbonnementsVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerTousAbonnementsVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ListerTousAbonnementsVariablesBuilder(this._dataConnect, );
  Deserializer<ListerTousAbonnementsData> dataDeserializer = (dynamic json)  => ListerTousAbonnementsData.fromJson(jsonDecode(json));
  Serializer<ListerTousAbonnementsVariables> varsSerializer = (ListerTousAbonnementsVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerTousAbonnementsData, ListerTousAbonnementsVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerTousAbonnementsData, ListerTousAbonnementsVariables> ref() {
    ListerTousAbonnementsVariables vars= ListerTousAbonnementsVariables(limit: _limit,offset: _offset,);
    return _dataConnect.query("listerTousAbonnements", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerTousAbonnementsAbonnements {
  final int id;
  final int utilisateurId;
  final EnumValue<NiveauAbonnement> niveau;
  final EnumValue<StatutAbonnement> statut;
  final DateTime dateDebut;
  final DateTime dateFin;
  ListerTousAbonnementsAbonnements.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  utilisateurId = nativeFromJson<int>(json['utilisateurId']),
  niveau = niveauAbonnementDeserializer(json['niveau']),
  statut = statutAbonnementDeserializer(json['statut']),
  dateDebut = nativeFromJson<DateTime>(json['dateDebut']),
  dateFin = nativeFromJson<DateTime>(json['dateFin']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTousAbonnementsAbonnements otherTyped = other as ListerTousAbonnementsAbonnements;
    return id == otherTyped.id && 
    utilisateurId == otherTyped.utilisateurId && 
    niveau == otherTyped.niveau && 
    statut == otherTyped.statut && 
    dateDebut == otherTyped.dateDebut && 
    dateFin == otherTyped.dateFin;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, utilisateurId.hashCode, niveau.hashCode, statut.hashCode, dateDebut.hashCode, dateFin.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    json['niveau'] = 
    niveauAbonnementSerializer(niveau)
    ;
    json['statut'] = 
    statutAbonnementSerializer(statut)
    ;
    json['dateDebut'] = nativeToJson<DateTime>(dateDebut);
    json['dateFin'] = nativeToJson<DateTime>(dateFin);
    return json;
  }

  ListerTousAbonnementsAbonnements({
    required this.id,
    required this.utilisateurId,
    required this.niveau,
    required this.statut,
    required this.dateDebut,
    required this.dateFin,
  });
}

@immutable
class ListerTousAbonnementsData {
  final List<ListerTousAbonnementsAbonnements> abonnements;
  ListerTousAbonnementsData.fromJson(dynamic json):
  
  abonnements = (json['abonnements'] as List<dynamic>)
        .map((e) => ListerTousAbonnementsAbonnements.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerTousAbonnementsData otherTyped = other as ListerTousAbonnementsData;
    return abonnements == otherTyped.abonnements;
    
  }
  @override
  int get hashCode => abonnements.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['abonnements'] = abonnements.map((e) => e.toJson()).toList();
    return json;
  }

  ListerTousAbonnementsData({
    required this.abonnements,
  });
}

@immutable
class ListerTousAbonnementsVariables {
  late final Optional<int>limit;
  late final Optional<int>offset;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerTousAbonnementsVariables.fromJson(Map<String, dynamic> json) {
  
  
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

    final ListerTousAbonnementsVariables otherTyped = other as ListerTousAbonnementsVariables;
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

  ListerTousAbonnementsVariables({
    required this.limit,
    required this.offset,
  });
}

