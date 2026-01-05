import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/birth_chart.dart';
import '../services/birth_chart_service.dart';
import '../utils/snackbar_utils.dart';
import '../widgets/birth_chart_form_widget.dart';
import '../widgets/generic_dialog.dart';

class EditBirthChartDialog extends StatefulWidget {
  final BirthChart birthChart;
  final VoidCallback? onUpdated;

  const EditBirthChartDialog({
    super.key,
    required this.birthChart,
    this.onUpdated,
  });

  @override
  State<EditBirthChartDialog> createState() => _EditBirthChartDialogState();
}

class _EditBirthChartDialogState extends State<EditBirthChartDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<BirthChartFormWidgetState> _formStateKey = GlobalKey<BirthChartFormWidgetState>();
  late BirthChartFormWidget _formWidget;
  late BirthChartService _birthChartService;

  bool _isLoading = false;
  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    _birthChartService = BirthChartService(context: context);
    _formWidget = BirthChartFormWidget(
      key: _formStateKey,
      initialBirthChart: widget.birthChart,
      onChanged: _onFieldChanged,
      isEditMode: true,
    );
  }

  @override
  void dispose() {
    _birthChartService.dispose();
    super.dispose();
  }

  void _onFieldChanged() {
    setState(() {
      _hasChanges = _hasFormChanged();
    });
  }

  bool _hasFormChanged() {
    final formState = _formStateKey.currentState;
    if (formState == null) return false;

    return formState.givenName != widget.birthChart.givenName ||
           formState.familyName != widget.birthChart.familyName ||
           formState.place != widget.birthChart.place ||
           formState.selectedDate != widget.birthChart.date ||
           formState.unknownTime != widget.birthChart.unknownTime;
  }

  Future<void> _updateBirthChart() async {
    if (!_hasChanges) {
      Navigator.of(context).pop();
      return;
    }

    // Validate form with visual feedback
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final formState = _formStateKey.currentState;
    if (formState == null) return;

    final l10n = AppLocalizations.of(context)!;

    setState(() {
      _isLoading = true;
    });

    try {
      // Prepare update data
      final updateData = <String, dynamic>{
        'given_name': formState.givenName,
        'family_name': formState.familyName,
      };

      // Add date/time if changed
      if (formState.selectedDate != widget.birthChart.date ||
          formState.unknownTime != widget.birthChart.unknownTime) {
        updateData['date'] = formState.selectedDate.toIso8601String();
        updateData['unknown_time'] = formState.unknownTime;
      }

      // Add place if changed and new place selected
      if (formState.selectedLocation != null) {
        updateData['place_id'] = formState.selectedLocation!.placeId;
        updateData['place'] = formState.selectedLocation!.formattedAddress;
      }

      await _birthChartService.updateBirthChart(
        widget.birthChart.id,
        updateData,
      );

      if (mounted) {
        Navigator.of(context).pop();
        SnackbarUtils.showSuccess(context, l10n.birthChartUpdated);
        widget.onUpdated?.call();
      }
    } catch (e) {
      if (mounted) {
        SnackbarUtils.showError(context, e.toString());
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return GenericDialog(
      title: l10n.editBirthChart,
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: Text(l10n.cancel),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: _isLoading ? null : _updateBirthChart,
          child: _isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(l10n.save),
        ),
      ],
      child: Form(
        key: _formKey,
        child: _formWidget,
      ),
    );
  }
}