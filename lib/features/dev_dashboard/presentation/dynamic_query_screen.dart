import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porhe_foncier_app_23072026/core/app_strings.dart';
import 'package:porhe_foncier_app_23072026/core/reference_dropdowns.dart';
import 'package:porhe_foncier_app_23072026/features/dev_dashboard/domain/endpoint_metadata.dart';
import 'package:porhe_foncier_app_23072026/features/dev_dashboard/presentation/dashboard_providers.dart';

/// Builds the widget list for a form's fields, detecting the
/// Commune(+SousPrefecture) pattern and rendering it as ONE
/// [LocationCascadeInput] (Région → Commune → Sous-préfecture) instead
/// of independent dropdowns — so Région is always the first, mandatory
/// step that narrows Commune, which in turn narrows Sous-préfecture.
///
/// If the form ALSO declares a standalone regionRef field (e.g.
/// creerParcelle's regionId, submitted alongside communeId rather than
/// only used to filter it), that field is folded into the same
/// cascade via onRegionSaved so Région is asked once, not twice.
///
/// Every other field type renders via [FieldInput] as before.
List<Widget> buildDynamicFormFields(
  List<FieldSpec> fields,
  void Function(String name, dynamic value) onFieldChanged,
) {
  final widgets = <Widget>[];
  final consumed = <String>{};

  for (final field in fields) {
    if (consumed.contains(field.name)) continue;

    if (field.type == FieldType.communeRef) {
      FieldSpec? sousPrefField;
      FieldSpec? regionField;
      for (final other in fields) {
        if (other.type == FieldType.sousPrefectureRef &&
            !consumed.contains(other.name)) {
          sousPrefField = other;
        }
        if (other.type == FieldType.regionRef && !consumed.contains(other.name)) {
          regionField = other;
        }
      }
      consumed.add(field.name);
      if (sousPrefField != null) consumed.add(sousPrefField.name);
      if (regionField != null) consumed.add(regionField.name);

      widgets.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: LocationCascadeInput(
            onRegionSaved: regionField == null
                ? null
                : (id) => onFieldChanged(regionField!.name, id),
            regionRequired: regionField?.required ?? false,
            communeLabel: field.label,
            communeRequired: field.required,
            onCommuneSaved: (id) => onFieldChanged(field.name, id),
            sousPrefectureLabel: sousPrefField?.label,
            sousPrefectureRequired: sousPrefField?.required ?? false,
            onSousPrefectureSaved: sousPrefField == null
                ? null
                : (id) => onFieldChanged(sousPrefField!.name, id),
          ),
        ),
      );
      continue;
    }

    widgets.add(
      Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: FieldInput(
          field: field,
          onSaved: (value) => onFieldChanged(field.name, value),
        ),
      ),
    );
  }

  return widgets;
}

class DynamicQueryScreen extends ConsumerStatefulWidget {
  const DynamicQueryScreen({super.key, required this.metadata});
  final EndpointMetadata metadata;

  @override
  ConsumerState<DynamicQueryScreen> createState() => _DynamicQueryScreenState();
}

class _DynamicQueryScreenState extends ConsumerState<DynamicQueryScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _values = {};
  bool _loading = false;
  String? _resultText;
  String? _errorText;

  void _onFieldChanged(String name, dynamic value) {
    if (value == null) {
      _values.remove(name);
    } else {
      _values[name] = value;
    }
  }

  Future<void> _execute() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    setState(() {
      _loading = true;
      _resultText = null;
      _errorText = null;
    });

    final repository = ref.read(dashboardRepositoryProvider);
    final result = await repository.runQuery(widget.metadata.name, _values);

    result.match(
      (failure) => setState(() => _errorText = failure.message),
      (data) => setState(
        () => _resultText = const JsonEncoder.withIndent('  ').convert(data),
      ),
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
                      'Cette requête ne nécessite aucun paramètre.',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ...buildDynamicFormFields(widget.metadata.fields, _onFieldChanged),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: _loading ? null : _execute,
                  child: _loading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text(AppStrings.executer),
                ),
                const SizedBox(height: 16),
                if (_errorText != null)
                  Text(_errorText!, style: const TextStyle(color: Colors.red)),
                if (_resultText != null) ...[
                  const Text(
                    AppStrings.resultat,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SelectableText(_resultText!),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Generic field renderer for every field type EXCEPT the
/// Région/Commune/SousPrefecture cascade, which
/// [buildDynamicFormFields] intercepts and renders via
/// [LocationCascadeInput] instead. A standalone `regionRef` field with
/// no accompanying `communeRef` on the same form (e.g.
/// listerCommunesParRegion, where the region itself IS the only
/// submitted value) still renders here as a plain [RegionDropdown].
class FieldInput extends StatefulWidget {
  const FieldInput({super.key, required this.field, required this.onSaved});
  final FieldSpec field;
  final void Function(dynamic value) onSaved;

  @override
  State<FieldInput> createState() => _FieldInputState();
}

class _FieldInputState extends State<FieldInput> {
  DateTime? _pickedDate;
  String? _selectedEnum;
  int? _selectedRefId;
  String? _selectedCountryCode;

  String get _label =>
      widget.field.required ? widget.field.label : '${widget.field.label} (optionnel)';

  @override
  Widget build(BuildContext context) {
    final isRequired = widget.field.required;

    switch (widget.field.type) {
      case FieldType.text:
        return TextFormField(
          decoration: InputDecoration(labelText: _label),
          validator: (v) {
            if (!isRequired) return null;
            return (v == null || v.isEmpty) ? AppStrings.champObligatoire : null;
          },
          onSaved: (v) => widget.onSaved((v == null || v.isEmpty) ? null : v),
        );

      case FieldType.integer:
        return TextFormField(
          decoration: InputDecoration(labelText: _label),
          keyboardType: TextInputType.number,
          validator: (v) {
            if (v == null || v.isEmpty) {
              return isRequired ? AppStrings.champObligatoire : null;
            }
            if (int.tryParse(v) == null) return AppStrings.nombreInvalide;
            return null;
          },
          onSaved: (v) =>
              widget.onSaved((v == null || v.isEmpty) ? null : int.parse(v)),
        );

      case FieldType.decimal:
        return TextFormField(
          decoration: InputDecoration(labelText: _label),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          validator: (v) {
            if (v == null || v.isEmpty) {
              return isRequired ? AppStrings.champObligatoire : null;
            }
            if (double.tryParse(v) == null) return AppStrings.nombreInvalide;
            return null;
          },
          onSaved: (v) =>
              widget.onSaved((v == null || v.isEmpty) ? null : double.parse(v)),
        );

      case FieldType.date:
        return FormField<DateTime>(
          validator: (_) {
            if (!isRequired) return null;
            return _pickedDate == null ? AppStrings.champObligatoire : null;
          },
          onSaved: (_) => widget.onSaved(_pickedDate),
          builder: (state) => InkWell(
            onTap: () async {
              final now = DateTime.now();
              final today = DateTime(now.year, now.month, now.day);
              final firstDate = DateTime(today.year - 100, today.month, today.day);

              final picked = await showDatePicker(
                context: context,
                initialDate: _pickedDate ?? today,
                firstDate: firstDate,
                lastDate: today,
              );
              if (picked != null) {
                setState(() => _pickedDate = picked);
                state.didChange(picked);
              }
            },
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: _label,
                errorText: state.errorText,
                suffixIcon: const Icon(Icons.calendar_today, size: 18),
              ),
              child: Text(
                _pickedDate == null
                    ? AppStrings.selectionnerDate
                    : '${_pickedDate!.year}-${_pickedDate!.month.toString().padLeft(2, '0')}-${_pickedDate!.day.toString().padLeft(2, '0')}',
              ),
            ),
          ),
        );

      case FieldType.enumField:
        return FormField<String>(
          validator: (_) {
            if (!isRequired) return null;
            return _selectedEnum == null ? AppStrings.champObligatoire : null;
          },
          onSaved: (_) => widget.onSaved(_selectedEnum),
          builder: (state) => InputDecorator(
            decoration: InputDecoration(
              labelText: _label,
              errorText: state.errorText,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                value: _selectedEnum,
                hint: const Text('Sélectionner'),
                items: [
                  if (!isRequired)
                    const DropdownMenuItem<String>(
                      value: null,
                      child: Text('(aucun)'),
                    ),
                  ...widget.field.enumValues.map(
                    (value) => DropdownMenuItem(value: value, child: Text(value)),
                  ),
                ],
                onChanged: (value) {
                  setState(() => _selectedEnum = value);
                  state.didChange(value);
                },
              ),
            ),
          ),
        );

      case FieldType.regionRef:
        // Only reached for a STANDALONE region field (no communeRef on
        // the same form) — buildDynamicFormFields intercepts the
        // combined case before this widget is ever built.
        return FormField<int>(
          validator: (_) {
            if (!isRequired) return null;
            return _selectedRefId == null ? AppStrings.champObligatoire : null;
          },
          onSaved: (_) => widget.onSaved(_selectedRefId),
          builder: (state) => RegionDropdown(
            label: _label,
            errorText: state.errorText,
            onChanged: (id) {
              setState(() => _selectedRefId = id);
              state.didChange(id);
            },
          ),
        );

      // Reached only if a communeRef/sousPrefectureRef field somehow
      // wasn't intercepted by buildDynamicFormFields (defensive
      // fallback — should not normally happen).
      case FieldType.communeRef:
        return FormField<int>(
          validator: (_) {
            if (!isRequired) return null;
            return _selectedRefId == null ? AppStrings.champObligatoire : null;
          },
          onSaved: (_) => widget.onSaved(_selectedRefId),
          builder: (state) => CommuneDropdown(
            label: _label,
            errorText: state.errorText,
            onChanged: (id) {
              setState(() => _selectedRefId = id);
              state.didChange(id);
            },
          ),
        );

      case FieldType.sousPrefectureRef:
        return FormField<int>(
          validator: (_) {
            if (!isRequired) return null;
            return _selectedRefId == null ? AppStrings.champObligatoire : null;
          },
          onSaved: (_) => widget.onSaved(_selectedRefId),
          builder: (state) => SousPrefectureDropdown(
            label: _label,
            errorText: state.errorText,
            onChanged: (id) {
              setState(() => _selectedRefId = id);
              state.didChange(id);
            },
          ),
        );

      case FieldType.countryRef:
        return FormField<String>(
          validator: (_) {
            if (!isRequired) return null;
            return _selectedCountryCode == null ? AppStrings.champObligatoire : null;
          },
          onSaved: (_) => widget.onSaved(_selectedCountryCode),
          builder: (state) => CountryDropdown(
            label: _label,
            errorText: state.errorText,
            onChanged: (code) {
              setState(() => _selectedCountryCode = code);
              state.didChange(code);
            },
          ),
        );
    }
  }
}
