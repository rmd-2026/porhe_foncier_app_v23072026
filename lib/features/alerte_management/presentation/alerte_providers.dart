import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/features/alerte_management/data/alerte_repository.dart';

final alerteRepositoryProvider = Provider<AlerteRepository>((ref) {
  return AlerteRepository(PorheFoncier23072026Connector.instance, FirebaseAuth.instance);
});
