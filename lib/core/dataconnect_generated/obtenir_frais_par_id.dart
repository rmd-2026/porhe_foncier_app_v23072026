part of 'porhe_foncier23072026.dart';

class ObtenirFraisParIdVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  ObtenirFraisParIdVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<ObtenirFraisParIdData> dataDeserializer = (dynamic json)  => ObtenirFraisParIdData.fromJson(jsonDecode(json));
  Serializer<ObtenirFraisParIdVariables> varsSerializer = (ObtenirFraisParIdVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ObtenirFraisParIdData, ObtenirFraisParIdVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ObtenirFraisParIdData, ObtenirFraisParIdVariables> ref() {
    ObtenirFraisParIdVariables vars= ObtenirFraisParIdVariables(id: id,);
    return _dataConnect.query("obtenirFraisParId", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ObtenirFraisParIdFraisEnregistrement {
  final int id;
  final int parcelleId;
  final EnumValue<TypeFrais> typeFrais;
  final double montant;
  final EnumValue<StatutPaiement> statut;
  final String? motifRejet;
  final Timestamp createdAt;
  final Timestamp updatedAt;
  ObtenirFraisParIdFraisEnregistrement.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  parcelleId = nativeFromJson<int>(json['parcelleId']),
  typeFrais = typeFraisDeserializer(json['typeFrais']),
  montant = nativeFromJson<double>(json['montant']),
  statut = statutPaiementDeserializer(json['statut']),
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

    final ObtenirFraisParIdFraisEnregistrement otherTyped = other as ObtenirFraisParIdFraisEnregistrement;
    return id == otherTyped.id && 
    parcelleId == otherTyped.parcelleId && 
    typeFrais == otherTyped.typeFrais && 
    montant == otherTyped.montant && 
    statut == otherTyped.statut && 
    motifRejet == otherTyped.motifRejet && 
    createdAt == otherTyped.createdAt && 
    updatedAt == otherTyped.updatedAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, parcelleId.hashCode, typeFrais.hashCode, montant.hashCode, statut.hashCode, motifRejet.hashCode, createdAt.hashCode, updatedAt.hashCode]);
  

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
    if (motifRejet != null) {
      json['motifRejet'] = nativeToJson<String?>(motifRejet);
    }
    json['createdAt'] = createdAt.toJson();
    json['updatedAt'] = updatedAt.toJson();
    return json;
  }

  ObtenirFraisParIdFraisEnregistrement({
    required this.id,
    required this.parcelleId,
    required this.typeFrais,
    required this.montant,
    required this.statut,
    this.motifRejet,
    required this.createdAt,
    required this.updatedAt,
  });
}

@immutable
class ObtenirFraisParIdData {
  final ObtenirFraisParIdFraisEnregistrement? fraisEnregistrement;
  ObtenirFraisParIdData.fromJson(dynamic json):
  
  fraisEnregistrement = json['fraisEnregistrement'] == null ? null : ObtenirFraisParIdFraisEnregistrement.fromJson(json['fraisEnregistrement']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirFraisParIdData otherTyped = other as ObtenirFraisParIdData;
    return fraisEnregistrement == otherTyped.fraisEnregistrement;
    
  }
  @override
  int get hashCode => fraisEnregistrement.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (fraisEnregistrement != null) {
      json['fraisEnregistrement'] = fraisEnregistrement!.toJson();
    }
    return json;
  }

  ObtenirFraisParIdData({
    this.fraisEnregistrement,
  });
}

@immutable
class ObtenirFraisParIdVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ObtenirFraisParIdVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirFraisParIdVariables otherTyped = other as ObtenirFraisParIdVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  ObtenirFraisParIdVariables({
    required this.id,
  });
}

