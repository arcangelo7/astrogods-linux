import 'package:flutter/material.dart';
import '../models/synastry.dart';
import '../models/birth_chart.dart';
import '../constants/text_styles.dart';
import '../utils/date_utils.dart' as date_utils;
import '../l10n/app_localizations.dart';

class SynastryHeader extends StatelessWidget {
  final Synastry synastry;

  const SynastryHeader({
    super.key,
    required this.synastry,
  });

  @override
  Widget build(BuildContext context) {
    final chartA = synastry.birthChartA!;
    final chartB = synastry.birthChartB!;
    final nameA = chartA.fullName;
    final nameB = chartB.fullName;


    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          // Main title
          Text(
            AppLocalizations.of(context)!.synastryBetween(nameA, nameB),
            style: AppTextStyles.getH5Style(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          // Person data layout
          Row(
            children: [
              Expanded(
                child: _buildPersonInfo(
                  context,
                  chartA,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _buildPersonInfo(
                  context,
                  chartB,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPersonInfo(
    BuildContext context,
    BirthChart birthChart,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          birthChart.fullName,
          style: AppTextStyles.getBodyStyle(context).copyWith(
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          date_utils.DateUtils.formatBirthDateTime(context, birthChart),
          style: AppTextStyles.getCaptionStyle(context),
          textAlign: TextAlign.center,
        ),
        if (birthChart.place != null && birthChart.place!.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            birthChart.place!,
            style: AppTextStyles.getCaptionStyle(context).copyWith(
              fontSize: 11,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }
}