import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../l10n/app_localizations.dart';
import '../services/birth_chart_service.dart';
import '../services/reading_state_service.dart';
import '../services/synastry_service.dart';
import '../services/transit_service.dart' as transit;

class _Constants {
  static const double maxChartWidth = 700.0;
  static const double desktopZoomFactor = 1.27;
  static const double dialogSizeFactor = 0.9;
  static const double dialogBorderRadius = 12.0;
  static const double zoomIconSize = 20.0;
  static const double closeIconSize = 30.0;
  static const double smallPageIndicatorSize = 8.0;
  static const double interactiveViewerMaxScale = 4.0;
  static const double interactiveViewerMinScale = 1.0;
  static const double navigationArrowSize = 40.0;
  static const double arrowButtonWidth = navigationArrowSize + 16.0;
}

enum _ChartType { birthChart, synastry, dailyTransit, monthlyTransit }

class _ChartSvgConfig {
  final _ChartType type;
  final int chartId;
  final String personAName;
  final String? personBName;

  const _ChartSvgConfig({
    required this.type,
    required this.chartId,
    required this.personAName,
    this.personBName,
  });

  bool get hasThreePages =>
      type == _ChartType.synastry ||
      type == _ChartType.dailyTransit ||
      type == _ChartType.monthlyTransit;

  int get pageCount => hasThreePages ? 3 : 2;

  Future<String> getMainSvg(BuildContext context, {required double zoom}) {
    switch (type) {
      case _ChartType.birthChart:
        return BirthChartService(
          context: context,
        ).getBirthChartSvg(chartId, zoom: zoom);
      case _ChartType.synastry:
        return SynastryService(
          context: context,
        ).getSynastrySvg(chartId, zoom: zoom);
      case _ChartType.dailyTransit:
        return transit.TransitService(
          context: context,
        ).getDailyTransitSvg(chartId, zoom: zoom);
      case _ChartType.monthlyTransit:
        return transit.TransitService(
          context: context,
        ).getMonthlyTransitSvg(chartId, zoom: zoom);
    }
  }

  Future<String>? getDetailsSvg(
    BuildContext context, {
    required double zoom,
    required bool darkMode,
  }) {
    switch (type) {
      case _ChartType.birthChart:
        return BirthChartService(
          context: context,
        ).getBirthChartDetailsSvg(chartId, zoom: zoom, darkMode: darkMode);
      case _ChartType.synastry:
        return SynastryService(
          context: context,
        ).getSynastryDetailsSvg(chartId, zoom: zoom, darkMode: darkMode);
      case _ChartType.dailyTransit:
        return transit.TransitService(
          context: context,
        ).getDailyTransitDetailsSvg(chartId, zoom: zoom, darkMode: darkMode);
      case _ChartType.monthlyTransit:
        return transit.TransitService(
          context: context,
        ).getMonthlyTransitDetailsSvg(chartId, zoom: zoom, darkMode: darkMode);
    }
  }

  Future<String>? getAspectGridSvg(
    BuildContext context, {
    required double zoom,
    required bool darkMode,
  }) {
    switch (type) {
      case _ChartType.birthChart:
        return null;
      case _ChartType.synastry:
        return SynastryService(
          context: context,
        ).getSynastryAspectGridSvg(chartId, zoom: zoom, darkMode: darkMode);
      case _ChartType.dailyTransit:
        return transit.TransitService(
          context: context,
        ).getDailyTransitAspectGridSvg(chartId, zoom: zoom, darkMode: darkMode);
      case _ChartType.monthlyTransit:
        return transit.TransitService(
          context: context,
        ).getMonthlyTransitAspectGridSvg(
          chartId,
          zoom: zoom,
          darkMode: darkMode,
        );
    }
  }

  static _ChartSvgConfig? create({
    int? birthChartId,
    int? synastryId,
    int? transitId,
    String? transitType,
    required String personAName,
    String? personBName,
  }) {
    if (birthChartId != null) {
      return _ChartSvgConfig(
        type: _ChartType.birthChart,
        chartId: birthChartId,
        personAName: personAName,
      );
    } else if (synastryId != null) {
      return _ChartSvgConfig(
        type: _ChartType.synastry,
        chartId: synastryId,
        personAName: personAName,
        personBName: personBName,
      );
    } else if (transitId != null && transitType != null) {
      final type = transitType == 'daily'
          ? _ChartType.dailyTransit
          : _ChartType.monthlyTransit;
      return _ChartSvgConfig(
        type: type,
        chartId: transitId,
        personAName: personAName,
      );
    }
    return null;
  }
}

class ChartSvgDisplay extends StatefulWidget {
  final Future<String>? svgFuture;
  final int? birthChartId;
  final int? synastryId;
  final int? transitId;
  final String? transitType;
  final String personAName;
  final String? personBName;
  final bool darkMode;

  const ChartSvgDisplay({
    super.key,
    this.svgFuture,
    this.birthChartId,
    this.synastryId,
    this.transitId,
    this.transitType,
    required this.personAName,
    this.personBName,
    required this.darkMode,
  });

  @override
  State<ChartSvgDisplay> createState() => _ChartSvgDisplayState();
}

class _ChartSvgDisplayState extends State<ChartSvgDisplay> {
  Future<String>? _cachedMainSvg;
  Future<String>? _cachedDetailsSvg;
  Future<String>? _cachedAspectGridSvg;
  _ChartSvgConfig? _config;
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    // Initialize from svgFuture if provided
    if (widget.svgFuture != null) {
      _cachedMainSvg = widget.svgFuture;
      return;
    }

    // Otherwise create config and fetch SVGs
    _config = _ChartSvgConfig.create(
      birthChartId: widget.birthChartId,
      synastryId: widget.synastryId,
      transitId: widget.transitId,
      transitType: widget.transitType,
      personAName: widget.personAName,
      personBName: widget.personBName,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_config != null && _cachedMainSvg == null) {
      final zoom = _getZoom();
      final stateService = ReadingStateService();

      // Load main SVG
      _cachedMainSvg = _config!.getMainSvg(context, zoom: zoom).then((svg) {
        stateService.cacheChartSvg(_config!.type.name, _config!.chartId, svg);
        return svg;
      });

      // Load details SVG for current theme
      final detailsFuture = _config!.getDetailsSvg(context, zoom: zoom, darkMode: widget.darkMode);
      _cachedDetailsSvg = detailsFuture?.then((svg) {
        stateService.cacheDetailsSvg(
          _config!.type.name, _config!.chartId, svg,
          darkMode: widget.darkMode,
        );
        return svg;
      });
      // Pre-cache light version for PDF generation (intentional: PDF always uses light mode
      // since it has white background and needs black text)
      if (widget.darkMode) {
        _config!.getDetailsSvg(context, zoom: zoom, darkMode: false)?.then((lightSvg) {
          stateService.cacheDetailsSvg(
            _config!.type.name, _config!.chartId, lightSvg,
            darkMode: false,
          );
        });
      }

      // Load aspect grid SVG for current theme (synastry/transits only)
      final aspectFuture = _config!.getAspectGridSvg(context, zoom: zoom, darkMode: widget.darkMode);
      _cachedAspectGridSvg = aspectFuture?.then((svg) {
        stateService.cacheAspectGridSvg(
          _config!.type.name, _config!.chartId, svg,
          darkMode: widget.darkMode,
        );
        return svg;
      });
      // Pre-cache light version for PDF generation
      if (widget.darkMode) {
        _config!.getAspectGridSvg(context, zoom: zoom, darkMode: false)?.then((lightSvg) {
          stateService.cacheAspectGridSvg(
            _config!.type.name, _config!.chartId, lightSvg,
            darkMode: false,
          );
        });
      }
    }
  }

  double _getZoom() {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > _Constants.maxChartWidth
        ? _Constants.desktopZoomFactor
        : 1.0;
  }

  void _showFullscreen() {
    if (_config == null) return;

    showDialog(
      context: context,
      builder: (context) =>
          _ChartFullscreenDialog(config: _config!, initialPage: _currentPage),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<String>? _getSvgForPage(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return _cachedMainSvg;
      case 1:
        return _cachedDetailsSvg;
      case 2:
        return _cachedAspectGridSvg;
      default:
        throw StateError('Invalid page index: $pageIndex');
    }
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth > _Constants.maxChartWidth
        ? _Constants.maxChartWidth
        : screenWidth;
    final height = containerWidth;

    final pageCount = _config?.pageCount ?? 1;
    final hasMultiplePages = pageCount > 1;
    final arrowSpace = _Constants.arrowButtonWidth * 2;
    final hasSpaceForArrows = screenWidth >= containerWidth + arrowSpace;
    final showArrows = hasSpaceForArrows && hasMultiplePages;
    final showLeftArrow = showArrows && _currentPage > 0;
    final showRightArrow = showArrows && _currentPage < pageCount - 1;

    final chartContent = SizedBox(
      width: containerWidth,
      height: height + (hasMultiplePages ? 30 : 0),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: pageCount,
              onPageChanged: (page) => setState(() => _currentPage = page),
              itemBuilder: (context, index) {
                return _SvgViewer(
                  svgFuture: _getSvgForPage(index),
                  onTap: _showFullscreen,
                );
              },
            ),
          ),
          if (hasMultiplePages)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: _PageIndicators(
                pageCount: pageCount,
                currentPage: _currentPage,
                size: _Constants.smallPageIndicatorSize,
                activeColor: Theme.of(context).colorScheme.primary,
                inactiveColor: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.3),
                onPageSelected: _goToPage,
              ),
            ),
        ],
      ),
    );

    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          if (_currentPage > 0) _goToPage(_currentPage - 1);
        },
        const SingleActivator(LogicalKeyboardKey.arrowRight): () {
          if (_currentPage < pageCount - 1) _goToPage(_currentPage + 1);
        },
      },
      child: Focus(
        autofocus: true,
        child: showArrows
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: _Constants.arrowButtonWidth,
                    child: showLeftArrow
                        ? IconButton(
                            icon: Icon(
                              Icons.chevron_left,
                              color: Theme.of(context).colorScheme.primary,
                              size: _Constants.navigationArrowSize,
                            ),
                            onPressed: () => _goToPage(_currentPage - 1),
                          )
                        : null,
                  ),
                  chartContent,
                  SizedBox(
                    width: _Constants.arrowButtonWidth,
                    child: showRightArrow
                        ? IconButton(
                            icon: Icon(
                              Icons.chevron_right,
                              color: Theme.of(context).colorScheme.primary,
                              size: _Constants.navigationArrowSize,
                            ),
                            onPressed: () => _goToPage(_currentPage + 1),
                          )
                        : null,
                  ),
                ],
              )
            : Center(child: chartContent),
      ),
    );
  }
}

class _SvgViewer extends StatelessWidget {
  final Future<String>? svgFuture;
  final VoidCallback? onTap;

  const _SvgViewer({required this.svgFuture, this.onTap});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: svgFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              AppLocalizations.of(
                context,
              )!.errorLoadingChart(snapshot.error.toString()),
              style: TextStyle(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
          );
        }

        final svgString = snapshot.data;
        if (svgString == null || svgString.trim().isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              AppLocalizations.of(context)!.chartNotAvailable,
              style: TextStyle(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
          );
        }

        return GestureDetector(
          onTap: onTap,
          child: MouseRegion(
            cursor: onTap != null
                ? SystemMouseCursors.click
                : MouseCursor.defer,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.surface.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  children: [
                    SizedBox.expand(
                      child: SvgPicture.string(
                        svgString,
                        fit: BoxFit.contain,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                    if (onTap != null)
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Icon(
                            Icons.zoom_in,
                            color: Colors.white,
                            size: _Constants.zoomIconSize,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PageIndicators extends StatelessWidget {
  final int pageCount;
  final int currentPage;
  final double size;
  final Color activeColor;
  final Color inactiveColor;
  final void Function(int)? onPageSelected;

  const _PageIndicators({
    required this.pageCount,
    required this.currentPage,
    required this.size,
    required this.activeColor,
    required this.inactiveColor,
    this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
        (index) => MouseRegion(
          cursor: onPageSelected != null
              ? SystemMouseCursors.click
              : MouseCursor.defer,
          child: GestureDetector(
            onTap: onPageSelected != null ? () => onPageSelected!(index) : null,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentPage == index ? activeColor : inactiveColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ChartFullscreenDialog extends StatefulWidget {
  final _ChartSvgConfig config;
  final int initialPage;

  const _ChartFullscreenDialog({
    required this.config,
    required this.initialPage,
  });

  @override
  State<_ChartFullscreenDialog> createState() => _ChartFullscreenDialogState();
}

class _ChartFullscreenDialogState extends State<_ChartFullscreenDialog> {
  late Future<String> _mainSvg;
  Future<String>? _detailsSvg;
  Future<String>? _aspectGridSvg;
  late int _currentPage;
  bool _svgsLoaded = false;
  final TransformationController _transformationController =
      TransformationController();

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_svgsLoaded) {
      _svgsLoaded = true;
      _mainSvg = widget.config.getMainSvg(context, zoom: 1.0);
      _detailsSvg = widget.config.getDetailsSvg(
        context,
        zoom: 1.0,
        darkMode: true,
      );
      _aspectGridSvg = widget.config.getAspectGridSvg(
        context,
        zoom: 1.0,
        darkMode: true,
      );
    }
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  Future<String>? _getSvgForPage(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return _mainSvg;
      case 1:
        return _detailsSvg;
      case 2:
        return _aspectGridSvg;
      default:
        throw StateError('Invalid page index: $pageIndex');
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _transformationController.value = Matrix4.identity();
      setState(() => _currentPage--);
    }
  }

  void _goToNextPage() {
    if (_currentPage < widget.config.pageCount - 1) {
      _transformationController.value = Matrix4.identity();
      setState(() => _currentPage++);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 768;
    final chartSize = isDesktop
        ? screenSize.width * 0.7
        : screenSize.width * 0.85;
    final pageCount = widget.config.pageCount;
    final hasMultiplePages = pageCount > 1;

    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.arrowLeft): _goToPreviousPage,
        const SingleActivator(LogicalKeyboardKey.arrowRight): _goToNextPage,
        const SingleActivator(LogicalKeyboardKey.escape): () =>
            Navigator.of(context).pop(),
      },
      child: Focus(
        autofocus: true,
        child: Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(0),
          child: Container(
            width: isDesktop
                ? screenSize.width * _Constants.dialogSizeFactor
                : screenSize.width,
            height: isDesktop
                ? screenSize.height * _Constants.dialogSizeFactor
                : screenSize.height,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.95),
              borderRadius: BorderRadius.circular(
                isDesktop ? _Constants.dialogBorderRadius : 0,
              ),
            ),
            child: Stack(
              children: [
                _buildFullscreenContent(chartSize),
                if (hasMultiplePages && _currentPage > 0)
                  Positioned(
                    left: 8,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.chevron_left,
                          color: Colors.white.withValues(alpha: 0.8),
                          size: _Constants.navigationArrowSize,
                        ),
                        onPressed: _goToPreviousPage,
                      ),
                    ),
                  ),
                if (hasMultiplePages && _currentPage < pageCount - 1)
                  Positioned(
                    right: 8,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.chevron_right,
                          color: Colors.white.withValues(alpha: 0.8),
                          size: _Constants.navigationArrowSize,
                        ),
                        onPressed: _goToNextPage,
                      ),
                    ),
                  ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: _Constants.closeIconSize,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                if (hasMultiplePages)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 20,
                    child: _PageIndicators(
                      pageCount: pageCount,
                      currentPage: _currentPage,
                      size: _Constants.smallPageIndicatorSize,
                      activeColor: Colors.white,
                      inactiveColor: Colors.white.withValues(alpha: 0.3),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFullscreenContent(double chartSize) {
    return FutureBuilder<String>(
      future: _getSvgForPage(_currentPage),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError || snapshot.data == null) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                AppLocalizations.of(
                  context,
                )!.errorLoadingChart(snapshot.error?.toString() ?? ''),
                style: const TextStyle(color: Colors.white70),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        final svgWidget = SizedBox(
          width: chartSize,
          height: chartSize,
          child: SvgPicture.string(
            snapshot.data!,
            fit: BoxFit.contain,
            allowDrawingOutsideViewBox: true,
          ),
        );

        return Positioned.fill(
          child: InteractiveViewer(
            transformationController: _transformationController,
            panEnabled: true,
            boundaryMargin: const EdgeInsets.all(100.0),
            minScale: _Constants.interactiveViewerMinScale,
            maxScale: _Constants.interactiveViewerMaxScale,
            child: Center(child: svgWidget),
          ),
        );
      },
    );
  }
}
