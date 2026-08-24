part of 'porhe_foncier23072026.dart';

class ObtenirAlerteParIdVariablesBuilder {
  int id;

  final FirebaseDataConnect _dataConnect;
  ObtenirAlerteParIdVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<ObtenirAlerteParIdData> dataDeserializer = (dynamic json)  => ObtenirAlerteParIdData.fromJson(jsonDecode(json));
  Serializer<ObtenirAlerteParIdVariables> varsSerializer = (ObtenirAlerteParIdVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ObtenirAlerteParIdData, ObtenirAlerteParIdVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ObtenirAlerteParIdData, ObtenirAlerteParIdVariables> ref() {
    ObtenirAlerteParIdVariables vars= ObtenirAlerteParIdVariables(id: id,);
    return _dataConnect.query("obtenirAlerteParId", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ObtenirAlerteParIdAlerte {
  final int id;
  final int utilisateurId;
  final int? parcelleId;
  final EnumValue<TypeAlerte> typeAlerte;
  final String message;
  final bool lue;
  final Timestamp createdAt;
  ObtenirAlerteParIdAlerte.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']),
  utilisateurId = nativeFromJson<int>(json['utilisateurId']),
  parcelleId = json['parcelleId'] == null ? null : nativeFromJson<int>(json['parcelleId']),
  typeAlerte = typeAlerteDeserializer(json['typeAlerte']),
  message = nativeFromJson<String>(json['message']),
  lue = nativeFromJson<bool>(json['lue']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirAlerteParIdAlerte otherTyped = other as ObtenirAlerteParIdAlerte;
    return id == otherTyped.id && 
    utilisateurId == otherTyped.utilisateurId && 
    parcelleId == otherTyped.parcelleId && 
    typeAlerte == otherTyped.typeAlerte && 
    message == otherTyped.message && 
    lue == otherTyped.lue && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, utilisateurId.hashCode, parcelleId.hashCode, typeAlerte.hashCode, message.hashCode, lue.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    json['utilisateurId'] = nativeToJson<int>(utilisateurId);
    if (parcelleId != null) {
      json['parcelleId'] = nativeToJson<int?>(parcelleId);
    }
    json['typeAlerte'] = 
    typeAlerteSerializer(typeAlerte)
    ;
    json['message'] = nativeToJson<String>(message);
    json['lue'] = nativeToJson<bool>(lue);
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ObtenirAlerteParIdAlerte({
    required this.id,
    required this.utilisateurId,
    this.parcelleId,
    required this.typeAlerte,
    required this.message,
    required this.lue,
    required this.createdAt,
  });
}

@immutable
class ObtenirAlerteParIdData {
  final ObtenirAlerteParIdAlerte? alerte;
  ObtenirAlerteParIdData.fromJson(dynamic json):
  
  alerte = json['alerte'] == null ? null : ObtenirAlerteParIdAlerte.fromJson(json['alerte']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirAlerteParIdData otherTyped = other as ObtenirAlerteParIdData;
    return alerte == otherTyped.alerte;
    
  }
  @override
  int get hashCode => alerte.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (alerte != null) {
      json['alerte'] = alerte!.toJson();
    }
    return json;
  }

  ObtenirAlerteParIdData({
    this.alerte,
  });
}

@immutable
class ObtenirAlerteParIdVariables {
  final int id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ObtenirAlerteParIdVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ObtenirAlerteParIdVariables otherTyped = other as ObtenirAlerteParIdVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  ObtenirAlerteParIdVariables({
    required this.id,
  });
}

