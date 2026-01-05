import 'dart:async';
import 'package:flutter/foundation.dart';
import '../models/reading.dart';

class ReadingStateService extends ChangeNotifier {
  static final ReadingStateService _instance = ReadingStateService._internal();
  factory ReadingStateService() => _instance;
  ReadingStateService._internal();

  final ValueNotifier<int> readingCompletedNotifier = ValueNotifier<int>(0);
  final Map<int, _ReadingState> _readingStates = {};
  final Map<String, String> _svgCache = {};
  final Map<String, String> _detailsSvgCache = {};
  final Map<String, String> _aspectGridSvgCache = {};
  final Map<int, Map<String, dynamic>> _lunarPhaseCache = {};
  StreamSubscription<dynamic>? _activeSubscription;
  int? _activeChartId;

  Timer? _notifyTimer;
  bool _hasPendingNotification = false;
  static const _notifyInterval = Duration(milliseconds: 100);

  void _scheduleNotification() {
    _hasPendingNotification = true;
    _notifyTimer ??= Timer.periodic(_notifyInterval, (_) {
      if (_hasPendingNotification) {
        _hasPendingNotification = false;
        notifyListeners();
      }
    });
  }

  void _flushNotification() {
    _notifyTimer?.cancel();
    _notifyTimer = null;
    _hasPendingNotification = false;
    notifyListeners();
  }

  String _svgKey(String type, int id) => '${type}_$id';
  String _svgKeyWithMode(String type, int id, bool darkMode) =>
      '${type}_${id}_${darkMode ? 'dark' : 'light'}';

  void cacheChartSvg(String type, int id, String svg) {
    _svgCache[_svgKey(type, id)] = svg;
  }

  String? getCachedChartSvg(String type, int id) {
    return _svgCache[_svgKey(type, id)];
  }

  void cacheDetailsSvg(String type, int id, String svg, {required bool darkMode}) {
    _detailsSvgCache[_svgKeyWithMode(type, id, darkMode)] = svg;
  }

  String? getCachedDetailsSvg(String type, int id, {required bool darkMode}) {
    return _detailsSvgCache[_svgKeyWithMode(type, id, darkMode)];
  }

  void cacheAspectGridSvg(String type, int id, String svg, {required bool darkMode}) {
    _aspectGridSvgCache[_svgKeyWithMode(type, id, darkMode)] = svg;
  }

  String? getCachedAspectGridSvg(String type, int id, {required bool darkMode}) {
    return _aspectGridSvgCache[_svgKeyWithMode(type, id, darkMode)];
  }

  void cacheLunarPhase(int birthChartId, Map<String, dynamic> data) {
    _lunarPhaseCache[birthChartId] = data;
  }

  Map<String, dynamic>? getCachedLunarPhase(int birthChartId) {
    return _lunarPhaseCache[birthChartId];
  }

  // Remove this method as it exposes private type

  bool isGenerating(int chartId) =>
      _readingStates[chartId]?.isGenerating ?? false;

  String getGeneratedContent(int chartId) =>
      _readingStates[chartId]?.generatedContent ?? '';

  String getCurrentTopic(int chartId) =>
      _readingStates[chartId]?.currentTopic ?? '';

  Reading? getReading(int chartId) => _readingStates[chartId]?.reading;

  bool hasActiveSubscription(int chartId) {
    return _activeChartId == chartId && _activeSubscription != null;
  }

  void startGeneration(int chartId, Stream<dynamic> readingStream) {
    // Stop any existing generation
    stopGeneration();

    _activeChartId = chartId;
    _readingStates[chartId] = _ReadingState(
      isGenerating: true,
      generatedContent: '',
      currentTopic: '',
    );

    _activeSubscription = readingStream.listen(
      (chunk) {
        final state = _readingStates[chartId];
        if (state == null) return;

        if (chunk.hasError) {
          _readingStates[chartId] = state.copyWith(
            isGenerating: false,
            hasError: true,
            error: chunk.error,
            errorKey: chunk.errorKey,
            isSubscriptionRequired: chunk.isSubscriptionRequired,
          );
          _activeSubscription?.cancel();
          _activeSubscription = null;
          _activeChartId = null;
          _flushNotification();
          return;
        }

        String updatedContent = state.generatedContent;
        String updatedTopic = state.currentTopic;

        if (chunk.isSectionEnd) {
          updatedContent += '\n\n';
        } else if (chunk.isTopicChange) {
          updatedTopic = chunk.topic;
          if (updatedContent.isNotEmpty) {
            updatedContent += '\n\n**${chunk.topic}**\n\n';
          } else {
            updatedContent = '**${chunk.topic}**\n\n';
          }
        } else if (chunk.content.isNotEmpty) {
          updatedContent += chunk.content;
        }

        _readingStates[chartId] = state.copyWith(
          generatedContent: updatedContent,
          currentTopic: updatedTopic,
        );

        if (chunk.isComplete) {
          final String finalContent = updatedContent.isNotEmpty
              ? updatedContent
              : chunk.content;

          if (finalContent.trim().isNotEmpty) {
            final readingId = chunk.readingId;
            _readingStates[chartId] = state.copyWith(
              isGenerating: false,
              reading: readingId != null
                  ? Reading(
                      id: readingId,
                      reading: finalContent,
                      birthChartId: chartId,
                    )
                  : null,
              generatedContent: finalContent,
            );
          }

          _activeSubscription?.cancel();
          _activeSubscription = null;
          _activeChartId = null;
          readingCompletedNotifier.value++;
          _flushNotification();
        } else {
          _scheduleNotification();
        }
      },
      onError: (error) {
        final state = _readingStates[chartId];
        if (state != null) {
          _readingStates[chartId] = state.copyWith(
            isGenerating: false,
            hasError: true,
            error: error.toString(),
            isSubscriptionRequired: error is SubscriptionRequiredException,
          );
        }
        _activeSubscription?.cancel();
        _activeSubscription = null;
        _activeChartId = null;
        _flushNotification();
      },
    );

    notifyListeners();
  }

  void stopGeneration() {
    _activeSubscription?.cancel();
    _activeSubscription = null;

    if (_activeChartId != null) {
      final state = _readingStates[_activeChartId!];
      if (state != null && state.isGenerating) {
        _readingStates[_activeChartId!] = state.copyWith(isGenerating: false);
      }
    }

    _activeChartId = null;
    _flushNotification();
  }

  void setExistingReading(int chartId, Reading reading) {
    _readingStates[chartId] = _ReadingState(
      reading: reading,
      isGenerating: false,
      generatedContent: reading.reading,
      currentTopic: '',
    );
    notifyListeners();
  }

  void clearReadingState(int chartId) {
    if (_activeChartId == chartId) {
      stopGeneration();
    }
    _readingStates.remove(chartId);
    notifyListeners();
  }

  bool hasError(int chartId) => _readingStates[chartId]?.hasError ?? false;
  String? getError(int chartId) => _readingStates[chartId]?.error;

  String? getErrorKey(int chartId) => _readingStates[chartId]?.errorKey;
  bool isSubscriptionRequired(int chartId) =>
      _readingStates[chartId]?.isSubscriptionRequired ?? false;

  @override
  void dispose() {
    _notifyTimer?.cancel();
    _activeSubscription?.cancel();
    _readingStates.clear();
    _svgCache.clear();
    _detailsSvgCache.clear();
    _aspectGridSvgCache.clear();
    _lunarPhaseCache.clear();
    super.dispose();
  }
}

class _ReadingState {
  final Reading? reading;
  final bool isGenerating;
  final String generatedContent;
  final String currentTopic;
  final bool hasError;
  final String? error;
  final String? errorKey;
  final bool isSubscriptionRequired;

  const _ReadingState({
    this.reading,
    required this.isGenerating,
    required this.generatedContent,
    required this.currentTopic,
    this.hasError = false,
    this.error,
    this.errorKey,
    this.isSubscriptionRequired = false,
  });

  _ReadingState copyWith({
    Reading? reading,
    bool? isGenerating,
    String? generatedContent,
    String? currentTopic,
    bool? hasError,
    String? error,
    String? errorKey,
    bool? isSubscriptionRequired,
  }) {
    return _ReadingState(
      reading: reading ?? this.reading,
      isGenerating: isGenerating ?? this.isGenerating,
      generatedContent: generatedContent ?? this.generatedContent,
      currentTopic: currentTopic ?? this.currentTopic,
      hasError: hasError ?? this.hasError,
      error: error ?? this.error,
      errorKey: errorKey ?? this.errorKey,
      isSubscriptionRequired: isSubscriptionRequired ?? this.isSubscriptionRequired,
    );
  }
}

class SubscriptionRequiredException implements Exception {
  final String message;
  SubscriptionRequiredException(this.message);
}