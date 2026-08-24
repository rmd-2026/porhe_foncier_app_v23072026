part of 'porhe_foncier23072026.dart';

class MettreAJourAbonnementVariablesBuilder {
  int id;
  Optional<NiveauAbonnement> _niveau = Optional.optional((data) => NiveauAbonnement.values.byName(data), enumSerializer);
  Optional<DateTime> _dateDebut = Optional.optional(nativeFromJson, nativeToJson);
  Optional<DateTime> _dateFin = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;  MettreAJourAbonnementVariablesBuilder niveau(NiveauAbonnement? t) {
   _niveau.value = t;
   return this;
  }
  MettreAJourAbonnementVariablesBuilder dateDebut(DateTime? t) {
   _dateDebut.value = t;
   return this;
  }
  MettreAJourAbonnementVariablesBuilder dateFin(DateTime? t) {
   _dateFin.value = t;
   return this;
  }

  MettreAJourAbonnementVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<MettreAJourAbonnementData> dataDeserializer = (dynamic json)  => MettreAJourAbonnementData.fromJson(jsonDecode(json));
  Serializer<MettreAJourAbonnementVariables> varsSerializer = (MettreAJourAbonnementVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<MettreAJourAbonnementData, MettreAJourAbonnementVariables>> execute() {
    return ref().execute();
  }

  MutationRef<MettreAJourAbonnementData, MettreAJourAbonnementVariables> ref() {
    MettreAJourAbonnementVariables vars= MettreAJourAbonnementVariables(id: id,niveau: _niveau,dateDebut: _dateDebut,dateFin: _dateFin,);
    return _dataConnect.mutation("mettreAJourAbonnement", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class MettreAJourAbonnementAbonnementUpdate {
  final int id;
  MettreAJourAbonnementAbonnementUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MettreAJourAbonnementAbonnementUpdate otherTyped = other as MettreAJourAbonnementAbonnementUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  MettreAJourAbonnementAbonnementUpdate({
    required this.id,
  });
}

@immutable
class MettreAJourAbonnementData {
  final MettreAJourAbonnementAbonnementUpdate? abonnement_update;
  MettreAJourAbonnementData.fromJson(dynamic json):
  
  abonnement_update = json['abonnement_update'] == null ? null : MettreAJourAbonnementAbonnementUpdate.fromJson(json['abonnement_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MettreAJourAbonnementData otherTyped = other as MettreAJourAbonnementData;
    return abonnement_update == otherTyped.abonnement_update;
    
  }
  @override
  int get hashCode => abonnement_update.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (abonnement_update != null) {
      json['abonnement_update'] = abonnement_update!.toJson();
    }
    return json;
  }

  MettreAJourAbonnementData({
    this.abonnement_update,
  });
}

@immutable
class MettreAJourAbonnementVariables {
  final int id;
  late final Optional<NiveauAbonnement>niveau;
  late final Optional<DateTime>dateDebut;
  late final Optional<DateTime>dateFin;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  MettreAJourAbonnementVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']) {
  
  
  
    niveau = Optional.optional((data) => NiveauAbonnement.values.byName(data), enumSerializer);
    niveau.value = json['niveau'] == null ? null : NiveauAbonnement.values.byName(json['niveau']);
  
  
    dateDebut = Optional.optional(nativeFromJson, nativeToJson);
    dateDebut.value = json['dateDebut'] == null ? null : nativeFromJson<DateTime>(json['dateDebut']);
  
  
    dateFin = Optional.optional(nativeFromJson, nativeToJson);
    dateFin.value = json['dateFin'] == null ? null : nativeFromJson<DateTime>(json['dateFin']);
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MettreAJourAbonnementVariables otherTyped = other as MettreAJourAbonnementVariables;
    return id == otherTyped.id && 
    niveau == otherTyped.niveau && 
    dateDebut == otherTyped.dateDebut && 
    dateFin == otherTyped.dateFin;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, niveau.hashCode, dateDebut.hashCode, dateFin.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    if(niveau.state == OptionalState.set) {
      json['niveau'] = niveau.toJson();
    }
    if(dateDebut.state == OptionalState.set) {
      json['dateDebut'] = dateDebut.toJson();
    }
    if(dateFin.state == OptionalState.set) {
      json['dateFin'] = dateFin.toJson();
    }
    return json;
  }

  MettreAJourAbonnementVariables({
    required this.id,
    required this.niveau,
    required this.dateDebut,
    required this.dateFin,
  });
}

