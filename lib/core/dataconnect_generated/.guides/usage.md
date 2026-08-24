# Basic Usage

```dart
PorheFoncier23072026Connector.instance.seedRegions().execute();
PorheFoncier23072026Connector.instance.seedCommunes().execute();
PorheFoncier23072026Connector.instance.seedSousPrefectures().execute();
PorheFoncier23072026Connector.instance.upsertUtilisateurParFirebaseUid(upsertUtilisateurParFirebaseUidVariables).execute();
PorheFoncier23072026Connector.instance.mettreAJourProfil(mettreAJourProfilVariables).execute();
PorheFoncier23072026Connector.instance.assignerRoleUtilisateurParDefaut(assignerRoleUtilisateurParDefautVariables).execute();
PorheFoncier23072026Connector.instance.assignerRoleGlobal(assignerRoleGlobalVariables).execute();
PorheFoncier23072026Connector.instance.assignerRoleCommune(assignerRoleCommuneVariables).execute();
PorheFoncier23072026Connector.instance.validerUtilisateur(validerUtilisateurVariables).execute();
PorheFoncier23072026Connector.instance.desactiverUtilisateur(desactiverUtilisateurVariables).execute();

```

## Optional Fields

Some operations may have optional fields. In these cases, the Flutter SDK exposes a builder method, and will have to be set separately.

Optional fields can be discovered based on classes that have `Optional` object types.

This is an example of a mutation with an optional field:

```dart
await PorheFoncier23072026Connector.instance.listerTousFrais({ ... })
.limit(...)
.execute();
```

Note: the above example is a mutation, but the same logic applies to query operations as well. Additionally, `createMovie` is an example, and may not be available to the user.

