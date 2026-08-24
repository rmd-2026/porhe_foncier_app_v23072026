import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/features/parcelle/data/parcelle_repository.dart';

final parcelleRepositoryProvider = Provider<ParcelleRepository>((ref) {
  return ParcelleRepository(PorheFoncier23072026Connector.instance, FirebaseAuth.instance);
});
