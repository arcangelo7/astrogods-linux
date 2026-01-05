import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/birth_chart.dart';
import '../models/synastry.dart';
import '../models/transit.dart';
import '../models/reading.dart';
import 'formatted_markdown_content.dart';
import 'pdf_download_widget.dart';

class ReadingContent extends StatelessWidget {
  final String? reading;
  final String generatedContent;
  final bool isGenerating;
  final bool hasError;
  final String currentTopic;
  final String? error;
  final Widget? emptyStateWidget;
  final Widget Function(String error) errorStateBuilder;
  final BirthChart? birthChart;
  final Synastry? synastry;
  final Reading? readingModel;
  final DailyTransitReading? dailyTransit;
  final MonthlyTransitReading? monthlyTransit;

  const ReadingContent({
    super.key,
    this.reading,
    required this.generatedContent,
    required this.isGenerating,
    required this.hasError,
    required this.currentTopic,
    this.error,
    this.emptyStateWidget,
    required this.errorStateBuilder,
    this.birthChart,
    this.synastry,
    this.readingModel,
    this.dailyTransit,
    this.monthlyTransit,
  });

  Widget _buildPdfDownloadWidget() {
    if (birthChart != null && readingModel != null && synastry == null) {
      return PdfDownloadWidget(
        type: PdfDownloadType.birthChart,
        birthChart: birthChart,
        reading: readingModel,
      );
    } else if (synastry != null && readingModel != null) {
      return PdfDownloadWidget(
        type: PdfDownloadType.synastry,
        synastry: synastry,
        reading: readingModel,
      );
    } else if (dailyTransit != null && birthChart != null) {
      return PdfDownloadWidget(
        type: PdfDownloadType.dailyTransit,
        birthChart: birthChart,
        dailyTransit: dailyTransit,
      );
    } else if (monthlyTransit != null && birthChart != null) {
      return PdfDownloadWidget(
        type: PdfDownloadType.monthlyTransit,
        birthChart: birthChart,
        monthlyTransit: monthlyTransit,
      );
    }
    return const SizedBox.shrink();
  }

  bool get _canShowPdfButton {
    return readingModel != null ||
        dailyTransit != null ||
        monthlyTransit != null;
  }

  @override
  Widget build(BuildContext context) {
    if (reading == null &&
        generatedContent.isEmpty &&
        !isGenerating &&
        !hasError) {
      return emptyStateWidget ?? const SizedBox.shrink();
    } else if (hasError && !isGenerating) {
      return errorStateBuilder(error!);
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (reading != null || generatedContent.isNotEmpty) ...[
            FormattedMarkdownContent(
              content: reading ?? generatedContent,
            ),
            if (!isGenerating && reading != null && _canShowPdfButton) ...[
              const SizedBox(height: 24),
              Center(
                child: _buildPdfDownloadWidget(),
              ),
            ],
          ],
          if (isGenerating) ...[
            const SizedBox(height: 16),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    currentTopic.isNotEmpty
                        ? AppLocalizations.of(context)!
                            .generatingTopic(currentTopic)
                        : AppLocalizations.of(context)!.generatingReading,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ],
      );
    }
  }
}
