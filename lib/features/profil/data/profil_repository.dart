import 'dart:typed_data';
import 'package:fpdart/fpdart.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/core/failure.dart';
import 'package:porhe_foncier_app_23072026/features/profil/data/profil_storage_service.dart';

class ProfilDetail {
  ProfilDetail({
    required this.id,
    required this.firebaseUid,
    this.nom,
    this.prenom,
    this.civilite,
    this.dateNaissance,
    this.lieuNaissance,
    this.nationalite,
    this.typePieceIdentite,
    this.numeroPieceIdentite,
    this.pieceIdentiteValideDe,
    this.pieceIdentiteValideA,
    this.telephone,
    this.email,
    this.adresse,
    this.photoUrl,
  });

  final int id;
  final String firebaseUid;
  final String? nom;
  final String? prenom;
  final String? civilite;
  final String? dateNaissance;
  final String? lieuNaissance;
  final String? nationalite;
  final String? typePieceIdentite;
  final String? numeroPieceIdentite;
  final String? pieceIdentiteValideDe;
  final String? pieceIdentiteValideA;
  final String? telephone;
  final String? email;
  final String? adresse;
  final String? photoUrl;

  /// Mirrors the backend's estProfilIncomplet check: nom, prenom,
  /// telephone, or adresse null. The identity-document fields
  /// (lieuNaissance/nationalite/typePieceIdentite/etc.) are NOT part
  /// of that canonical check, per the Auth Rules -- they're
  /// additional, optional profile detail, not required-for-complete
  /// fields, so they never appear in this banner.
  bool get semblerIncomplet =>
      (nom ?? '').trim().isEmpty ||
      (prenom ?? '').trim().isEmpty ||
      (telephone ?? '').trim().isEmpty ||
      (adresse ?? '').trim().isEmpty;
}

const List<String> typesPieceIdentite = ['CIN', 'PASSEPORT'];

class ProfilRepository {
  ProfilRepository(this._connector, this._storage);
  final PorheFoncier23072026Connector _connector;
  final ProfilStorageService _storage;

  Future<Either<Failure, ProfilDetail>> obtenirProfil(String firebaseUid) async {
    try {
      final result = await _connector.obtenirProfilParFirebaseUid(firebaseUid: firebaseUid).execute();
      final u = result.data.utilisateur;
      if (u == null) {
        return left(const Failure('Profil introuvable.'));
      }
      return right(ProfilDetail(
        id: u.id,
        firebaseUid: u.firebaseUid,
        nom: u.nom,
        prenom: u.prenom,
        civilite: u.civilite?.stringValue,
        dateNaissance: u.dateNaissance?.toString(),
        lieuNaissance: u.lieuNaissance,
        nationalite: u.nationalite,
        typePieceIdentite: u.typePieceIdentite?.stringValue,
        numeroPieceIdentite: u.numeroPieceIdentite,
        pieceIdentiteValideDe: u.pieceIdentiteValideDe?.toString(),
        pieceIdentiteValideA: u.pieceIdentiteValideA?.toString(),
        telephone: u.telephone,
        email: u.email,
        adresse: u.adresse,
        photoUrl: u.photoUrl,
      ));
    } catch (e) {
      return left(Failure('Erreur lors du chargement du profil : $e'));
    }
  }

  /// Full field set actually accepted by mettreAJourProfil, per the
  /// admin-side UtilisateurDetailScreen's confirmed usage -- broader
  /// than the seven fields named in the Auth Rules text, which
  /// appears to predate this mutation being extended with the
  /// identity-document fields. firebaseUid and email remain absent,
  /// per the "must never allow changing" rule, which still holds.
  Future<Either<Failure, Unit>> mettreAJourProfil({
    required String firebaseUid,
    String? nom,
    String? prenom,
    String? civilite,
    DateTime? dateNaissance,
    String? lieuNaissance,
    String? nationalite,
    String? typePieceIdentite,
    String? numeroPieceIdentite,
    DateTime? pieceIdentiteValideDe,
    DateTime? pieceIdentiteValideA,
    String? telephone,
    String? adresse,
    String? photoUrl,
  }) async {
    try {
      final builder = _connector.mettreAJourProfil(firebaseUid: firebaseUid);
      if (nom != null) builder.nom(nom);
      if (prenom != null) builder.prenom(prenom);
      if (civilite != null) builder.civilite(Civilite.values.byName(civilite));
      if (dateNaissance != null) builder.dateNaissance(dateNaissance);
      if (lieuNaissance != null) builder.lieuNaissance(lieuNaissance);
      if (nationalite != null) builder.nationalite(nationalite);
      if (typePieceIdentite != null) {
        builder.typePieceIdentite(TypePieceIdentite.values.byName(typePieceIdentite));
      }
      if (numeroPieceIdentite != null) builder.numeroPieceIdentite(numeroPieceIdentite);
      if (pieceIdentiteValideDe != null) builder.pieceIdentiteValideDe(pieceIdentiteValideDe);
      if (pieceIdentiteValideA != null) builder.pieceIdentiteValideA(pieceIdentiteValideA);
      if (telephone != null) builder.telephone(telephone);
      if (adresse != null) builder.adresse(adresse);
      if (photoUrl != null) builder.photoUrl(photoUrl);
      await builder.execute();
      return right(unit);
    } catch (e) {
      return left(Failure('Erreur lors de la mise à jour du profil : $e'));
    }
  }

  /// Uploads to Storage first, saves the URL via mettreAJourProfil
  /// only on success, then best-effort deletes the previous photo --
  /// same order of operations as DocumentRepository.ajouter, so a
  /// failed upload never touches Data Connect and a failed metadata
  /// save never leaves an orphaned file with nothing pointing at it
  /// (the newly-uploaded file is simply abandoned, matching that
  /// existing pattern's tradeoff).
  Future<Either<Failure, String>> changerPhoto({
    required String firebaseUid,
    required Uint8List bytes,
    required String extensionOriginale,
    String? ancienneUrl,
  }) async {
    final uploadResult = await _storage.televerserPhoto(
      firebaseUid: firebaseUid,
      bytes: bytes,
      extensionOriginale: extensionOriginale,
    );

    return uploadResult.match(
      (f) => left(f),
      (url) async {
        final saveResult = await mettreAJourProfil(firebaseUid: firebaseUid, photoUrl: url);
        return saveResult.match(
          (f) => left(f),
          (_) async {
            if (ancienneUrl != null && ancienneUrl.isNotEmpty) {
              await _storage.supprimerAncienne(ancienneUrl);
            }
            return right(url);
          },
        );
      },
    ) as Future<Either<Failure, String>>;
  }
}
