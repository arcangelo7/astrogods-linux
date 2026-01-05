import 'package:flutter/material.dart';
import '../../constants/text_styles.dart';
import '../../l10n/app_localizations.dart';

enum SubscriptionButtonStyle {
  main,
  alternative,
}

class SubscriptionButton extends StatelessWidget {
  final bool isLoading;
  final bool hasTrialEligibility;
  final VoidCallback? onPressed;
  final SubscriptionButtonStyle buttonStyle;
  final String? customText;

  const SubscriptionButton({
    super.key,
    required this.isLoading,
    required this.hasTrialEligibility,
    required this.onPressed,
    this.buttonStyle = SubscriptionButtonStyle.main,
    this.customText,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return ElevatedButton(
      onPressed: isLoading ? () {} : onPressed,
      style: _getButtonStyle(context),
      child: isLoading
          ? SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: _getTextColor(context),
              ),
            )
          : Text(
              _getButtonText(localizations),
              style: _getTextStyle(context),
            ),
    );
  }

  ButtonStyle _getButtonStyle(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    switch (buttonStyle) {
      case SubscriptionButtonStyle.main:
        return ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(vertical: 16),
          elevation: 8,
          shadowColor: colorScheme.primary.withValues(alpha: 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        );
      case SubscriptionButtonStyle.alternative:
        return ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        );
    }
  }

  Color _getTextColor(BuildContext context) {
    return Theme.of(context).colorScheme.onPrimary;
  }

  TextStyle _getTextStyle(BuildContext context) {
    final baseStyle = buttonStyle == SubscriptionButtonStyle.main
        ? AppTextStyles.getH5Style(context)
        : AppTextStyles.getBodyStyle(context);

    return baseStyle.copyWith(
      color: _getTextColor(context),
      fontWeight: FontWeight.bold,
    );
  }

  String _getButtonText(AppLocalizations localizations) {
    if (customText != null) {
      return customText!;
    }

    if (hasTrialEligibility) {
      return localizations.startFreeSevenDays;
    }

    return localizations.startNow;
  }
}
