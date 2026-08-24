import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:porhe_foncier_app_23072026/core/failure.dart';

/// Mirrors document_storage_service.dart's structure — Firebase
/// Storage upload/delete, entirely separate from Data Connect (which
/// only ever receives a plain urlStockage: String!).
class SuiviVisuelStorageService {
  SuiviVisuelStorageService(this._storage);
  final FirebaseStorage _storage;

  Future<Either<Failure, String>> televerser({
    required int parcelleId,
    required String nomFichier,
    required Uint8List bytes,
  }) async {
    try {
      final chemin = 'suivi_visuel/$parcelleId/$nomFichier';
      final ref = _storage.ref().child(chemin);
      await ref.putData(bytes);
      final url = await ref.getDownloadURL();
      return right(url);
    } catch (e) {
      return left(Failure('Erreur lors du téléversement : $e'));
    }
  }

  Future<Either<Failure, Unit>> supprimer(String urlStockage) async {
    try {
      final ref = _storage.refFromURL(urlStockage);
      await ref.delete();
      return right(unit);
    } catch (e) {
      return right(unit);
    }
  }
}
