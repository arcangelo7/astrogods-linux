import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../constants/text_styles.dart';
import '../models/birth_chart.dart';
import '../services/newsletter_service.dart';
import '../utils/snackbar_utils.dart';
import '../widgets/birth_chart_selector.dart';
import '../widgets/location_search_field.dart';
import '../models/location.dart';

class NewsletterSubscriptionDialog extends StatefulWidget {
  const NewsletterSubscriptionDialog({super.key});

  @override
  State<NewsletterSubscriptionDialog> createState() => _NewsletterSubscriptionDialogState();
}

class _NewsletterSubscriptionDialogState extends State<NewsletterSubscriptionDialog> {
  BirthChart? _selectedChart;
  PlaceDetails? _selectedLocation;
  String _selectedType = 'daily'; // 'daily' or 'monthly'
  bool _isLoading = false;
  final TextEditingController _locationController = TextEditingController();

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(
        _selectedType == 'daily' ? l10n.subscribeToDaily : l10n.subscribeToMonthly,
        style: AppTextStyles.getH3Style(context),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Newsletter type selection
            DropdownButtonFormField<String>(
              initialValue: _selectedType,
              decoration: InputDecoration(
                labelText: l10n.newsletterType,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              items: [
                DropdownMenuItem(
                  value: 'daily',
                  child: Text(l10n.subscribeToDaily),
                ),
                DropdownMenuItem(
                  value: 'monthly',
                  child: Text(l10n.subscribeToMonthly),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedType = value!;
                });
              },
            ),
            const SizedBox(height: 16),

            // Birth chart selection
            BirthChartSelector(
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
      ),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: Text(l10n.cancel),
        ),
        ElevatedButton(
          onPressed: _isLoading || _selectedChart == null || _selectedLocation == null
              ? null
              : _subscribe,
          child: _isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(_selectedType == 'daily' ? l10n.subscribeToDaily : l10n.subscribeToMonthly),
        ),
      ],
    );
  }

  Future<void> _subscribe() async {
    if (_selectedChart == null || _selectedLocation == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final newsletterService = NewsletterService(context: context);

      if (_selectedType == 'daily') {
        await newsletterService.subscribeDailyNewsletter(
          birthChartId: _selectedChart!.id,
          placeId: _selectedLocation!.placeId,
          place: _selectedLocation!.formattedAddress,
        );
      } else {
        await newsletterService.subscribeMonthlyNewsletter(
          birthChartId: _selectedChart!.id,
          placeId: _selectedLocation!.placeId,
          place: _selectedLocation!.formattedAddress,
        );
      }

      if (mounted) {
        Navigator.of(context).pop();
        SnackbarUtils.showSuccess(context, AppLocalizations.of(context)!.subscribeSuccess);
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
}