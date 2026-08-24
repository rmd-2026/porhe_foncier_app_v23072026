import 'package:flutter/material.dart';

/// Empty shell for the mobile terrain app (Agent role) — offline-first
/// parcel/GPS/QR/photo workflows belong to later phases (8+). This
/// phase only establishes that AGENT-role users land somewhere
/// distinct from the admin/owner surfaces.
class AgentShellScreen extends StatelessWidget {
  const AgentShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Porhe Foncier — Agent terrain')),
      body: const Center(
        child: Text(
          'Interface agent terrain — à construire dans les phases suivantes.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
