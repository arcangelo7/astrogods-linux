import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../l10n/app_localizations.dart';
import '../models/birth_chart.dart';
import '../services/birth_chart_service.dart';
import '../services/api_client.dart';
import '../utils/snackbar_utils.dart';
import '../widgets/birth_chart_form_widget.dart';
import '../widgets/generic_dialog.dart';
import '../providers/auth_provider.dart';

class CreateBirthChartDialog extends StatefulWidget {
  final Function(BirthChart)? onCreated;

  const CreateBirthChartDialog({
    super.key,
    this.onCreated,
  });

  @override
  State<CreateBirthChartDialog> createState() => _CreateBirthChartDialogState();
}

class _CreateBirthChartDialogState extends State<CreateBirthChartDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<BirthChartFormWidgetState> _formStateKey = GlobalKey<BirthChartFormWidgetState>();
  late BirthChartFormWidget _formWidget;
  late BirthChartService _birthChartService;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _birthChartService = BirthChartService(context: context);
    _formWidget = BirthChartFormWidget(
      key: _formStateKey,
      isEditMode: false,
    );
  }

  @override
  void dispose() {
    _birthChartService.dispose();
    super.dispose();
  }

  Future<void> _createBirthChart() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (!authProvider.isAuthenticated) {
      _showAuthenticationRequired();
      return;
    }

    if (!_formKey.currentState!.validate()) return;

    final formState = _formStateKey.currentState;
    if (formState == null) return;

    final l10n = AppLocalizations.of(context)!;

    setState(() {
      _isLoading = true;
    });

    try {
      DateTime birthDateTime = DateTime(
        formState.selectedDate.year,
        formState.selectedDate.month,
        formState.selectedDate.day,
        formState.unknownTime ? 12 : (formState.selectedTime?.hour ?? 12),
        formState.unknownTime ? 0 : (formState.selectedTime?.minute ?? 0),
      );

      final birthChart = await _birthChartService.createBirthChart(
        givenName: formState.givenName,
        familyName: formState.familyName,
        date: birthDateTime,
        placeId: formState.selectedLocation!.placeId,
        place: formState.selectedLocation!.formattedAddress,
        unknownTime: formState.unknownTime,
      );

      await _birthChartService.calculateBirthChart(birthChart.id);

      if (mounted) {
        Navigator.of(context).pop();
        SnackbarUtils.showSuccess(context, l10n.birthChartCreated);
        widget.onCreated?.call(birthChart);
      }
    } catch (e) {
      if (mounted) {
        if (e is SubscriptionRequiredException) {
          SnackbarUtils.showInfo(
            context,
            l10n.subscriptionRequiredMessage,
          );
        } else {
          final errorMessage = e is ApiException && e.message.isNotEmpty
              ? e.message
              : l10n.errorCreatingBirthChart(e.toString());
          SnackbarUtils.showCopyableErrorSnackBar(context, errorMessage);
        }
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showAuthenticationRequired() {
    final l10n = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.authenticationRequired),
        content: Text(l10n.pleaseLoginToSaveCharts),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close auth dialog
              Navigator.of(context).pop(); // Close create dialog
              context.go('/login'); // Navigate to login
            },
            child: Text(l10n.login),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return GenericDialog(
      title: l10n.createBirthChart,
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: Text(l10n.cancel),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: _isLoading ? null : _createBirthChart,
          child: _isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(l10n.create),
        ),
      ],
      child: Form(
        key: _formKey,
        child: _formWidget,
      ),
    );
  }
}