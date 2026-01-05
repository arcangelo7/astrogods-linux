import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../models/birth_chart.dart';
import '../services/birth_chart_service.dart';
import '../services/api_client.dart';
import '../utils/session_utils.dart';
import '../l10n/app_localizations.dart';
import '../constants/text_styles.dart';
import 'gradient_button.dart';
import 'create_birth_chart_dialog.dart';
import 'empty_state_widget.dart';

class BirthChartSelector extends StatefulWidget {
  final String? labelText;
  final BirthChart? selectedChart;
  final Function(BirthChart?)? onChanged;
  final String? Function(BirthChart?) validator;
  final bool allowNull;
  final List<int> excludeChartIds;
  final bool autoSelectPersonal;
  final bool showCreateButton;

  const BirthChartSelector({
    super.key,
    this.labelText,
    this.selectedChart,
    this.onChanged,
    required this.validator,
    this.allowNull = true,
    this.excludeChartIds = const [],
    this.autoSelectPersonal = false,
    this.showCreateButton = true,
  });

  @override
  State<BirthChartSelector> createState() => _BirthChartSelectorState();
}

class _BirthChartSelectorState extends State<BirthChartSelector> {
  late final BirthChartService _birthChartService;
  List<BirthChart> _savedCharts = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _birthChartService = BirthChartService(context: context);
    _loadSavedCharts();
  }

  @override
  void didUpdateWidget(BirthChartSelector oldWidget) {
    super.didUpdateWidget(oldWidget);

    // If excludeChartIds changed, re-filter the saved charts
    if (oldWidget.excludeChartIds != widget.excludeChartIds) {
      setState(() {
        _filterSavedCharts();
      });
    }
  }

  @override
  void dispose() {
    _birthChartService.dispose();
    super.dispose();
  }

  List<BirthChart> _allCharts = [];

  Future<void> _loadSavedCharts() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final charts = await _birthChartService.getSavedCharts();
      if (mounted) {
        setState(() {
          _allCharts = charts;
          _filterSavedCharts();
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        final apiException = e as ApiException;
        if (!SessionUtils.handleSessionExpiration(context, apiException)) {
          setState(() {
            _error = apiException.message.isNotEmpty
                ? apiException.message
                : AppLocalizations.of(context)!.errorLoadingSavedCharts;
            _isLoading = false;
          });
        }
      }
    }
  }

  void _filterSavedCharts() {
    _savedCharts = _allCharts
        .where((chart) => !widget.excludeChartIds.contains(chart.id))
        .toList();
  }

  Future<void> _showCreateDialog() async {
    if (!widget.showCreateButton) return;

    await showDialog<void>(
      context: context,
      builder: (context) => CreateBirthChartDialog(
        onCreated: (newChart) {
          // Add the new chart to the list and select it
          setState(() {
            _allCharts.add(newChart);
            _filterSavedCharts();
          });
          // Auto-select the newly created chart
          widget.onChanged?.call(newChart);
        },
      ),
    );
  }

  Widget _buildErrorState() {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          _error!,
          style: AppTextStyles.getBodyStyle(
            context,
          ).copyWith(color: Theme.of(context).colorScheme.error),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        ElevatedButton(onPressed: _loadSavedCharts, child: Text(l10n.retry)),
      ],
    );
  }

  Widget _buildEmptyState() {
    final l10n = AppLocalizations.of(context)!;

    return EmptyStateWidget(
      icon: Icons.person_add_outlined,
      title: l10n.noSavedCharts,
      description: l10n.noSavedChartsDescription,
      compact: true,
      primaryAction: GradientButton(
        text: l10n.createBirthChart,
        onPressed: widget.showCreateButton
            ? _showCreateDialog
            : () => context.go('/personality'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (_isLoading) {
      return const SizedBox(
        height: 60,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null) {
      return _buildErrorState();
    }

    if (_savedCharts.isEmpty) {
      return _buildEmptyState();
    }

    // Sort charts: personal first, then most recent, then alphabetically
    final sortedCharts = List<BirthChart>.from(_savedCharts);
    sortedCharts.sort((a, b) {
      // Personal charts first
      final aIsPersonal = a.isPersonal ?? false;
      final bIsPersonal = b.isPersonal ?? false;
      if (aIsPersonal != bIsPersonal) {
        return bIsPersonal ? 1 : -1;
      }

      // Then by creation date (most recent first)
      final dateComparison = (b.createdOn ?? DateTime.now()).compareTo(
        a.createdOn ?? DateTime.now(),
      );
      if (dateComparison != 0) return dateComparison;

      // Finally alphabetically
      return a.fullName.compareTo(b.fullName);
    });

    // Auto-select personal chart if requested and no chart is selected
    if (widget.autoSelectPersonal &&
        widget.selectedChart == null &&
        sortedCharts.isNotEmpty) {
      // Find available charts (not in exclude list)
      final availableCharts = sortedCharts
          .where((chart) => !widget.excludeChartIds.contains(chart.id))
          .toList();

      if (availableCharts.isNotEmpty) {
        final personalChart = availableCharts.firstWhere(
          (chart) => chart.isPersonal == true,
          orElse: () => availableCharts.first,
        );

        // Call the callback to set the selected chart
        WidgetsBinding.instance.addPostFrameCallback((_) {
          widget.onChanged?.call(personalChart);
        });
      }
    }

    final dropdown = FormField<BirthChart>(
      initialValue: widget.selectedChart,
      validator: widget.validator,
      builder: (FormFieldState<BirthChart> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownSearch<BirthChart>(
              items: (filter, loadProps) => sortedCharts,
              selectedItem: widget.selectedChart,
              onChanged: (chart) {
                field.didChange(chart);
                widget.onChanged?.call(chart);
              },
              itemAsString: (chart) => chart.fullName,
              compareFn: (chart1, chart2) => chart1.id == chart2.id,
              filterFn: (item, filter) {
                final query = filter.toLowerCase();
                final fullName = item.fullName.toLowerCase();
                final givenName = item.givenName.toLowerCase();
                final familyName = item.familyName.toLowerCase();
                final place = (item.place ?? '').toLowerCase();

                return fullName.contains(query) ||
                    givenName.contains(query) ||
                    familyName.contains(query) ||
                    place.contains(query);
              },
              popupProps: PopupProps.menu(
                showSearchBox: true,
                searchFieldProps: TextFieldProps(
                  decoration: InputDecoration(
                    hintText: l10n.searchByNameOrPlace,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Theme.of(
                          context,
                        ).colorScheme.outline.withValues(alpha: 0.5),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    filled: true,
                    fillColor: Theme.of(context)
                        .colorScheme
                        .surfaceContainerHighest
                        .withValues(alpha: 0.3),
                  ),
                  style: AppTextStyles.getBodyStyle(context),
                ),
                searchDelay: const Duration(milliseconds: 300),
                showSelectedItems: true,
                menuProps: MenuProps(
                  elevation: 8,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  shadowColor: Theme.of(
                    context,
                  ).colorScheme.shadow.withValues(alpha: 0.1),
                ),
                itemBuilder: _buildDropdownItem,
                loadingBuilder: (context, searchEntry) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                        const SizedBox(width: 12),
                        Text(l10n.searchInProgress),
                      ],
                    ),
                  ),
                ),
                emptyBuilder: (context, searchEntry) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 32,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.4),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l10n.noResultsFound,
                          style: AppTextStyles.getBodyStyle(context).copyWith(
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                        ),
                        if (searchEntry.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            l10n.forSearchTerm(searchEntry),
                            style: AppTextStyles.getCaptionStyle(context)
                                .copyWith(
                                  color: Theme.of(context).colorScheme.onSurface
                                      .withValues(alpha: 0.5),
                                ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
              decoratorProps: DropDownDecoratorProps(
                decoration: InputDecoration(
                  labelText: widget.labelText ?? l10n.selectChart,
                  labelStyle: AppTextStyles.getFormLabelStyle(context),
                  floatingLabelStyle: AppTextStyles.getFloatingLabelStyle(
                    context,
                  ),
                  errorText: field.errorText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: field.hasError
                          ? Theme.of(context).colorScheme.error
                          : Theme.of(
                              context,
                            ).colorScheme.outline.withValues(alpha: 0.5),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: field.hasError
                          ? Theme.of(context).colorScheme.error
                          : Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  filled: true,
                  fillColor: Theme.of(
                    context,
                  ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                ),
              ),
            ),
          ],
        );
      },
    );

    // Return dropdown with optional create button
    if (widget.showCreateButton && sortedCharts.isNotEmpty) {
      return Row(
        children: [
          Expanded(child: dropdown),
          const SizedBox(width: 8),
          SizedBox(
            height: 48, // Match actual dropdown height
            child: ElevatedButton(
              onPressed: _showCreateDialog,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                elevation: 2,
                shadowColor: Theme.of(
                  context,
                ).colorScheme.shadow.withValues(alpha: 0.3),
              ),
              child: Icon(
                Icons.add,
                size: 20,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      );
    }

    return dropdown;
  }

  Widget _buildDropdownItem(
    BuildContext context,
    BirthChart chart,
    bool isSelected,
    bool isHighlighted,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isHighlighted
            ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            chart.fullName,
            style: AppTextStyles.getBodyStyle(context).copyWith(
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: isSelected ? Theme.of(context).colorScheme.primary : null,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: Text(
                  chart.place ?? '',
                  style: AppTextStyles.getCaptionStyle(context).copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${chart.date.day}/${chart.date.month}/${chart.date.year}',
                style: AppTextStyles.getCaptionStyle(context).copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
