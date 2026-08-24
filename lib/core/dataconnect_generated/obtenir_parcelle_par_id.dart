part of 'porhe_foncier23072026.dart';

class ObtenirParcelleParIdVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  ObtenirParcelleParIdVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<ObtenirParcelleParIdData> dataDeserializer = (dynamic json)  => ObtenirParcelleParIdData.fromJson(jsonDecode(json));
  Serializer<ObtenirParcelleParIdVariables> varsSerializer = (ObtenirParcelleParIdVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ObtenirParcelleParIdData, ObtenirParcelleParIdVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ObtenirParcelleParIdData, ObtenirParcelleParIdVariables> ref() {
    ObtenirParcelleParIdVariables vars= ObtenirParcelleParIdVariables(id: id,);
    return _dataConnect.query("obtenirParcelleParId", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ObtenirParcelleParIdParcelle {
  final int id;
  final String codeParcelle;
  final int utilisateurId;
  final int regionId;
  final int communeId;
  final int? sousPrefectureId;
  final double? superficieM2;
  final double? latitude;
  final double? longitude;
  final String? adresseTerrain;
  final String? qrCode;
  final EnumValue<StatutParcelle> statut;
  final String? motifRejet;
  final Timestamp createdAt;
  final Timestamp updatedAt;
  ObtenirParcelleParIdParcelle.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  codeParcelle = nativeFromJson<String>(json['codeParcelle']),
  utilisateurId = nativeFromJson<int>(json['utilisateurId']),
  regionId = nativeFromJson<int>(json['regionId']),
  communeId = nativeFromJson<int>(json['communeId']),
  sousPrefectureId = json['sousPrefectureId'] == null ? null : nativeFromJson<int>(json['sousPrefectureId']),
  superficieM2 = json['superficieM2'] == null ? null : nativeFromJson<double>(json['superficieM2']),
  latitude = json['latitude'] == null ? null : nativeFromJson<double>(json['latitude']),
  longitude = json['longitude'] == null ? null : nativeFromJson<double>(json['longitude']),
  adresseTerrain = json['adresseTerrain'] == null ? null : nativeFromJson<String>(json['adresseTerrain']),
  qrCode = json['qrCode'] == null ? null : nativeFromJson<String>(json['qrCode']),
  statut = statutParcelleDeserializer(json['statut']),
  motifRejet = json['motifRejet'] == null ? null : nativeFromJson<String>(json['motifRejet']),
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

    final ObtenirParcelleParIdParcelle otherTyped = other as ObtenirParcelleParIdParcelle;
    return id == otherTyped.id && 
    codeParcelle == otherTyped.codeParcelle && 
    utilisateurId == otherTyped.utilisateurId && 
    regionId == otherTyped.regionId && 
    communeId == otherTyped.communeId && 
    sousPrefectureId == otherTyped.sousPrefectureId && 
    superficieM2 == otherTyped.superficieM2 && 
    latitude == otherTyped.latitude && 
    longitude == otherTyped.longitude && 
    adresseTerrain == otherTyped.adresseTerrain && 
    qrCode == otherTyped.qrCode && 
    statut == otherTyped.statut && 
    motifRejet == otherTyped.motifRejet && 
    createdAt == otherTyped.createdAt && 
    updatedAt == otherTyped.updatedAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, codeParcelle.hashCode, utilisateurId.hashCode, regionId.hashCode, communeId.hashCode, sousPrefectureId.hashCode, superficieM2.hashCode, latitude.hashCode, longitude.hashCode, adresseTerrain.hashCode, qrCode.hashCode, statut.hashCode, motifRejet.hashCode, createdAt.hashCode, updatedAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['codeParcelle'] = nativeToJson<String>(codeParcelle);
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    json['regionId'] = nativeToJson<int>(regionId);
    json['communeId'] = nativeToJson<int>(communeId);
    if (sousPrefectureId != null) {
      json['sousPrefectureId'] = nativeToJson<int?>(sousPrefectureId);
    }
    if (superficieM2 != null) {
      json['superficieM2'] = nativeToJson<double?>(superficieM2);
    }
    if (latitude != null) {
      json['latitude'] = nativeToJson<double?>(latitude);
    }
    if (longitude != null) {
      json['longitude'] = nativeToJson<double?>(longitude);
    }
    if (adresseTerrain != null) {
      json['adresseTerrain'] = nativeToJson<String?>(adresseTerrain);
    }
    if (qrCode != null) {
      json['qrCode'] = nativeToJson<String?>(qrCode);
    }
    json['statut'] = 
    statutParcelleSerializer(statut)
    ;
    if (motifRejet != null) {
      json['motifRejet'] = nativeToJson<String?>(motifRejet);
    }
    json['createdAt'] = createdAt.toJson();
    json['updatedAt'] = updatedAt.toJson();
    return json;
  }

  ObtenirParcelleParIdParcelle({
    required this.id,
    required this.codeParcelle,
    required this.utilisateurId,
    required this.regionId,
    required this.communeId,
    this.sousPrefectureId,
    this.superficieM2,
    this.latitude,
    this.longitude,
    this.adresseTerrain,
    this.qrCode,
    required this.statut,
    this.motifRejet,
    required this.createdAt,
    required this.updatedAt,
  });
}

@immutable
class ObtenirParcelleParIdData {
  final ObtenirParcelleParIdParcelle? parcelle;
  ObtenirParcelleParIdData.fromJson(dynamic json):
  
  parcelle = json['parcelle'] == null ? null : ObtenirParcelleParIdParcelle.fromJson(json['parcelle']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirParcelleParIdData otherTyped = other as ObtenirParcelleParIdData;
    return parcelle == otherTyped.parcelle;
    
  }
  @override
  int get hashCode => parcelle.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (parcelle != null) {
      json['parcelle'] = parcelle!.toJson();
    }
    return json;
  }

  ObtenirParcelleParIdData({
    this.parcelle,
  });
}

@immutable
class ObtenirParcelleParIdVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ObtenirParcelleParIdVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirParcelleParIdVariables otherTyped = other as ObtenirParcelleParIdVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  ObtenirParcelleParIdVariables({
    required this.id,
  });
}

