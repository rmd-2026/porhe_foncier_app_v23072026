part of 'porhe_foncier23072026.dart';

class SignalerLitigeVariablesBuilder {
  int parcelleId;
  int plaignantId;
  String motif;
  Optional<int> _transactionFonciereId = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;  SignalerLitigeVariablesBuilder transactionFonciereId(int? t) {
   _transactionFonciereId.value = t;
   return this;
  }

  SignalerLitigeVariablesBuilder(this._dataConnect, {required  this.parcelleId,required  this.plaignantId,required  this.motif,});
  Deserializer<SignalerLitigeData> dataDeserializer = (dynamic json)  => SignalerLitigeData.fromJson(jsonDecode(json));
  Serializer<SignalerLitigeVariables> varsSerializer = (SignalerLitigeVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<SignalerLitigeData, SignalerLitigeVariables>> execute() {
    return ref().execute();
  }

  MutationRef<SignalerLitigeData, SignalerLitigeVariables> ref() {
    SignalerLitigeVariables vars= SignalerLitigeVariables(parcelleId: parcelleId,plaignantId: plaignantId,motif: motif,transactionFonciereId: _transactionFonciereId,);
    return _dataConnect.mutation("signalerLitige", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class SignalerLitigeLitigeInsert {
  final int id;
  SignalerLitigeLitigeInsert.fromJson(dynamic json):
  
  id = nativeFromJson<int>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SignalerLitigeLitigeInsert otherTyped = other as SignalerLitigeLitigeInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<int>(id);
    return json;
  }

  SignalerLitigeLitigeInsert({
    required this.id,
  });
}

@immutable
class SignalerLitigeData {
  final SignalerLitigeLitigeInsert litige_insert;
  SignalerLitigeData.fromJson(dynamic json):
  
  litige_insert = SignalerLitigeLitigeInsert.fromJson(json['litige_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SignalerLitigeData otherTyped = other as SignalerLitigeData;
    return litige_insert == otherTyped.litige_insert;
    
  }
  @override
  int get hashCode => litige_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['litige_insert'] = litige_insert.toJson();
    return json;
  }

  SignalerLitigeData({
    required this.litige_insert,
  });
}

@immutable
class SignalerLitigeVariables {
  final int parcelleId;
  final int plaignantId;
  final String motif;
  late final Optional<int>transactionFonciereId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  SignalerLitigeVariables.fromJson(Map<String, dynamic> json):
  
  parcelleId = nativeFromJson<int>(json['parcelleId']),
  plaignantId = nativeFromJson<int>(json['plaignantId']),
  motif = nativeFromJson<String>(json['motif']) {
  
  
  
  
  
    transactionFonciereId = Optional.optional(nativeFromJson, nativeToJson);
    transactionFonciereId.value = json['transactionFonciereId'] == null ? null : nativeFromJson<int>(json['transactionFonciereId']);
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SignalerLitigeVariables otherTyped = other as SignalerLitigeVariables;
    return parcelleId == otherTyped.parcelleId && 
    plaignantId == otherTyped.plaignantId && 
    motif == otherTyped.motif && 
    transactionFonciereId == otherTyped.transactionFonciereId;
    
  }
  @override
  int get hashCode => Object.hashAll([parcelleId.hashCode, plaignantId.hashCode, motif.hashCode, transactionFonciereId.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['parcelleId'] = nativeToJson<int>(parcelleId);
    json['plaignantId'] = nativeToJson<int>(plaignantId);
    json['motif'] = nativeToJson<String>(motif);
    if(transactionFonciereId.state == OptionalState.set) {
      json['transactionFonciereId'] = transactionFonciereId.toJson();
    }
    return json;
  }

  SignalerLitigeVariables({
    required this.parcelleId,
    required this.plaignantId,
    required this.motif,
    required this.transactionFonciereId,
  });
}

