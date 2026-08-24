import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/core/app_strings.dart';
import 'package:porhe_foncier_app_23072026/features/dev_dashboard/domain/endpoint_metadata.dart';
import 'package:porhe_foncier_app_23072026/features/dev_dashboard/presentation/dashboard_providers.dart';
import 'package:porhe_foncier_app_23072026/features/dev_dashboard/presentation/dynamic_query_screen.dart'
    show buildDynamicFormFields;

class DynamicMutationScreen extends ConsumerStatefulWidget {
  const DynamicMutationScreen({super.key, required this.metadata});
  final EndpointMetadata metadata;

  @override
  ConsumerState<DynamicMutationScreen> createState() =>
      _DynamicMutationScreenState();
}

class _DynamicMutationScreenState extends ConsumerState<DynamicMutationScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _values = {};
  bool _loading = false;
  String? _errorText;
  bool _succeeded = false;

  bool get _isDestructive => widget.metadata.name.startsWith('supprimer');

  void _onFieldChanged(String name, dynamic value) {
    if (value == null) {
      _values.remove(name);
    } else {
      _values[name] = value;
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    if (_isDestructive) {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: const Text(AppStrings.confirmerSuppressionTitre),
          content: const Text(AppStrings.confirmerSuppressionMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text(AppStrings.annuler),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: const Text(AppStrings.confirmer),
            ),
          ],
        ),
      );
      if (confirmed != true) return;
    }

    setState(() {
      _loading = true;
      _errorText = null;
      _succeeded = false;
    });

    final repository = ref.read(dashboardRepositoryProvider);
    final result = await repository.runMutation(widget.metadata.name, _values);

    result.match(
      (failure) => setState(() => _errorText = failure.message),
      (_) => setState(() => _succeeded = true),
    );

    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.metadata.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (widget.metadata.fields.isEmpty)
                  const Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Text(
                      'Cette mutation ne nécessite aucun paramètre.',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ...buildDynamicFormFields(widget.metadata.fields, _onFieldChanged),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: _loading ? null : _submit,
                  style: _isDestructive
                      ? ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade600,
                          foregroundColor: Colors.white,
                        )
                      : null,
                  child: _loading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text(AppStrings.soumettre),
                ),
                const SizedBox(height: 16),
                if (_errorText != null)
                  Text(_errorText!, style: const TextStyle(color: Colors.red)),
                if (_succeeded)
                  Row(
                    children: const [
                      Icon(Icons.check_circle, color: Colors.green),
                      SizedBox(width: 8),
                      Text(AppStrings.succes),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
