import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../config/image_urls.dart';
import '../models/cavern_details.dart';
import '../services/cavern_details_service.dart';
import '../widgets/starry_night_background.dart';
import '../widgets/formatted_markdown_content.dart';
import '../constants/text_styles.dart';
import '../l10n/app_localizations.dart';

class CavernDetailsScreen extends StatefulWidget {
  final int houseNumber;
  final Map<String, dynamic>? extra;

  const CavernDetailsScreen({super.key, required this.houseNumber, this.extra});

  @override
  State<CavernDetailsScreen> createState() => _CavernDetailsScreenState();
}

class _CavernDetailsScreenState extends State<CavernDetailsScreen> {
  CavernDetails? _cavernDetails;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadCavernDetails();
  }

  void _loadCavernDetails() {
    setState(() {
      _cavernDetails = CavernDetailsService.getCavernDetailsByHouse(widget.houseNumber, context);
    });
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Title centered and constrained like text content
        Center(
          child: Container(
            width: _getConstrainedWidth(context),
            constraints: _getConstrainedWidth(context) != double.infinity
                ? const BoxConstraints(maxWidth: 700.0)
                : null,
            child: Text(
              title,
              style: AppTextStyles.getH4Style(context),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Content can break out for tables
        FormattedMarkdownContent(
          content: content,
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  double _getConstrainedWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const maxTextWidth = 700.0;
    return screenWidth > maxTextWidth ? maxTextWidth : double.infinity;
  }

  void _showFullImage(String imagePath, String alt) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final screenSize = MediaQuery.of(context).size;
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(0),
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.95),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: InteractiveViewer(
                    panEnabled: true,
                    boundaryMargin: const EdgeInsets.all(100.0),
                    minScale: 1.0,
                    maxScale: 4.0,
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: ImageUrls.cavernHd(imagePath),
                        fit: BoxFit.contain,
                        memCacheWidth: (screenSize.width * MediaQuery.of(context).devicePixelRatio).toInt(),
                        placeholder: (context, url) => const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error_outline,
                          color: Colors.white,
                          size: 48,
                        ),
                      ),
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
                      size: 30,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 20,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        alt,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StarryNightBackground(
        showPlanet: false,
        subtle: true,
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                title: Text(l10n.cavernDetailsTitle),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/codex');
                    }
                  },
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                      padding: const EdgeInsets.all(16),
                child: _cavernDetails == null
                    ? Center(
                        child: Text(
                          l10n.cavernDetailsNotFound,
                          style: AppTextStyles.getBodyLargeStyle(context),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 20),
                          // Main title centered and constrained
                          Center(
                            child: Container(
                              width: _getConstrainedWidth(context),
                              constraints: _getConstrainedWidth(context) != double.infinity
                                  ? const BoxConstraints(maxWidth: 700.0)
                                  : null,
                              child: Text(
                                _cavernDetails!.title,
                                style: AppTextStyles.getH3Style(context),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Cavern image centered and constrained
                          if (_cavernDetails!.imagePath != null)
                            Center(
                              child: Container(
                                width: _getConstrainedWidth(context),
                                constraints: _getConstrainedWidth(context) != double.infinity
                                    ? const BoxConstraints(maxWidth: 700.0)
                                    : null,
                                child: GestureDetector(
                              onTap: () => _showFullImage(
                                _cavernDetails!.imagePath!,
                                _cavernDetails!.title,
                              ),
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(alpha: 0.2),
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Stack(
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: ImageUrls.cavern(_cavernDetails!.imagePath!),
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          memCacheWidth: (MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio).toInt(),
                                          placeholder: (context, url) => Container(
                                            height: 200,
                                            color: Theme.of(context).colorScheme.surfaceContainerHighest,
                                            child: const Center(
                                              child: CircularProgressIndicator(),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) => Container(
                                            height: 200,
                                            color: Theme.of(context).colorScheme.surfaceContainerHighest,
                                            child: const Center(
                                              child: Icon(
                                                Icons.image_not_supported,
                                                size: 48,
                                              ),
                                            ),
                                          ),
                                        ),
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
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                            ),
                          ),

                          const SizedBox(height: 32),

                          // Book of Caverns Introduction (always show for all caverns)
                          _buildSection(
                            l10n.generalIntroduction,
                            _cavernDetails!.introduction,
                          ),

                          // Literal meaning
                          _buildSection(
                            l10n.literalMeaning,
                            _cavernDetails!.literalMeaning,
                          ),

                          // Esoteric meaning
                          if (_cavernDetails!.esotericMeaning.isNotEmpty)
                            _buildSection(
                              l10n.esotericMeaning,
                              _cavernDetails!.esotericMeaning,
                            ),

                          const SizedBox(height: 32),
                        ],
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}