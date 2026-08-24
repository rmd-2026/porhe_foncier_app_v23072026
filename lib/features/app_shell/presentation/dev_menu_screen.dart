import 'package:flutter/material.dart';
import 'package:porhe_foncier_app_23072026/features/admin/presentation/admin_home_screen.dart';
import 'package:porhe_foncier_app_23072026/features/app_shell/presentation/agent_shell_screen.dart';
import 'package:porhe_foncier_app_23072026/features/app_shell/presentation/owner_shell_screen.dart';

/// Temporary "Dev Menu" route (per the Response Format rules) for
/// reaching any shell directly during development, bypassing the real
/// RoleRouter resolution — useful for testing a shell's UI without
/// needing a real Firebase user provisioned with that exact role.
/// Delete once Phase 6+ real navigation makes this redundant.
class DevMenuScreen extends StatelessWidget {
  const DevMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dev Menu')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.admin_panel_settings),
            title: const Text('Admin (ADMIN_COMMUNE / ADMIN_GLOBAL)'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AdminHomeScreen()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.terrain),
            title: const Text('Agent terrain (AGENT)'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AgentShellScreen()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Espace propriétaire (PROPRIETAIRE)'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const OwnerShellScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
