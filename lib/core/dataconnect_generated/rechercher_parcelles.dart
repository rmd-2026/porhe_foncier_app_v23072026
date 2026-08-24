part of 'porhe_foncier23072026.dart';

class RechercherParcellesVariablesBuilder {
  String terme;

  final FirebaseDataConnect _dataConnect;
  RechercherParcellesVariablesBuilder(this._dataConnect, {required  this.terme,});
  Deserializer<RechercherParcellesData> dataDeserializer = (dynamic json)  => RechercherParcellesData.fromJson(jsonDecode(json));
  Serializer<RechercherParcellesVariables> varsSerializer = (RechercherParcellesVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<RechercherParcellesData, RechercherParcellesVariables>> execute() {
    return ref().execute();
  }

  QueryRef<RechercherParcellesData, RechercherParcellesVariables> ref() {
    RechercherParcellesVariables vars= RechercherParcellesVariables(terme: terme,);
    return _dataConnect.query("rechercherParcelles", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class RechercherParcellesParcelles {
  final int id;
  final String codeParcelle;
  final int communeId;
  final EnumValue<StatutParcelle> statut;
  RechercherParcellesParcelles.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  codeParcelle = nativeFromJson<String>(json['codeParcelle']),
  communeId = nativeFromJson<int>(json['communeId']),
  statut = statutParcelleDeserializer(json['statut']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RechercherParcellesParcelles otherTyped = other as RechercherParcellesParcelles;
    return id == otherTyped.id && 
    codeParcelle == otherTyped.codeParcelle && 
    communeId == otherTyped.communeId && 
    statut == otherTyped.statut;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, codeParcelle.hashCode, communeId.hashCode, statut.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['codeParcelle'] = nativeToJson<String>(codeParcelle);
    json['communeId'] = nativeToJson<int>(communeId);
    json['statut'] = 
    statutParcelleSerializer(statut)
    ;
    return json;
  }

  RechercherParcellesParcelles({
    required this.id,
    required this.codeParcelle,
    required this.communeId,
    required this.statut,
  });
}

@immutable
class RechercherParcellesData {
  final List<RechercherParcellesParcelles> parcelles;
  RechercherParcellesData.fromJson(dynamic json):
  
  parcelles = (json['parcelles'] as List<dynamic>)
        .map((e) => RechercherParcellesParcelles.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RechercherParcellesData otherTyped = other as RechercherParcellesData;
    return parcelles == otherTyped.parcelles;
    
  }
  @override
  int get hashCode => parcelles.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelles'] = parcelles.map((e) => e.toJson()).toList();
    return json;
  }

  RechercherParcellesData({
    required this.parcelles,
  });
}

@immutable
class RechercherParcellesVariables {
  final String terme;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  RechercherParcellesVariables.fromJson(Map<String, dynamic> json):
  
  terme = nativeFromJson<String>(json['terme']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final RechercherParcellesVariables otherTyped = other as RechercherParcellesVariables;
    return terme == otherTyped.terme;
    
  }
  @override
  int get hashCode => terme.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['terme'] = nativeToJson<String>(terme);
    return json;
  }

  RechercherParcellesVariables({
    required this.terme,
  });
}

