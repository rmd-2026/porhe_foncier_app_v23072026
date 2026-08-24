import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/core/dataconnect_generated/porhe_foncier23072026.dart';
import 'package:porhe_foncier_app_23072026/features/dev_dashboard/data/dev_dashboard_repository.dart';

final dashboardRepositoryProvider = Provider<DevDashboardRepository>((ref) {
  return DevDashboardRepository(PorheFoncier23072026Connector.instance);
});