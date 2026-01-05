import 'package:flutter/material.dart';
import '../../constants/text_styles.dart';

enum FeaturesDisplayStyle {
  main,
  alternative,
  normal,
}

class PlanFeatures extends StatelessWidget {
  final List<String> features;
  final List<String>? excludedFeatures;
  final FeaturesDisplayStyle displayStyle;

  const PlanFeatures({
    super.key,
    required this.features,
    this.excludedFeatures,
    this.displayStyle = FeaturesDisplayStyle.normal,
  });

  @override
  Widget build(BuildContext context) {
    if (displayStyle == FeaturesDisplayStyle.alternative) {
      return Text(
        'Tutte le funzioni Premium',
        style: AppTextStyles.getBodyStyle(context),
        textAlign: TextAlign.center,
      );
    }

    final colorScheme = Theme.of(context).colorScheme;
    final isMain = displayStyle == FeaturesDisplayStyle.main;

    return Column(
      children: [
        ...features.map(
          (feature) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Icon(
                  isMain ? Icons.check_circle : Icons.check,
                  color: colorScheme.primary,
                  size: 20,
                ),
                SizedBox(width: isMain ? 12 : 8),
                Expanded(
                  child: Text(
                    feature,
                    style: AppTextStyles.getBodyStyle(context),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (excludedFeatures != null)
          ...excludedFeatures!.map(
            (feature) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Icon(
                    Icons.close,
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      feature,
                      style: AppTextStyles.getBodyStyle(context).copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
