import 'package:flutter/material.dart';
import '../models/birth_chart.dart';
import '../constants/text_styles.dart';
import '../utils/date_utils.dart' as date_utils;
import '../l10n/app_localizations.dart';

class TransitHeader extends StatelessWidget {
  final BirthChart birthChart;
  final String transitType; // 'daily' or 'monthly'
  final DateTime? date;
  final int? year;
  final int? month;
  final String? location;

  const TransitHeader({
    super.key,
    required this.birthChart,
    required this.transitType,
    this.date,
    this.year,
    this.month,
    this.location,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          // Main title
          Text(
            transitType == 'daily'
              ? l10n.dailyPredictions
              : l10n.monthlyPredictions,
            style: AppTextStyles.getH5Style(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),

          // Subtitle with person name
          Text(
            '${l10n.transitFor} ${birthChart.fullName}',
            style: AppTextStyles.getSubtitleLargeStyle(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          // Transit info layout
          Row(
            children: [
              Expanded(
                child: _buildPersonInfo(context, birthChart),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _buildTransitInfo(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPersonInfo(BuildContext context, BirthChart birthChart) {
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

  Widget _buildTransitInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          transitType == 'daily' ? AppLocalizations.of(context)!.dailySkyOf : AppLocalizations.of(context)!.monthlySkyOf,
          style: AppTextStyles.getBodyStyle(context).copyWith(
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          transitType == 'daily' && date != null
              ? date_utils.DateUtils.formatDate(context, date!)
              : transitType == 'monthly' && year != null && month != null
                  ? date_utils.DateUtils.formatMonthYear(context, month!, year!)
                  : '',
          style: AppTextStyles.getCaptionStyle(context),
          textAlign: TextAlign.center,
        ),
        if (location != null && location!.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            location!,
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