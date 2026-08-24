import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/features/profil/data/profil_repository.dart';
import 'package:porhe_foncier_app_23072026/features/profil/data/profil_storage_service.dart';

final profilStorageServiceProvider = Provider<ProfilStorageService>((ref) {
  return ProfilStorageService(FirebaseStorage.instance);
});

final profilRepositoryProvider = Provider<ProfilRepository>((ref) {
  return ProfilRepository(
    PorheFoncier23072026Connector.instance,
    ref.read(profilStorageServiceProvider),
  );
});
