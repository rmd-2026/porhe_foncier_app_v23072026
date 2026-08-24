import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/features/suivi_visuel_management/data/suivi_visuel_repository.dart';
import 'package:porhe_foncier_app_23072026/features/suivi_visuel_management/data/suivi_visuel_storage_service.dart';

final suiviVisuelStorageServiceProvider = Provider<SuiviVisuelStorageService>((ref) {
  return SuiviVisuelStorageService(FirebaseStorage.instance);
});

final suiviVisuelRepositoryProvider = Provider<SuiviVisuelRepository>((ref) {
  return SuiviVisuelRepository(
    PorheFoncier23072026Connector.instance,
    FirebaseAuth.instance,
    ref.read(suiviVisuelStorageServiceProvider),
  );
});
