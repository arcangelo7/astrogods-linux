import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/starry_night_background.dart';
import '../widgets/gradient_button.dart';
import '../widgets/birth_chart_selector.dart';
import '../widgets/create_birth_chart_dialog.dart';
import '../widgets/empty_state_widget.dart';
import '../constants/text_styles.dart';
import '../models/birth_chart.dart';
import '../services/synastry_service.dart' as synastry;
import '../services/birth_chart_service.dart';
import '../services/api_client.dart';
import '../utils/snackbar_utils.dart';
import '../utils/session_utils.dart';
import '../l10n/app_localizations.dart';
import '../widgets/mystical_checkbox.dart';

class RelationshipsScreen extends StatefulWidget {
  const RelationshipsScreen({super.key});

  @override
  State<RelationshipsScreen> createState() => _RelationshipsScreenState();
}

class _RelationshipsScreenState extends State<RelationshipsScreen> {
  final _formKey = GlobalKey<FormState>();
  late final synastry.SynastryService _synastryService;
  late final BirthChartService _birthChartService;

  List<BirthChart> _savedCharts = [];
  BirthChart? _selectedChartA;
  BirthChart? _selectedChartB;

  bool _isLoading = true;
  bool _isCreating = false;
  bool _chartOnly = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _synastryService = synastry.SynastryService(context: context);
    _birthChartService = BirthChartService(context: context);
    _loadSavedCharts();
  }

  @override
  void dispose() {
    _synastryService.dispose();
    _birthChartService.dispose();
    super.dispose();
  }

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
          _savedCharts = charts;
          _isLoading = false;
        });
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

  Future<void> _showCreateDialog() async {
    await showDialog<void>(
      context: context,
      builder: (context) => CreateBirthChartDialog(
        onCreated: (newChart) {
          // Add the new chart to the list and reload saved charts
          _loadSavedCharts();
        },
      ),
    );
  }

  Future<void> _createSynastry() async {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedChartA!.id == _selectedChartB!.id) {
      SnackbarUtils.showError(
        context,
        AppLocalizations.of(context)!.birthChartsMustBeDifferent,
      );
      return;
    }

    setState(() {
      _isCreating = true;
    });

    try {
      final synastry = await _synastryService.createSynastry(
        birthChartAId: _selectedChartA!.id,
        birthChartBId: _selectedChartB!.id,
      );

      if (!mounted) return;
      context.push(
        '/synastry/${synastry.id}',
        extra: {'synastry': synastry.toJson(), 'chartOnly': _chartOnly},
      );
      setState(() {
        _isCreating = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isCreating = false;
      });
      if (e is synastry.SubscriptionRequiredException) {
        SnackbarUtils.showInfo(
          context,
          AppLocalizations.of(context)!.premiumRequiredForSynastry,
        );
        context.push('/subscription-plans');
      } else if (e is ApiException) {
        SessionUtils.handleApiException(
          context,
          e,
          (message) => SnackbarUtils.showError(context, message),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return StarryNightBackground(
      showPlanet: false,
      subtle: true,
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Sottrai l'altezza della bottom navigation (circa 80px) per centrare solo nella porzione visibile
            final availableHeight = constraints.maxHeight - 80.0;
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 8.0,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: availableHeight - 16.0,
                ),
                child: _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : _error != null
                      ? Center(child: _buildErrorState())
                      : _savedCharts.length < 2
                      ? Center(child: _buildEmptyState())
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 8),

                            Text(
                              AppLocalizations.of(
                                context,
                              )!.discoverHeartOfRelationship,
                              style: AppTextStyles.getH4Style(context),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 40),

                            _buildSynastryForm(),

                            const SizedBox(height: 24),
                          ],
                      ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildErrorState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline,
          size: 64,
          color: Theme.of(context).colorScheme.error,
        ),
        const SizedBox(height: 16),
        Text(
          _error!,
          style: AppTextStyles.getBodyStyle(context),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        GradientButton(
          text: AppLocalizations.of(context)!.tryAgain,
          onPressed: _loadSavedCharts,
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    final l10n = AppLocalizations.of(context)!;

    // Check how many charts we have
    if (_savedCharts.length == 1) {
      // We have one chart, need one more
      return EmptyStateWidget(
        icon: Icons.person_add_outlined,
        title: l10n.oneMoreChartNeeded,
        description: l10n.needTwoBirthChartsForSynastry,
        primaryAction: GradientButton(
          text: l10n.createSecondChart,
          onPressed: _showCreateDialog,
        ),
      );
    } else {
      // We have no charts
      return EmptyStateWidget(
        icon: Icons.people_outline,
        title: l10n.noSavedBirthCharts,
        description: l10n.needTwoBirthChartsForSynastry,
        primaryAction: GradientButton(
          text: l10n.createFirstChart,
          onPressed: _showCreateDialog,
        ),
      );
    }
  }

  Widget _buildSynastryForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Persona A selector
          Text(
            AppLocalizations.of(context)!.personA,
            style: AppTextStyles.getBodyStyle(
              context,
            ).copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          BirthChartSelector(
            labelText: AppLocalizations.of(context)!.selectFirstBirthChart,
            selectedChart: _selectedChartA,
            excludeChartIds: _selectedChartB != null
                ? [_selectedChartB!.id]
                : [],
            validator: (chart) {
              if (chart == null) {
                return AppLocalizations.of(context)!.pleaseSelectBirthChart;
              }
              return null;
            },
            onChanged: (chart) {
              setState(() {
                _selectedChartA = chart;
                // Reset chart B if it's the same as A
                if (_selectedChartB?.id == chart?.id) {
                  _selectedChartB = null;
                }
              });
            },
            autoSelectPersonal: true,
          ),

          const SizedBox(height: 24),

          // Persona B selector
          Text(
            AppLocalizations.of(context)!.personB,
            style: AppTextStyles.getBodyStyle(
              context,
            ).copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          BirthChartSelector(
            labelText: AppLocalizations.of(context)!.selectSecondBirthChart,
            selectedChart: _selectedChartB,
            excludeChartIds: _selectedChartA != null
                ? [_selectedChartA!.id]
                : [],
            validator: (chart) {
              if (chart == null) {
                return AppLocalizations.of(context)!.pleaseSelectBirthChart;
              }
              return null;
            },
            onChanged: (chart) {
              setState(() {
                _selectedChartB = chart;
              });
            },
          ),

          const SizedBox(height: 16),

          MysticalCheckbox(
            title: AppLocalizations.of(context)!.chartOnlyMode,
            value: _chartOnly,
            onChanged: (value) {
              setState(() {
                _chartOnly = value;
              });
            },
          ),

          const SizedBox(height: 24),

          // Create button
          GradientButton(
            text: _isCreating
                ? AppLocalizations.of(context)!.creating
                : AppLocalizations.of(context)!.createSynastry,
            onPressed: !_isCreating ? _createSynastry : () {},
          ),

          const SizedBox(height: 24),

          // Info text
          Text(
            AppLocalizations.of(context)!.synastryDescription,
            style: AppTextStyles.getCaptionStyle(context).copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
