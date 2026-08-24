import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:porhe_foncier_app_23072026/core/failure.dart';

/// Thin wrapper around Firebase Storage — NOT a Data Connect operation.
/// Data Connect's ajouterDocument mutation only ever receives a plain
/// urlStockage: String! it never uploads anything itself (confirmed:
/// no Storage-specific mutation exists in mutations.gql). This service
/// is the only place actual file bytes touch the network.
class DocumentStorageService {
  DocumentStorageService(this._storage);
  final FirebaseStorage _storage;

  /// Uploads [bytes] under documents/{parcelleId}/{nomFichier}.
  ///
  /// [nomFichier] is expected to already be the FINAL, fully-built name
  /// (e.g. "42_TITRE_FONCIER_1755375000000.pdf", built once by
  /// document_repository's _construireNomFichier) — this method must
  /// NOT add its own timestamp/prefix on top of it. Doing so previously
  /// caused a visible double-timestamp bug in the stored filename.
  Future<Either<Failure, String>> televerser({
    required int parcelleId,
    required String nomFichier,
    required Uint8List bytes,
  }) async {
    try {
      final chemin = 'documents/$parcelleId/$nomFichier';
      final ref = _storage.ref().child(chemin);
      await ref.putData(bytes);
      final url = await ref.getDownloadURL();
      return right(url);
    } catch (e) {
      return left(Failure('Erreur lors du téléversement : $e'));
    }
  }

  /// Deletes the underlying Storage object given its download URL.
  /// Best-effort: if the object is already gone (e.g. manually removed
  /// from the Storage console), this does not fail the caller — the
  /// Data Connect row deletion is what matters most for consistency;
  /// an orphaned-but-already-missing Storage object is not an error.
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
