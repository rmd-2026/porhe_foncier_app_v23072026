part of 'porhe_foncier23072026.dart';

class MettreAJourTaxeFonciereVariablesBuilder {
  int id;
  Optional<int> _anneeFiscale = Optional.optional(nativeFromJson, nativeToJson);
  Optional<double> _montantDu = Optional.optional(nativeFromJson, nativeToJson);
  Optional<DateTime> _dateEcheance = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;  MettreAJourTaxeFonciereVariablesBuilder anneeFiscale(int? t) {
   _anneeFiscale.value = t;
   return this;
  }
  MettreAJourTaxeFonciereVariablesBuilder montantDu(double? t) {
   _montantDu.value = t;
   return this;
  }
  MettreAJourTaxeFonciereVariablesBuilder dateEcheance(DateTime? t) {
   _dateEcheance.value = t;
   return this;
  }

  MettreAJourTaxeFonciereVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<MettreAJourTaxeFonciereData> dataDeserializer = (dynamic json)  => MettreAJourTaxeFonciereData.fromJson(jsonDecode(json));
  Serializer<MettreAJourTaxeFonciereVariables> varsSerializer = (MettreAJourTaxeFonciereVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<MettreAJourTaxeFonciereData, MettreAJourTaxeFonciereVariables>> execute() {
    return ref().execute();
  }

  MutationRef<MettreAJourTaxeFonciereData, MettreAJourTaxeFonciereVariables> ref() {
    MettreAJourTaxeFonciereVariables vars= MettreAJourTaxeFonciereVariables(id: id,anneeFiscale: _anneeFiscale,montantDu: _montantDu,dateEcheance: _dateEcheance,);
    return _dataConnect.mutation("mettreAJourTaxeFonciere", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class MettreAJourTaxeFonciereTaxeFonciereUpdate {
  final int id;
  MettreAJourTaxeFonciereTaxeFonciereUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MettreAJourTaxeFonciereTaxeFonciereUpdate otherTyped = other as MettreAJourTaxeFonciereTaxeFonciereUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  MettreAJourTaxeFonciereTaxeFonciereUpdate({
    required this.id,
  });
}

@immutable
class MettreAJourTaxeFonciereData {
  final MettreAJourTaxeFonciereTaxeFonciereUpdate? taxeFonciere_update;
  MettreAJourTaxeFonciereData.fromJson(dynamic json):
  
  taxeFonciere_update = json['taxeFonciere_update'] == null ? null : MettreAJourTaxeFonciereTaxeFonciereUpdate.fromJson(json['taxeFonciere_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MettreAJourTaxeFonciereData otherTyped = other as MettreAJourTaxeFonciereData;
    return taxeFonciere_update == otherTyped.taxeFonciere_update;
    
  }
  @override
  int get hashCode => taxeFonciere_update.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (taxeFonciere_update != null) {
      json['taxeFonciere_update'] = taxeFonciere_update!.toJson();
    }
    return json;
  }

  MettreAJourTaxeFonciereData({
    this.taxeFonciere_update,
  });
}

@immutable
class MettreAJourTaxeFonciereVariables {
  final int id;
  late final Optional<int>anneeFiscale;
  late final Optional<double>montantDu;
  late final Optional<DateTime>dateEcheance;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  MettreAJourTaxeFonciereVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<int>(json['id']) {
  
  
  
    anneeFiscale = Optional.optional(nativeFromJson, nativeToJson);
    anneeFiscale.value = json['anneeFiscale'] == null ? null : nativeFromJson<int>(json['anneeFiscale']);
  
  
    montantDu = Optional.optional(nativeFromJson, nativeToJson);
    montantDu.value = json['montantDu'] == null ? null : nativeFromJson<double>(json['montantDu']);
  
  
    dateEcheance = Optional.optional(nativeFromJson, nativeToJson);
    dateEcheance.value = json['dateEcheance'] == null ? null : nativeFromJson<DateTime>(json['dateEcheance']);
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MettreAJourTaxeFonciereVariables otherTyped = other as MettreAJourTaxeFonciereVariables;
    return id == otherTyped.id && 
    anneeFiscale == otherTyped.anneeFiscale && 
    montantDu == otherTyped.montantDu && 
    dateEcheance == otherTyped.dateEcheance;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, anneeFiscale.hashCode, montantDu.hashCode, dateEcheance.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    if(anneeFiscale.state == OptionalState.set) {
      json['anneeFiscale'] = anneeFiscale.toJson();
    }
    if(montantDu.state == OptionalState.set) {
      json['montantDu'] = montantDu.toJson();
    }
    if(dateEcheance.state == OptionalState.set) {
      json['dateEcheance'] = dateEcheance.toJson();
    }
    return json;
  }

  MettreAJourTaxeFonciereVariables({
    required this.id,
    required this.anneeFiscale,
    required this.montantDu,
    required this.dateEcheance,
  });
}

