import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/features/document_management/data/document_repository.dart';
import 'package:porhe_foncier_app_23072026/features/document_management/data/document_storage_service.dart';

final documentStorageServiceProvider = Provider<DocumentStorageService>((ref) {
  return DocumentStorageService(FirebaseStorage.instance);
});

final documentRepositoryProvider = Provider<DocumentRepository>((ref) {
  return DocumentRepository(
    PorheFoncier23072026Connector.instance,
    FirebaseAuth.instance,
    ref.read(documentStorageServiceProvider),
  );
});
