part of 'porhe_foncier23072026.dart';

class ObtenirParcelleParQrCodeVariablesBuilder {
  String qrCode;

  final FirebaseDataConnect _dataConnect;
  ObtenirParcelleParQrCodeVariablesBuilder(this._dataConnect, {required  this.qrCode,});
  Deserializer<ObtenirParcelleParQrCodeData> dataDeserializer = (dynamic json)  => ObtenirParcelleParQrCodeData.fromJson(jsonDecode(json));
  Serializer<ObtenirParcelleParQrCodeVariables> varsSerializer = (ObtenirParcelleParQrCodeVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ObtenirParcelleParQrCodeData, ObtenirParcelleParQrCodeVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ObtenirParcelleParQrCodeData, ObtenirParcelleParQrCodeVariables> ref() {
    ObtenirParcelleParQrCodeVariables vars= ObtenirParcelleParQrCodeVariables(qrCode: qrCode,);
    return _dataConnect.query("obtenirParcelleParQrCode", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ObtenirParcelleParQrCodeParcelles {
  final int id;
  final String codeParcelle;
  final int utilisateurId;
  final int communeId;
  final EnumValue<StatutParcelle> statut;
  ObtenirParcelleParQrCodeParcelles.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  codeParcelle = nativeFromJson<String>(json['codeParcelle']),
  utilisateurId = nativeFromJson<int>(json['utilisateurId']),
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

    final ObtenirParcelleParQrCodeParcelles otherTyped = other as ObtenirParcelleParQrCodeParcelles;
    return id == otherTyped.id && 
    codeParcelle == otherTyped.codeParcelle && 
    utilisateurId == otherTyped.utilisateurId && 
    communeId == otherTyped.communeId && 
    statut == otherTyped.statut;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, codeParcelle.hashCode, utilisateurId.hashCode, communeId.hashCode, statut.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['codeParcelle'] = nativeToJson<String>(codeParcelle);
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    json['communeId'] = nativeToJson<int>(communeId);
    json['statut'] = 
    statutParcelleSerializer(statut)
    ;
    return json;
  }

  ObtenirParcelleParQrCodeParcelles({
    required this.id,
    required this.codeParcelle,
    required this.utilisateurId,
    required this.communeId,
    required this.statut,
  });
}

@immutable
class ObtenirParcelleParQrCodeData {
  final List<ObtenirParcelleParQrCodeParcelles> parcelles;
  ObtenirParcelleParQrCodeData.fromJson(dynamic json):
  
  parcelles = (json['parcelles'] as List<dynamic>)
        .map((e) => ObtenirParcelleParQrCodeParcelles.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirParcelleParQrCodeData otherTyped = other as ObtenirParcelleParQrCodeData;
    return parcelles == otherTyped.parcelles;
    
  }
  @override
  int get hashCode => parcelles.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelles'] = parcelles.map((e) => e.toJson()).toList();
    return json;
  }

  ObtenirParcelleParQrCodeData({
    required this.parcelles,
  });
}

@immutable
class ObtenirParcelleParQrCodeVariables {
  final String qrCode;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ObtenirParcelleParQrCodeVariables.fromJson(Map<String, dynamic> json):
  
  qrCode = nativeFromJson<String>(json['qrCode']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirParcelleParQrCodeVariables otherTyped = other as ObtenirParcelleParQrCodeVariables;
    return qrCode == otherTyped.qrCode;
    
  }
  @override
  int get hashCode => qrCode.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['qrCode'] = nativeToJson<String>(qrCode);
    return json;
  }

  ObtenirParcelleParQrCodeVariables({
    required this.qrCode,
  });
}

