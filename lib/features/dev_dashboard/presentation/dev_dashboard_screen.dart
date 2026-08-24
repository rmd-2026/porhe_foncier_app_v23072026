import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:porhe_foncier_app_23072026/core/app_strings.dart';
import 'package:porhe_foncier_app_23072026/features/dev_dashboard/domain/endpoint_metadata.dart';
import 'package:porhe_foncier_app_23072026/features/dev_dashboard/presentation/dynamic_mutation_screen.dart';
import 'package:porhe_foncier_app_23072026/features/dev_dashboard/presentation/dynamic_query_screen.dart';

/// Pure diagnostic tool — raw test surface for all 102 Data Connect
/// endpoints. Contains NO product-feature navigation; real management
/// screens (Utilisateurs, Parcelles, ...) live under
/// features/admin/presentation/admin_home_screen.dart and are reached
/// independently of this screen.
class DevDashboardScreen extends StatelessWidget {
  const DevDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.dashboardTitle)),
      body: Column(
        children: [
          const _AuthStatusBanner(),
          Expanded(
            child: ListView(
              children: endpointCategories
                  .map((category) => _CategorySection(category: category))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

/// Diagnostic banner: makes the current Firebase Auth state visible
/// on-screen instead of buried in the debug console, so a missing or
/// failed sign-in (the #1 cause of 401 UNAUTHENTICATED errors from
/// Data Connect) is immediately obvious without checking logs.
class _AuthStatusBanner extends StatefulWidget {
  const _AuthStatusBanner();

  @override
  State<_AuthStatusBanner> createState() => _AuthStatusBannerState();
}

class _AuthStatusBannerState extends State<_AuthStatusBanner> {
  bool _retrying = false;
  String? _retryError;

  Future<void> _retrySignIn() async {
    setState(() {
      _retrying = true;
      _retryError = null;
    });
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } catch (e) {
      setState(() => _retryError = e.toString());
    }
    setState(() => _retrying = false);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final user = snapshot.data;
        final connected = user != null;

        return Container(
          width: double.infinity,
          color: connected ? Colors.green.shade50 : Colors.red.shade50,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    connected ? Icons.check_circle : Icons.error,
                    color: connected ? Colors.green : Colors.red,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      connected
                          ? 'Connecté — firebaseUid : ${user.uid}'
                          : 'Non connecté — les appels @auth(level: USER) échoueront (401)',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  if (!connected)
                    TextButton(
                      onPressed: _retrying ? null : _retrySignIn,
                      child: _retrying
                          ? const SizedBox(
                              height: 14,
                              width: 14,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Réessayer'),
                    ),
                ],
              ),
              if (_retryError != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    _retryError!,
                    style: const TextStyle(color: Colors.red, fontSize: 11),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _CategorySection extends StatelessWidget {
  const _CategorySection({required this.category});
  final EndpointCategory category;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('${category.label} (${category.endpoints.length})'),
      children: category.endpoints
          .map((endpoint) => _EndpointTile(endpoint: endpoint))
          .toList(),
    );
  }
}

class _EndpointTile extends StatelessWidget {
  const _EndpointTile({required this.endpoint});
  final EndpointMetadata endpoint;

  @override
  Widget build(BuildContext context) {
    final isQuery = endpoint.type == EndpointType.query;
    return ListTile(
      leading: Icon(
        isQuery ? Icons.visibility_outlined : Icons.edit_outlined,
        color: isQuery ? Colors.blue : Colors.orange,
      ),
      title: Text(endpoint.name),
      subtitle: Text(isQuery ? AppStrings.lecture : AppStrings.ecriture),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => isQuery
                ? DynamicQueryScreen(metadata: endpoint)
                : DynamicMutationScreen(metadata: endpoint),
          ),
        );
      },
    );
  }
}
