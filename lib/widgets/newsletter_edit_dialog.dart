import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/birth_chart.dart';
import '../services/newsletter_service.dart';
import '../services/birth_chart_service.dart';
import '../utils/snackbar_utils.dart';
import '../widgets/birth_chart_selector.dart';
import '../widgets/location_search_field.dart';
import '../widgets/generic_dialog.dart';
import '../models/location.dart';

class NewsletterEditDialog extends StatefulWidget {
  final NewsletterSubscription subscription;
  final String type; // 'daily' or 'monthly'

  const NewsletterEditDialog({
    super.key,
    required this.subscription,
    required this.type,
  });

  @override
  State<NewsletterEditDialog> createState() => _NewsletterEditDialogState();
}

class _NewsletterEditDialogState extends State<NewsletterEditDialog> {
  BirthChart? _selectedChart;
  PlaceDetails? _selectedLocation;
  bool _isLoading = false;
  bool _isLoadingCharts = true;
  final TextEditingController _locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Pre-populate the location field with current subscription location
    _locationController.text = widget.subscription.place;
    // Create a PlaceDetails object from the current subscription
    _selectedLocation = PlaceDetails(
      placeId: '', // We don't store placeId in subscription, backend will handle this
      name: widget.subscription.place,
      formattedAddress: widget.subscription.place,
    );
    _loadAndSelectBirthChart();
  }

  Future<void> _loadAndSelectBirthChart() async {
    try {
      final birthChartService = BirthChartService(context: context);
      final charts = await birthChartService.getSavedCharts();

      // Find the chart that matches the subscription's birth chart ID
      final chart = charts.firstWhere(
        (chart) => chart.id == widget.subscription.birthChartId,
        orElse: () => throw Exception('Birth chart not found'),
      );

      setState(() {
        _selectedChart = chart;
        _isLoadingCharts = false;
      });
    } catch (e) {
      setState(() {
        _isLoadingCharts = false;
      });
    }
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _updateSubscription() async {
    if (_selectedChart == null || _selectedLocation == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final newsletterService = NewsletterService(context: context);

      if (widget.type == 'daily') {
        await newsletterService.updateDailyNewsletter(
          newsletterId: widget.subscription.id,
          birthChartId: _selectedChart!.id,
          placeId: _selectedLocation!.placeId,
          place: _selectedLocation!.formattedAddress,
        );
      } else {
        await newsletterService.updateMonthlyNewsletter(
          newsletterId: widget.subscription.id,
          birthChartId: _selectedChart!.id,
          placeId: _selectedLocation!.placeId,
          place: _selectedLocation!.formattedAddress,
        );
      }

      if (mounted) {
        Navigator.of(context).pop();
        SnackbarUtils.showSuccess(context, AppLocalizations.of(context)!.updateSuccess);
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        SnackbarUtils.showError(context, e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return GenericDialog(
      title: widget.type == 'daily' ? l10n.editDaily : l10n.editMonthly,
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: Text(l10n.cancel),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: _isLoading || _isLoadingCharts || _selectedChart == null || _selectedLocation == null
              ? null
              : _updateSubscription,
          child: _isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(l10n.save),
        ),
      ],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Birth chart selection
          _isLoadingCharts
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : BirthChartSelector(
                  selectedChart: _selectedChart,
                  validator: (chart) {
                    if (chart == null) {
                      return AppLocalizations.of(context)!.pleaseSelectBirthChart;
                    }
                    return null;
                  },
                  onChanged: (chart) {
                    setState(() {
                      _selectedChart = chart;
                    });
                  },
                  allowNull: false,
                  autoSelectPersonal: true,
                ),
          const SizedBox(height: 16),

          // Location selection
          LocationSearchField(
            controller: _locationController,
            labelText: l10n.currentLocation,
            onLocationSelected: (PlaceDetails? location) {
              setState(() {
                _selectedLocation = location;
              });
            },
          ),
        ],
      ),
    );
  }
}