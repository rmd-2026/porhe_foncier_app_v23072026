# porhe_foncier23072026 SDK

## Installation
```sh
flutter pub get firebase_data_connect
flutterfire configure
```
For more information, see [Flutter for Firebase installation documentation](https://firebase.google.com/docs/data-connect/flutter-sdk#use-core).

## Data Connect instance
Each connector creates a static class, with an instance of the `DataConnect` class that can be used to connect to your Data Connect backend and call operations.

### Connecting to the emulator

```dart
String host = 'localhost'; // or your host name
int port = 9399; // or your port number
PorheFoncier23072026Connector.instance.dataConnect.useDataConnectEmulator(host, port);
```

You can also call queries and mutations by using the connector class.
## Queries

### listerRegions
#### Required Arguments
```dart
// No required arguments
PorheFoncier23072026Connector.instance.listerRegions().execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerRegionsData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerRegions();
listerRegionsData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = PorheFoncier23072026Connector.instance.listerRegions().ref();
ref.execute();

ref.subscribe(...);
```


### listerCommunes
#### Required Arguments
```dart
// No required arguments
PorheFoncier23072026Connector.instance.listerCommunes().execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerCommunesData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerCommunes();
listerCommunesData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = PorheFoncier23072026Connector.instance.listerCommunes().ref();
ref.execute();

ref.subscribe(...);
```


### listerCommunesParRegion
#### Required Arguments
```dart
int regionId = ...;
PorheFoncier23072026Connector.instance.listerCommunesParRegion(
  regionId: regionId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerCommunesParRegionData, listerCommunesParRegionVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerCommunesParRegion(
  regionId: regionId,
);
listerCommunesParRegionData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int regionId = ...;

final ref = PorheFoncier23072026Connector.instance.listerCommunesParRegion(
  regionId: regionId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerSousPrefectures
#### Required Arguments
```dart
// No required arguments
PorheFoncier23072026Connector.instance.listerSousPrefectures().execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerSousPrefecturesData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerSousPrefectures();
listerSousPrefecturesData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = PorheFoncier23072026Connector.instance.listerSousPrefectures().ref();
ref.execute();

ref.subscribe(...);
```


### listerSousPrefecturesParCommune
#### Required Arguments
```dart
int communeId = ...;
PorheFoncier23072026Connector.instance.listerSousPrefecturesParCommune(
  communeId: communeId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerSousPrefecturesParCommuneData, listerSousPrefecturesParCommuneVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerSousPrefecturesParCommune(
  communeId: communeId,
);
listerSousPrefecturesParCommuneData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int communeId = ...;

final ref = PorheFoncier23072026Connector.instance.listerSousPrefecturesParCommune(
  communeId: communeId,
).ref();
ref.execute();

ref.subscribe(...);
```


### obtenirProfilParFirebaseUid
#### Required Arguments
```dart
String firebaseUid = ...;
PorheFoncier23072026Connector.instance.obtenirProfilParFirebaseUid(
  firebaseUid: firebaseUid,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<obtenirProfilParFirebaseUidData, obtenirProfilParFirebaseUidVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.obtenirProfilParFirebaseUid(
  firebaseUid: firebaseUid,
);
obtenirProfilParFirebaseUidData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String firebaseUid = ...;

final ref = PorheFoncier23072026Connector.instance.obtenirProfilParFirebaseUid(
  firebaseUid: firebaseUid,
).ref();
ref.execute();

ref.subscribe(...);
```


### estProfilIncomplet
#### Required Arguments
```dart
String firebaseUid = ...;
PorheFoncier23072026Connector.instance.estProfilIncomplet(
  firebaseUid: firebaseUid,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<estProfilIncompletData, estProfilIncompletVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.estProfilIncomplet(
  firebaseUid: firebaseUid,
);
estProfilIncompletData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String firebaseUid = ...;

final ref = PorheFoncier23072026Connector.instance.estProfilIncomplet(
  firebaseUid: firebaseUid,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerUtilisateursParStatutCompte
#### Required Arguments
```dart
StatutCompte statutCompte = ...;
PorheFoncier23072026Connector.instance.listerUtilisateursParStatutCompte(
  statutCompte: statutCompte,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerUtilisateursParStatutCompteData, listerUtilisateursParStatutCompteVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerUtilisateursParStatutCompte(
  statutCompte: statutCompte,
);
listerUtilisateursParStatutCompteData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
StatutCompte statutCompte = ...;

final ref = PorheFoncier23072026Connector.instance.listerUtilisateursParStatutCompte(
  statutCompte: statutCompte,
).ref();
ref.execute();

ref.subscribe(...);
```


### obtenirUtilisateurParId
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.obtenirUtilisateurParId(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<obtenirUtilisateurParIdData, obtenirUtilisateurParIdVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.obtenirUtilisateurParId(
  id: id,
);
obtenirUtilisateurParIdData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.obtenirUtilisateurParId(
  id: id,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerTousUtilisateurs
#### Required Arguments
```dart
// No required arguments
PorheFoncier23072026Connector.instance.listerTousUtilisateurs().execute();
```

#### Optional Arguments
We return a builder for each query. For listerTousUtilisateurs, we created `listerTousUtilisateursBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class ListerTousUtilisateursVariablesBuilder {
  ...
 
  ListerTousUtilisateursVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerTousUtilisateursVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ...
}
PorheFoncier23072026Connector.instance.listerTousUtilisateurs()
.limit(limit)
.offset(offset)
.execute();
```

#### Return Type
`execute()` returns a `QueryResult<listerTousUtilisateursData, listerTousUtilisateursVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerTousUtilisateurs();
listerTousUtilisateursData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = PorheFoncier23072026Connector.instance.listerTousUtilisateurs().ref();
ref.execute();

ref.subscribe(...);
```


### obtenirRoleParUtilisateurId
#### Required Arguments
```dart
int utilisateurId = ...;
PorheFoncier23072026Connector.instance.obtenirRoleParUtilisateurId(
  utilisateurId: utilisateurId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<obtenirRoleParUtilisateurIdData, obtenirRoleParUtilisateurIdVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.obtenirRoleParUtilisateurId(
  utilisateurId: utilisateurId,
);
obtenirRoleParUtilisateurIdData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int utilisateurId = ...;

final ref = PorheFoncier23072026Connector.instance.obtenirRoleParUtilisateurId(
  utilisateurId: utilisateurId,
).ref();
ref.execute();

ref.subscribe(...);
```


### verifierAppartenanceCommune
#### Required Arguments
```dart
int utilisateurId = ...;
int communeId = ...;
PorheFoncier23072026Connector.instance.verifierAppartenanceCommune(
  utilisateurId: utilisateurId,
  communeId: communeId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<verifierAppartenanceCommuneData, verifierAppartenanceCommuneVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.verifierAppartenanceCommune(
  utilisateurId: utilisateurId,
  communeId: communeId,
);
verifierAppartenanceCommuneData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int utilisateurId = ...;
int communeId = ...;

final ref = PorheFoncier23072026Connector.instance.verifierAppartenanceCommune(
  utilisateurId: utilisateurId,
  communeId: communeId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerAuditToutes
#### Required Arguments
```dart
// No required arguments
PorheFoncier23072026Connector.instance.listerAuditToutes().execute();
```

#### Optional Arguments
We return a builder for each query. For listerAuditToutes, we created `listerAuditToutesBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class ListerAuditToutesVariablesBuilder {
  ...
 
  ListerAuditToutesVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerAuditToutesVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ...
}
PorheFoncier23072026Connector.instance.listerAuditToutes()
.limit(limit)
.offset(offset)
.execute();
```

#### Return Type
`execute()` returns a `QueryResult<listerAuditToutesData, listerAuditToutesVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerAuditToutes();
listerAuditToutesData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = PorheFoncier23072026Connector.instance.listerAuditToutes().ref();
ref.execute();

ref.subscribe(...);
```


### listerAuditParActeur
#### Required Arguments
```dart
String acteurFirebaseUid = ...;
PorheFoncier23072026Connector.instance.listerAuditParActeur(
  acteurFirebaseUid: acteurFirebaseUid,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerAuditParActeurData, listerAuditParActeurVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerAuditParActeur(
  acteurFirebaseUid: acteurFirebaseUid,
);
listerAuditParActeurData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String acteurFirebaseUid = ...;

final ref = PorheFoncier23072026Connector.instance.listerAuditParActeur(
  acteurFirebaseUid: acteurFirebaseUid,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerAuditParCommune
#### Required Arguments
```dart
int communeId = ...;
PorheFoncier23072026Connector.instance.listerAuditParCommune(
  communeId: communeId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerAuditParCommuneData, listerAuditParCommuneVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerAuditParCommune(
  communeId: communeId,
);
listerAuditParCommuneData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int communeId = ...;

final ref = PorheFoncier23072026Connector.instance.listerAuditParCommune(
  communeId: communeId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerAuditParTypeEntite
#### Required Arguments
```dart
String typeEntite = ...;
PorheFoncier23072026Connector.instance.listerAuditParTypeEntite(
  typeEntite: typeEntite,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerAuditParTypeEntiteData, listerAuditParTypeEntiteVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerAuditParTypeEntite(
  typeEntite: typeEntite,
);
listerAuditParTypeEntiteData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String typeEntite = ...;

final ref = PorheFoncier23072026Connector.instance.listerAuditParTypeEntite(
  typeEntite: typeEntite,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerHistoriqueRejetsEtSuppressions
#### Required Arguments
```dart
// No required arguments
PorheFoncier23072026Connector.instance.listerHistoriqueRejetsEtSuppressions().execute();
```

#### Optional Arguments
We return a builder for each query. For listerHistoriqueRejetsEtSuppressions, we created `listerHistoriqueRejetsEtSuppressionsBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class ListerHistoriqueRejetsEtSuppressionsVariablesBuilder {
  ...
 
  ListerHistoriqueRejetsEtSuppressionsVariablesBuilder communeId(int? t) {
   _communeId.value = t;
   return this;
  }
  ListerHistoriqueRejetsEtSuppressionsVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerHistoriqueRejetsEtSuppressionsVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ...
}
PorheFoncier23072026Connector.instance.listerHistoriqueRejetsEtSuppressions()
.communeId(communeId)
.limit(limit)
.offset(offset)
.execute();
```

#### Return Type
`execute()` returns a `QueryResult<listerHistoriqueRejetsEtSuppressionsData, listerHistoriqueRejetsEtSuppressionsVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerHistoriqueRejetsEtSuppressions();
listerHistoriqueRejetsEtSuppressionsData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = PorheFoncier23072026Connector.instance.listerHistoriqueRejetsEtSuppressions().ref();
ref.execute();

ref.subscribe(...);
```


### obtenirParcelleParId
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.obtenirParcelleParId(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<obtenirParcelleParIdData, obtenirParcelleParIdVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.obtenirParcelleParId(
  id: id,
);
obtenirParcelleParIdData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.obtenirParcelleParId(
  id: id,
).ref();
ref.execute();

ref.subscribe(...);
```


### obtenirParcelleParQrCode
#### Required Arguments
```dart
String qrCode = ...;
PorheFoncier23072026Connector.instance.obtenirParcelleParQrCode(
  qrCode: qrCode,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<obtenirParcelleParQrCodeData, obtenirParcelleParQrCodeVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.obtenirParcelleParQrCode(
  qrCode: qrCode,
);
obtenirParcelleParQrCodeData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String qrCode = ...;

final ref = PorheFoncier23072026Connector.instance.obtenirParcelleParQrCode(
  qrCode: qrCode,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerParcellesParUtilisateur
#### Required Arguments
```dart
int utilisateurId = ...;
PorheFoncier23072026Connector.instance.listerParcellesParUtilisateur(
  utilisateurId: utilisateurId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerParcellesParUtilisateurData, listerParcellesParUtilisateurVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerParcellesParUtilisateur(
  utilisateurId: utilisateurId,
);
listerParcellesParUtilisateurData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int utilisateurId = ...;

final ref = PorheFoncier23072026Connector.instance.listerParcellesParUtilisateur(
  utilisateurId: utilisateurId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerParcellesParCommune
#### Required Arguments
```dart
int communeId = ...;
PorheFoncier23072026Connector.instance.listerParcellesParCommune(
  communeId: communeId,
).execute();
```

#### Optional Arguments
We return a builder for each query. For listerParcellesParCommune, we created `listerParcellesParCommuneBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class ListerParcellesParCommuneVariablesBuilder {
  ...
   ListerParcellesParCommuneVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerParcellesParCommuneVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ...
}
PorheFoncier23072026Connector.instance.listerParcellesParCommune(
  communeId: communeId,
)
.limit(limit)
.offset(offset)
.execute();
```

#### Return Type
`execute()` returns a `QueryResult<listerParcellesParCommuneData, listerParcellesParCommuneVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerParcellesParCommune(
  communeId: communeId,
);
listerParcellesParCommuneData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int communeId = ...;

final ref = PorheFoncier23072026Connector.instance.listerParcellesParCommune(
  communeId: communeId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerParcellesParStatut
#### Required Arguments
```dart
int communeId = ...;
StatutParcelle statut = ...;
PorheFoncier23072026Connector.instance.listerParcellesParStatut(
  communeId: communeId,
  statut: statut,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerParcellesParStatutData, listerParcellesParStatutVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerParcellesParStatut(
  communeId: communeId,
  statut: statut,
);
listerParcellesParStatutData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int communeId = ...;
StatutParcelle statut = ...;

final ref = PorheFoncier23072026Connector.instance.listerParcellesParStatut(
  communeId: communeId,
  statut: statut,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerParcellesRejeteesParCommune
#### Required Arguments
```dart
int communeId = ...;
PorheFoncier23072026Connector.instance.listerParcellesRejeteesParCommune(
  communeId: communeId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerParcellesRejeteesParCommuneData, listerParcellesRejeteesParCommuneVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerParcellesRejeteesParCommune(
  communeId: communeId,
);
listerParcellesRejeteesParCommuneData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int communeId = ...;

final ref = PorheFoncier23072026Connector.instance.listerParcellesRejeteesParCommune(
  communeId: communeId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerParcellesDansZone
#### Required Arguments
```dart
double latMin = ...;
double latMax = ...;
double lonMin = ...;
double lonMax = ...;
PorheFoncier23072026Connector.instance.listerParcellesDansZone(
  latMin: latMin,
  latMax: latMax,
  lonMin: lonMin,
  lonMax: lonMax,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerParcellesDansZoneData, listerParcellesDansZoneVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerParcellesDansZone(
  latMin: latMin,
  latMax: latMax,
  lonMin: lonMin,
  lonMax: lonMax,
);
listerParcellesDansZoneData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
double latMin = ...;
double latMax = ...;
double lonMin = ...;
double lonMax = ...;

final ref = PorheFoncier23072026Connector.instance.listerParcellesDansZone(
  latMin: latMin,
  latMax: latMax,
  lonMin: lonMin,
  lonMax: lonMax,
).ref();
ref.execute();

ref.subscribe(...);
```


### rechercherParcelles
#### Required Arguments
```dart
String terme = ...;
PorheFoncier23072026Connector.instance.rechercherParcelles(
  terme: terme,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<rechercherParcellesData, rechercherParcellesVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.rechercherParcelles(
  terme: terme,
);
rechercherParcellesData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String terme = ...;

final ref = PorheFoncier23072026Connector.instance.rechercherParcelles(
  terme: terme,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerToutesParcelles
#### Required Arguments
```dart
// No required arguments
PorheFoncier23072026Connector.instance.listerToutesParcelles().execute();
```

#### Optional Arguments
We return a builder for each query. For listerToutesParcelles, we created `listerToutesParcellesBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class ListerToutesParcellesVariablesBuilder {
  ...
 
  ListerToutesParcellesVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerToutesParcellesVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ...
}
PorheFoncier23072026Connector.instance.listerToutesParcelles()
.limit(limit)
.offset(offset)
.execute();
```

#### Return Type
`execute()` returns a `QueryResult<listerToutesParcellesData, listerToutesParcellesVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerToutesParcelles();
listerToutesParcellesData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = PorheFoncier23072026Connector.instance.listerToutesParcelles().ref();
ref.execute();

ref.subscribe(...);
```


### obtenirTransactionParId
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.obtenirTransactionParId(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<obtenirTransactionParIdData, obtenirTransactionParIdVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.obtenirTransactionParId(
  id: id,
);
obtenirTransactionParIdData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.obtenirTransactionParId(
  id: id,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerTransactionsParParcelle
#### Required Arguments
```dart
int parcelleId = ...;
PorheFoncier23072026Connector.instance.listerTransactionsParParcelle(
  parcelleId: parcelleId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerTransactionsParParcelleData, listerTransactionsParParcelleVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerTransactionsParParcelle(
  parcelleId: parcelleId,
);
listerTransactionsParParcelleData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int parcelleId = ...;

final ref = PorheFoncier23072026Connector.instance.listerTransactionsParParcelle(
  parcelleId: parcelleId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerTransactionsParUtilisateur
#### Required Arguments
```dart
int utilisateurId = ...;
PorheFoncier23072026Connector.instance.listerTransactionsParUtilisateur(
  utilisateurId: utilisateurId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerTransactionsParUtilisateurData, listerTransactionsParUtilisateurVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerTransactionsParUtilisateur(
  utilisateurId: utilisateurId,
);
listerTransactionsParUtilisateurData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int utilisateurId = ...;

final ref = PorheFoncier23072026Connector.instance.listerTransactionsParUtilisateur(
  utilisateurId: utilisateurId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerTransactionsEnAttenteParCommune
#### Required Arguments
```dart
int communeId = ...;
PorheFoncier23072026Connector.instance.listerTransactionsEnAttenteParCommune(
  communeId: communeId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerTransactionsEnAttenteParCommuneData, listerTransactionsEnAttenteParCommuneVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerTransactionsEnAttenteParCommune(
  communeId: communeId,
);
listerTransactionsEnAttenteParCommuneData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int communeId = ...;

final ref = PorheFoncier23072026Connector.instance.listerTransactionsEnAttenteParCommune(
  communeId: communeId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerTransactionsRejeteesParCommune
#### Required Arguments
```dart
int communeId = ...;
PorheFoncier23072026Connector.instance.listerTransactionsRejeteesParCommune(
  communeId: communeId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerTransactionsRejeteesParCommuneData, listerTransactionsRejeteesParCommuneVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerTransactionsRejeteesParCommune(
  communeId: communeId,
);
listerTransactionsRejeteesParCommuneData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int communeId = ...;

final ref = PorheFoncier23072026Connector.instance.listerTransactionsRejeteesParCommune(
  communeId: communeId,
).ref();
ref.execute();

ref.subscribe(...);
```


### obtenirHistoriquePropriete
#### Required Arguments
```dart
int parcelleId = ...;
PorheFoncier23072026Connector.instance.obtenirHistoriquePropriete(
  parcelleId: parcelleId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<obtenirHistoriqueProprieteData, obtenirHistoriqueProprieteVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.obtenirHistoriquePropriete(
  parcelleId: parcelleId,
);
obtenirHistoriqueProprieteData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int parcelleId = ...;

final ref = PorheFoncier23072026Connector.instance.obtenirHistoriquePropriete(
  parcelleId: parcelleId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerToutesTransactions
#### Required Arguments
```dart
// No required arguments
PorheFoncier23072026Connector.instance.listerToutesTransactions().execute();
```

#### Optional Arguments
We return a builder for each query. For listerToutesTransactions, we created `listerToutesTransactionsBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class ListerToutesTransactionsVariablesBuilder {
  ...
 
  ListerToutesTransactionsVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerToutesTransactionsVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ...
}
PorheFoncier23072026Connector.instance.listerToutesTransactions()
.limit(limit)
.offset(offset)
.execute();
```

#### Return Type
`execute()` returns a `QueryResult<listerToutesTransactionsData, listerToutesTransactionsVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerToutesTransactions();
listerToutesTransactionsData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = PorheFoncier23072026Connector.instance.listerToutesTransactions().ref();
ref.execute();

ref.subscribe(...);
```


### obtenirDocumentParId
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.obtenirDocumentParId(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<obtenirDocumentParIdData, obtenirDocumentParIdVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.obtenirDocumentParId(
  id: id,
);
obtenirDocumentParIdData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.obtenirDocumentParId(
  id: id,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerDocumentsParParcelle
#### Required Arguments
```dart
int parcelleId = ...;
PorheFoncier23072026Connector.instance.listerDocumentsParParcelle(
  parcelleId: parcelleId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerDocumentsParParcelleData, listerDocumentsParParcelleVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerDocumentsParParcelle(
  parcelleId: parcelleId,
);
listerDocumentsParParcelleData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int parcelleId = ...;

final ref = PorheFoncier23072026Connector.instance.listerDocumentsParParcelle(
  parcelleId: parcelleId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerTousDocuments
#### Required Arguments
```dart
// No required arguments
PorheFoncier23072026Connector.instance.listerTousDocuments().execute();
```

#### Optional Arguments
We return a builder for each query. For listerTousDocuments, we created `listerTousDocumentsBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class ListerTousDocumentsVariablesBuilder {
  ...
 
  ListerTousDocumentsVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerTousDocumentsVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ...
}
PorheFoncier23072026Connector.instance.listerTousDocuments()
.limit(limit)
.offset(offset)
.execute();
```

#### Return Type
`execute()` returns a `QueryResult<listerTousDocumentsData, listerTousDocumentsVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerTousDocuments();
listerTousDocumentsData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = PorheFoncier23072026Connector.instance.listerTousDocuments().ref();
ref.execute();

ref.subscribe(...);
```


### obtenirTaxeParId
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.obtenirTaxeParId(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<obtenirTaxeParIdData, obtenirTaxeParIdVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.obtenirTaxeParId(
  id: id,
);
obtenirTaxeParIdData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.obtenirTaxeParId(
  id: id,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerTaxesParParcelle
#### Required Arguments
```dart
int parcelleId = ...;
PorheFoncier23072026Connector.instance.listerTaxesParParcelle(
  parcelleId: parcelleId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerTaxesParParcelleData, listerTaxesParParcelleVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerTaxesParParcelle(
  parcelleId: parcelleId,
);
listerTaxesParParcelleData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int parcelleId = ...;

final ref = PorheFoncier23072026Connector.instance.listerTaxesParParcelle(
  parcelleId: parcelleId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerTaxesEnRetardParCommune
#### Required Arguments
```dart
int communeId = ...;
PorheFoncier23072026Connector.instance.listerTaxesEnRetardParCommune(
  communeId: communeId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerTaxesEnRetardParCommuneData, listerTaxesEnRetardParCommuneVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerTaxesEnRetardParCommune(
  communeId: communeId,
);
listerTaxesEnRetardParCommuneData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int communeId = ...;

final ref = PorheFoncier23072026Connector.instance.listerTaxesEnRetardParCommune(
  communeId: communeId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerTaxesEcheanceDepassee
#### Required Arguments
```dart
int communeId = ...;
DateTime dateActuelle = ...;
PorheFoncier23072026Connector.instance.listerTaxesEcheanceDepassee(
  communeId: communeId,
  dateActuelle: dateActuelle,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerTaxesEcheanceDepasseeData, listerTaxesEcheanceDepasseeVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerTaxesEcheanceDepassee(
  communeId: communeId,
  dateActuelle: dateActuelle,
);
listerTaxesEcheanceDepasseeData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int communeId = ...;
DateTime dateActuelle = ...;

final ref = PorheFoncier23072026Connector.instance.listerTaxesEcheanceDepassee(
  communeId: communeId,
  dateActuelle: dateActuelle,
).ref();
ref.execute();

ref.subscribe(...);
```


### obtenirRapportFinancierCommune
#### Required Arguments
```dart
int communeId = ...;
PorheFoncier23072026Connector.instance.obtenirRapportFinancierCommune(
  communeId: communeId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<obtenirRapportFinancierCommuneData, obtenirRapportFinancierCommuneVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.obtenirRapportFinancierCommune(
  communeId: communeId,
);
obtenirRapportFinancierCommuneData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int communeId = ...;

final ref = PorheFoncier23072026Connector.instance.obtenirRapportFinancierCommune(
  communeId: communeId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerToutesTaxes
#### Required Arguments
```dart
// No required arguments
PorheFoncier23072026Connector.instance.listerToutesTaxes().execute();
```

#### Optional Arguments
We return a builder for each query. For listerToutesTaxes, we created `listerToutesTaxesBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class ListerToutesTaxesVariablesBuilder {
  ...
 
  ListerToutesTaxesVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerToutesTaxesVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ...
}
PorheFoncier23072026Connector.instance.listerToutesTaxes()
.limit(limit)
.offset(offset)
.execute();
```

#### Return Type
`execute()` returns a `QueryResult<listerToutesTaxesData, listerToutesTaxesVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerToutesTaxes();
listerToutesTaxesData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = PorheFoncier23072026Connector.instance.listerToutesTaxes().ref();
ref.execute();

ref.subscribe(...);
```


### listerSuiviVisuelParParcelle
#### Required Arguments
```dart
int parcelleId = ...;
PorheFoncier23072026Connector.instance.listerSuiviVisuelParParcelle(
  parcelleId: parcelleId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerSuiviVisuelParParcelleData, listerSuiviVisuelParParcelleVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerSuiviVisuelParParcelle(
  parcelleId: parcelleId,
);
listerSuiviVisuelParParcelleData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int parcelleId = ...;

final ref = PorheFoncier23072026Connector.instance.listerSuiviVisuelParParcelle(
  parcelleId: parcelleId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerSuiviVisuelRecentParParcelle
#### Required Arguments
```dart
int parcelleId = ...;
PorheFoncier23072026Connector.instance.listerSuiviVisuelRecentParParcelle(
  parcelleId: parcelleId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerSuiviVisuelRecentParParcelleData, listerSuiviVisuelRecentParParcelleVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerSuiviVisuelRecentParParcelle(
  parcelleId: parcelleId,
);
listerSuiviVisuelRecentParParcelleData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int parcelleId = ...;

final ref = PorheFoncier23072026Connector.instance.listerSuiviVisuelRecentParParcelle(
  parcelleId: parcelleId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerSuiviVisuelCompletParParcelle
#### Required Arguments
```dart
int parcelleId = ...;
PorheFoncier23072026Connector.instance.listerSuiviVisuelCompletParParcelle(
  parcelleId: parcelleId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerSuiviVisuelCompletParParcelleData, listerSuiviVisuelCompletParParcelleVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerSuiviVisuelCompletParParcelle(
  parcelleId: parcelleId,
);
listerSuiviVisuelCompletParParcelleData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int parcelleId = ...;

final ref = PorheFoncier23072026Connector.instance.listerSuiviVisuelCompletParParcelle(
  parcelleId: parcelleId,
).ref();
ref.execute();

ref.subscribe(...);
```


### obtenirContexteAccesSuiviVisuel
#### Required Arguments
```dart
int parcelleId = ...;
int utilisateurId = ...;
PorheFoncier23072026Connector.instance.obtenirContexteAccesSuiviVisuel(
  parcelleId: parcelleId,
  utilisateurId: utilisateurId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<obtenirContexteAccesSuiviVisuelData, obtenirContexteAccesSuiviVisuelVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.obtenirContexteAccesSuiviVisuel(
  parcelleId: parcelleId,
  utilisateurId: utilisateurId,
);
obtenirContexteAccesSuiviVisuelData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int parcelleId = ...;
int utilisateurId = ...;

final ref = PorheFoncier23072026Connector.instance.obtenirContexteAccesSuiviVisuel(
  parcelleId: parcelleId,
  utilisateurId: utilisateurId,
).ref();
ref.execute();

ref.subscribe(...);
```


### obtenirUploadsRecentsPourAbonnement
#### Required Arguments
```dart
int parcelleId = ...;
int utilisateurId = ...;
Timestamp depuis = ...;
PorheFoncier23072026Connector.instance.obtenirUploadsRecentsPourAbonnement(
  parcelleId: parcelleId,
  utilisateurId: utilisateurId,
  depuis: depuis,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<obtenirUploadsRecentsPourAbonnementData, obtenirUploadsRecentsPourAbonnementVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.obtenirUploadsRecentsPourAbonnement(
  parcelleId: parcelleId,
  utilisateurId: utilisateurId,
  depuis: depuis,
);
obtenirUploadsRecentsPourAbonnementData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int parcelleId = ...;
int utilisateurId = ...;
Timestamp depuis = ...;

final ref = PorheFoncier23072026Connector.instance.obtenirUploadsRecentsPourAbonnement(
  parcelleId: parcelleId,
  utilisateurId: utilisateurId,
  depuis: depuis,
).ref();
ref.execute();

ref.subscribe(...);
```


### obtenirAbonnementActifParUtilisateur
#### Required Arguments
```dart
int utilisateurId = ...;
PorheFoncier23072026Connector.instance.obtenirAbonnementActifParUtilisateur(
  utilisateurId: utilisateurId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<obtenirAbonnementActifParUtilisateurData, obtenirAbonnementActifParUtilisateurVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.obtenirAbonnementActifParUtilisateur(
  utilisateurId: utilisateurId,
);
obtenirAbonnementActifParUtilisateurData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int utilisateurId = ...;

final ref = PorheFoncier23072026Connector.instance.obtenirAbonnementActifParUtilisateur(
  utilisateurId: utilisateurId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerAbonnementsParUtilisateur
#### Required Arguments
```dart
int utilisateurId = ...;
PorheFoncier23072026Connector.instance.listerAbonnementsParUtilisateur(
  utilisateurId: utilisateurId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerAbonnementsParUtilisateurData, listerAbonnementsParUtilisateurVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerAbonnementsParUtilisateur(
  utilisateurId: utilisateurId,
);
listerAbonnementsParUtilisateurData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int utilisateurId = ...;

final ref = PorheFoncier23072026Connector.instance.listerAbonnementsParUtilisateur(
  utilisateurId: utilisateurId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerAbonnementsActifsToutes
#### Required Arguments
```dart
// No required arguments
PorheFoncier23072026Connector.instance.listerAbonnementsActifsToutes().execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerAbonnementsActifsToutesData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerAbonnementsActifsToutes();
listerAbonnementsActifsToutesData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = PorheFoncier23072026Connector.instance.listerAbonnementsActifsToutes().ref();
ref.execute();

ref.subscribe(...);
```


### listerTousAbonnements
#### Required Arguments
```dart
// No required arguments
PorheFoncier23072026Connector.instance.listerTousAbonnements().execute();
```

#### Optional Arguments
We return a builder for each query. For listerTousAbonnements, we created `listerTousAbonnementsBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class ListerTousAbonnementsVariablesBuilder {
  ...
 
  ListerTousAbonnementsVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerTousAbonnementsVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ...
}
PorheFoncier23072026Connector.instance.listerTousAbonnements()
.limit(limit)
.offset(offset)
.execute();
```

#### Return Type
`execute()` returns a `QueryResult<listerTousAbonnementsData, listerTousAbonnementsVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerTousAbonnements();
listerTousAbonnementsData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = PorheFoncier23072026Connector.instance.listerTousAbonnements().ref();
ref.execute();

ref.subscribe(...);
```


### obtenirPaiementParId
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.obtenirPaiementParId(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<obtenirPaiementParIdData, obtenirPaiementParIdVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.obtenirPaiementParId(
  id: id,
);
obtenirPaiementParIdData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.obtenirPaiementParId(
  id: id,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerPaiementsParUtilisateur
#### Required Arguments
```dart
int utilisateurId = ...;
PorheFoncier23072026Connector.instance.listerPaiementsParUtilisateur(
  utilisateurId: utilisateurId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerPaiementsParUtilisateurData, listerPaiementsParUtilisateurVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerPaiementsParUtilisateur(
  utilisateurId: utilisateurId,
);
listerPaiementsParUtilisateurData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int utilisateurId = ...;

final ref = PorheFoncier23072026Connector.instance.listerPaiementsParUtilisateur(
  utilisateurId: utilisateurId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerPaiementsTaxeEnAttenteParCommune
#### Required Arguments
```dart
int communeId = ...;
PorheFoncier23072026Connector.instance.listerPaiementsTaxeEnAttenteParCommune(
  communeId: communeId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerPaiementsTaxeEnAttenteParCommuneData, listerPaiementsTaxeEnAttenteParCommuneVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerPaiementsTaxeEnAttenteParCommune(
  communeId: communeId,
);
listerPaiementsTaxeEnAttenteParCommuneData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int communeId = ...;

final ref = PorheFoncier23072026Connector.instance.listerPaiementsTaxeEnAttenteParCommune(
  communeId: communeId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerPaiementsAbonnementEnAttente
#### Required Arguments
```dart
// No required arguments
PorheFoncier23072026Connector.instance.listerPaiementsAbonnementEnAttente().execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerPaiementsAbonnementEnAttenteData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerPaiementsAbonnementEnAttente();
listerPaiementsAbonnementEnAttenteData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = PorheFoncier23072026Connector.instance.listerPaiementsAbonnementEnAttente().ref();
ref.execute();

ref.subscribe(...);
```


### listerTousPaiements
#### Required Arguments
```dart
// No required arguments
PorheFoncier23072026Connector.instance.listerTousPaiements().execute();
```

#### Optional Arguments
We return a builder for each query. For listerTousPaiements, we created `listerTousPaiementsBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class ListerTousPaiementsVariablesBuilder {
  ...
 
  ListerTousPaiementsVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerTousPaiementsVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ...
}
PorheFoncier23072026Connector.instance.listerTousPaiements()
.limit(limit)
.offset(offset)
.execute();
```

#### Return Type
`execute()` returns a `QueryResult<listerTousPaiementsData, listerTousPaiementsVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerTousPaiements();
listerTousPaiementsData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = PorheFoncier23072026Connector.instance.listerTousPaiements().ref();
ref.execute();

ref.subscribe(...);
```


### obtenirAlerteParId
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.obtenirAlerteParId(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<obtenirAlerteParIdData, obtenirAlerteParIdVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.obtenirAlerteParId(
  id: id,
);
obtenirAlerteParIdData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.obtenirAlerteParId(
  id: id,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerAlertesParUtilisateur
#### Required Arguments
```dart
int utilisateurId = ...;
PorheFoncier23072026Connector.instance.listerAlertesParUtilisateur(
  utilisateurId: utilisateurId,
).execute();
```

#### Optional Arguments
We return a builder for each query. For listerAlertesParUtilisateur, we created `listerAlertesParUtilisateurBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class ListerAlertesParUtilisateurVariablesBuilder {
  ...
   ListerAlertesParUtilisateurVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerAlertesParUtilisateurVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ...
}
PorheFoncier23072026Connector.instance.listerAlertesParUtilisateur(
  utilisateurId: utilisateurId,
)
.limit(limit)
.offset(offset)
.execute();
```

#### Return Type
`execute()` returns a `QueryResult<listerAlertesParUtilisateurData, listerAlertesParUtilisateurVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerAlertesParUtilisateur(
  utilisateurId: utilisateurId,
);
listerAlertesParUtilisateurData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int utilisateurId = ...;

final ref = PorheFoncier23072026Connector.instance.listerAlertesParUtilisateur(
  utilisateurId: utilisateurId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerAlertesNonLuesParUtilisateur
#### Required Arguments
```dart
int utilisateurId = ...;
PorheFoncier23072026Connector.instance.listerAlertesNonLuesParUtilisateur(
  utilisateurId: utilisateurId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerAlertesNonLuesParUtilisateurData, listerAlertesNonLuesParUtilisateurVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerAlertesNonLuesParUtilisateur(
  utilisateurId: utilisateurId,
);
listerAlertesNonLuesParUtilisateurData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int utilisateurId = ...;

final ref = PorheFoncier23072026Connector.instance.listerAlertesNonLuesParUtilisateur(
  utilisateurId: utilisateurId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerToutesAlertes
#### Required Arguments
```dart
// No required arguments
PorheFoncier23072026Connector.instance.listerToutesAlertes().execute();
```

#### Optional Arguments
We return a builder for each query. For listerToutesAlertes, we created `listerToutesAlertesBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class ListerToutesAlertesVariablesBuilder {
  ...
 
  ListerToutesAlertesVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerToutesAlertesVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ...
}
PorheFoncier23072026Connector.instance.listerToutesAlertes()
.limit(limit)
.offset(offset)
.execute();
```

#### Return Type
`execute()` returns a `QueryResult<listerToutesAlertesData, listerToutesAlertesVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerToutesAlertes();
listerToutesAlertesData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = PorheFoncier23072026Connector.instance.listerToutesAlertes().ref();
ref.execute();

ref.subscribe(...);
```


### obtenirLitigeParId
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.obtenirLitigeParId(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<obtenirLitigeParIdData, obtenirLitigeParIdVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.obtenirLitigeParId(
  id: id,
);
obtenirLitigeParIdData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.obtenirLitigeParId(
  id: id,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerLitigesParParcelle
#### Required Arguments
```dart
int parcelleId = ...;
PorheFoncier23072026Connector.instance.listerLitigesParParcelle(
  parcelleId: parcelleId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerLitigesParParcelleData, listerLitigesParParcelleVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerLitigesParParcelle(
  parcelleId: parcelleId,
);
listerLitigesParParcelleData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int parcelleId = ...;

final ref = PorheFoncier23072026Connector.instance.listerLitigesParParcelle(
  parcelleId: parcelleId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerLitigesOuvertsParCommune
#### Required Arguments
```dart
int communeId = ...;
PorheFoncier23072026Connector.instance.listerLitigesOuvertsParCommune(
  communeId: communeId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerLitigesOuvertsParCommuneData, listerLitigesOuvertsParCommuneVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerLitigesOuvertsParCommune(
  communeId: communeId,
);
listerLitigesOuvertsParCommuneData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int communeId = ...;

final ref = PorheFoncier23072026Connector.instance.listerLitigesOuvertsParCommune(
  communeId: communeId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerTousLitiges
#### Required Arguments
```dart
// No required arguments
PorheFoncier23072026Connector.instance.listerTousLitiges().execute();
```

#### Optional Arguments
We return a builder for each query. For listerTousLitiges, we created `listerTousLitigesBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class ListerTousLitigesVariablesBuilder {
  ...
 
  ListerTousLitigesVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerTousLitigesVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ...
}
PorheFoncier23072026Connector.instance.listerTousLitiges()
.limit(limit)
.offset(offset)
.execute();
```

#### Return Type
`execute()` returns a `QueryResult<listerTousLitigesData, listerTousLitigesVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerTousLitiges();
listerTousLitigesData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = PorheFoncier23072026Connector.instance.listerTousLitiges().ref();
ref.execute();

ref.subscribe(...);
```


### obtenirFraisParId
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.obtenirFraisParId(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<obtenirFraisParIdData, obtenirFraisParIdVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.obtenirFraisParId(
  id: id,
);
obtenirFraisParIdData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.obtenirFraisParId(
  id: id,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerFraisParParcelle
#### Required Arguments
```dart
int parcelleId = ...;
PorheFoncier23072026Connector.instance.listerFraisParParcelle(
  parcelleId: parcelleId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerFraisParParcelleData, listerFraisParParcelleVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerFraisParParcelle(
  parcelleId: parcelleId,
);
listerFraisParParcelleData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int parcelleId = ...;

final ref = PorheFoncier23072026Connector.instance.listerFraisParParcelle(
  parcelleId: parcelleId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerFraisEnAttenteParCommune
#### Required Arguments
```dart
int communeId = ...;
PorheFoncier23072026Connector.instance.listerFraisEnAttenteParCommune(
  communeId: communeId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<listerFraisEnAttenteParCommuneData, listerFraisEnAttenteParCommuneVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerFraisEnAttenteParCommune(
  communeId: communeId,
);
listerFraisEnAttenteParCommuneData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int communeId = ...;

final ref = PorheFoncier23072026Connector.instance.listerFraisEnAttenteParCommune(
  communeId: communeId,
).ref();
ref.execute();

ref.subscribe(...);
```


### listerTousFrais
#### Required Arguments
```dart
// No required arguments
PorheFoncier23072026Connector.instance.listerTousFrais().execute();
```

#### Optional Arguments
We return a builder for each query. For listerTousFrais, we created `listerTousFraisBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class ListerTousFraisVariablesBuilder {
  ...
 
  ListerTousFraisVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }
  ListerTousFraisVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }

  ...
}
PorheFoncier23072026Connector.instance.listerTousFrais()
.limit(limit)
.offset(offset)
.execute();
```

#### Return Type
`execute()` returns a `QueryResult<listerTousFraisData, listerTousFraisVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.listerTousFrais();
listerTousFraisData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = PorheFoncier23072026Connector.instance.listerTousFrais().ref();
ref.execute();

ref.subscribe(...);
```


### obtenirStatistiquesCommune
#### Required Arguments
```dart
int communeId = ...;
PorheFoncier23072026Connector.instance.obtenirStatistiquesCommune(
  communeId: communeId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<obtenirStatistiquesCommuneData, obtenirStatistiquesCommuneVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.obtenirStatistiquesCommune(
  communeId: communeId,
);
obtenirStatistiquesCommuneData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int communeId = ...;

final ref = PorheFoncier23072026Connector.instance.obtenirStatistiquesCommune(
  communeId: communeId,
).ref();
ref.execute();

ref.subscribe(...);
```


### obtenirChronologieParcelle
#### Required Arguments
```dart
int parcelleId = ...;
PorheFoncier23072026Connector.instance.obtenirChronologieParcelle(
  parcelleId: parcelleId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<obtenirChronologieParcelleData, obtenirChronologieParcelleVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await PorheFoncier23072026Connector.instance.obtenirChronologieParcelle(
  parcelleId: parcelleId,
);
obtenirChronologieParcelleData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int parcelleId = ...;

final ref = PorheFoncier23072026Connector.instance.obtenirChronologieParcelle(
  parcelleId: parcelleId,
).ref();
ref.execute();

ref.subscribe(...);
```

## Mutations

### seedRegions
#### Required Arguments
```dart
// No required arguments
PorheFoncier23072026Connector.instance.seedRegions().execute();
```



#### Return Type
`execute()` returns a `OperationResult<seedRegionsData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.seedRegions();
seedRegionsData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = PorheFoncier23072026Connector.instance.seedRegions().ref();
ref.execute();
```


### seedCommunes
#### Required Arguments
```dart
// No required arguments
PorheFoncier23072026Connector.instance.seedCommunes().execute();
```



#### Return Type
`execute()` returns a `OperationResult<seedCommunesData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.seedCommunes();
seedCommunesData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = PorheFoncier23072026Connector.instance.seedCommunes().ref();
ref.execute();
```


### seedSousPrefectures
#### Required Arguments
```dart
// No required arguments
PorheFoncier23072026Connector.instance.seedSousPrefectures().execute();
```



#### Return Type
`execute()` returns a `OperationResult<seedSousPrefecturesData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.seedSousPrefectures();
seedSousPrefecturesData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = PorheFoncier23072026Connector.instance.seedSousPrefectures().ref();
ref.execute();
```


### upsertUtilisateurParFirebaseUid
#### Required Arguments
```dart
String firebaseUid = ...;
PorheFoncier23072026Connector.instance.upsertUtilisateurParFirebaseUid(
  firebaseUid: firebaseUid,
).execute();
```

#### Optional Arguments
We return a builder for each query. For upsertUtilisateurParFirebaseUid, we created `upsertUtilisateurParFirebaseUidBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class UpsertUtilisateurParFirebaseUidVariablesBuilder {
  ...
   UpsertUtilisateurParFirebaseUidVariablesBuilder nom(String? t) {
   _nom.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder prenom(String? t) {
   _prenom.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder civilite(Civilite? t) {
   _civilite.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder dateNaissance(DateTime? t) {
   _dateNaissance.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder lieuNaissance(String? t) {
   _lieuNaissance.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder nationalite(String? t) {
   _nationalite.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder typePieceIdentite(TypePieceIdentite? t) {
   _typePieceIdentite.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder numeroPieceIdentite(String? t) {
   _numeroPieceIdentite.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder pieceIdentiteValideDe(DateTime? t) {
   _pieceIdentiteValideDe.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder pieceIdentiteValideA(DateTime? t) {
   _pieceIdentiteValideA.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder email(String? t) {
   _email.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder telephone(String? t) {
   _telephone.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder adresse(String? t) {
   _adresse.value = t;
   return this;
  }
  UpsertUtilisateurParFirebaseUidVariablesBuilder photoUrl(String? t) {
   _photoUrl.value = t;
   return this;
  }

  ...
}
PorheFoncier23072026Connector.instance.upsertUtilisateurParFirebaseUid(
  firebaseUid: firebaseUid,
)
.nom(nom)
.prenom(prenom)
.civilite(civilite)
.dateNaissance(dateNaissance)
.lieuNaissance(lieuNaissance)
.nationalite(nationalite)
.typePieceIdentite(typePieceIdentite)
.numeroPieceIdentite(numeroPieceIdentite)
.pieceIdentiteValideDe(pieceIdentiteValideDe)
.pieceIdentiteValideA(pieceIdentiteValideA)
.email(email)
.telephone(telephone)
.adresse(adresse)
.photoUrl(photoUrl)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<upsertUtilisateurParFirebaseUidData, upsertUtilisateurParFirebaseUidVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.upsertUtilisateurParFirebaseUid(
  firebaseUid: firebaseUid,
);
upsertUtilisateurParFirebaseUidData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String firebaseUid = ...;

final ref = PorheFoncier23072026Connector.instance.upsertUtilisateurParFirebaseUid(
  firebaseUid: firebaseUid,
).ref();
ref.execute();
```


### mettreAJourProfil
#### Required Arguments
```dart
String firebaseUid = ...;
PorheFoncier23072026Connector.instance.mettreAJourProfil(
  firebaseUid: firebaseUid,
).execute();
```

#### Optional Arguments
We return a builder for each query. For mettreAJourProfil, we created `mettreAJourProfilBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class MettreAJourProfilVariablesBuilder {
  ...
   MettreAJourProfilVariablesBuilder nom(String? t) {
   _nom.value = t;
   return this;
  }
  MettreAJourProfilVariablesBuilder prenom(String? t) {
   _prenom.value = t;
   return this;
  }
  MettreAJourProfilVariablesBuilder civilite(Civilite? t) {
   _civilite.value = t;
   return this;
  }
  MettreAJourProfilVariablesBuilder dateNaissance(DateTime? t) {
   _dateNaissance.value = t;
   return this;
  }
  MettreAJourProfilVariablesBuilder lieuNaissance(String? t) {
   _lieuNaissance.value = t;
   return this;
  }
  MettreAJourProfilVariablesBuilder nationalite(String? t) {
   _nationalite.value = t;
   return this;
  }
  MettreAJourProfilVariablesBuilder typePieceIdentite(TypePieceIdentite? t) {
   _typePieceIdentite.value = t;
   return this;
  }
  MettreAJourProfilVariablesBuilder numeroPieceIdentite(String? t) {
   _numeroPieceIdentite.value = t;
   return this;
  }
  MettreAJourProfilVariablesBuilder pieceIdentiteValideDe(DateTime? t) {
   _pieceIdentiteValideDe.value = t;
   return this;
  }
  MettreAJourProfilVariablesBuilder pieceIdentiteValideA(DateTime? t) {
   _pieceIdentiteValideA.value = t;
   return this;
  }
  MettreAJourProfilVariablesBuilder telephone(String? t) {
   _telephone.value = t;
   return this;
  }
  MettreAJourProfilVariablesBuilder adresse(String? t) {
   _adresse.value = t;
   return this;
  }
  MettreAJourProfilVariablesBuilder photoUrl(String? t) {
   _photoUrl.value = t;
   return this;
  }

  ...
}
PorheFoncier23072026Connector.instance.mettreAJourProfil(
  firebaseUid: firebaseUid,
)
.nom(nom)
.prenom(prenom)
.civilite(civilite)
.dateNaissance(dateNaissance)
.lieuNaissance(lieuNaissance)
.nationalite(nationalite)
.typePieceIdentite(typePieceIdentite)
.numeroPieceIdentite(numeroPieceIdentite)
.pieceIdentiteValideDe(pieceIdentiteValideDe)
.pieceIdentiteValideA(pieceIdentiteValideA)
.telephone(telephone)
.adresse(adresse)
.photoUrl(photoUrl)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<mettreAJourProfilData, mettreAJourProfilVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.mettreAJourProfil(
  firebaseUid: firebaseUid,
);
mettreAJourProfilData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String firebaseUid = ...;

final ref = PorheFoncier23072026Connector.instance.mettreAJourProfil(
  firebaseUid: firebaseUid,
).ref();
ref.execute();
```


### assignerRoleUtilisateurParDefaut
#### Required Arguments
```dart
int utilisateurId = ...;
PorheFoncier23072026Connector.instance.assignerRoleUtilisateurParDefaut(
  utilisateurId: utilisateurId,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<assignerRoleUtilisateurParDefautData, assignerRoleUtilisateurParDefautVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.assignerRoleUtilisateurParDefaut(
  utilisateurId: utilisateurId,
);
assignerRoleUtilisateurParDefautData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int utilisateurId = ...;

final ref = PorheFoncier23072026Connector.instance.assignerRoleUtilisateurParDefaut(
  utilisateurId: utilisateurId,
).ref();
ref.execute();
```


### assignerRoleGlobal
#### Required Arguments
```dart
int utilisateurId = ...;
NomRole nomRole = ...;
PorheFoncier23072026Connector.instance.assignerRoleGlobal(
  utilisateurId: utilisateurId,
  nomRole: nomRole,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<assignerRoleGlobalData, assignerRoleGlobalVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.assignerRoleGlobal(
  utilisateurId: utilisateurId,
  nomRole: nomRole,
);
assignerRoleGlobalData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int utilisateurId = ...;
NomRole nomRole = ...;

final ref = PorheFoncier23072026Connector.instance.assignerRoleGlobal(
  utilisateurId: utilisateurId,
  nomRole: nomRole,
).ref();
ref.execute();
```


### assignerRoleCommune
#### Required Arguments
```dart
int utilisateurId = ...;
NomRole nomRole = ...;
int communeId = ...;
PorheFoncier23072026Connector.instance.assignerRoleCommune(
  utilisateurId: utilisateurId,
  nomRole: nomRole,
  communeId: communeId,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<assignerRoleCommuneData, assignerRoleCommuneVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.assignerRoleCommune(
  utilisateurId: utilisateurId,
  nomRole: nomRole,
  communeId: communeId,
);
assignerRoleCommuneData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int utilisateurId = ...;
NomRole nomRole = ...;
int communeId = ...;

final ref = PorheFoncier23072026Connector.instance.assignerRoleCommune(
  utilisateurId: utilisateurId,
  nomRole: nomRole,
  communeId: communeId,
).ref();
ref.execute();
```


### validerUtilisateur
#### Required Arguments
```dart
String firebaseUid = ...;
PorheFoncier23072026Connector.instance.validerUtilisateur(
  firebaseUid: firebaseUid,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<validerUtilisateurData, validerUtilisateurVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.validerUtilisateur(
  firebaseUid: firebaseUid,
);
validerUtilisateurData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String firebaseUid = ...;

final ref = PorheFoncier23072026Connector.instance.validerUtilisateur(
  firebaseUid: firebaseUid,
).ref();
ref.execute();
```


### desactiverUtilisateur
#### Required Arguments
```dart
String firebaseUid = ...;
String motifStatut = ...;
PorheFoncier23072026Connector.instance.desactiverUtilisateur(
  firebaseUid: firebaseUid,
  motifStatut: motifStatut,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<desactiverUtilisateurData, desactiverUtilisateurVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.desactiverUtilisateur(
  firebaseUid: firebaseUid,
  motifStatut: motifStatut,
);
desactiverUtilisateurData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String firebaseUid = ...;
String motifStatut = ...;

final ref = PorheFoncier23072026Connector.instance.desactiverUtilisateur(
  firebaseUid: firebaseUid,
  motifStatut: motifStatut,
).ref();
ref.execute();
```


### enregistrerAudit
#### Required Arguments
```dart
String typeEntite = ...;
int entiteId = ...;
String action = ...;
String acteurFirebaseUid = ...;
PorheFoncier23072026Connector.instance.enregistrerAudit(
  typeEntite: typeEntite,
  entiteId: entiteId,
  action: action,
  acteurFirebaseUid: acteurFirebaseUid,
).execute();
```

#### Optional Arguments
We return a builder for each query. For enregistrerAudit, we created `enregistrerAuditBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class EnregistrerAuditVariablesBuilder {
  ...
   EnregistrerAuditVariablesBuilder motif(String? t) {
   _motif.value = t;
   return this;
  }
  EnregistrerAuditVariablesBuilder communeId(int? t) {
   _communeId.value = t;
   return this;
  }
  EnregistrerAuditVariablesBuilder donneesAvant(String? t) {
   _donneesAvant.value = t;
   return this;
  }
  EnregistrerAuditVariablesBuilder donneesApres(String? t) {
   _donneesApres.value = t;
   return this;
  }

  ...
}
PorheFoncier23072026Connector.instance.enregistrerAudit(
  typeEntite: typeEntite,
  entiteId: entiteId,
  action: action,
  acteurFirebaseUid: acteurFirebaseUid,
)
.motif(motif)
.communeId(communeId)
.donneesAvant(donneesAvant)
.donneesApres(donneesApres)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<enregistrerAuditData, enregistrerAuditVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.enregistrerAudit(
  typeEntite: typeEntite,
  entiteId: entiteId,
  action: action,
  acteurFirebaseUid: acteurFirebaseUid,
);
enregistrerAuditData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String typeEntite = ...;
int entiteId = ...;
String action = ...;
String acteurFirebaseUid = ...;

final ref = PorheFoncier23072026Connector.instance.enregistrerAudit(
  typeEntite: typeEntite,
  entiteId: entiteId,
  action: action,
  acteurFirebaseUid: acteurFirebaseUid,
).ref();
ref.execute();
```


### creerParcelle
#### Required Arguments
```dart
String codeParcelle = ...;
int utilisateurId = ...;
int regionId = ...;
int communeId = ...;
PorheFoncier23072026Connector.instance.creerParcelle(
  codeParcelle: codeParcelle,
  utilisateurId: utilisateurId,
  regionId: regionId,
  communeId: communeId,
).execute();
```

#### Optional Arguments
We return a builder for each query. For creerParcelle, we created `creerParcelleBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class CreerParcelleVariablesBuilder {
  ...
   CreerParcelleVariablesBuilder sousPrefectureId(int? t) {
   _sousPrefectureId.value = t;
   return this;
  }
  CreerParcelleVariablesBuilder superficieM2(double? t) {
   _superficieM2.value = t;
   return this;
  }
  CreerParcelleVariablesBuilder latitude(double? t) {
   _latitude.value = t;
   return this;
  }
  CreerParcelleVariablesBuilder longitude(double? t) {
   _longitude.value = t;
   return this;
  }
  CreerParcelleVariablesBuilder adresseTerrain(String? t) {
   _adresseTerrain.value = t;
   return this;
  }
  CreerParcelleVariablesBuilder qrCode(String? t) {
   _qrCode.value = t;
   return this;
  }

  ...
}
PorheFoncier23072026Connector.instance.creerParcelle(
  codeParcelle: codeParcelle,
  utilisateurId: utilisateurId,
  regionId: regionId,
  communeId: communeId,
)
.sousPrefectureId(sousPrefectureId)
.superficieM2(superficieM2)
.latitude(latitude)
.longitude(longitude)
.adresseTerrain(adresseTerrain)
.qrCode(qrCode)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<creerParcelleData, creerParcelleVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.creerParcelle(
  codeParcelle: codeParcelle,
  utilisateurId: utilisateurId,
  regionId: regionId,
  communeId: communeId,
);
creerParcelleData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String codeParcelle = ...;
int utilisateurId = ...;
int regionId = ...;
int communeId = ...;

final ref = PorheFoncier23072026Connector.instance.creerParcelle(
  codeParcelle: codeParcelle,
  utilisateurId: utilisateurId,
  regionId: regionId,
  communeId: communeId,
).ref();
ref.execute();
```


### mettreAJourParcelle
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.mettreAJourParcelle(
  id: id,
).execute();
```

#### Optional Arguments
We return a builder for each query. For mettreAJourParcelle, we created `mettreAJourParcelleBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class MettreAJourParcelleVariablesBuilder {
  ...
   MettreAJourParcelleVariablesBuilder superficieM2(double? t) {
   _superficieM2.value = t;
   return this;
  }
  MettreAJourParcelleVariablesBuilder latitude(double? t) {
   _latitude.value = t;
   return this;
  }
  MettreAJourParcelleVariablesBuilder longitude(double? t) {
   _longitude.value = t;
   return this;
  }
  MettreAJourParcelleVariablesBuilder adresseTerrain(String? t) {
   _adresseTerrain.value = t;
   return this;
  }

  ...
}
PorheFoncier23072026Connector.instance.mettreAJourParcelle(
  id: id,
)
.superficieM2(superficieM2)
.latitude(latitude)
.longitude(longitude)
.adresseTerrain(adresseTerrain)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<mettreAJourParcelleData, mettreAJourParcelleVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.mettreAJourParcelle(
  id: id,
);
mettreAJourParcelleData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.mettreAJourParcelle(
  id: id,
).ref();
ref.execute();
```


### validerParcelle
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.validerParcelle(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<validerParcelleData, validerParcelleVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.validerParcelle(
  id: id,
);
validerParcelleData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.validerParcelle(
  id: id,
).ref();
ref.execute();
```


### rejeterParcelle
#### Required Arguments
```dart
int id = ...;
String motifRejet = ...;
PorheFoncier23072026Connector.instance.rejeterParcelle(
  id: id,
  motifRejet: motifRejet,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<rejeterParcelleData, rejeterParcelleVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.rejeterParcelle(
  id: id,
  motifRejet: motifRejet,
);
rejeterParcelleData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;
String motifRejet = ...;

final ref = PorheFoncier23072026Connector.instance.rejeterParcelle(
  id: id,
  motifRejet: motifRejet,
).ref();
ref.execute();
```


### rejeterParcelleAvecMotif
#### Required Arguments
```dart
int id = ...;
String motifRejet = ...;
PorheFoncier23072026Connector.instance.rejeterParcelleAvecMotif(
  id: id,
  motifRejet: motifRejet,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<rejeterParcelleAvecMotifData, rejeterParcelleAvecMotifVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.rejeterParcelleAvecMotif(
  id: id,
  motifRejet: motifRejet,
);
rejeterParcelleAvecMotifData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;
String motifRejet = ...;

final ref = PorheFoncier23072026Connector.instance.rejeterParcelleAvecMotif(
  id: id,
  motifRejet: motifRejet,
).ref();
ref.execute();
```


### resoumettreParcelle
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.resoumettreParcelle(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<resoumettreParcelleData, resoumettreParcelleVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.resoumettreParcelle(
  id: id,
);
resoumettreParcelleData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.resoumettreParcelle(
  id: id,
).ref();
ref.execute();
```


### transfererParcelleEntreCommunes
#### Required Arguments
```dart
int id = ...;
int nouvelleRegionId = ...;
int nouvelleCommuneId = ...;
PorheFoncier23072026Connector.instance.transfererParcelleEntreCommunes(
  id: id,
  nouvelleRegionId: nouvelleRegionId,
  nouvelleCommuneId: nouvelleCommuneId,
).execute();
```

#### Optional Arguments
We return a builder for each query. For transfererParcelleEntreCommunes, we created `transfererParcelleEntreCommunesBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class TransfererParcelleEntreCommunesVariablesBuilder {
  ...
   TransfererParcelleEntreCommunesVariablesBuilder nouvelleSousPrefectureId(int? t) {
   _nouvelleSousPrefectureId.value = t;
   return this;
  }

  ...
}
PorheFoncier23072026Connector.instance.transfererParcelleEntreCommunes(
  id: id,
  nouvelleRegionId: nouvelleRegionId,
  nouvelleCommuneId: nouvelleCommuneId,
)
.nouvelleSousPrefectureId(nouvelleSousPrefectureId)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<transfererParcelleEntreCommunesData, transfererParcelleEntreCommunesVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.transfererParcelleEntreCommunes(
  id: id,
  nouvelleRegionId: nouvelleRegionId,
  nouvelleCommuneId: nouvelleCommuneId,
);
transfererParcelleEntreCommunesData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;
int nouvelleRegionId = ...;
int nouvelleCommuneId = ...;

final ref = PorheFoncier23072026Connector.instance.transfererParcelleEntreCommunes(
  id: id,
  nouvelleRegionId: nouvelleRegionId,
  nouvelleCommuneId: nouvelleCommuneId,
).ref();
ref.execute();
```


### supprimerParcelle
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.supprimerParcelle(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<supprimerParcelleData, supprimerParcelleVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.supprimerParcelle(
  id: id,
);
supprimerParcelleData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.supprimerParcelle(
  id: id,
).ref();
ref.execute();
```


### creerTransaction
#### Required Arguments
```dart
int parcelleId = ...;
int vendeurId = ...;
int acheteurId = ...;
TypeTransaction typeTransaction = ...;
DateTime dateTransaction = ...;
PorheFoncier23072026Connector.instance.creerTransaction(
  parcelleId: parcelleId,
  vendeurId: vendeurId,
  acheteurId: acheteurId,
  typeTransaction: typeTransaction,
  dateTransaction: dateTransaction,
).execute();
```

#### Optional Arguments
We return a builder for each query. For creerTransaction, we created `creerTransactionBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class CreerTransactionVariablesBuilder {
  ...
   CreerTransactionVariablesBuilder montant(double? t) {
   _montant.value = t;
   return this;
  }

  ...
}
PorheFoncier23072026Connector.instance.creerTransaction(
  parcelleId: parcelleId,
  vendeurId: vendeurId,
  acheteurId: acheteurId,
  typeTransaction: typeTransaction,
  dateTransaction: dateTransaction,
)
.montant(montant)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<creerTransactionData, creerTransactionVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.creerTransaction(
  parcelleId: parcelleId,
  vendeurId: vendeurId,
  acheteurId: acheteurId,
  typeTransaction: typeTransaction,
  dateTransaction: dateTransaction,
);
creerTransactionData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int parcelleId = ...;
int vendeurId = ...;
int acheteurId = ...;
TypeTransaction typeTransaction = ...;
DateTime dateTransaction = ...;

final ref = PorheFoncier23072026Connector.instance.creerTransaction(
  parcelleId: parcelleId,
  vendeurId: vendeurId,
  acheteurId: acheteurId,
  typeTransaction: typeTransaction,
  dateTransaction: dateTransaction,
).ref();
ref.execute();
```


### validerTransaction
#### Required Arguments
```dart
int id = ...;
int parcelleId = ...;
int nouveauUtilisateurId = ...;
PorheFoncier23072026Connector.instance.validerTransaction(
  id: id,
  parcelleId: parcelleId,
  nouveauUtilisateurId: nouveauUtilisateurId,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<validerTransactionData, validerTransactionVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.validerTransaction(
  id: id,
  parcelleId: parcelleId,
  nouveauUtilisateurId: nouveauUtilisateurId,
);
validerTransactionData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;
int parcelleId = ...;
int nouveauUtilisateurId = ...;

final ref = PorheFoncier23072026Connector.instance.validerTransaction(
  id: id,
  parcelleId: parcelleId,
  nouveauUtilisateurId: nouveauUtilisateurId,
).ref();
ref.execute();
```


### rejeterTransactionAvecMotif
#### Required Arguments
```dart
int id = ...;
String motifRejet = ...;
PorheFoncier23072026Connector.instance.rejeterTransactionAvecMotif(
  id: id,
  motifRejet: motifRejet,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<rejeterTransactionAvecMotifData, rejeterTransactionAvecMotifVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.rejeterTransactionAvecMotif(
  id: id,
  motifRejet: motifRejet,
);
rejeterTransactionAvecMotifData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;
String motifRejet = ...;

final ref = PorheFoncier23072026Connector.instance.rejeterTransactionAvecMotif(
  id: id,
  motifRejet: motifRejet,
).ref();
ref.execute();
```


### resoumettreTransaction
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.resoumettreTransaction(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<resoumettreTransactionData, resoumettreTransactionVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.resoumettreTransaction(
  id: id,
);
resoumettreTransactionData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.resoumettreTransaction(
  id: id,
).ref();
ref.execute();
```


### ajouterDocument
#### Required Arguments
```dart
int parcelleId = ...;
TypeDocument typeDocument = ...;
String nomFichier = ...;
String urlStockage = ...;
String uploadeParFirebaseUid = ...;
PorheFoncier23072026Connector.instance.ajouterDocument(
  parcelleId: parcelleId,
  typeDocument: typeDocument,
  nomFichier: nomFichier,
  urlStockage: urlStockage,
  uploadeParFirebaseUid: uploadeParFirebaseUid,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<ajouterDocumentData, ajouterDocumentVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.ajouterDocument(
  parcelleId: parcelleId,
  typeDocument: typeDocument,
  nomFichier: nomFichier,
  urlStockage: urlStockage,
  uploadeParFirebaseUid: uploadeParFirebaseUid,
);
ajouterDocumentData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int parcelleId = ...;
TypeDocument typeDocument = ...;
String nomFichier = ...;
String urlStockage = ...;
String uploadeParFirebaseUid = ...;

final ref = PorheFoncier23072026Connector.instance.ajouterDocument(
  parcelleId: parcelleId,
  typeDocument: typeDocument,
  nomFichier: nomFichier,
  urlStockage: urlStockage,
  uploadeParFirebaseUid: uploadeParFirebaseUid,
).ref();
ref.execute();
```


### supprimerDocument
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.supprimerDocument(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<supprimerDocumentData, supprimerDocumentVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.supprimerDocument(
  id: id,
);
supprimerDocumentData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.supprimerDocument(
  id: id,
).ref();
ref.execute();
```


### creerTaxeFonciere
#### Required Arguments
```dart
int parcelleId = ...;
int anneeFiscale = ...;
double montantDu = ...;
DateTime dateEcheance = ...;
PorheFoncier23072026Connector.instance.creerTaxeFonciere(
  parcelleId: parcelleId,
  anneeFiscale: anneeFiscale,
  montantDu: montantDu,
  dateEcheance: dateEcheance,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<creerTaxeFonciereData, creerTaxeFonciereVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.creerTaxeFonciere(
  parcelleId: parcelleId,
  anneeFiscale: anneeFiscale,
  montantDu: montantDu,
  dateEcheance: dateEcheance,
);
creerTaxeFonciereData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int parcelleId = ...;
int anneeFiscale = ...;
double montantDu = ...;
DateTime dateEcheance = ...;

final ref = PorheFoncier23072026Connector.instance.creerTaxeFonciere(
  parcelleId: parcelleId,
  anneeFiscale: anneeFiscale,
  montantDu: montantDu,
  dateEcheance: dateEcheance,
).ref();
ref.execute();
```


### marquerTaxePayee
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.marquerTaxePayee(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<marquerTaxePayeeData, marquerTaxePayeeVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.marquerTaxePayee(
  id: id,
);
marquerTaxePayeeData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.marquerTaxePayee(
  id: id,
).ref();
ref.execute();
```


### marquerTaxeEnRetard
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.marquerTaxeEnRetard(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<marquerTaxeEnRetardData, marquerTaxeEnRetardVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.marquerTaxeEnRetard(
  id: id,
);
marquerTaxeEnRetardData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.marquerTaxeEnRetard(
  id: id,
).ref();
ref.execute();
```


### mettreAJourTaxeFonciere
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.mettreAJourTaxeFonciere(
  id: id,
).execute();
```

#### Optional Arguments
We return a builder for each query. For mettreAJourTaxeFonciere, we created `mettreAJourTaxeFonciereBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class MettreAJourTaxeFonciereVariablesBuilder {
  ...
   MettreAJourTaxeFonciereVariablesBuilder anneeFiscale(int? t) {
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

  ...
}
PorheFoncier23072026Connector.instance.mettreAJourTaxeFonciere(
  id: id,
)
.anneeFiscale(anneeFiscale)
.montantDu(montantDu)
.dateEcheance(dateEcheance)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<mettreAJourTaxeFonciereData, mettreAJourTaxeFonciereVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.mettreAJourTaxeFonciere(
  id: id,
);
mettreAJourTaxeFonciereData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.mettreAJourTaxeFonciere(
  id: id,
).ref();
ref.execute();
```


### annulerTaxe
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.annulerTaxe(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<annulerTaxeData, annulerTaxeVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.annulerTaxe(
  id: id,
);
annulerTaxeData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.annulerTaxe(
  id: id,
).ref();
ref.execute();
```


### supprimerTaxeFonciere
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.supprimerTaxeFonciere(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<supprimerTaxeFonciereData, supprimerTaxeFonciereVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.supprimerTaxeFonciere(
  id: id,
);
supprimerTaxeFonciereData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.supprimerTaxeFonciere(
  id: id,
).ref();
ref.execute();
```


### ajouterSuiviVisuel
#### Required Arguments
```dart
int parcelleId = ...;
TypeMedia typeMedia = ...;
String urlStockage = ...;
String uploadeParFirebaseUid = ...;
PorheFoncier23072026Connector.instance.ajouterSuiviVisuel(
  parcelleId: parcelleId,
  typeMedia: typeMedia,
  urlStockage: urlStockage,
  uploadeParFirebaseUid: uploadeParFirebaseUid,
).execute();
```

#### Optional Arguments
We return a builder for each query. For ajouterSuiviVisuel, we created `ajouterSuiviVisuelBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class AjouterSuiviVisuelVariablesBuilder {
  ...
   AjouterSuiviVisuelVariablesBuilder latitude(double? t) {
   _latitude.value = t;
   return this;
  }
  AjouterSuiviVisuelVariablesBuilder longitude(double? t) {
   _longitude.value = t;
   return this;
  }

  ...
}
PorheFoncier23072026Connector.instance.ajouterSuiviVisuel(
  parcelleId: parcelleId,
  typeMedia: typeMedia,
  urlStockage: urlStockage,
  uploadeParFirebaseUid: uploadeParFirebaseUid,
)
.latitude(latitude)
.longitude(longitude)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<ajouterSuiviVisuelData, ajouterSuiviVisuelVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.ajouterSuiviVisuel(
  parcelleId: parcelleId,
  typeMedia: typeMedia,
  urlStockage: urlStockage,
  uploadeParFirebaseUid: uploadeParFirebaseUid,
);
ajouterSuiviVisuelData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int parcelleId = ...;
TypeMedia typeMedia = ...;
String urlStockage = ...;
String uploadeParFirebaseUid = ...;

final ref = PorheFoncier23072026Connector.instance.ajouterSuiviVisuel(
  parcelleId: parcelleId,
  typeMedia: typeMedia,
  urlStockage: urlStockage,
  uploadeParFirebaseUid: uploadeParFirebaseUid,
).ref();
ref.execute();
```


### supprimerSuiviVisuel
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.supprimerSuiviVisuel(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<supprimerSuiviVisuelData, supprimerSuiviVisuelVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.supprimerSuiviVisuel(
  id: id,
);
supprimerSuiviVisuelData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.supprimerSuiviVisuel(
  id: id,
).ref();
ref.execute();
```


### creerAbonnement
#### Required Arguments
```dart
int utilisateurId = ...;
NiveauAbonnement niveau = ...;
DateTime dateDebut = ...;
DateTime dateFin = ...;
PorheFoncier23072026Connector.instance.creerAbonnement(
  utilisateurId: utilisateurId,
  niveau: niveau,
  dateDebut: dateDebut,
  dateFin: dateFin,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<creerAbonnementData, creerAbonnementVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.creerAbonnement(
  utilisateurId: utilisateurId,
  niveau: niveau,
  dateDebut: dateDebut,
  dateFin: dateFin,
);
creerAbonnementData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int utilisateurId = ...;
NiveauAbonnement niveau = ...;
DateTime dateDebut = ...;
DateTime dateFin = ...;

final ref = PorheFoncier23072026Connector.instance.creerAbonnement(
  utilisateurId: utilisateurId,
  niveau: niveau,
  dateDebut: dateDebut,
  dateFin: dateFin,
).ref();
ref.execute();
```


### renouvelerAbonnement
#### Required Arguments
```dart
int id = ...;
DateTime dateFin = ...;
PorheFoncier23072026Connector.instance.renouvelerAbonnement(
  id: id,
  dateFin: dateFin,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<renouvelerAbonnementData, renouvelerAbonnementVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.renouvelerAbonnement(
  id: id,
  dateFin: dateFin,
);
renouvelerAbonnementData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;
DateTime dateFin = ...;

final ref = PorheFoncier23072026Connector.instance.renouvelerAbonnement(
  id: id,
  dateFin: dateFin,
).ref();
ref.execute();
```


### annulerAbonnement
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.annulerAbonnement(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<annulerAbonnementData, annulerAbonnementVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.annulerAbonnement(
  id: id,
);
annulerAbonnementData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.annulerAbonnement(
  id: id,
).ref();
ref.execute();
```


### mettreAJourAbonnement
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.mettreAJourAbonnement(
  id: id,
).execute();
```

#### Optional Arguments
We return a builder for each query. For mettreAJourAbonnement, we created `mettreAJourAbonnementBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class MettreAJourAbonnementVariablesBuilder {
  ...
   MettreAJourAbonnementVariablesBuilder niveau(NiveauAbonnement? t) {
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

  ...
}
PorheFoncier23072026Connector.instance.mettreAJourAbonnement(
  id: id,
)
.niveau(niveau)
.dateDebut(dateDebut)
.dateFin(dateFin)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<mettreAJourAbonnementData, mettreAJourAbonnementVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.mettreAJourAbonnement(
  id: id,
);
mettreAJourAbonnementData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.mettreAJourAbonnement(
  id: id,
).ref();
ref.execute();
```


### supprimerAbonnement
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.supprimerAbonnement(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<supprimerAbonnementData, supprimerAbonnementVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.supprimerAbonnement(
  id: id,
);
supprimerAbonnementData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.supprimerAbonnement(
  id: id,
).ref();
ref.execute();
```


### enregistrerPaiement
#### Required Arguments
```dart
int utilisateurId = ...;
MethodePaiement methodePaiement = ...;
double montant = ...;
PorheFoncier23072026Connector.instance.enregistrerPaiement(
  utilisateurId: utilisateurId,
  methodePaiement: methodePaiement,
  montant: montant,
).execute();
```

#### Optional Arguments
We return a builder for each query. For enregistrerPaiement, we created `enregistrerPaiementBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class EnregistrerPaiementVariablesBuilder {
  ...
   EnregistrerPaiementVariablesBuilder taxeFonciereId(int? t) {
   _taxeFonciereId.value = t;
   return this;
  }
  EnregistrerPaiementVariablesBuilder abonnementId(int? t) {
   _abonnementId.value = t;
   return this;
  }
  EnregistrerPaiementVariablesBuilder fraisEnregistrementId(int? t) {
   _fraisEnregistrementId.value = t;
   return this;
  }
  EnregistrerPaiementVariablesBuilder referenceTransaction(String? t) {
   _referenceTransaction.value = t;
   return this;
  }

  ...
}
PorheFoncier23072026Connector.instance.enregistrerPaiement(
  utilisateurId: utilisateurId,
  methodePaiement: methodePaiement,
  montant: montant,
)
.taxeFonciereId(taxeFonciereId)
.abonnementId(abonnementId)
.fraisEnregistrementId(fraisEnregistrementId)
.referenceTransaction(referenceTransaction)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<enregistrerPaiementData, enregistrerPaiementVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.enregistrerPaiement(
  utilisateurId: utilisateurId,
  methodePaiement: methodePaiement,
  montant: montant,
);
enregistrerPaiementData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int utilisateurId = ...;
MethodePaiement methodePaiement = ...;
double montant = ...;

final ref = PorheFoncier23072026Connector.instance.enregistrerPaiement(
  utilisateurId: utilisateurId,
  methodePaiement: methodePaiement,
  montant: montant,
).ref();
ref.execute();
```


### confirmerPaiement
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.confirmerPaiement(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<confirmerPaiementData, confirmerPaiementVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.confirmerPaiement(
  id: id,
);
confirmerPaiementData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.confirmerPaiement(
  id: id,
).ref();
ref.execute();
```


### confirmerPaiementTaxe
#### Required Arguments
```dart
int id = ...;
int taxeFonciereId = ...;
PorheFoncier23072026Connector.instance.confirmerPaiementTaxe(
  id: id,
  taxeFonciereId: taxeFonciereId,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<confirmerPaiementTaxeData, confirmerPaiementTaxeVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.confirmerPaiementTaxe(
  id: id,
  taxeFonciereId: taxeFonciereId,
);
confirmerPaiementTaxeData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;
int taxeFonciereId = ...;

final ref = PorheFoncier23072026Connector.instance.confirmerPaiementTaxe(
  id: id,
  taxeFonciereId: taxeFonciereId,
).ref();
ref.execute();
```


### confirmerPaiementAbonnement
#### Required Arguments
```dart
int id = ...;
int abonnementId = ...;
PorheFoncier23072026Connector.instance.confirmerPaiementAbonnement(
  id: id,
  abonnementId: abonnementId,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<confirmerPaiementAbonnementData, confirmerPaiementAbonnementVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.confirmerPaiementAbonnement(
  id: id,
  abonnementId: abonnementId,
);
confirmerPaiementAbonnementData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;
int abonnementId = ...;

final ref = PorheFoncier23072026Connector.instance.confirmerPaiementAbonnement(
  id: id,
  abonnementId: abonnementId,
).ref();
ref.execute();
```


### annulerPaiement
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.annulerPaiement(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<annulerPaiementData, annulerPaiementVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.annulerPaiement(
  id: id,
);
annulerPaiementData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.annulerPaiement(
  id: id,
).ref();
ref.execute();
```


### creerAlerte
#### Required Arguments
```dart
int utilisateurId = ...;
TypeAlerte typeAlerte = ...;
String message = ...;
PorheFoncier23072026Connector.instance.creerAlerte(
  utilisateurId: utilisateurId,
  typeAlerte: typeAlerte,
  message: message,
).execute();
```

#### Optional Arguments
We return a builder for each query. For creerAlerte, we created `creerAlerteBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class CreerAlerteVariablesBuilder {
  ...
   CreerAlerteVariablesBuilder parcelleId(int? t) {
   _parcelleId.value = t;
   return this;
  }

  ...
}
PorheFoncier23072026Connector.instance.creerAlerte(
  utilisateurId: utilisateurId,
  typeAlerte: typeAlerte,
  message: message,
)
.parcelleId(parcelleId)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<creerAlerteData, creerAlerteVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.creerAlerte(
  utilisateurId: utilisateurId,
  typeAlerte: typeAlerte,
  message: message,
);
creerAlerteData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int utilisateurId = ...;
TypeAlerte typeAlerte = ...;
String message = ...;

final ref = PorheFoncier23072026Connector.instance.creerAlerte(
  utilisateurId: utilisateurId,
  typeAlerte: typeAlerte,
  message: message,
).ref();
ref.execute();
```


### marquerAlerteLue
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.marquerAlerteLue(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<marquerAlerteLueData, marquerAlerteLueVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.marquerAlerteLue(
  id: id,
);
marquerAlerteLueData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.marquerAlerteLue(
  id: id,
).ref();
ref.execute();
```


### supprimerAlerte
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.supprimerAlerte(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<supprimerAlerteData, supprimerAlerteVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.supprimerAlerte(
  id: id,
);
supprimerAlerteData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.supprimerAlerte(
  id: id,
).ref();
ref.execute();
```


### signalerLitige
#### Required Arguments
```dart
int parcelleId = ...;
int plaignantId = ...;
String motif = ...;
PorheFoncier23072026Connector.instance.signalerLitige(
  parcelleId: parcelleId,
  plaignantId: plaignantId,
  motif: motif,
).execute();
```

#### Optional Arguments
We return a builder for each query. For signalerLitige, we created `signalerLitigeBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class SignalerLitigeVariablesBuilder {
  ...
   SignalerLitigeVariablesBuilder transactionFonciereId(int? t) {
   _transactionFonciereId.value = t;
   return this;
  }

  ...
}
PorheFoncier23072026Connector.instance.signalerLitige(
  parcelleId: parcelleId,
  plaignantId: plaignantId,
  motif: motif,
)
.transactionFonciereId(transactionFonciereId)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<signalerLitigeData, signalerLitigeVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.signalerLitige(
  parcelleId: parcelleId,
  plaignantId: plaignantId,
  motif: motif,
);
signalerLitigeData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int parcelleId = ...;
int plaignantId = ...;
String motif = ...;

final ref = PorheFoncier23072026Connector.instance.signalerLitige(
  parcelleId: parcelleId,
  plaignantId: plaignantId,
  motif: motif,
).ref();
ref.execute();
```


### passerLitigeEnExamen
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.passerLitigeEnExamen(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<passerLitigeEnExamenData, passerLitigeEnExamenVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.passerLitigeEnExamen(
  id: id,
);
passerLitigeEnExamenData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.passerLitigeEnExamen(
  id: id,
).ref();
ref.execute();
```


### resoudreLitige
#### Required Arguments
```dart
int id = ...;
String resolution = ...;
PorheFoncier23072026Connector.instance.resoudreLitige(
  id: id,
  resolution: resolution,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<resoudreLitigeData, resoudreLitigeVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.resoudreLitige(
  id: id,
  resolution: resolution,
);
resoudreLitigeData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;
String resolution = ...;

final ref = PorheFoncier23072026Connector.instance.resoudreLitige(
  id: id,
  resolution: resolution,
).ref();
ref.execute();
```


### rejeterLitige
#### Required Arguments
```dart
int id = ...;
String resolution = ...;
PorheFoncier23072026Connector.instance.rejeterLitige(
  id: id,
  resolution: resolution,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<rejeterLitigeData, rejeterLitigeVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.rejeterLitige(
  id: id,
  resolution: resolution,
);
rejeterLitigeData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;
String resolution = ...;

final ref = PorheFoncier23072026Connector.instance.rejeterLitige(
  id: id,
  resolution: resolution,
).ref();
ref.execute();
```


### supprimerLitige
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.supprimerLitige(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<supprimerLitigeData, supprimerLitigeVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.supprimerLitige(
  id: id,
);
supprimerLitigeData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.supprimerLitige(
  id: id,
).ref();
ref.execute();
```


### creerFraisEnregistrement
#### Required Arguments
```dart
int parcelleId = ...;
TypeFrais typeFrais = ...;
double montant = ...;
PorheFoncier23072026Connector.instance.creerFraisEnregistrement(
  parcelleId: parcelleId,
  typeFrais: typeFrais,
  montant: montant,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<creerFraisEnregistrementData, creerFraisEnregistrementVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.creerFraisEnregistrement(
  parcelleId: parcelleId,
  typeFrais: typeFrais,
  montant: montant,
);
creerFraisEnregistrementData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int parcelleId = ...;
TypeFrais typeFrais = ...;
double montant = ...;

final ref = PorheFoncier23072026Connector.instance.creerFraisEnregistrement(
  parcelleId: parcelleId,
  typeFrais: typeFrais,
  montant: montant,
).ref();
ref.execute();
```


### marquerFraisPaye
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.marquerFraisPaye(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<marquerFraisPayeData, marquerFraisPayeVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.marquerFraisPaye(
  id: id,
);
marquerFraisPayeData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.marquerFraisPaye(
  id: id,
).ref();
ref.execute();
```


### annulerFrais
#### Required Arguments
```dart
int id = ...;
String motifRejet = ...;
PorheFoncier23072026Connector.instance.annulerFrais(
  id: id,
  motifRejet: motifRejet,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<annulerFraisData, annulerFraisVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.annulerFrais(
  id: id,
  motifRejet: motifRejet,
);
annulerFraisData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;
String motifRejet = ...;

final ref = PorheFoncier23072026Connector.instance.annulerFrais(
  id: id,
  motifRejet: motifRejet,
).ref();
ref.execute();
```


### rejeterFrais
#### Required Arguments
```dart
int id = ...;
String motifRejet = ...;
PorheFoncier23072026Connector.instance.rejeterFrais(
  id: id,
  motifRejet: motifRejet,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<rejeterFraisData, rejeterFraisVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.rejeterFrais(
  id: id,
  motifRejet: motifRejet,
);
rejeterFraisData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;
String motifRejet = ...;

final ref = PorheFoncier23072026Connector.instance.rejeterFrais(
  id: id,
  motifRejet: motifRejet,
).ref();
ref.execute();
```


### supprimerFraisEnregistrement
#### Required Arguments
```dart
int id = ...;
PorheFoncier23072026Connector.instance.supprimerFraisEnregistrement(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<supprimerFraisEnregistrementData, supprimerFraisEnregistrementVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await PorheFoncier23072026Connector.instance.supprimerFraisEnregistrement(
  id: id,
);
supprimerFraisEnregistrementData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int id = ...;

final ref = PorheFoncier23072026Connector.instance.supprimerFraisEnregistrement(
  id: id,
).ref();
ref.execute();
```

