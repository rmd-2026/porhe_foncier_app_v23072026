part of 'porhe_foncier23072026.dart';

class ObtenirTaxeParIdVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  ObtenirTaxeParIdVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<ObtenirTaxeParIdData> dataDeserializer = (dynamic json)  => ObtenirTaxeParIdData.fromJson(jsonDecode(json));
  Serializer<ObtenirTaxeParIdVariables> varsSerializer = (ObtenirTaxeParIdVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ObtenirTaxeParIdData, ObtenirTaxeParIdVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ObtenirTaxeParIdData, ObtenirTaxeParIdVariables> ref() {
    ObtenirTaxeParIdVariables vars= ObtenirTaxeParIdVariables(id: id,);
    return _dataConnect.query("obtenirTaxeParId", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ObtenirTaxeParIdTaxeFonciere {
  final int id;
  final int parcelleId;
  final int anneeFiscale;
  final double montantDu;
  final DateTime dateEcheance;
  final EnumValue<StatutPaiement> statut;
  final Timestamp createdAt;
  final Timestamp updatedAt;
  ObtenirTaxeParIdTaxeFonciere.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  parcelleId = nativeFromJson<int>(json['parcelleId']),
  anneeFiscale = nativeFromJson<int>(json['anneeFiscale']),
  montantDu = nativeFromJson<double>(json['montantDu']),
  dateEcheance = nativeFromJson<DateTime>(json['dateEcheance']),
  statut = statutPaiementDeserializer(json['statut']),
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

    final ObtenirTaxeParIdTaxeFonciere otherTyped = other as ObtenirTaxeParIdTaxeFonciere;
    return id == otherTyped.id && 
    parcelleId == otherTyped.parcelleId && 
    anneeFiscale == otherTyped.anneeFiscale && 
    montantDu == otherTyped.montantDu && 
    dateEcheance == otherTyped.dateEcheance && 
    statut == otherTyped.statut && 
    createdAt == otherTyped.createdAt && 
    updatedAt == otherTyped.updatedAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, parcelleId.hashCode, anneeFiscale.hashCode, montantDu.hashCode, dateEcheance.hashCode, statut.hashCode, createdAt.hashCode, updatedAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    json['anneeFiscale'] = nativeToJson<int>(anneeFiscale);
    json['montantDu'] = nativeToJson<double>(montantDu);
    json['dateEcheance'] = nativeToJson<DateTime>(dateEcheance);
    json['statut'] = 
    statutPaiementSerializer(statut)
    ;
    json['createdAt'] = createdAt.toJson();
    json['updatedAt'] = updatedAt.toJson();
    return json;
  }

  ObtenirTaxeParIdTaxeFonciere({
    required this.id,
    required this.parcelleId,
    required this.anneeFiscale,
    required this.montantDu,
    required this.dateEcheance,
    required this.statut,
    required this.createdAt,
    required this.updatedAt,
  });
}

@immutable
class ObtenirTaxeParIdData {
  final ObtenirTaxeParIdTaxeFonciere? taxeFonciere;
  ObtenirTaxeParIdData.fromJson(dynamic json):
  
  taxeFonciere = json['taxeFonciere'] == null ? null : ObtenirTaxeParIdTaxeFonciere.fromJson(json['taxeFonciere']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirTaxeParIdData otherTyped = other as ObtenirTaxeParIdData;
    return taxeFonciere == otherTyped.taxeFonciere;
    
  }
  @override
  int get hashCode => taxeFonciere.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (taxeFonciere != null) {
      json['taxeFonciere'] = taxeFonciere!.toJson();
    }
    return json;
  }

  ObtenirTaxeParIdData({
    this.taxeFonciere,
  });
}

@immutable
class ObtenirTaxeParIdVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ObtenirTaxeParIdVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirTaxeParIdVariables otherTyped = other as ObtenirTaxeParIdVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  ObtenirTaxeParIdVariables({
    required this.id,
  });
}

