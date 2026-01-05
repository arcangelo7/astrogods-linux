import 'package:flutter/material.dart';
import '../../constants/text_styles.dart';
import '../../l10n/app_localizations.dart';

enum TrialContainerStyle {
  main,
  normal,
}

class TrialInfoContainer extends StatelessWidget {
  final TrialContainerStyle containerStyle;

  const TrialInfoContainer({
    super.key,
    this.containerStyle = TrialContainerStyle.normal,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final isMain = containerStyle == TrialContainerStyle.main;

    return Container(
      padding: EdgeInsets.all(isMain ? 16 : 12),
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.card_giftcard,
            color: colorScheme.primary,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            localizations.sevenDaysFreeTrial,
            style: AppTextStyles.getBodyStyle(context).copyWith(
              color: colorScheme.primary,
              fontWeight: isMain ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
