part of 'porhe_foncier23072026.dart';

class ListerFraisParParcelleVariablesBuilder {
  int parcelleId;

  final FirebaseDataConnect _dataConnect;
  ListerFraisParParcelleVariablesBuilder(this._dataConnect, {required  this.parcelleId,});
  Deserializer<ListerFraisParParcelleData> dataDeserializer = (dynamic json)  => ListerFraisParParcelleData.fromJson(jsonDecode(json));
  Serializer<ListerFraisParParcelleVariables> varsSerializer = (ListerFraisParParcelleVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListerFraisParParcelleData, ListerFraisParParcelleVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListerFraisParParcelleData, ListerFraisParParcelleVariables> ref() {
    ListerFraisParParcelleVariables vars= ListerFraisParParcelleVariables(parcelleId: parcelleId,);
    return _dataConnect.query("listerFraisParParcelle", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListerFraisParParcelleFraisEnregistrements {
  final int id;
  final EnumValue<TypeFrais> typeFrais;
  final double montant;
  final EnumValue<StatutPaiement> statut;
  final Timestamp createdAt;
  ListerFraisParParcelleFraisEnregistrements.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
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

    final ListerFraisParParcelleFraisEnregistrements otherTyped = other as ListerFraisParParcelleFraisEnregistrements;
    return id == otherTyped.id && 
    typeFrais == otherTyped.typeFrais && 
    montant == otherTyped.montant && 
    statut == otherTyped.statut && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, typeFrais.hashCode, montant.hashCode, statut.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
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

  ListerFraisParParcelleFraisEnregistrements({
    required this.id,
    required this.typeFrais,
    required this.montant,
    required this.statut,
    required this.createdAt,
  });
}

@immutable
class ListerFraisParParcelleData {
  final List<ListerFraisParParcelleFraisEnregistrements> fraisEnregistrements;
  ListerFraisParParcelleData.fromJson(dynamic json):
  
  fraisEnregistrements = (json['fraisEnregistrements'] as List<dynamic>)
        .map((e) => ListerFraisParParcelleFraisEnregistrements.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerFraisParParcelleData otherTyped = other as ListerFraisParParcelleData;
    return fraisEnregistrements == otherTyped.fraisEnregistrements;
    
  }
  @override
  int get hashCode => fraisEnregistrements.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['fraisEnregistrements'] = fraisEnregistrements.map((e) => e.toJson()).toList();
    return json;
  }

  ListerFraisParParcelleData({
    required this.fraisEnregistrements,
  });
}

@immutable
class ListerFraisParParcelleVariables {
  final int parcelleId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListerFraisParParcelleVariables.fromJson(Map<String, dynamic> json):
  
  parcelleId = nativeFromJson<int>(json['parcelleId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListerFraisParParcelleVariables otherTyped = other as ListerFraisParParcelleVariables;
    return parcelleId == otherTyped.parcelleId;
    
  }
  @override
  int get hashCode => parcelleId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    return json;
  }

  ListerFraisParParcelleVariables({
    required this.parcelleId,
  });
}

