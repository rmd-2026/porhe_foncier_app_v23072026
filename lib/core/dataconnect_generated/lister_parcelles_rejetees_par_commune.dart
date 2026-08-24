part of 'porhe_foncier23072026.dart';

class ListerParcellesRejeteesParCommuneVariablesBuilder {
  int communeId;

  final FirebaseDataConnect _dataConnect;
  ListerParcellesRejeteesParCommuneVariablesBuilder(this._dataConnect, {required  this.communeId,});
  Deserializer<ListerParcellesRejeteesParCommuneData> dataDeserializer = (dynamic json)  => ListerParcellesRejeteesParCommuneData.fromJson(jsonDecode(json));
  Serializer<ListerParcellesRejeteesParCommuneVariables> varsSerializer = (ListerParcellesRejeteesParCommuneVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerParcellesRejeteesParCommuneData, ListerParcellesRejeteesParCommuneVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerParcellesRejeteesParCommuneData, ListerParcellesRejeteesParCommuneVariables> ref() {
    ListerParcellesRejeteesParCommuneVariables vars= ListerParcellesRejeteesParCommuneVariables(communeId: communeId,);
    return _dataConnect.query("listerParcellesRejeteesParCommune", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerParcellesRejeteesParCommuneParcelles {
  final int id;
  final String codeParcelle;
  final int utilisateurId;
  final String? motifRejet;
  final Timestamp updatedAt;
  ListerParcellesRejeteesParCommuneParcelles.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  codeParcelle = nativeFromJson<String>(json['codeParcelle']),
  utilisateurId = nativeFromJson<int>(json['utilisateurId']),
  motifRejet = json['motifRejet'] == null ? null : nativeFromJson<String>(json['motifRejet']),
  updatedAt = Timestamp.fromJson(json['updatedAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerParcellesRejeteesParCommuneParcelles otherTyped = other as ListerParcellesRejeteesParCommuneParcelles;
    return id == otherTyped.id && 
    codeParcelle == otherTyped.codeParcelle && 
    utilisateurId == otherTyped.utilisateurId && 
    motifRejet == otherTyped.motifRejet && 
    updatedAt == otherTyped.updatedAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, codeParcelle.hashCode, utilisateurId.hashCode, motifRejet.hashCode, updatedAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['codeParcelle'] = nativeToJson<String>(codeParcelle);
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    if (motifRejet != null) {
      json['motifRejet'] = nativeToJson<String?>(motifRejet);
    }
    json['updatedAt'] = updatedAt.toJson();
    return json;
  }

  ListerParcellesRejeteesParCommuneParcelles({
    required this.id,
    required this.codeParcelle,
    required this.utilisateurId,
    this.motifRejet,
    required this.updatedAt,
  });
}

@immutable
class ListerParcellesRejeteesParCommuneData {
  final List<ListerParcellesRejeteesParCommuneParcelles> parcelles;
  ListerParcellesRejeteesParCommuneData.fromJson(dynamic json):
  
  parcelles = (json['parcelles'] as List<dynamic>)
        .map((e) => ListerParcellesRejeteesParCommuneParcelles.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerParcellesRejeteesParCommuneData otherTyped = other as ListerParcellesRejeteesParCommuneData;
    return parcelles == otherTyped.parcelles;
    
  }
  @override
  int get hashCode => parcelles.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelles'] = parcelles.map((e) => e.toJson()).toList();
    return json;
  }

  ListerParcellesRejeteesParCommuneData({
    required this.parcelles,
  });
}

@immutable
class ListerParcellesRejeteesParCommuneVariables {
  final int communeId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerParcellesRejeteesParCommuneVariables.fromJson(Map<String, dynamic> json):
  
  communeId = nativeFromJson<int>(json['communeId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerParcellesRejeteesParCommuneVariables otherTyped = other as ListerParcellesRejeteesParCommuneVariables;
    return communeId == otherTyped.communeId;
    
  }
  @override
  int get hashCode => communeId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['communeId'] = nativeToJson<int>(communeId);
    return json;
  }

  ListerParcellesRejeteesParCommuneVariables({
    required this.communeId,
  });
}

