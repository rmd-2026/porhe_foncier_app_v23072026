part of 'porhe_foncier23072026.dart';

class ListerParcellesParUtilisateurVariablesBuilder {
  int utilisateurId;

  final FirebaseDataConnect _dataConnect;
  ListerParcellesParUtilisateurVariablesBuilder(this._dataConnect, {required  this.utilisateurId,});
  Deserializer<ListerParcellesParUtilisateurData> dataDeserializer = (dynamic json)  => ListerParcellesParUtilisateurData.fromJson(jsonDecode(json));
  Serializer<ListerParcellesParUtilisateurVariables> varsSerializer = (ListerParcellesParUtilisateurVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerParcellesParUtilisateurData, ListerParcellesParUtilisateurVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerParcellesParUtilisateurData, ListerParcellesParUtilisateurVariables> ref() {
    ListerParcellesParUtilisateurVariables vars= ListerParcellesParUtilisateurVariables(utilisateurId: utilisateurId,);
    return _dataConnect.query("listerParcellesParUtilisateur", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerParcellesParUtilisateurParcelles {
  final int id;
  final String codeParcelle;
  final int communeId;
  final double? superficieM2;
  final EnumValue<StatutParcelle> statut;
  final Timestamp createdAt;
  ListerParcellesParUtilisateurParcelles.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  codeParcelle = nativeFromJson<String>(json['codeParcelle']),
  communeId = nativeFromJson<int>(json['communeId']),
  superficieM2 = json['superficieM2'] == null ? null : nativeFromJson<double>(json['superficieM2']),
  statut = statutParcelleDeserializer(json['statut']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerParcellesParUtilisateurParcelles otherTyped = other as ListerParcellesParUtilisateurParcelles;
    return id == otherTyped.id && 
    codeParcelle == otherTyped.codeParcelle && 
    communeId == otherTyped.communeId && 
    superficieM2 == otherTyped.superficieM2 && 
    statut == otherTyped.statut && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, codeParcelle.hashCode, communeId.hashCode, superficieM2.hashCode, statut.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['codeParcelle'] = nativeToJson<String>(codeParcelle);
    json['communeId'] = nativeToJson<int>(communeId);
    if (superficieM2 != null) {
      json['superficieM2'] = nativeToJson<double?>(superficieM2);
    }
    json['statut'] = 
    statutParcelleSerializer(statut)
    ;
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListerParcellesParUtilisateurParcelles({
    required this.id,
    required this.codeParcelle,
    required this.communeId,
    this.superficieM2,
    required this.statut,
    required this.createdAt,
  });
}

@immutable
class ListerParcellesParUtilisateurData {
  final List<ListerParcellesParUtilisateurParcelles> parcelles;
  ListerParcellesParUtilisateurData.fromJson(dynamic json):
  
  parcelles = (json['parcelles'] as List<dynamic>)
        .map((e) => ListerParcellesParUtilisateurParcelles.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerParcellesParUtilisateurData otherTyped = other as ListerParcellesParUtilisateurData;
    return parcelles == otherTyped.parcelles;
    
  }
  @override
  int get hashCode => parcelles.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelles'] = parcelles.map((e) => e.toJson()).toList();
    return json;
  }

  ListerParcellesParUtilisateurData({
    required this.parcelles,
  });
}

@immutable
class ListerParcellesParUtilisateurVariables {
  final int utilisateurId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerParcellesParUtilisateurVariables.fromJson(Map<String, dynamic> json):
  
  utilisateurId = nativeFromJson<int>(json['utilisateurId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerParcellesParUtilisateurVariables otherTyped = other as ListerParcellesParUtilisateurVariables;
    return utilisateurId == otherTyped.utilisateurId;
    
  }
  @override
  int get hashCode => utilisateurId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    return json;
  }

  ListerParcellesParUtilisateurVariables({
    required this.utilisateurId,
  });
}

