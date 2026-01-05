import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../models/synastry.dart';
import '../providers/theme_provider.dart';
import '../services/synastry_service.dart';
import '../services/reading_state_service.dart';
import '../utils/snackbar_utils.dart';
import '../widgets/reading_screen_layout.dart';
import '../widgets/synastry_header.dart';
import '../widgets/reading_content.dart';
import '../widgets/pdf_download_widget.dart';
import '../services/api_client.dart';
import '../utils/session_utils.dart';
import '../constants/text_styles.dart';
import '../l10n/app_localizations.dart';

class SynastryReadingScreen extends StatefulWidget {
  final Synastry synastry;
  final bool chartOnly;

  const SynastryReadingScreen({
    super.key,
    required this.synastry,
    this.chartOnly = false,
  });

  @override
  State<SynastryReadingScreen> createState() => _SynastryReadingScreenState();
}

class _SynastryReadingScreenState extends State<SynastryReadingScreen> {
  late final SynastryService _service;
  late final ReadingStateService _readingStateService;
  bool _wasGenerating = false;

  @override
  void initState() {
    super.initState();
    _service = SynastryService(context: context);
    _readingStateService = ReadingStateService();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.chartOnly) return;

      // If state says generating but SSE subscription is dead, reset and restart
      // Check BEFORE _loadExistingReading to avoid HTTP interference
      if (mounted &&
          _readingStateService.isGenerating(widget.synastry.id) &&
          !_readingStateService.hasActiveSubscription(widget.synastry.id)) {
        _readingStateService.clearReadingState(widget.synastry.id);
        _generateReading();
        return;
      }

      await _loadExistingReading();

      if (mounted &&
          _readingStateService.getReading(widget.synastry.id) == null &&
          !_readingStateService.isGenerating(widget.synastry.id) &&
          !_readingStateService.hasError(widget.synastry.id)) {
        _generateReading();
      }
    });

    _readingStateService.addListener(_onReadingStateChanged);
  }

  @override
  void dispose() {
    _readingStateService.removeListener(_onReadingStateChanged);
    super.dispose();
  }

  void _onReadingStateChanged() {
    if (mounted) {
      final synastryId = widget.synastry.id;
      final isCurrentlyGenerating = _readingStateService.isGenerating(
        synastryId,
      );

      if (_readingStateService.hasError(synastryId) && _wasGenerating) {
        final error = _readingStateService.getError(synastryId);

        if (_readingStateService.isSubscriptionRequired(synastryId)) {
          SnackbarUtils.showError(
            context,
            AppLocalizations.of(context)!.subscriptionRequiredMessage,
          );
        } else {
          final errorKey = _readingStateService.getErrorKey(widget.synastry.id);
          if (!SessionUtils.handleSessionExpirationByKey(
            context,
            errorKey,
            error!,
          )) {
            SnackbarUtils.showError(context, error);
          }
        }
        _wasGenerating = false;
        setState(() {});
        return;
      }

      if (_wasGenerating &&
          !isCurrentlyGenerating &&
          _readingStateService.getReading(synastryId) != null) {
        _wasGenerating = false;
      }

      setState(() {});
    }
  }

  Future<void> _loadExistingReading() async {
    try {
      final existingReading = await _service.getSynastryReading(
        widget.synastry.id,
      );
      if (existingReading != null && mounted) {
        _readingStateService.setExistingReading(
          widget.synastry.id,
          existingReading,
        );
      }
    } catch (e) {
      // Reading doesn't exist yet, which is fine
    }
  }

  Future<void> _generateReading() async {
    if (_readingStateService.isGenerating(widget.synastry.id)) return;

    _wasGenerating = true;

    try {
      final stream = _service.streamSynastryReading(widget.synastry.id);
      _readingStateService.startGeneration(widget.synastry.id, stream);
    } catch (e) {
      _wasGenerating = false;
      if (mounted) {
        SessionUtils.handleApiException(
          context,
          e as ApiException,
          (message) => SnackbarUtils.showError(context, message),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.select<ThemeProvider, bool>((p) => p.isDarkMode);

    return ReadingScreenLayout(
      darkMode: isDarkMode,
      personAName: widget.synastry.birthChartA!.fullName,
      personBName: widget.synastry.birthChartB!.fullName,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.synastryBetween(
            widget.synastry.birthChartA!.fullName,
            widget.synastry.birthChartB!.fullName,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/relationships');
            }
          },
        ),
      ),
      header: SynastryHeader(synastry: widget.synastry),
      synastryId: widget.synastry.id,
      content: _buildContent(),
    );
  }

  Widget _buildContent() {
    if (widget.chartOnly) {
      return _buildChartOnlyContent();
    }

    final synastryId = widget.synastry.id;
    final isGenerating = _readingStateService.isGenerating(synastryId);
    final hasError = _readingStateService.hasError(synastryId);
    final reading = _readingStateService.getReading(synastryId);
    final generatedContent = _readingStateService.getGeneratedContent(
      synastryId,
    );
    final currentTopic = _readingStateService.getCurrentTopic(synastryId);
    final error = _readingStateService.getError(synastryId);

    return ReadingContent(
      reading: reading?.reading,
      generatedContent: generatedContent,
      isGenerating: isGenerating,
      hasError: hasError,
      currentTopic: currentTopic,
      error: error,
      emptyStateWidget: _buildEmptyState(),
      errorStateBuilder: (error) => _buildErrorState(error),
      synastry: widget.synastry,
      readingModel: reading,
    );
  }

  Widget _buildChartOnlyContent() {
    return Center(
      child: PdfDownloadWidget(
        type: PdfDownloadType.synastry,
        synastry: widget.synastry,
        chartOnly: true,
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              size: 64,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 24),
            Text(
              AppLocalizations.of(context)!.compatibilityAnalysis,
              style: AppTextStyles.getH5Style(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              AppLocalizations.of(
                context,
              )!.generateDetailedCompatibilityAnalysis(
                widget.synastry.relationshipTitle,
              ),
              style: AppTextStyles.getBodyStyle(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _generateReading,
              icon: const Icon(Icons.auto_awesome),
              label: Text(AppLocalizations.of(context)!.generateAnalysis),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(String error) {
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
              AppLocalizations.of(context)!.errorTitle,
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
                _readingStateService.clearReadingState(widget.synastry.id);
                _generateReading();
              },
              icon: const Icon(Icons.refresh),
              label: Text(AppLocalizations.of(context)!.retry),
            ),
          ],
        ),
      ),
    );
  }
}
