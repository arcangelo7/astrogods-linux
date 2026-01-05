import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../models/birth_chart.dart';
import '../models/transit.dart';
import '../models/reading_chunk.dart';
import '../providers/theme_provider.dart';
import '../services/transit_service.dart' as transit;
import '../utils/snackbar_utils.dart';
import '../widgets/reading_screen_layout.dart';
import '../widgets/transit_header.dart';
import '../widgets/reading_content.dart';
import '../widgets/pdf_download_widget.dart';
import '../constants/text_styles.dart';
import '../l10n/app_localizations.dart';

class TransitReadingScreen extends StatefulWidget {
  final BirthChart birthChart;
  final String transitType; // 'daily' or 'monthly'
  final DateTime? date;
  final int? year;
  final int? month;
  final Map<String, dynamic> location;
  final String? existingReading;
  final int? readingId;
  final bool chartOnly;

  const TransitReadingScreen({
    super.key,
    required this.birthChart,
    required this.transitType,
    required this.location,
    this.date,
    this.year,
    this.month,
    this.existingReading,
    this.readingId,
    this.chartOnly = false,
  });

  @override
  State<TransitReadingScreen> createState() => _TransitReadingScreenState();
}

class _TransitReadingScreenState extends State<TransitReadingScreen> {
  late final transit.TransitService _service;
  bool _isGenerating = false;
  bool _hasError = false;
  String? _errorMessage;
  String _generatedContent = '';
  StreamSubscription<ReadingChunk>? _subscription;

  Timer? _updateTimer;
  bool _hasPendingUpdate = false;
  static const _updateInterval = Duration(milliseconds: 100);

  void _scheduleUpdate() {
    _hasPendingUpdate = true;
    _updateTimer ??= Timer.periodic(_updateInterval, (_) {
      if (_hasPendingUpdate && mounted) {
        _hasPendingUpdate = false;
        setState(() {});
      }
    });
  }

  void _flushUpdate() {
    _updateTimer?.cancel();
    _updateTimer = null;
    if (_hasPendingUpdate && mounted) {
      _hasPendingUpdate = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _service = transit.TransitService(context: context);

    if (widget.chartOnly) return;

    // If we have an existing reading, use it
    if (widget.existingReading != null) {
      _generatedContent = widget.existingReading!;
    } else {
      // Start generation immediately like synastry does
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _generateReading();
      });
    }
  }

  @override
  void dispose() {
    _updateTimer?.cancel();
    _subscription?.cancel();
    super.dispose();
  }

  String get _readingTitle {
    final l10n = AppLocalizations.of(context)!;
    if (widget.transitType == 'daily') {
      return '${l10n.dailyPredictions} - ${widget.birthChart.fullName}';
    } else {
      return '${l10n.monthlyPredictions} - ${widget.birthChart.fullName}';
    }
  }

  TransitLocation get _transitLocation {
    return TransitLocation(
      place: widget.location['place'] as String,
      latitude: (widget.location['latitude'] as num).toDouble(),
      longitude: (widget.location['longitude'] as num).toDouble(),
      timezone: widget.location['timezone'] as String,
    );
  }

  DailyTransitReading? get _dailyTransitReading {
    if (widget.transitType != 'daily' ||
        widget.readingId == null ||
        widget.date == null) {
      return null;
    }
    final reading =
        _generatedContent.isNotEmpty ? _generatedContent : widget.existingReading;
    if (reading == null) return null;

    return DailyTransitReading(
      readingId: widget.readingId!,
      reading: reading,
      date: widget.date!,
      location: _transitLocation,
    );
  }

  MonthlyTransitReading? get _monthlyTransitReading {
    if (widget.transitType != 'monthly' ||
        widget.readingId == null ||
        widget.year == null ||
        widget.month == null) {
      return null;
    }
    final reading =
        _generatedContent.isNotEmpty ? _generatedContent : widget.existingReading;
    if (reading == null) return null;

    return MonthlyTransitReading(
      readingId: widget.readingId!,
      reading: reading,
      year: widget.year!,
      month: widget.month!,
      location: _transitLocation,
    );
  }

  Future<void> _generateReading() async {
    if (_isGenerating) return;

    setState(() {
      _isGenerating = true;
      _hasError = false;
      _errorMessage = null;
      _generatedContent = '';
    });

    try {
      _subscription?.cancel();

      if (widget.transitType == 'daily') {
        _subscription = _service
            .streamDailyTransit(widget.readingId!)
            .listen(
              _handleStreamData,
              onError: _handleStreamError,
              onDone: _handleStreamDone,
            );
      } else {
        _subscription = _service
            .streamMonthlyTransit(widget.readingId!)
            .listen(
              _handleStreamData,
              onError: _handleStreamError,
              onDone: _handleStreamDone,
            );
      }
    } catch (e) {
      _handleStreamError(e);
    }
  }

  void _handleStreamData(ReadingChunk chunk) {
    if (!mounted) return;

    if (chunk.isReconnecting) {
      return;
    } else if (chunk.hasError) {
      _hasError = true;
      _errorMessage = chunk.error;
      _isGenerating = false;
      _flushUpdate();
    } else if (chunk.isComplete) {
      _isGenerating = false;
      _flushUpdate();
    } else {
      _generatedContent += chunk.content;
      _scheduleUpdate();
    }
  }

  void _handleStreamError(dynamic error) {
    if (!mounted) return;

    _hasError = true;
    _errorMessage = error.toString();
    _isGenerating = false;
    _flushUpdate();

    if (error is transit.SubscriptionRequiredException) {
      SnackbarUtils.showError(
        context,
        AppLocalizations.of(context)!.subscriptionRequiredMessage,
      );
    } else {
      SnackbarUtils.showError(context, _errorMessage!);
    }
  }

  void _handleStreamDone() {
    if (!mounted) return;

    _isGenerating = false;
    _flushUpdate();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.select<ThemeProvider, bool>((p) => p.isDarkMode);

    return ReadingScreenLayout(
      darkMode: isDarkMode,
      personAName: widget.birthChart.fullName,
      appBar: AppBar(
        title: Text(_readingTitle),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/predictions');
            }
          },
        ),
      ),
      header: TransitHeader(
        birthChart: widget.birthChart,
        transitType: widget.transitType,
        date: widget.date,
        year: widget.year,
        month: widget.month,
        location: widget.location['place'],
      ),
      transitId: widget.readingId,
      transitType: widget.transitType,
      content: _buildContent(),
    );
  }

  Widget _buildContent() {
    if (widget.chartOnly) {
      return _buildChartOnlyContent();
    }

    return ReadingContent(
      reading: _generatedContent.isNotEmpty ? _generatedContent : null,
      generatedContent: _generatedContent,
      isGenerating: _isGenerating,
      hasError: _hasError,
      currentTopic: '',
      error: _errorMessage,
      emptyStateWidget: null,
      errorStateBuilder: (error) => _buildErrorState(error),
      birthChart: widget.birthChart,
      readingModel: null,
      dailyTransit: _dailyTransitReading,
      monthlyTransit: _monthlyTransitReading,
    );
  }

  Widget _buildChartOnlyContent() {
    return Center(
      child: PdfDownloadWidget(
        type: widget.transitType == 'daily'
            ? PdfDownloadType.dailyTransit
            : PdfDownloadType.monthlyTransit,
        birthChart: widget.birthChart,
        dailyTransit: widget.transitType == 'daily'
            ? DailyTransitReading(
                readingId: widget.readingId!,
                reading: '',
                date: widget.date!,
                location: _transitLocation,
              )
            : null,
        monthlyTransit: widget.transitType == 'monthly'
            ? MonthlyTransitReading(
                readingId: widget.readingId!,
                reading: '',
                year: widget.year!,
                month: widget.month!,
                location: _transitLocation,
              )
            : null,
        chartOnly: true,
      ),
    );
  }

  Widget _buildErrorState(String error) {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 24),
            Text(
              l10n.errorTitle,
              style: AppTextStyles.getH5Style(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              error,
              style: AppTextStyles.getBodyStyle(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _hasError = false;
                  _errorMessage = null;
                  _generatedContent = '';
                });
                _generateReading();
              },
              icon: const Icon(Icons.refresh),
              label: Text(l10n.retry),
            ),
          ],
        ),
      ),
    );
  }
}
