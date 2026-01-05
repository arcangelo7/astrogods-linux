import 'package:flutter/material.dart';
import '../../constants/text_styles.dart';
import '../../models/subscription_plan.dart';
import '../../l10n/app_localizations.dart';

class PlanBadgeWidget extends StatelessWidget {
  final PlanBadge badge;

  const PlanBadgeWidget({
    super.key,
    required this.badge,
  });

  @override
  Widget build(BuildContext context) {
    if (badge == PlanBadge.none) {
      return const SizedBox.shrink();
    }

    final localizations = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    final BadgeData badgeData = _getBadgeData(badge, localizations, colorScheme);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        gradient: badgeData.gradient,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: badgeData.shadowColor,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            badgeData.icon,
            color: badgeData.iconColor,
            size: 16,
          ),
          const SizedBox(width: 6),
          Text(
            badgeData.label,
            style: AppTextStyles.getBodyStyle(context).copyWith(
              color: badgeData.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  BadgeData _getBadgeData(
    PlanBadge badge,
    AppLocalizations localizations,
    ColorScheme colorScheme,
  ) {
    switch (badge) {
      case PlanBadge.currentPlan:
        return BadgeData(
          label: localizations.currentPlan,
          icon: Icons.check_circle,
          iconColor: colorScheme.onPrimary,
          textColor: colorScheme.onPrimary,
          gradient: LinearGradient(
            colors: [
              colorScheme.primary,
              colorScheme.primary.withValues(alpha: 0.8),
            ],
          ),
          shadowColor: colorScheme.primary.withValues(alpha: 0.3),
        );
      case PlanBadge.upgrade:
        return BadgeData(
          label: localizations.upgrade,
          icon: Icons.arrow_upward,
          iconColor: colorScheme.onSecondaryContainer,
          textColor: colorScheme.onSecondaryContainer,
          gradient: LinearGradient(
            colors: [
              colorScheme.secondaryContainer,
              colorScheme.secondaryContainer.withValues(alpha: 0.8),
            ],
          ),
          shadowColor: colorScheme.secondaryContainer.withValues(alpha: 0.3),
        );
      case PlanBadge.downgrade:
        return BadgeData(
          label: localizations.downgrade,
          icon: Icons.arrow_downward,
          iconColor: colorScheme.onSurfaceVariant,
          textColor: colorScheme.onSurfaceVariant,
          gradient: LinearGradient(
            colors: [
              colorScheme.surfaceContainerHighest,
              colorScheme.surfaceContainerHighest.withValues(alpha: 0.8),
            ],
          ),
          shadowColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        );
      case PlanBadge.none:
        return BadgeData(
          label: '',
          icon: Icons.help,
          iconColor: colorScheme.onSurface,
          textColor: colorScheme.onSurface,
          gradient: const LinearGradient(colors: [Colors.transparent, Colors.transparent]),
          shadowColor: Colors.transparent,
        );
    }
  }
}

class BadgeData {
  final String label;
  final IconData icon;
  final Color iconColor;
  final Color textColor;
  final LinearGradient gradient;
  final Color shadowColor;

  BadgeData({
    required this.label,
    required this.icon,
    required this.iconColor,
    required this.textColor,
    required this.gradient,
    required this.shadowColor,
  });
}
