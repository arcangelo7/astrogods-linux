import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/theme_provider.dart';
import 'dart:convert';
import '../models/birth_chart.dart';
import '../services/birth_chart_service.dart';
import '../providers/auth_provider.dart';
import '../utils/snackbar_utils.dart';
import '../widgets/gradient_button.dart';
import '../widgets/birth_chart_header.dart';
import '../widgets/reading_screen_layout.dart';
import '../constants/text_styles.dart';
import '../l10n/app_localizations.dart';

class BirthChartPreviewScreen extends StatefulWidget {
  final BirthChart birthChart;

  const BirthChartPreviewScreen({super.key, required this.birthChart});

  @override
  State<BirthChartPreviewScreen> createState() =>
      _BirthChartPreviewScreenState();
}

class _BirthChartPreviewScreenState extends State<BirthChartPreviewScreen> {
  late final BirthChartService _service;

  @override
  void initState() {
    super.initState();
    _service = BirthChartService(context: context);
  }

  @override
  void dispose() {
    _service.dispose();
    super.dispose();
  }

  void _onGetFullReading() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (authProvider.isAuthenticated) {
      // User is already authenticated, go directly to full reading
      context.pushReplacement(
        '/birth-chart-reading/${widget.birthChart.id}',
        extra: {'birthChart': widget.birthChart.toJson()},
      );
    } else {
      // Save birth chart data for post-login redirect
      await _saveBirthChartForRedirect();

      // Show info and redirect to login
      if (mounted) {
        SnackbarUtils.showInfo(
          context,
          AppLocalizations.of(context)!.loginRequiredForFullReading,
        );
        // Navigate to login
        context.go('/login');
      }
    }
  }

  Future<void> _saveBirthChartForRedirect() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Save only birth chart basic data (birthChartData is not used by BirthChartReadingScreen)
      final birthChartJson = jsonEncode(widget.birthChart.toJson());
      await prefs.setString('pending_birth_chart', birthChartJson);

      // Set redirect flag
      await prefs.setBool('redirect_to_reading', true);
    } catch (e) {
      // If saving fails, continue anyway
      debugPrint('Failed to save birth chart data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ReadingScreenLayout(
      darkMode: themeProvider.isDarkMode,
      personAName:
          '${widget.birthChart.givenName} ${widget.birthChart.familyName}',
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.birthChartPreview),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onSurface,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (GoRouter.of(context).canPop()) {
              context.pop();
            } else {
              context.go('/personality');
            }
          },
        ),
      ),
      header: BirthChartHeader(birthChart: widget.birthChart),
      birthChartId: widget.birthChart.id,
      content: _buildPreviewContent(),
    );
  }

  Widget _buildPreviewContent() {
    return Column(
      children: [
        const SizedBox(height: 8),
        // Preview explanation
        Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.surface.withValues(alpha: 0.85),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Theme.of(
                context,
              ).colorScheme.outline.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Icon(
                Icons.auto_awesome,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context)!.previewTitle,
                style: AppTextStyles.getH4Style(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                AppLocalizations.of(context)!.previewDescription,
                style: AppTextStyles.getBodyLargeStyle(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // Benefits list
              Column(
                children: [
                  _buildFeatureBullet(
                    context,
                    Icons.psychology,
                    AppLocalizations.of(context)!.fullPersonalityAnalysis,
                  ),
                  const SizedBox(height: 12),
                  _buildFeatureBullet(
                    context,
                    Icons.nights_stay,
                    AppLocalizations.of(
                      context,
                    )!.detailedPlanetaryInterpretation,
                  ),
                  const SizedBox(height: 12),
                  _buildFeatureBullet(
                    context,
                    Icons.insights,
                    AppLocalizations.of(context)!.personalizedInsights,
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 32),

        // CTA Button
        GradientButton(
          text: AppLocalizations.of(context)!.getFullReading.toUpperCase(),
          onPressed: _onGetFullReading,
        ),

        const SizedBox(height: 16),

        // Secondary action
        TextButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              context.go('/personality');
            }
          },
          child: Text(
            AppLocalizations.of(context)!.backToForm,
            style: AppTextStyles.getBodyLargeStyle(context).copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ),

        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildFeatureBullet(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 12),
        Expanded(child: Text(text, style: AppTextStyles.getBodyStyle(context))),
      ],
    );
  }
}
