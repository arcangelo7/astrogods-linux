import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../widgets/accent_icon.dart';
import '../widgets/starry_night_background.dart';
import '../constants/text_styles.dart';
import '../l10n/app_localizations.dart';
import '../models/birth_chart.dart';
import '../models/synastry.dart';
import '../services/birth_chart_service.dart';
import '../services/synastry_service.dart';
import '../services/reading_state_service.dart';
import '../services/api_client.dart';
import '../utils/snackbar_utils.dart';
import '../utils/session_utils.dart';
import '../utils/date_utils.dart' as date_utils;
import '../providers/auth_provider.dart';
import '../widgets/edit_birth_chart_dialog.dart';

enum AnalysisType { birthChart, synastry }

abstract class AnalysisItem {
  int get id;
  String get title;
  DateTime get sortDate;
  bool? get hasReading;
  bool? get readingOutdated;
  AnalysisType get type;
  String? get subtitle;
}

class BirthChartAnalysisItem implements AnalysisItem {
  final BirthChart birthChart;

  BirthChartAnalysisItem(this.birthChart);

  @override
  int get id => birthChart.id;

  @override
  String get title => birthChart.fullName;

  @override
  DateTime get sortDate => birthChart.createdOn ?? birthChart.date;

  @override
  bool? get hasReading => birthChart.hasReading;

  @override
  bool? get readingOutdated => birthChart.readingOutdated;

  @override
  AnalysisType get type => AnalysisType.birthChart;

  @override
  String? get subtitle => birthChart.place;

  bool? get isPersonal => birthChart.isPersonal;
}

class SynastryAnalysisItem implements AnalysisItem {
  final Synastry synastry;

  SynastryAnalysisItem(this.synastry);

  @override
  int get id => synastry.id;

  @override
  String get title => synastry.relationshipTitle;

  @override
  DateTime get sortDate => synastry.createdOn;

  @override
  bool? get hasReading => synastry.hasReading;

  @override
  bool? get readingOutdated => synastry.readingOutdated;

  @override
  AnalysisType get type => AnalysisType.synastry;

  @override
  String? get subtitle => null;
}

class SavedChartsScreen extends StatefulWidget {
  const SavedChartsScreen({super.key});

  @override
  State<SavedChartsScreen> createState() => _SavedChartsScreenState();
}

class _SavedChartsScreenState extends State<SavedChartsScreen> {
  late final BirthChartService _birthChartService;
  late final SynastryService _synastryService;
  late final ReadingStateService _readingStateService;
  List<AnalysisItem> _savedAnalyses = [];
  List<AnalysisItem> _filteredAnalyses = [];
  bool _isLoading = true;
  String? _error;
  final TextEditingController _searchController = TextEditingController();
  AnalysisType? _selectedFilter;
  final Set<String> _deletingItems = {};
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _birthChartService = BirthChartService(context: context);
    _synastryService = SynastryService(context: context);
    _readingStateService = ReadingStateService();
    _readingStateService.readingCompletedNotifier.addListener(_onReadingCompleted);
    _loadSavedAnalyses();
  }

  void _onReadingCompleted() {
    _loadSavedAnalyses();
  }

  @override
  void dispose() {
    _readingStateService.readingCompletedNotifier.removeListener(_onReadingCompleted);
    _debounceTimer?.cancel();
    _searchController.dispose();
    _birthChartService.dispose();
    _synastryService.dispose();
    super.dispose();
  }

  void _debouncedFilter() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), _applyFilters);
  }

  Future<void> _loadSavedAnalyses() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final List<AnalysisItem> analyses = [];

      // Load birth charts
      final charts = await _birthChartService.getSavedCharts();
      analyses.addAll(charts.map((chart) => BirthChartAnalysisItem(chart)));

      // Load synastries
      final synastries = await _synastryService.getSavedSynastries();
      analyses.addAll(
        synastries.map((synastry) => SynastryAnalysisItem(synastry)),
      );

      if (mounted) {
        // Sort analyses: personal birth charts first, then by date
        analyses.sort((a, b) {
          // Personal birth chart always comes first
          if (a is BirthChartAnalysisItem &&
              a.isPersonal == true &&
              (b is! BirthChartAnalysisItem || b.isPersonal != true)) {
            return -1;
          }
          if (b is BirthChartAnalysisItem &&
              b.isPersonal == true &&
              (a is! BirthChartAnalysisItem || a.isPersonal != true)) {
            return 1;
          }
          // Otherwise sort by date (most recent first)
          return b.sortDate.compareTo(a.sortDate);
        });
        setState(() {
          _savedAnalyses = analyses;
          _filteredAnalyses = analyses;
          _isLoading = false;
        });
        _applyFilters();
      }
    } on ApiException catch (e) {
      if (mounted) {
        SessionUtils.handleApiException(
          context,
          e,
          (message) => setState(() {
            _error = message;
            _isLoading = false;
          }),
        );
      }
    }
  }

  Future<void> _removeAnalysis(AnalysisItem analysis) async {
    final l10n = AppLocalizations.of(context)!;
    final itemKey = '${analysis.type.name}_${analysis.id}';

    if (mounted) {
      setState(() {
        _deletingItems.add(itemKey);
      });
    }

    try {
      if (analysis is BirthChartAnalysisItem) {
        await _birthChartService.deleteBirthChart(analysis.id);
      } else if (analysis is SynastryAnalysisItem) {
        await _synastryService.deleteSynastry(analysis.id);
      }

      if (mounted) {
        setState(() {
          _deletingItems.remove(itemKey);
          _savedAnalyses.removeWhere(
            (a) => a.id == analysis.id && a.type == analysis.type,
          );
          _filteredAnalyses.removeWhere(
            (a) => a.id == analysis.id && a.type == analysis.type,
          );
        });
        final successMessage = analysis is BirthChartAnalysisItem
            ? l10n.chartRemovedFromSaved
            : l10n.synastryRemovedFromSaved;
        SnackbarUtils.showSuccess(context, successMessage);
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _deletingItems.remove(itemKey);
        });
        if (e is ApiException) {
          SessionUtils.handleApiException(
            context,
            e,
            (message) => SnackbarUtils.showError(context, message),
          );
        } else {
          SnackbarUtils.showError(
            context,
            'Errore durante la rimozione dell\'analisi',
          );
        }
      }
    }
  }

  Future<void> _setPersonalChart(BirthChartAnalysisItem chartAnalysis) async {
    final l10n = AppLocalizations.of(context)!;
    try {
      final updatedChart = await _birthChartService.setPersonalChart(
        chartAnalysis.id,
        isPersonal: !(chartAnalysis.isPersonal ?? false),
      );

      // If chart was set as personal, refresh user data to update profile
      if (updatedChart.isPersonal == true && mounted) {
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        await authProvider.refreshUserData();
      }

      if (mounted) {
        setState(() {
          final index = _savedAnalyses.indexWhere(
            (a) => a is BirthChartAnalysisItem && a.id == chartAnalysis.id,
          );
          if (index != -1) {
            _savedAnalyses[index] = BirthChartAnalysisItem(updatedChart);
          }
          // Remove personal flag from other charts if this one was set as personal
          if (updatedChart.isPersonal == true) {
            for (int i = 0; i < _savedAnalyses.length; i++) {
              if (_savedAnalyses[i] is BirthChartAnalysisItem) {
                final chartItem = _savedAnalyses[i] as BirthChartAnalysisItem;
                if (chartItem.id != chartAnalysis.id &&
                    chartItem.isPersonal == true) {
                  final updatedBirthChart = chartItem.birthChart.copyWith(
                    isPersonal: false,
                  );
                  _savedAnalyses[i] = BirthChartAnalysisItem(updatedBirthChart);
                }
              }
            }
          }
        });
        _applyFilters();
        SnackbarUtils.showSuccess(
          context,
          updatedChart.isPersonal == true
              ? l10n.chartSetAsPersonal
              : l10n.chartRemovedFromPersonal,
        );
      }
    } catch (e) {
      if (mounted) {
        if (e is ApiException) {
          SessionUtils.handleApiException(
            context,
            e,
            (message) => SnackbarUtils.showError(context, message),
          );
        } else {
          SnackbarUtils.showError(
            context,
            'Errore durante l\'aggiornamento del tema',
          );
        }
      }
    }
  }

  void _navigateToReading(AnalysisItem analysis) {
    if (analysis is BirthChartAnalysisItem) {
      context.push(
        '/birth-chart-reading/${analysis.id}',
        extra: {'birthChart': analysis.birthChart.toJson()},
      );
    } else if (analysis is SynastryAnalysisItem) {
      context.push(
        '/synastry/${analysis.id}',
        extra: {'synastry': analysis.synastry.toJson()},
      );
    }
  }

  void _navigateToChartOnly(AnalysisItem analysis) {
    if (analysis is BirthChartAnalysisItem) {
      context.push(
        '/birth-chart-reading/${analysis.id}',
        extra: {'birthChart': analysis.birthChart.toJson(), 'chartOnly': true},
      );
    } else if (analysis is SynastryAnalysisItem) {
      context.push(
        '/synastry/${analysis.id}',
        extra: {'synastry': analysis.synastry.toJson(), 'chartOnly': true},
      );
    }
  }

  void _showAnalysisActions(AnalysisItem analysis) {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            Text(analysis.title, style: AppTextStyles.getH6Style(context)),
            const SizedBox(height: 20),
            _ActionTile(
              icon: analysis.readingOutdated == true
                  ? Icons.refresh
                  : (analysis.hasReading == true
                        ? Icons.auto_stories
                        : Icons.auto_awesome),
              title: analysis.readingOutdated == true
                  ? l10n.regenerateReading
                  : (analysis.hasReading == true
                        ? l10n.viewReading
                        : l10n.generateReading),
              onTap: () {
                Navigator.pop(context);
                _navigateToReading(analysis);
              },
            ),
            _ActionTile(
              icon: Icons.pie_chart_outline,
              title: l10n.viewChart,
              onTap: () {
                Navigator.pop(context);
                _navigateToChartOnly(analysis);
              },
            ),
            // Only show personal chart options for birth charts
            if (analysis is BirthChartAnalysisItem) ...[
              _ActionTile(
                icon: analysis.isPersonal == true
                    ? Icons.person_remove
                    : Icons.person_add,
                title: analysis.isPersonal == true
                    ? l10n.removeFromPersonal
                    : l10n.setAsPersonal,
                onTap: () {
                  Navigator.pop(context);
                  _setPersonalChart(analysis);
                },
              ),
            ],
            if (analysis is BirthChartAnalysisItem)
              _ActionTile(
                icon: Icons.edit,
                title: l10n.edit,
                onTap: () {
                  Navigator.pop(context);
                  _showEditDialog(analysis);
                },
              ),
            _ActionTile(
              icon: Icons.delete,
              title: l10n.removeFromSaved,
              isDestructive: true,
              onTap: () {
                Navigator.pop(context);
                final itemKey = '${analysis.type.name}_${analysis.id}';
                final isDeleting = _deletingItems.contains(itemKey);
                if (!isDeleting) {
                  _showDeleteConfirmation(analysis);
                }
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void _applyFilters() {
    if (!mounted) return;

    final query = _searchController.text.toLowerCase().trim();

    setState(() {
      _filteredAnalyses = _savedAnalyses.where((analysis) {
        // Filter by type if selected
        if (_selectedFilter != null && analysis.type != _selectedFilter) {
          return false;
        }

        // Filter by search query
        if (query.isEmpty) return true;

        final matchesTitle = analysis.title.toLowerCase().contains(query);
        final matchesSubtitle =
            analysis.subtitle?.toLowerCase().contains(query) ?? false;

        return matchesTitle || matchesSubtitle;
      }).toList();
    });
  }

  String _getSubtitleText(AppLocalizations l10n, int count) {
    if (_selectedFilter == AnalysisType.birthChart) {
      return count == 1
          ? l10n.birthChartsCountSingular
          : l10n.birthChartsCountPlural(count);
    } else if (_selectedFilter == AnalysisType.synastry) {
      return count == 1
          ? l10n.synastriesCountSingular
          : l10n.synastriesCountPlural(count);
    } else {
      return count == 1
          ? l10n.chartsCountSingular
          : l10n.chartsCountPlural(count);
    }
  }

  String _getSearchPlaceholder(AppLocalizations l10n) {
    if (_selectedFilter == AnalysisType.birthChart) {
      return l10n.searchBirthCharts;
    } else if (_selectedFilter == AnalysisType.synastry) {
      return l10n.searchSynastries;
    } else {
      return l10n.searchCharts;
    }
  }

  Widget _buildSearchSection(AppLocalizations l10n, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Filter chips
          Row(
            children: [
              FilterChip(
                label: Text('Tutti'),
                selected: _selectedFilter == null,
                onSelected: (selected) {
                  setState(() {
                    _selectedFilter = null;
                  });
                  _applyFilters();
                },
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: Text('Temi natali'),
                selected: _selectedFilter == AnalysisType.birthChart,
                onSelected: (selected) {
                  setState(() {
                    _selectedFilter = selected ? AnalysisType.birthChart : null;
                  });
                  _applyFilters();
                },
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: Text('Sinastrie'),
                selected: _selectedFilter == AnalysisType.synastry,
                onSelected: (selected) {
                  setState(() {
                    _selectedFilter = selected ? AnalysisType.synastry : null;
                  });
                  _applyFilters();
                },
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Simple search
          TextField(
            controller: _searchController,
            onChanged: (value) => _debouncedFilter(),
            style: AppTextStyles.getBodyStyle(context),
            decoration: InputDecoration(
              hintText: _getSearchPlaceholder(l10n),
              hintStyle: AppTextStyles.getCaptionStyle(context),
              prefixIcon: Icon(
                Icons.search,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        _searchController.clear();
                        _applyFilters();
                      },
                      icon: Icon(
                        Icons.clear,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    )
                  : null,
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(AnalysisItem analysis) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          final itemKey = '${analysis.type.name}_${analysis.id}';
          final isDeleting = _deletingItems.contains(itemKey);

          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.surface,
            title: Text(
              l10n.removeChart,
              style: AppTextStyles.getH6Style(context),
            ),
            content: Text(
              l10n.removeChartConfirmation(analysis.title),
              style: AppTextStyles.getBodyStyle(context),
            ),
            actions: [
              TextButton(
                onPressed: isDeleting ? null : () => Navigator.pop(context),
                child: Text(
                  l10n.cancel,
                  style: TextStyle(
                    color: isDeleting
                        ? Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.4)
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              TextButton(
                onPressed: isDeleting
                    ? null
                    : () {
                        Navigator.pop(context);
                        _removeAnalysis(analysis);
                      },
                child: isDeleting
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(
                                  context,
                                ).colorScheme.error.withValues(alpha: 0.6),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            l10n.remove,
                            style: TextStyle(
                              color: Theme.of(
                                context,
                              ).colorScheme.error.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      )
                    : Text(
                        l10n.remove,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showEditDialog(AnalysisItem analysis) {
    if (analysis is BirthChartAnalysisItem) {
      _showEditBirthChartDialog(analysis.birthChart);
    }
  }

  void _showEditBirthChartDialog(BirthChart birthChart) {
    showDialog(
      context: context,
      builder: (context) => EditBirthChartDialog(
        birthChart: birthChart,
        onUpdated: () {
          // Refresh the list after update
          _loadSavedAnalyses();
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: StarryNightBackground(
        showPlanet: false,
        subtle: true,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    if (GoRouter.of(context).canPop()) {
                      context.pop();
                    } else {
                      context.go('/');
                    }
                  },
                ),
                title: Text(l10n.savedChartsTitle),
              ),
              // Header
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const AccentIcon(icon: Icons.bookmark, useSecondary: true),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.savedChartsTitle,
                            style: AppTextStyles.getH4Style(context),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _getSubtitleText(l10n, _filteredAnalyses.length),
                            style: AppTextStyles.getCaptionStyle(context),
                          ),
                        ],
                      ),
                    ),
                    if (!_isLoading)
                      IconButton(
                        onPressed: _loadSavedAnalyses,
                        icon: Icon(
                          Icons.refresh,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                  ],
                ),
              ),

              // Search
              _buildSearchSection(l10n, isDark),

              // Content
              Expanded(child: _buildContent(l10n, isDark)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(AppLocalizations l10n, bool isDark) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AccentIcon(icon: Icons.error_outline, useSecondary: false),
              const SizedBox(height: 20),
              Text(
                l10n.errorLoadingSavedCharts,
                style: AppTextStyles.getH6Style(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _loadSavedAnalyses,
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      );
    }

    if (_filteredAnalyses.isEmpty) {
      // Determine message based on selected filter
      String title;
      String description;
      IconData iconData;

      if (_selectedFilter == AnalysisType.birthChart) {
        title = l10n.noSavedBirthCharts;
        description = l10n.noSavedBirthChartsDescription;
        iconData = Icons.person;
      } else if (_selectedFilter == AnalysisType.synastry) {
        title = l10n.noSavedSynastries;
        description = l10n.noSavedSynastriesDescription;
        iconData = Icons.favorite;
      } else {
        title = l10n.noSavedAnalyses;
        description = l10n.noSavedAnalysesDescription;
        iconData = Icons.bookmark_border;
      }

      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AccentIcon(icon: iconData, useSecondary: true),
              const SizedBox(height: 20),
              Text(
                title,
                style: AppTextStyles.getH6Style(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: AppTextStyles.getBodyStyle(context),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: _filteredAnalyses.length,
      itemBuilder: (context, index) {
        final analysis = _filteredAnalyses[index];
        final itemKey = '${analysis.type.name}_${analysis.id}';
        final isDeleting = _deletingItems.contains(itemKey);
        return Padding(
          key: ValueKey(itemKey),
          padding: const EdgeInsets.only(bottom: 12),
          child: _AnalysisCard(
            analysis: analysis,
            l10n: l10n,
            isDark: isDark,
            isDeleting: isDeleting,
            onTap: () => _navigateToReading(analysis),
            onMoreActions: () => _showAnalysisActions(analysis),
          ),
        );
      },
    );
  }
}

class _AnalysisCard extends StatelessWidget {
  final AnalysisItem analysis;
  final AppLocalizations l10n;
  final bool isDark;
  final bool isDeleting;
  final VoidCallback onTap;
  final VoidCallback onMoreActions;

  const _AnalysisCard({
    required this.analysis,
    required this.l10n,
    required this.isDark,
    required this.isDeleting,
    required this.onTap,
    required this.onMoreActions,
  });

  @override
  Widget build(BuildContext context) {
    final isPersonal =
        analysis is BirthChartAnalysisItem &&
        (analysis as BirthChartAnalysisItem).isPersonal == true;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: isPersonal
            ? [
                BoxShadow(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.3),
                  blurRadius: 12,
                  spreadRadius: 2,
                ),
              ]
            : null,
      ),
      child: Card(
        color: isPersonal
            ? (isDark
                  ? Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.15)
                  : Theme.of(context).colorScheme.primaryContainer)
            : Theme.of(context).colorScheme.surface,
        elevation: isPersonal ? 4 : 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: isPersonal
              ? BorderSide(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.3),
                  width: 1.5,
                )
              : BorderSide.none,
        ),
        child: InkWell(
          onTap: isDeleting ? null : onTap,
          borderRadius: BorderRadius.circular(12),
          child: Opacity(
            opacity: isDeleting ? 0.6 : 1.0,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name and badges
                        Row(
                          children: [
                            // Type icon
                            Icon(
                              analysis.type == AnalysisType.birthChart
                                  ? Icons.person
                                  : Icons.favorite,
                              size: 16,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                analysis.title,
                                style: AppTextStyles.getH6Style(context),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (isPersonal)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.primary.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  l10n.personal,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        // Analysis info
                        if (analysis is BirthChartAnalysisItem) ...[
                          Text(
                            date_utils.DateUtils.formatBirthDateTime(
                              context,
                              (analysis as BirthChartAnalysisItem).birthChart,
                            ),
                            style: AppTextStyles.getCaptionStyle(context),
                          ),
                          if (analysis.subtitle != null)
                            Text(
                              analysis.subtitle!,
                              style: AppTextStyles.getCaptionStyle(context),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                        ] else if (analysis is SynastryAnalysisItem) ...[
                          // Show birth info for both people in the synastry
                          Builder(
                            builder: (context) {
                              final synastryAnalysis =
                                  analysis as SynastryAnalysisItem;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Person A
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        size: 12,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        synastryAnalysis
                                            .synastry
                                            .birthChartA!
                                            .fullName,
                                        style:
                                            AppTextStyles.getCaptionStyle(
                                              context,
                                            ).copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                            ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 3),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          date_utils
                                              .DateUtils.formatBirthDateTime(
                                            context,
                                            synastryAnalysis
                                                .synastry
                                                .birthChartA!,
                                          ),
                                          style: AppTextStyles.getCaptionStyle(
                                            context,
                                          ),
                                        ),
                                        if (synastryAnalysis
                                                .synastry
                                                .birthChartA!
                                                .place !=
                                            null) ...[
                                          const SizedBox(height: 1),
                                          Text(
                                            synastryAnalysis
                                                .synastry
                                                .birthChartA!
                                                .place!,
                                            style:
                                                AppTextStyles.getCaptionStyle(
                                                  context,
                                                ).copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurface
                                                      .withValues(alpha: 0.7),
                                                ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),

                                  // Separator
                                  const SizedBox(height: 8),
                                  Container(
                                    height: 1,
                                    color: Theme.of(context).colorScheme.outline
                                        .withValues(alpha: 0.2),
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 4,
                                    ),
                                  ),
                                  const SizedBox(height: 8),

                                  // Person B
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        size: 12,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.secondary,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        synastryAnalysis
                                            .synastry
                                            .birthChartB!
                                            .fullName,
                                        style:
                                            AppTextStyles.getCaptionStyle(
                                              context,
                                            ).copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.secondary,
                                            ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 3),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          date_utils
                                              .DateUtils.formatBirthDateTime(
                                            context,
                                            synastryAnalysis
                                                .synastry
                                                .birthChartB!,
                                          ),
                                          style: AppTextStyles.getCaptionStyle(
                                            context,
                                          ),
                                        ),
                                        if (synastryAnalysis
                                                .synastry
                                                .birthChartB!
                                                .place !=
                                            null) ...[
                                          const SizedBox(height: 1),
                                          Text(
                                            synastryAnalysis
                                                .synastry
                                                .birthChartB!
                                                .place!,
                                            style:
                                                AppTextStyles.getCaptionStyle(
                                                  context,
                                                ).copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurface
                                                      .withValues(alpha: 0.7),
                                                ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],

                        // Reading status
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(
                              analysis.readingOutdated == true
                                  ? Icons.refresh
                                  : (analysis.hasReading == true
                                        ? Icons.auto_stories
                                        : Icons.auto_awesome),
                              size: 16,
                              color: analysis.readingOutdated == true
                                  ? Theme.of(context).colorScheme.error
                                  : (analysis.hasReading == true
                                        ? Theme.of(
                                            context,
                                          ).colorScheme.secondary
                                        : Theme.of(context).colorScheme.error),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              analysis.readingOutdated == true
                                  ? l10n.regenerateReading
                                  : (analysis.hasReading == true
                                        ? l10n.readingAvailable
                                        : l10n.generateReadingAction),
                              style: TextStyle(
                                fontSize: 12,
                                color: analysis.readingOutdated == true
                                    ? Theme.of(context).colorScheme.error
                                    : (analysis.hasReading == true
                                          ? Theme.of(
                                              context,
                                            ).colorScheme.secondary
                                          : Theme.of(
                                              context,
                                            ).colorScheme.error),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // More actions button or loading indicator
                  isDeleting
                      ? Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        )
                      : IconButton(
                          onPressed: onMoreActions,
                          icon: Icon(
                            Icons.more_vert,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isDestructive;

  const _ActionTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isDestructive
        ? Theme.of(context).colorScheme.error
        : Theme.of(context).colorScheme.onSurface;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        highlightColor: Theme.of(
          context,
        ).colorScheme.onSurface.withValues(alpha: isDark ? 0.1 : 0.05),
        splashColor: Theme.of(
          context,
        ).colorScheme.onSurface.withValues(alpha: isDark ? 0.2 : 0.1),
        child: ListTile(
          leading: Icon(icon, color: color),
          title: Text(
            title,
            style: TextStyle(color: color, fontWeight: FontWeight.w500),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
