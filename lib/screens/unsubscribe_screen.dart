import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../l10n/app_localizations.dart';
import '../widgets/gradient_button.dart';

class UnsubscribeScreen extends StatefulWidget {
  final String token;

  const UnsubscribeScreen({
    super.key,
    required this.token,
  });

  @override
  State<UnsubscribeScreen> createState() => _UnsubscribeScreenState();
}

class _UnsubscribeScreenState extends State<UnsubscribeScreen> {
  bool _isLoading = true;
  bool _hasError = false;
  String _errorMessage = '';
  String? _email;
  String? _newsletterType;
  String? _birthChartName;

  @override
  void initState() {
    super.initState();
    _processUnsubscribe();
  }

  Future<void> _processUnsubscribe() async {
    try {
      const baseUrl = String.fromEnvironment('API_BASE_URL');
      final response = await http.post(
        Uri.parse('$baseUrl/api/newsletter/unsubscribe/${widget.token}'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200 && responseData['success'] == true) {
        setState(() {
          _email = responseData['email'];
          _newsletterType = responseData['newsletter_type'];
          _birthChartName = responseData['birth_chart_name'];
          _isLoading = false;
        });
      } else {
        setState(() {
          _hasError = true;
          _errorMessage = responseData['message'] ?? AppLocalizations.of(context)!.unknownErrorOccurred;
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _hasError = true;
        _errorMessage = AppLocalizations.of(context)!.networkErrorOccurred;
        _isLoading = false;
      });
    }
  }

  String _getNewsletterTypeText(AppLocalizations l10n, String type) {
    switch (type) {
      case 'daily':
        return l10n.dailyPredictions;
      case 'monthly':
        return l10n.monthlyPredictions;
      case 'all':
        return l10n.allNewsletters;
      default:
        return type;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(l10n.unsubscribe),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          onPressed: () => context.go('/'),
        ),
      ),
      body: SafeArea(
        child: _isLoading
            ? _buildLoadingWidget()
            : _hasError
                ? _buildErrorWidget(l10n)
                : _buildSuccessWidget(l10n, isDark),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: AppColors.mysticalPurple,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.processingUnsubscribeRequest,
            style: AppTextStyles.getSubtitleLargeStyle(context),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget(AppLocalizations l10n) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
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
              l10n.unsubscribeError,
              style: AppTextStyles.getH4Style(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              _errorMessage,
              style: AppTextStyles.getSubtitleLargeStyle(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            GradientButton(
              text: l10n.goHome,
              onPressed: () => context.go('/'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessWidget(AppLocalizations l10n, bool isDark) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
              ),
              child: Icon(
                Icons.check_circle_outline,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              l10n.unsubscribeSuccess,
              style: AppTextStyles.getH4Style(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            if (_email != null) ...[
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: AppTextStyles.getSubtitleLargeStyle(context),
                  children: [
                    TextSpan(text: '${l10n.email}: '),
                    TextSpan(
                      text: _email!,
                      style: AppTextStyles.getSubtitleLargeStyle(context).copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
            if (_newsletterType != null) ...[
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: AppTextStyles.getSubtitleLargeStyle(context),
                  children: [
                    TextSpan(text: '${l10n.newsletterType}: '),
                    TextSpan(
                      text: _getNewsletterTypeText(l10n, _newsletterType!),
                      style: AppTextStyles.getSubtitleLargeStyle(context).copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
            if (_birthChartName != null) ...[
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: AppTextStyles.getSubtitleLargeStyle(context),
                  children: [
                    TextSpan(text: '${l10n.birthChart}: '),
                    TextSpan(
                      text: _birthChartName!,
                      style: AppTextStyles.getSubtitleLargeStyle(context).copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
            Text(
              l10n.unsubscribeSuccessMessage,
              style: AppTextStyles.getCaptionStyle(context).copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            GradientButton(
              text: l10n.goHome,
              onPressed: () => context.go('/'),
            ),
          ],
        ),
      ),
    );
  }
}