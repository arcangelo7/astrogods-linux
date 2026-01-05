import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../constants/text_styles.dart';
import '../widgets/starry_night_background.dart';
import '../widgets/gradient_button.dart';
import '../widgets/location_search_field.dart';
import '../widgets/mystical_text_field.dart';
import '../widgets/date_picker_field.dart';
import '../widgets/time_picker_field.dart';
import '../widgets/unknown_time_checkbox.dart';
import '../widgets/mystical_checkbox.dart';
import '../services/birth_chart_service.dart';
import '../services/api_client.dart';
import '../models/location.dart';
import '../utils/snackbar_utils.dart';
import '../utils/session_utils.dart';
import '../providers/auth_provider.dart';

class PersonalityScreen extends StatefulWidget {
  const PersonalityScreen({super.key});

  @override
  State<PersonalityScreen> createState() => _PersonalityScreenState();
}

class _PersonalityScreenState extends State<PersonalityScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _birthPlaceController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _birthTimeController = TextEditingController();
  bool _dontKnowBirthTime = false;
  bool _isLoading = false;
  bool _chartOnly = false;

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  PlaceDetails? _selectedLocation;
  late final BirthChartService _birthChartService;

  @override
  void initState() {
    super.initState();
    _birthChartService = BirthChartService(context: context);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _birthPlaceController.dispose();
    _birthDateController.dispose();
    _birthTimeController.dispose();
    _birthChartService.dispose();
    super.dispose();
  }

  Future<void> _submitBirthChart() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedDate == null) {
      SnackbarUtils.showErrorSnackBar(context, AppLocalizations.of(context)!.pleaseSelectBirthDate);
      return;
    }

    if (_selectedLocation == null) {
      SnackbarUtils.showErrorSnackBar(
        context,
        AppLocalizations.of(context)!.pleaseSelectBirthPlace,
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      // Combine date and time
      DateTime birthDateTime = DateTime(
        _selectedDate!.year,
        _selectedDate!.month,
        _selectedDate!.day,
        _dontKnowBirthTime ? 12 : (_selectedTime?.hour ?? 12),
        _dontKnowBirthTime ? 0 : (_selectedTime?.minute ?? 0),
      );

      // Create birth chart with place_id (backend will do geocoding)
      final birthChart = await _birthChartService.createBirthChart(
        givenName: _firstNameController.text.trim(),
        familyName: _lastNameController.text.trim(),
        date: birthDateTime,
        placeId: _selectedLocation!.placeId,
        place: _selectedLocation!.formattedAddress,
        unknownTime: _dontKnowBirthTime,
      );

      await _birthChartService.calculateBirthChart(birthChart.id);

      if (mounted) {
        final authProvider = Provider.of<AuthProvider>(context, listen: false);

        if (authProvider.isAuthenticated) {
          // User is authenticated, go directly to full reading
          context.push(
            '/birth-chart-reading/${birthChart.id}',
            extra: {'birthChart': birthChart.toJson(), 'chartOnly': _chartOnly},
          );
        } else {
          // User is not authenticated, go to preview
          context.push(
            '/birth-chart-preview/${birthChart.id}',
            extra: birthChart.toJson(),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        if (e is SubscriptionRequiredException) {
          SnackbarUtils.showInfo(
            context,
            AppLocalizations.of(context)!.subscriptionRequiredMessage,
          );
          context.push('/subscription-plans');
        } else if (e is ApiException) {
          SessionUtils.handleApiException(
            context,
            e,
            (message) => SnackbarUtils.showCopyableErrorSnackBar(context, message),
          );
        }
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 8),

                          Text(
                            AppLocalizations.of(context)!.unveilHeart,
                            style: AppTextStyles.getH4Style(context),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 40),

                          // Use vertical layout on small screens
                          MediaQuery.of(context).size.width < 600
                              ? Column(
                                  children: [
                                    MysticalTextField(
                                      controller: _firstNameController,
                                      labelText: AppLocalizations.of(
                                        context,
                                      )!.firstName,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return AppLocalizations.of(context)!.pleaseEnterFirstName;
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    MysticalTextField(
                                      controller: _lastNameController,
                                      labelText: AppLocalizations.of(
                                        context,
                                      )!.lastName,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return AppLocalizations.of(context)!.pleaseEnterLastName;
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Expanded(
                                      child: MysticalTextField(
                                        controller: _firstNameController,
                                        labelText: AppLocalizations.of(
                                          context,
                                        )!.firstName,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return AppLocalizations.of(context)!.pleaseEnterFirstName;
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: MysticalTextField(
                                        controller: _lastNameController,
                                        labelText: AppLocalizations.of(
                                          context,
                                        )!.lastName,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return AppLocalizations.of(context)!.pleaseEnterLastName;
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),

                          const SizedBox(height: 20),

                          LocationSearchField(
                            controller: _birthPlaceController,
                            labelText: AppLocalizations.of(context)!.birthPlace,
                            language: Localizations.localeOf(
                              context,
                            ).languageCode,
                            validator: (value) {
                              if (_selectedLocation == null) {
                                return AppLocalizations.of(
                                  context,
                                )!.pleaseSelectBirthPlace;
                              }
                              return null;
                            },
                            onLocationSelected: (PlaceDetails? location) {
                              setState(() {
                                _selectedLocation = location;
                              });
                            },
                          ),

                          const SizedBox(height: 20),

                          // Use vertical layout on small screens
                          MediaQuery.of(context).size.width < 600
                              ? Column(
                                  children: [
                                    MysticalDatePickerField(
                                      controller: _birthDateController,
                                      selectedDate: _selectedDate,
                                      labelText: AppLocalizations.of(
                                        context,
                                      )!.birthDate,
                                      onDateSelected: (date) {
                                        setState(() {
                                          _selectedDate = date;
                                        });
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return AppLocalizations.of(context)!.pleaseSelectBirthDate;
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    MysticalTimePickerField(
                                      controller: _birthTimeController,
                                      selectedTime: _selectedTime,
                                      labelText: AppLocalizations.of(
                                        context,
                                      )!.birthTime,
                                      onTimeSelected: (time) {
                                        setState(() {
                                          _selectedTime = time;
                                        });
                                      },
                                      enabled: !_dontKnowBirthTime,
                                      validator: (value) {
                                        if (!_dontKnowBirthTime &&
                                            (value == null || value.isEmpty)) {
                                          return AppLocalizations.of(context)!.pleaseSelectBirthTime;
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: MysticalDatePickerField(
                                        controller: _birthDateController,
                                        selectedDate: _selectedDate,
                                        labelText: AppLocalizations.of(
                                          context,
                                        )!.birthDate,
                                        onDateSelected: (date) {
                                          setState(() {
                                            _selectedDate = date;
                                          });
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return AppLocalizations.of(context)!.pleaseSelectBirthDate;
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: MysticalTimePickerField(
                                        controller: _birthTimeController,
                                        selectedTime: _selectedTime,
                                        labelText: AppLocalizations.of(
                                          context,
                                        )!.birthTime,
                                        onTimeSelected: (time) {
                                          setState(() {
                                            _selectedTime = time;
                                          });
                                        },
                                        enabled: !_dontKnowBirthTime,
                                        validator: (value) {
                                          if (!_dontKnowBirthTime &&
                                              (value == null ||
                                                  value.isEmpty)) {
                                            return AppLocalizations.of(context)!.pleaseSelectBirthTime;
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),

                          const SizedBox(height: 24),

                          UnknownTimeCheckbox(
                            value: _dontKnowBirthTime,
                            onChanged: (value) {
                              setState(() {
                                _dontKnowBirthTime = value;
                                if (_dontKnowBirthTime) {
                                  _birthTimeController.clear();
                                }
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

                          GradientButton(
                            text: _isLoading
                                ? AppLocalizations.of(context)!.analyzing
                                : AppLocalizations.of(
                                    context,
                                  )!.read.toUpperCase(),
                            onPressed: !_isLoading ? _submitBirthChart : () {},
                          ),

                          const SizedBox(height: 24),

                          // Info text
                          Text(
                            AppLocalizations.of(context)!.birthChartDescription,
                            style: AppTextStyles.getCaptionStyle(context).copyWith(
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
          ),
        ),
    );
  }

}
