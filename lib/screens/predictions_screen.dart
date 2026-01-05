import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../l10n/app_localizations.dart';
import '../constants/text_styles.dart';
import '../widgets/starry_night_background.dart';
import '../widgets/birth_chart_selector.dart';
import '../widgets/location_search_field.dart';
import '../widgets/date_picker_field.dart';
import '../widgets/gradient_button.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/create_birth_chart_dialog.dart';
import '../models/birth_chart.dart';
import '../models/location.dart';
import '../utils/snackbar_utils.dart';
import '../services/api_client.dart';
import '../services/birth_chart_service.dart';
import '../services/transit_service.dart' as transit;
import '../services/newsletter_service.dart';
import '../utils/session_utils.dart';
import '../widgets/mystical_checkbox.dart';

class PredictionsScreen extends StatefulWidget {
  const PredictionsScreen({super.key});

  @override
  State<PredictionsScreen> createState() => _PredictionsScreenState();
}

class _PredictionsScreenState extends State<PredictionsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StarryNightBackground(
        showPlanet: false,
        subtle: true,
        child: SafeArea(
          child: Column(
            children: [
              // Tab bar - at the top
              Material(
                color: Colors.transparent,
                child: TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(text: AppLocalizations.of(context)!.dailyPredictions),
                    Tab(text: AppLocalizations.of(context)!.monthlyPredictions),
                  ],
                ),
              ),

              // Tab content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [_DailyTransitTab(), _MonthlyTransitTab()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DailyTransitTab extends StatefulWidget {
  const _DailyTransitTab();

  @override
  State<_DailyTransitTab> createState() => _DailyTransitTabState();
}

class _DailyTransitTabState extends State<_DailyTransitTab> {
  final _formKey = GlobalKey<FormState>();
  final _locationController = TextEditingController();
  final _dateController = TextEditingController();
  late final BirthChartService _birthChartService;
  List<BirthChart> _savedCharts = [];
  BirthChart? _selectedChart;
  DateTime? _selectedDate = DateTime.now();
  PlaceDetails? _selectedLocation;
  bool _isCreating = false;
  bool _isLoadingCharts = true;
  bool _hasAutoPopulated = false;
  bool _chartOnly = false;
  NewsletterSubscription? _autoPopulatedNewsletter;
  String? _error;

  @override
  void initState() {
    super.initState();
    _birthChartService = BirthChartService(context: context);
    // Set default date to today
    _selectedDate = DateTime.now();
    _dateController.text =
        '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}';
    _loadSavedCharts();
  }

  Future<void> _loadSavedCharts() async {
    if (!mounted) return;

    setState(() {
      _isLoadingCharts = true;
      _error = null;
    });

    try {
      final charts = await _birthChartService.getSavedCharts();
      if (mounted) {
        setState(() {
          _savedCharts = charts;
          _isLoadingCharts = false;
        });
      }
    } on ApiException catch (e) {
      if (mounted) {
        SessionUtils.handleApiException(
          context,
          e,
          (message) => setState(() {
            _error = message;
            _isLoadingCharts = false;
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
          // Reload saved charts
          _loadSavedCharts();
        },
      ),
    );
  }

  Future<void> _loadNewsletterLocationForChart(BirthChart chart) async {
    if (_hasAutoPopulated) return; // Avoid multiple auto-population

    try {
      final newsletterService = NewsletterService(context: context);
      final newsletters = await newsletterService.getSubscriptions();

      // Look for a daily newsletter for this birth chart
      final dailyNewsletter = newsletters.dailySubscriptions
          .where((sub) => sub.birthChartId == chart.id)
          .firstOrNull;

      if (dailyNewsletter != null && mounted) {
        // Create a PlaceDetails with stored coordinates but without placeId
        // The backend should accept coordinates even without placeId
        final location = PlaceDetails(
          placeId: dailyNewsletter.place, // Use place name as fallback placeId
          name: dailyNewsletter.place,
          formattedAddress: dailyNewsletter.place,
        );

        setState(() {
          _selectedLocation = location;
          _locationController.text = dailyNewsletter.place;
          _hasAutoPopulated = true;
          _autoPopulatedNewsletter = dailyNewsletter;
        });
      } else {
        // Clear the location field if no newsletter is found
        if (mounted) {
          setState(() {
            _selectedLocation = null;
            _locationController.clear();
          });
        }
      }
    } catch (e) {
      // Silently fail - newsletter loading is optional
    }
  }

  @override
  void dispose() {
    _locationController.dispose();
    _dateController.dispose();
    _birthChartService.dispose();
    super.dispose();
  }

  Future<void> _generateDailyTransit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isCreating = true;
    });

    try {
      // Create transit first, then navigate with ID
      final transitService = transit.TransitService(context: context);
      final transitData = await transitService.createDailyTransit(
        birthChartId: _selectedChart!.id,
        date: _selectedDate!,
        location: _autoPopulatedNewsletter != null
            ? {
                'place': _selectedLocation!.formattedAddress,
                'latitude': _autoPopulatedNewsletter!.latitude,
                'longitude': _autoPopulatedNewsletter!.longitude,
              }
            : {
                'place': _selectedLocation!.formattedAddress,
                'placeId': _selectedLocation!.placeId,
              },
      );

      if (!mounted) return;
      context.push(
        '/daily-transit/${transitData['id']}',
        extra: {'chartOnly': _chartOnly},
      );
      setState(() {
        _isCreating = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isCreating = false;
      });
      if (e is transit.SubscriptionRequiredException) {
        SnackbarUtils.showInfo(
          context,
          AppLocalizations.of(context)!.premiumRequiredForDailyTransit,
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
    final l10n = AppLocalizations.of(context)!;

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableHeight = constraints.maxHeight - 80.0;
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: availableHeight - 16.0),
            child: _isLoadingCharts
                ? const Center(child: CircularProgressIndicator())
                : _error != null
                ? Center(child: _buildErrorState())
                : _savedCharts.isEmpty
                ? Center(child: _buildEmptyState())
                : Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 8),

                        Text(
                          AppLocalizations.of(
                            context,
                          )!.anticipateYourDayWithTransits,
                          style: AppTextStyles.getH4Style(context),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 40),

                        // Birth Chart Selector
                        BirthChartSelector(
                          labelText: AppLocalizations.of(context)!.selectChart,
                          selectedChart: _selectedChart,
                          allowNull: false,
                          autoSelectPersonal: true,
                          validator: (chart) {
                            if (chart == null) {
                              return AppLocalizations.of(
                                context,
                              )!.pleaseSelectBirthChart;
                            }
                            return null;
                          },
                          onChanged: (chart) {
                            setState(() {
                              _selectedChart = chart;
                              _hasAutoPopulated =
                                  false; // Reset auto-population flag
                              _autoPopulatedNewsletter =
                                  null; // Reset newsletter reference
                            });
                            // Auto-populate location from newsletter if available
                            if (chart != null) {
                              _loadNewsletterLocationForChart(chart);
                            }
                          },
                        ),

                        const SizedBox(height: 20),

                        // Date picker
                        MysticalDatePickerField(
                          controller: _dateController,
                          selectedDate: _selectedDate,
                          labelText: l10n.selectDate,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(
                                context,
                              )!.pleaseSelectDate;
                            }
                            return null;
                          },
                          onDateSelected: (date) {
                            setState(() {
                              _selectedDate = date;
                            });
                          },
                          firstDate: DateTime.now().subtract(
                            const Duration(days: 30),
                          ),
                          lastDate: DateTime.now().add(
                            const Duration(days: 30),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Location search
                        LocationSearchField(
                          controller: _locationController,
                          labelText: AppLocalizations.of(
                            context,
                          )!.selectLocation,
                          language: Localizations.localeOf(
                            context,
                          ).languageCode,
                          validator: (value) {
                            if (_selectedLocation == null) {
                              return AppLocalizations.of(
                                context,
                              )!.pleaseSelectLocation;
                            }
                            return null;
                          },
                          onLocationSelected: (PlaceDetails? location) {
                            setState(() {
                              _selectedLocation = location;
                              // Reset auto-populated newsletter when user manually selects a location
                              _autoPopulatedNewsletter = null;
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

                        // Generate button
                        GradientButton(
                          text: _isCreating
                              ? AppLocalizations.of(context)!.generating
                              : l10n.generateDailyTransit,
                          onPressed: !_isCreating
                              ? _generateDailyTransit
                              : () {},
                        ),

                        const SizedBox(height: 24),

                        // Info text
                        Text(
                          AppLocalizations.of(context)!.transitDescription,
                          style: AppTextStyles.getCaptionStyle(context)
                              .copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withValues(alpha: 0.7),
                              ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }

  Widget _buildErrorState() {
    return EmptyStateWidget(
      icon: Icons.error_outline,
      title: AppLocalizations.of(context)!.errorLoadingSavedCharts,
      description: _error,
      compact: true,
      primaryAction: GradientButton(
        text: AppLocalizations.of(context)!.tryAgain,
        onPressed: _loadSavedCharts,
      ),
    );
  }

  Widget _buildEmptyState() {
    return EmptyStateWidget(
      icon: Icons.calendar_month_outlined,
      title: AppLocalizations.of(context)!.noSavedBirthCharts,
      description: AppLocalizations.of(context)!.needBirthChartForPredictions,
      primaryAction: GradientButton(
        text: AppLocalizations.of(context)!.createBirthChart,
        onPressed: _showCreateDialog,
      ),
    );
  }
}

class _MonthlyTransitTab extends StatefulWidget {
  const _MonthlyTransitTab();

  @override
  State<_MonthlyTransitTab> createState() => _MonthlyTransitTabState();
}

class _MonthlyTransitTabState extends State<_MonthlyTransitTab> {
  final _formKey = GlobalKey<FormState>();
  final _locationController = TextEditingController();
  final _monthController = TextEditingController();
  late final BirthChartService _birthChartService;
  List<BirthChart> _savedCharts = [];
  BirthChart? _selectedChart;
  int _selectedYear = DateTime.now().year;
  int _selectedMonth = DateTime.now().month;
  PlaceDetails? _selectedLocation;
  bool _isCreating = false;
  bool _isLoadingCharts = true;
  bool _hasAutoPopulated = false;
  bool _chartOnly = false;
  NewsletterSubscription? _autoPopulatedNewsletter;
  String? _error;

  @override
  void initState() {
    super.initState();
    _birthChartService = BirthChartService(context: context);
    _updateMonthController();
    _loadSavedCharts();
  }

  Future<void> _loadSavedCharts() async {
    if (!mounted) return;

    setState(() {
      _isLoadingCharts = true;
      _error = null;
    });

    try {
      final charts = await _birthChartService.getSavedCharts();
      if (mounted) {
        setState(() {
          _savedCharts = charts;
          _isLoadingCharts = false;
        });
      }
    } on ApiException catch (e) {
      if (mounted) {
        SessionUtils.handleApiException(
          context,
          e,
          (message) => setState(() {
            _error = message;
            _isLoadingCharts = false;
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
          // Reload saved charts
          _loadSavedCharts();
        },
      ),
    );
  }

  Future<void> _loadNewsletterLocationForChart(BirthChart chart) async {
    if (_hasAutoPopulated) return; // Avoid multiple auto-population

    try {
      final newsletterService = NewsletterService(context: context);
      final newsletters = await newsletterService.getSubscriptions();

      // Look for a monthly newsletter for this birth chart
      final monthlyNewsletter = newsletters.monthlySubscriptions
          .where((sub) => sub.birthChartId == chart.id)
          .firstOrNull;

      if (monthlyNewsletter != null && mounted) {
        // Create a PlaceDetails with stored coordinates but without placeId
        // The backend should accept coordinates even without placeId
        final location = PlaceDetails(
          placeId:
              monthlyNewsletter.place, // Use place name as fallback placeId
          name: monthlyNewsletter.place,
          formattedAddress: monthlyNewsletter.place,
        );

        setState(() {
          _selectedLocation = location;
          _locationController.text = monthlyNewsletter.place;
          _hasAutoPopulated = true;
          _autoPopulatedNewsletter = monthlyNewsletter;
        });
      } else {
        // Clear the location field if no newsletter is found
        if (mounted) {
          setState(() {
            _selectedLocation = null;
            _locationController.clear();
          });
        }
      }
    } catch (e) {
      // Silently fail - newsletter loading is optional
    }
  }

  @override
  void dispose() {
    _locationController.dispose();
    _monthController.dispose();
    _birthChartService.dispose();
    super.dispose();
  }

  void _updateMonthController() {
    _monthController.text =
        '${_selectedMonth.toString().padLeft(2, '0')}/$_selectedYear';
  }

  Future<void> _selectMonth(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime(_selectedYear, _selectedMonth),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Theme.of(context).colorScheme.primary,
              surface: Theme.of(context).colorScheme.surface,
            ),
          ),
          child: child!,
        );
      },
    );

    if (date != null) {
      setState(() {
        _selectedYear = date.year;
        _selectedMonth = date.month;
        _updateMonthController();
      });
    }
  }

  Future<void> _generateMonthlyTransit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isCreating = true;
    });

    try {
      // Create transit first, then navigate with ID
      final transitService = transit.TransitService(context: context);
      final transitData = await transitService.createMonthlyTransit(
        birthChartId: _selectedChart!.id,
        year: _selectedYear,
        month: _selectedMonth,
        location: _autoPopulatedNewsletter != null
            ? {
                'place': _selectedLocation!.formattedAddress,
                'latitude': _autoPopulatedNewsletter!.latitude,
                'longitude': _autoPopulatedNewsletter!.longitude,
              }
            : {
                'place': _selectedLocation!.formattedAddress,
                'placeId': _selectedLocation!.placeId,
              },
      );

      if (!mounted) return;
      context.push(
        '/monthly-transit/${transitData['id']}',
        extra: {'chartOnly': _chartOnly},
      );
      setState(() {
        _isCreating = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isCreating = false;
      });
      if (e is transit.SubscriptionRequiredException) {
        SnackbarUtils.showInfo(
          context,
          AppLocalizations.of(context)!.premiumRequiredForMonthlyTransit,
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
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableHeight = constraints.maxHeight - 80.0;
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: availableHeight - 16.0),
            child: _isLoadingCharts
                ? const Center(child: CircularProgressIndicator())
                : _error != null
                ? Center(child: _buildErrorState())
                : _savedCharts.isEmpty
                ? Center(child: _buildEmptyState())
                : Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 8),

                        Text(
                          AppLocalizations.of(
                            context,
                          )!.anticipateYourMonthWithTransits,
                          style: AppTextStyles.getH4Style(context),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 40),

                        // Birth Chart Selector
                        BirthChartSelector(
                          labelText: AppLocalizations.of(context)!.selectChart,
                          selectedChart: _selectedChart,
                          allowNull: false,
                          autoSelectPersonal: true,
                          validator: (chart) {
                            if (chart == null) {
                              return AppLocalizations.of(
                                context,
                              )!.pleaseSelectBirthChart;
                            }
                            return null;
                          },
                          onChanged: (chart) {
                            setState(() {
                              _selectedChart = chart;
                              _hasAutoPopulated =
                                  false; // Reset auto-population flag
                              _autoPopulatedNewsletter =
                                  null; // Reset newsletter reference
                            });
                            // Auto-populate location from newsletter if available
                            if (chart != null) {
                              _loadNewsletterLocationForChart(chart);
                            }
                          },
                        ),

                        const SizedBox(height: 20),

                        // Month picker (styled like MysticalDatePickerField)
                        TextFormField(
                          controller: _monthController,
                          readOnly: true,
                          onTap: () => _selectMonth(context),
                          style: AppTextStyles.getBodyStyle(context),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(
                                context,
                              )!.pleaseSelectDate;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: l10n.selectMonth,
                            labelStyle: AppTextStyles.getFormLabelStyle(
                              context,
                            ),
                            floatingLabelStyle:
                                AppTextStyles.getFloatingLabelStyle(context),
                            suffixIcon: Icon(
                              Icons.calendar_month,
                              color: theme.colorScheme.onSurface.withValues(
                                alpha: 0.6,
                              ),
                              size: AppTextStyles.iconMedium,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: theme.colorScheme.outline.withValues(
                                  alpha: 0.5,
                                ),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: theme.colorScheme.primary,
                                width: 2,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            filled: true,
                            fillColor: theme.colorScheme.surfaceContainerHighest
                                .withValues(alpha: 0.3),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Location search
                        LocationSearchField(
                          controller: _locationController,
                          labelText: AppLocalizations.of(
                            context,
                          )!.selectLocation,
                          language: Localizations.localeOf(
                            context,
                          ).languageCode,
                          validator: (value) {
                            if (_selectedLocation == null) {
                              return AppLocalizations.of(
                                context,
                              )!.pleaseSelectLocation;
                            }
                            return null;
                          },
                          onLocationSelected: (PlaceDetails? location) {
                            setState(() {
                              _selectedLocation = location;
                              // Reset auto-populated newsletter when user manually selects a location
                              _autoPopulatedNewsletter = null;
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

                        // Generate button
                        GradientButton(
                          text: _isCreating
                              ? AppLocalizations.of(context)!.generating
                              : l10n.generateMonthlyTransit,
                          onPressed: !_isCreating
                              ? _generateMonthlyTransit
                              : () {},
                        ),

                        const SizedBox(height: 24),

                        // Info text
                        Text(
                          AppLocalizations.of(context)!.transitDescription,
                          style: AppTextStyles.getCaptionStyle(context)
                              .copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withValues(alpha: 0.7),
                              ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }

  Widget _buildErrorState() {
    return EmptyStateWidget(
      icon: Icons.error_outline,
      title: AppLocalizations.of(context)!.errorLoadingSavedCharts,
      description: _error,
      compact: true,
      primaryAction: GradientButton(
        text: AppLocalizations.of(context)!.tryAgain,
        onPressed: _loadSavedCharts,
      ),
    );
  }

  Widget _buildEmptyState() {
    return EmptyStateWidget(
      icon: Icons.calendar_month_outlined,
      title: AppLocalizations.of(context)!.noSavedBirthCharts,
      description: AppLocalizations.of(context)!.needBirthChartForPredictions,
      primaryAction: GradientButton(
        text: AppLocalizations.of(context)!.createBirthChart,
        onPressed: _showCreateDialog,
      ),
    );
  }
}
