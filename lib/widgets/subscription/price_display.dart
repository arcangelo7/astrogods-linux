import 'package:flutter/material.dart';
import '../../constants/text_styles.dart';
import '../../l10n/app_localizations.dart';

enum PriceDisplayStyle {
  main,
  alternative,
  normal,
}

class PriceDisplay extends StatelessWidget {
  final String price;
  final String period;
  final String? originalPrice;
  final String? discount;
  final String? saveAmount;
  final String? annualTotal;
  final String? extraInfo;
  final PriceDisplayStyle displayStyle;

  const PriceDisplay({
    super.key,
    required this.price,
    required this.period,
    this.originalPrice,
    this.discount,
    this.saveAmount,
    this.annualTotal,
    this.extraInfo,
    this.displayStyle = PriceDisplayStyle.normal,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        if (discount != null) ...[
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: colorScheme.error.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              discount!,
              style: AppTextStyles.getCaptionStyle(context).copyWith(
                color: colorScheme.error,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
        ],
        _buildPriceRow(context, colorScheme),
        if (annualTotal != null) ...[
          const SizedBox(height: 8),
          Text(
            localizations.billedAnnuallyAt(annualTotal!),
            style: AppTextStyles.getCaptionStyle(context),
            textAlign: TextAlign.center,
          ),
        ],
        if (saveAmount != null) ...[
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.red.shade200),
            ),
            child: Text(
              localizations.saveAmount(saveAmount!),
              style: AppTextStyles.getBodyStyle(context).copyWith(
                color: Colors.red.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        if (extraInfo != null) ...[
          const SizedBox(height: 4),
          Text(
            extraInfo!,
            style: AppTextStyles.getBodyStyle(context).copyWith(
              color: Colors.red.shade700,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }

  Widget _buildPriceRow(BuildContext context, ColorScheme colorScheme) {
    switch (displayStyle) {
      case PriceDisplayStyle.main:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            if (originalPrice != null) ...[
              Text(
                originalPrice!,
                style: AppTextStyles.getH4Style(context).copyWith(
                  decoration: TextDecoration.lineThrough,
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(width: 12),
            ],
            Text(
              price,
              style: AppTextStyles.getH1Style(context).copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
            Text(
              '/$period',
              style: AppTextStyles.getBodyStyle(context),
            ),
          ],
        );
      case PriceDisplayStyle.alternative:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              price,
              style: AppTextStyles.getH3Style(context).copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '/$period',
              style: AppTextStyles.getBodyStyle(context),
            ),
          ],
        );
      case PriceDisplayStyle.normal:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              price,
              style: AppTextStyles.getH1Style(context).copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '/$period',
              style: AppTextStyles.getCaptionStyle(context),
            ),
          ],
        );
    }
  }
}
