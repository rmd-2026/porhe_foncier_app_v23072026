import 'package:flutter/material.dart';
import 'package:porhe_foncier_app_23072026/core/app_strings.dart';
import 'package:porhe_foncier_app_23072026/core/countries_data.dart';
import 'package:porhe_foncier_app_23072026/core/reference_data.dart';

// ==========================================================
// Région / Commune / Sous-préfecture — location cascade
// ==========================================================

/// Searchable dropdown for Region — backed entirely by the static
/// [regionsData] list, never a live query.
class RegionDropdown extends StatelessWidget {
  const RegionDropdown({
    super.key,
    required this.label,
    required this.onChanged,
    this.initialValue,
    this.errorText,
  });

  final String label;
  final int? initialValue;
  final String? errorText;
  final void Function(int? regionId) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownSearchField<RegionData>(
      label: label,
      errorText: errorText,
      items: regionsData,
      initialValue: initialValue == null ? null : findRegion(initialValue!),
      itemLabel: (r) => r.nom,
      onChanged: (r) => onChanged(r?.id),
    );
  }
}

/// Searchable dropdown for Commune, optionally scoped to a parent
/// Region. If [regionId] is null, all communes are offered with their
/// region shown in parentheses for disambiguation.
class CommuneDropdown extends StatelessWidget {
  const CommuneDropdown({
    super.key,
    required this.label,
    required this.onChanged,
    this.regionId,
    this.initialValue,
    this.errorText,
    this.enabled = true,
  });

  final String label;
  final int? regionId;
  final int? initialValue;
  final String? errorText;
  final bool enabled;
  final void Function(int? communeId) onChanged;

  @override
  Widget build(BuildContext context) {
    final items = regionId == null ? communesData : communesForRegion(regionId!);
    return DropdownSearchField<CommuneData>(
      label: label,
      errorText: errorText,
      items: enabled ? items : const [],
      initialValue: initialValue == null ? null : findCommune(initialValue!),
      itemLabel: (c) => regionId == null ? communeLabelWithRegion(c) : c.nom,
      onChanged: (c) => onChanged(c?.id),
      disabledHint: enabled ? null : 'Sélectionnez d\'abord une région',
    );
  }
}

/// Searchable dropdown for SousPrefecture, optionally scoped to a
/// parent Commune. If [communeId] is null, all sous-préfectures are
/// offered with their commune shown in parentheses.
class SousPrefectureDropdown extends StatelessWidget {
  const SousPrefectureDropdown({
    super.key,
    required this.label,
    required this.onChanged,
    this.communeId,
    this.initialValue,
    this.errorText,
    this.enabled = true,
  });

  final String label;
  final int? communeId;
  final int? initialValue;
  final String? errorText;
  final bool enabled;
  final void Function(int? sousPrefectureId) onChanged;

  @override
  Widget build(BuildContext context) {
    final items =
        communeId == null ? sousPrefecturesData : sousPrefecturesForCommune(communeId!);
    return DropdownSearchField<SousPrefectureData>(
      label: label,
      errorText: errorText,
      items: enabled ? items : const [],
      initialValue: initialValue == null ? null : findSousPrefecture(initialValue!),
      itemLabel: (s) => communeId == null ? sousPrefectureLabelWithCommune(s) : s.nom,
      onChanged: (s) => onChanged(s?.id),
      disabledHint: enabled ? null : 'Sélectionnez d\'abord une commune',
    );
  }
}

/// The real cascading selector: Région (always shown first) → Commune
/// (filtered to the chosen région, disabled until one is picked) →
/// Sous-préfecture (filtered to the chosen commune, disabled until one
/// is picked — only rendered if [sousPrefectureLabel] is non-null).
///
/// Région is never itself a submitted value — it exists purely to
/// narrow the Commune list, matching the schema (Parcelle stores
/// regionId AND communeId separately; UtilisateurRole etc. store only
/// communeId — this widget always narrows Commune via région and only
/// separately reports regionId if the caller opts in via
/// [onRegionSaved]).
class LocationCascadeInput extends StatefulWidget {
  const LocationCascadeInput({
    super.key,
    this.onRegionSaved,
    this.regionRequired = false,
    this.initialRegionId,
    this.communeLabel,
    this.communeRequired = true,
    this.onCommuneSaved,
    this.initialCommuneId,
    this.sousPrefectureLabel,
    this.sousPrefectureRequired = false,
    this.onSousPrefectureSaved,
    this.initialSousPrefectureId,
  });

  final void Function(int? regionId)? onRegionSaved;
  final bool regionRequired;
  final int? initialRegionId;

  final String? communeLabel;
  final bool communeRequired;
  final void Function(int? communeId)? onCommuneSaved;
  final int? initialCommuneId;

  final String? sousPrefectureLabel;
  final bool sousPrefectureRequired;
  final void Function(int? sousPrefectureId)? onSousPrefectureSaved;
  final int? initialSousPrefectureId;

  @override
  State<LocationCascadeInput> createState() => _LocationCascadeInputState();
}

class _LocationCascadeInputState extends State<LocationCascadeInput> {
  int? _regionId;
  int? _communeId;
  int? _sousPrefectureId;

  @override
  void initState() {
    super.initState();
    // Pre-fill the cascade from an initial sous-préfecture/commune id
    // (e.g. when editing an existing record) so Région/Commune are
    // derived and shown correctly rather than starting blank.
    if (widget.initialSousPrefectureId != null) {
      final sp = findSousPrefecture(widget.initialSousPrefectureId!);
      _sousPrefectureId = widget.initialSousPrefectureId;
      if (sp != null) {
        _communeId = sp.communeId;
        final commune = findCommune(sp.communeId);
        _regionId = commune?.regionId;
      }
    } else if (widget.initialCommuneId != null) {
      _communeId = widget.initialCommuneId;
      final commune = findCommune(widget.initialCommuneId!);
      _regionId = commune?.regionId;
    } else if (widget.initialRegionId != null) {
      _regionId = widget.initialRegionId;
    }
  }

  @override
  Widget build(BuildContext context) {
    final showCommune = widget.communeLabel != null;
    final showSousPrefecture = widget.sousPrefectureLabel != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FormField<int>(
          initialValue: _regionId,
          validator: (_) {
            if (!widget.regionRequired) return null;
            return _regionId == null ? AppStrings.champObligatoire : null;
          },
          onSaved: (_) => widget.onRegionSaved?.call(_regionId),
          builder: (state) => RegionDropdown(
            label: 'Région',
            initialValue: _regionId,
            errorText: state.errorText,
            onChanged: (id) {
              setState(() {
                _regionId = id;
                _communeId = null;
                _sousPrefectureId = null;
              });
              state.didChange(id);
              widget.onCommuneSaved?.call(null);
              widget.onSousPrefectureSaved?.call(null);
            },
          ),
        ),
        if (showCommune) ...[
          const SizedBox(height: 12),
          FormField<int>(
            initialValue: _communeId,
            validator: (_) {
              if (!widget.communeRequired) return null;
              return _communeId == null ? AppStrings.champObligatoire : null;
            },
            onSaved: (_) => widget.onCommuneSaved?.call(_communeId),
            builder: (state) => CommuneDropdown(
              label: widget.communeLabel!,
              regionId: _regionId,
              enabled: _regionId != null,
              initialValue: _communeId,
              errorText: state.errorText,
              onChanged: (id) {
                setState(() {
                  _communeId = id;
                  _sousPrefectureId = null;
                });
                state.didChange(id);
                widget.onSousPrefectureSaved?.call(null);
              },
            ),
          ),
        ],
        if (showSousPrefecture) ...[
          const SizedBox(height: 12),
          FormField<int>(
            initialValue: _sousPrefectureId,
            validator: (_) {
              if (!widget.sousPrefectureRequired) return null;
              return _sousPrefectureId == null ? AppStrings.champObligatoire : null;
            },
            onSaved: (_) => widget.onSousPrefectureSaved?.call(_sousPrefectureId),
            builder: (state) => SousPrefectureDropdown(
              label: widget.sousPrefectureLabel!,
              communeId: _communeId,
              enabled: _communeId != null,
              initialValue: _sousPrefectureId,
              errorText: state.errorText,
              onChanged: (id) {
                setState(() => _sousPrefectureId = id);
                state.didChange(id);
              },
            ),
          ),
        ],
      ],
    );
  }
}

// ==========================================================
// Nationalité — unrelated to the location cascade above; kept
// separate on purpose, no relationship to Région/Commune/SousPref.
// ==========================================================

/// Searchable dropdown for nationalité — backed by the static
/// [countriesData] list, never a live query.
class CountryDropdown extends StatelessWidget {
  const CountryDropdown({
    super.key,
    required this.label,
    required this.onChanged,
    this.initialValue,
    this.errorText,
  });

  final String label;
  final String? initialValue;
  final String? errorText;
  final void Function(String? countryCode) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownSearchField<CountryData>(
      label: label,
      errorText: errorText,
      items: countriesData,
      initialValue: initialValue == null ? null : findCountry(initialValue!),
      itemLabel: (c) => c.nom,
      onChanged: (c) => onChanged(c?.code),
    );
  }
}

// ==========================================================
// Generic search engine — shared by every dropdown above
// ==========================================================

/// Generic searchable dropdown: tapping opens a full-screen search list
/// (better for 349 sous-préfectures or 180+ countries than a scrolling
/// inline dropdown), filters as you type, and returns the selected item.
class DropdownSearchField<T> extends StatefulWidget {
  const DropdownSearchField({
    super.key,
    required this.label,
    required this.items,
    required this.itemLabel,
    required this.onChanged,
    this.initialValue,
    this.errorText,
    this.disabledHint,
  });

  final String label;
  final List<T> items;
  final String Function(T item) itemLabel;
  final void Function(T? item) onChanged;
  final T? initialValue;
  final String? errorText;
  final String? disabledHint;

  @override
  State<DropdownSearchField<T>> createState() => _DropdownSearchFieldState<T>();
}

class _DropdownSearchFieldState<T> extends State<DropdownSearchField<T>> {
  T? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialValue;
  }

  @override
  void didUpdateWidget(covariant DropdownSearchField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Parent (e.g. LocationCascadeInput) may reset the selection when
    // an upstream field changes — stay in sync on rebuild.
    if (widget.initialValue != oldWidget.initialValue) {
      _selected = widget.initialValue;
    }
  }

  Future<void> _openSearch() async {
    final result = await showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      builder: (context) => _SearchSheet<T>(
        items: widget.items,
        itemLabel: widget.itemLabel,
      ),
    );
    if (result != null) {
      setState(() => _selected = result);
      widget.onChanged(result);
    }
  }

  bool get _isDisabled => widget.disabledHint != null;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (_isDisabled || widget.items.isEmpty) ? null : _openSearch,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: widget.label,
          errorText: widget.errorText,
          suffixIcon: const Icon(Icons.arrow_drop_down),
        ),
        child: Text(
          _isDisabled
              ? widget.disabledHint!
              : (_selected == null
                  ? (widget.items.isEmpty ? 'Aucune option disponible' : 'Sélectionner')
                  : widget.itemLabel(_selected as T)),
          style: (_isDisabled || _selected == null)
              ? TextStyle(color: Theme.of(context).hintColor)
              : null,
        ),
      ),
    );
  }
}

class _SearchSheet<T> extends StatefulWidget {
  const _SearchSheet({required this.items, required this.itemLabel});
  final List<T> items;
  final String Function(T item) itemLabel;

  @override
  State<_SearchSheet<T>> createState() => _SearchSheetState<T>();
}

class _SearchSheetState<T> extends State<_SearchSheet<T>> {
  final _searchController = TextEditingController();
  late List<T> _filtered;

  @override
  void initState() {
    super.initState();
    _filtered = widget.items;
  }

  void _filter(String query) {
    setState(() {
      _filtered = query.isEmpty
          ? widget.items
          : widget.items
              .where((item) => widget
                  .itemLabel(item)
                  .toLowerCase()
                  .contains(query.toLowerCase()))
              .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _searchController,
              autofocus: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Rechercher...',
              ),
              onChanged: _filter,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: _filtered.isEmpty
                  ? const Center(child: Text('Aucun résultat'))
                  : ListView.builder(
                      controller: scrollController,
                      itemCount: _filtered.length,
                      itemBuilder: (context, index) {
                        final item = _filtered[index];
                        return ListTile(
                          title: Text(widget.itemLabel(item)),
                          onTap: () => Navigator.of(context).pop(item),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
