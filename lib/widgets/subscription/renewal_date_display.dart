import 'package:flutter/material.dart';
import '../../constants/text_styles.dart';
import '../../l10n/app_localizations.dart';
import '../../utils/date_utils.dart' as date_utils;

class RenewalDateDisplay extends StatelessWidget {
  final DateTime renewalDate;

  const RenewalDateDisplay({
    super.key,
    required this.renewalDate,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final formattedDate = date_utils.DateUtils.formatDate(context, renewalDate);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.calendar_today,
            color: colorScheme.primary,
            size: 18,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              '${localizations.nextRenewal}: $formattedDate',
              style: AppTextStyles.getCaptionStyle(context).copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
