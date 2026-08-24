import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fpdart/fpdart.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/core/failure.dart';

class AuthRepository {
  AuthRepository(this._auth, this._connector, this._googleSignIn);
  final FirebaseAuth _auth;
  final PorheFoncier23072026Connector _connector;
  final GoogleSignIn _googleSignIn;

  Future<Either<Failure, Unit>> inscrireParEmail({
    required String nom,
    required String prenom,
    required String email,
    required String motDePasse,
    String? telephone,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: motDePasse,
      );
      final uid = credential.user?.uid;
      if (uid == null) {
        return left(const Failure('Erreur inattendue : utilisateur non créé.'));
      }

      final builder = _connector.upsertUtilisateurParFirebaseUid(firebaseUid: uid);
      if (nom.trim().isNotEmpty) builder.nom(nom.trim());
      if (prenom.trim().isNotEmpty) builder.prenom(prenom.trim());
      if (email.isNotEmpty) builder.email(email);
      if (telephone != null && telephone.trim().isNotEmpty) {
        builder.telephone(telephone.trim());
      }
      await builder.execute();

      await credential.user?.sendEmailVerification();

      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(Failure(_messageErreurFirebase(e)));
    } catch (e) {
      return left(Failure('Erreur lors de l\'inscription : $e'));
    }
  }

  Future<Either<Failure, Unit>> connecterParEmail({
    required String email,
    required String motDePasse,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: motDePasse);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(Failure(_messageErreurFirebase(e)));
    } catch (e) {
      return left(Failure('Erreur lors de la connexion : $e'));
    }
  }

  Future<Either<Failure, Unit>> connecterAvecGoogle() async {
    try {
      final compteGoogle = await _googleSignIn.signIn();
      if (compteGoogle == null) {
        return left(const Failure('Connexion Google annulée.'));
      }

      final authentificationGoogle = await compteGoogle.authentication;
      final credentialFirebase = GoogleAuthProvider.credential(
        accessToken: authentificationGoogle.accessToken,
        idToken: authentificationGoogle.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credentialFirebase);
      final uid = userCredential.user?.uid;
      if (uid == null) {
        return left(const Failure('Erreur inattendue : utilisateur non créé.'));
      }

      await _connector.upsertUtilisateurParFirebaseUid(firebaseUid: uid).execute();

      final profilResult =
          await _connector.obtenirProfilParFirebaseUid(firebaseUid: uid).execute();
      final prenomActuel = profilResult.data.utilisateur?.prenom ?? '';

      final builder = _connector.upsertUtilisateurParFirebaseUid(firebaseUid: uid);
      if (userCredential.user?.email != null) {
        builder.email(userCredential.user!.email!);
      }
      if (prenomActuel.trim().isEmpty && compteGoogle.displayName != null) {
        builder.prenom(compteGoogle.displayName!);
      }
      await builder.execute();

      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(Failure(_messageErreurFirebase(e)));
    } catch (e) {
      return left(Failure('Erreur lors de la connexion Google : $e'));
    }
  }

  /// Step 1 of phone auth. numeroTelephone must be E.164 format
  /// (e.g. +221771234567) -- the input screen is responsible for
  /// prepending the country code, this method does not normalize it.
  ///
  /// verificationCompleted (Android auto-retrieval) signs the user in
  /// directly and reports success via onAutoVerificationReussie
  /// instead of going through the OTP-entry screen at all -- flagged
  /// explicitly in the UI layer since it changes the expected flow.
  Future<void> demarrerVerificationTelephone({
    required String numeroTelephone,
    required void Function(String verificationId) onCodeEnvoye,
    required void Function(String message) onEchec,
    required void Function() onAutoVerificationReussie,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: numeroTelephone,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        try {
          final userCredential = await _auth.signInWithCredential(credential);
          final uid = userCredential.user?.uid;
          if (uid != null) {
            await _connector.upsertUtilisateurParFirebaseUid(firebaseUid: uid).execute();
          }
          onAutoVerificationReussie();
        } catch (e) {
          onEchec('Erreur lors de la vérification automatique : $e');
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        onEchec(_messageErreurFirebase(e));
      },
      codeSent: (String verificationId, int? resendToken) {
        onCodeEnvoye(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  /// Step 2 of phone auth -- called with the OTP the user typed in.
  Future<Either<Failure, Unit>> confirmerCodeTelephone({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      final userCredential = await _auth.signInWithCredential(credential);
      final uid = userCredential.user?.uid;
      if (uid == null) {
        return left(const Failure('Erreur inattendue : utilisateur non créé.'));
      }

      // Phone auth gives no name at all -- unlike Google's
      // displayName, there is nothing to seed nom/prenom with here.
      // A first-time phone user will have both fields empty, handled
      // by RoleRouter's "both empty AND no role yet" branch.
      await _connector.upsertUtilisateurParFirebaseUid(firebaseUid: uid).execute();

      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(Failure(_messageErreurFirebase(e)));
    } catch (e) {
      return left(Failure('Erreur lors de la vérification du code : $e'));
    }
  }

  Future<Either<Failure, Unit>> renvoyerEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de l\'envoi : $e'));
    }
  }

  Future<Either<Failure, Unit>> envoyerEmailReinitialisation(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(Failure(_messageErreurFirebase(e)));
    } catch (e) {
      return left(Failure('Erreur lors de l\'envoi : $e'));
    }
  }

  Future<void> seDeconnecter() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  Future<Either<Failure, Unit>> corrigerNomPrenom({
    required String firebaseUid,
    required String nom,
    required String prenom,
  }) async {
    try {
      final builder = _connector.upsertUtilisateurParFirebaseUid(firebaseUid: firebaseUid);
      builder.nom(nom.trim());
      builder.prenom(prenom.trim());
      await builder.execute();
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de la mise à jour : $e'));
    }
  }

  String _messageErreurFirebase(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'Cette adresse e-mail est déjà utilisée.';
      case 'invalid-email':
        return 'Adresse e-mail invalide.';
      case 'weak-password':
        return 'Mot de passe trop faible (6 caractères minimum).';
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return 'E-mail ou mot de passe incorrect.';
      case 'user-disabled':
        return 'Ce compte a été désactivé.';
      case 'too-many-requests':
        return 'Trop de tentatives. Réessayez plus tard.';
      case 'account-exists-with-different-credential':
        return 'Un compte existe déjà avec cette adresse e-mail via une autre méthode de connexion.';
      case 'invalid-phone-number':
        return 'Numéro de téléphone invalide.';
      case 'invalid-verification-code':
        return 'Code de vérification incorrect.';
      case 'session-expired':
        return 'Le code a expiré. Demandez-en un nouveau.';
      default:
        return 'Erreur d\'authentification : ${e.message ?? e.code}';
    }
  }
}
