import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:porhe_foncier_app_23072026/core/failure.dart';

/// Mirrors DocumentStorageService's pattern exactly: upload first,
/// only touch Data Connect if the Storage write succeeds. Profile
/// photos live under profils/{firebaseUid}/{timestamp}.{ext} rather
/// than a fixed filename, so replacing a photo never collides with
/// a still-in-flight previous upload, and old photos can be cleaned
/// up explicitly by the caller once the new URL is confirmed saved.
class ProfilStorageService {
  ProfilStorageService(this._storage);
  final FirebaseStorage _storage;

  Future<Either<Failure, String>> televerserPhoto({
    required String firebaseUid,
    required Uint8List bytes,
    required String extensionOriginale,
  }) async {
    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final chemin = 'profils/$firebaseUid/$timestamp$extensionOriginale';
      final ref = _storage.ref().child(chemin);
      await ref.putData(bytes);
      final url = await ref.getDownloadURL();
      return right(url);
    } catch (e) {
      return left(Failure('Erreur lors du téléversement de la photo : $e'));
    }
  }

  /// Best-effort cleanup of the previous photo after a successful
  /// replace -- never surfaced as an error to the user if it fails
  /// (e.g. URL already gone, permissions), since the new photo is
  /// already correctly saved at that point.
  Future<void> supprimerAncienne(String url) async {
    try {
      await _storage.refFromURL(url).delete();
    } catch (_) {
      // Swallowed intentionally, matches DocumentStorageService.
    }
  }
}
