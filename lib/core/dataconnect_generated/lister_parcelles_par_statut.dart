part of 'porhe_foncier23072026.dart';

class ListerParcellesParStatutVariablesBuilder {
  int communeId;
  StatutParcelle statut;

  final FirebaseDataConnect _dataConnect;
  ListerParcellesParStatutVariablesBuilder(this._dataConnect, {required  this.communeId,required  this.statut,});
  Deserializer<ListerParcellesParStatutData> dataDeserializer = (dynamic json)  => ListerParcellesParStatutData.fromJson(jsonDecode(json));
  Serializer<ListerParcellesParStatutVariables> varsSerializer = (ListerParcellesParStatutVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerParcellesParStatutData, ListerParcellesParStatutVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerParcellesParStatutData, ListerParcellesParStatutVariables> ref() {
    ListerParcellesParStatutVariables vars= ListerParcellesParStatutVariables(communeId: communeId,statut: statut,);
    return _dataConnect.query("listerParcellesParStatut", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerParcellesParStatutParcelles {
  final int id;
  final String codeParcelle;
  final int utilisateurId;
  final int communeId;
  final double? superficieM2;
  final EnumValue<StatutParcelle> statut;
  final Timestamp createdAt;
  final Timestamp updatedAt;
  ListerParcellesParStatutParcelles.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  codeParcelle = nativeFromJson<String>(json['codeParcelle']),
  utilisateurId = nativeFromJson<int>(json['utilisateurId']),
  communeId = nativeFromJson<int>(json['communeId']),
  superficieM2 = json['superficieM2'] == null ? null : nativeFromJson<double>(json['superficieM2']),
  statut = statutParcelleDeserializer(json['statut']),
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

    final ListerParcellesParStatutParcelles otherTyped = other as ListerParcellesParStatutParcelles;
    return id == otherTyped.id && 
    codeParcelle == otherTyped.codeParcelle && 
    utilisateurId == otherTyped.utilisateurId && 
    communeId == otherTyped.communeId && 
    superficieM2 == otherTyped.superficieM2 && 
    statut == otherTyped.statut && 
    createdAt == otherTyped.createdAt && 
    updatedAt == otherTyped.updatedAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, codeParcelle.hashCode, utilisateurId.hashCode, communeId.hashCode, superficieM2.hashCode, statut.hashCode, createdAt.hashCode, updatedAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['codeParcelle'] = nativeToJson<String>(codeParcelle);
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    json['communeId'] = nativeToJson<int>(communeId);
    if (superficieM2 != null) {
      json['superficieM2'] = nativeToJson<double?>(superficieM2);
    }
    json['statut'] = 
    statutParcelleSerializer(statut)
    ;
    json['createdAt'] = createdAt.toJson();
    json['updatedAt'] = updatedAt.toJson();
    return json;
  }

  ListerParcellesParStatutParcelles({
    required this.id,
    required this.codeParcelle,
    required this.utilisateurId,
    required this.communeId,
    this.superficieM2,
    required this.statut,
    required this.createdAt,
    required this.updatedAt,
  });
}

@immutable
class ListerParcellesParStatutData {
  final List<ListerParcellesParStatutParcelles> parcelles;
  ListerParcellesParStatutData.fromJson(dynamic json):
  
  parcelles = (json['parcelles'] as List<dynamic>)
        .map((e) => ListerParcellesParStatutParcelles.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerParcellesParStatutData otherTyped = other as ListerParcellesParStatutData;
    return parcelles == otherTyped.parcelles;
    
  }
  @override
  int get hashCode => parcelles.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelles'] = parcelles.map((e) => e.toJson()).toList();
    return json;
  }

  ListerParcellesParStatutData({
    required this.parcelles,
  });
}

@immutable
class ListerParcellesParStatutVariables {
  final int communeId;
  final StatutParcelle statut;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerParcellesParStatutVariables.fromJson(Map<String, dynamic> json):
  
  communeId = nativeFromJson<int>(json['communeId']),
  statut = StatutParcelle.values.byName(json['statut']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerParcellesParStatutVariables otherTyped = other as ListerParcellesParStatutVariables;
    return communeId == otherTyped.communeId && 
    statut == otherTyped.statut;
    
  }
  @override
  int get hashCode => Object.hashAll([communeId.hashCode, statut.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['communeId'] = nativeToJson<int>(communeId);
    json['statut'] = 
    statut.name
    ;
    return json;
  }

  ListerParcellesParStatutVariables({
    required this.communeId,
    required this.statut,
  });
}

