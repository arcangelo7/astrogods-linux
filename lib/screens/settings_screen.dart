import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../widgets/local_flag.dart';
import '../l10n/app_localizations.dart';
import '../providers/language_provider.dart';
import '../providers/auth_provider.dart';
import '../widgets/starry_night_background.dart';
import '../constants/text_styles.dart';
import '../services/auth_service.dart';
import '../utils/snackbar_utils.dart';
import '../providers/theme_provider.dart';
import '../config/environment.dart';
import '../services/subscription_service.dart';
import '../models/subscription.dart';
import '../widgets/subscription_card.dart';
import '../services/newsletter_service.dart';
import '../widgets/newsletter_subscription_dialog.dart';
import '../widgets/newsletter_edit_dialog.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SubscriptionStatusResponse? _subscriptionStatus;
  bool _isLoadingSubscriptions = false;
  String? _subscriptionError;
  bool _hasInitialized = false;

  NewsletterSubscriptions? _newsletterSubscriptions;
  bool _isLoadingNewsletters = false;
  String? _newsletterError;

  @override
  void initState() {
    super.initState();
    // Defer loading subscriptions until after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAuthAndLoadSubscriptions();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Re-check auth status when dependencies change
    if (!_hasInitialized) {
      _checkAuthAndLoadSubscriptions();
    }
  }

  void _checkAuthAndLoadSubscriptions() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (authProvider.isAuthenticated && !authProvider.isLoading) {
      if (!_hasInitialized) {
        _hasInitialized = true;
        _loadSubscriptions();
        _loadNewsletters();
      }
    }
  }

  Future<void> _loadSubscriptions() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (!authProvider.isAuthenticated) return;

    setState(() {
      _isLoadingSubscriptions = true;
      _subscriptionError = null;
    });

    try {
      final subscriptionService = SubscriptionService(context: context);
      final subscriptionStatus = await subscriptionService
          .getSubscriptionStatus();

      if (mounted) {
        setState(() {
          _subscriptionStatus = subscriptionStatus;
          _isLoadingSubscriptions = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _subscriptionError = e.toString();
          _isLoadingSubscriptions = false;
        });
      }
    }
  }

  Future<void> _loadNewsletters() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (!authProvider.isAuthenticated) return;

    setState(() {
      _isLoadingNewsletters = true;
      _newsletterError = null;
    });

    try {
      final newsletterService = NewsletterService(context: context);
      final newsletters = await newsletterService.getSubscriptions();

      if (mounted) {
        setState(() {
          _newsletterSubscriptions = newsletters;
          _isLoadingNewsletters = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _newsletterError = e.toString();
          _isLoadingNewsletters = false;
        });
      }
    }
  }

  Future<void> _showDeleteAccountDialog(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final TextEditingController confirmController = TextEditingController();
    bool isDeleting = false;

    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.surface,
              title: Text(
                l10n.deleteAccountTitle,
                style: AppTextStyles.getH5Style(context),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.deleteAccountWarning,
                    style: AppTextStyles.getBodyStyle(context),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l10n.deleteAccountConfirmation,
                    style: AppTextStyles.getBodyStyle(
                      context,
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: confirmController,
                    decoration: InputDecoration(
                      labelText: l10n.typeDeleteToConfirm,
                      labelStyle: AppTextStyles.getCaptionStyle(context),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    style: AppTextStyles.getBodyStyle(context),
                    enabled: !isDeleting,
                    onChanged: (value) {
                      setState(() {
                        // Force rebuild to update button state
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: isDeleting
                      ? null
                      : () => Navigator.of(dialogContext).pop(false),
                  child: Text(
                    l10n.cancel,
                    style: AppTextStyles.getButtonStyle(context),
                  ),
                ),
                TextButton(
                  onPressed:
                      isDeleting ||
                          (confirmController.text.trim().toUpperCase() !=
                              l10n.deleteConfirmationWord.toUpperCase())
                      ? null
                      : () async {
                          setState(() => isDeleting = true);
                          Navigator.of(dialogContext).pop(true);
                        },
                  child: isDeleting
                      ? SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        )
                      : Text(
                          l10n.delete,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                ),
              ],
            );
          },
        );
      },
    );

    if (result == true && context.mounted) {
      await _deleteAccount(context);
    }

    confirmController.dispose();
  }

  Future<void> _deleteAccount(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final authService = AuthService(context: context);

    final response = await authService.deleteAccount();

    if (!context.mounted) return;

    if (response.success) {
      SnackbarUtils.showSuccess(context, l10n.accountDeleted);

      // Clear auth provider without calling logout API (already handled by deleteAccount)
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      authProvider.clearSessionAfterAccountDeletion();

      if (context.mounted) {
        context.go('/');
      }
    } else {
      SnackbarUtils.showError(
        context,
        response.message!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: StarryNightBackground(
        showPlanet: false,
        subtle: true,
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    if (GoRouter.of(context).canPop()) {
                      context.pop();
                    } else {
                      context.go('/');
                    }
                  },
                ),
                title: Text(l10n.settingsTitle),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    // Preferences Section
                    Text(
                      l10n.preferences,
                      style: AppTextStyles.getCaptionStyle(context).copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.95),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Consumer<LanguageProvider>(
                      builder: (context, languageProvider, _) => Card(
                        color: Theme.of(context).colorScheme.surface,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              const Icon(Icons.language),
                              const SizedBox(width: 16),
                              Text(l10n.language),
                              const Spacer(),
                              SegmentedButton<String>(
                                segments: [
                                  ButtonSegment<String>(
                                    value: 'en',
                                    icon: const LocalFlag(countryCode: 'us'),
                                  ),
                                  ButtonSegment<String>(
                                    value: 'it',
                                    icon: const LocalFlag(countryCode: 'it'),
                                  ),
                                ],
                                selected: {
                                  languageProvider.currentLocale.languageCode,
                                },
                                onSelectionChanged: (Set<String> selection) {
                                  if (selection.isNotEmpty) {
                                    languageProvider.changeLanguage(
                                      Locale(selection.first),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Consumer<ThemeProvider>(
                      builder: (context, themeProvider, _) => Card(
                        color: Theme.of(context).colorScheme.surface,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Icon(
                                themeProvider.isDarkMode
                                    ? Icons.dark_mode
                                    : Icons.light_mode,
                              ),
                              const SizedBox(width: 16),
                              Text(l10n.theme),
                              const Spacer(),
                              SegmentedButton<String>(
                              segments: [
                                ButtonSegment<String>(
                                  value: 'light',
                                  icon: const Icon(Icons.light_mode, size: 18),
                                ),
                                ButtonSegment<String>(
                                  value: 'dark', 
                                  icon: const Icon(Icons.dark_mode, size: 18),
                                ),
                                ButtonSegment<String>(
                                  value: 'system',
                                  icon: const Icon(Icons.settings, size: 18),
                                ),
                              ],
                              selected: {themeProvider.themeMode.name},
                              onSelectionChanged: (Set<String> selection) {
                                if (selection.isNotEmpty) {
                                  ThemeMode mode = ThemeMode.values.firstWhere(
                                    (e) => e.name == selection.first,
                                  );
                                  themeProvider.setThemeMode(mode);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                    const SizedBox(height: 24),

                    // Newsletter Section
                    if (authProvider.isAuthenticated) ...[
                      Text(
                        l10n.emailNotifications,
                        style: AppTextStyles.getCaptionStyle(context).copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.95),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildNewsletterSection(l10n),
                      const SizedBox(height: 24),
                    ],

                    // About Section
                    Text(
                      l10n.about,
                      style: AppTextStyles.getCaptionStyle(context).copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.95),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Card(
                      color: Theme.of(context).colorScheme.surface,
                      child: ListTile(
                        leading: const Icon(Icons.info_outline),
                        title: Text(l10n.appVersion),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              Environment.appVersion,
                              style: AppTextStyles.getCaptionStyle(context),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.arrow_forward_ios, size: 16),
                          ],
                        ),
                        onTap: () {
                          context.push('/release-notes');
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Card(
                      color: Theme.of(context).colorScheme.surface,
                      child: ListTile(
                        leading: const Icon(Icons.description_outlined),
                        title: Text(l10n.termsOfService),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          context.push('/terms-and-conditions');
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Card(
                      color: Theme.of(context).colorScheme.surface,
                      child: ListTile(
                        leading: const Icon(Icons.privacy_tip_outlined),
                        title: Text(l10n.privacyPolicy),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          context.push('/privacy-policy');
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Card(
                      color: Theme.of(context).colorScheme.surface,
                      child: ListTile(
                        leading: const Icon(Icons.cookie_outlined),
                        title: Text(l10n.cookiePolicy),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          context.push('/cookie-policy');
                        },
                      ),
                    ),

                    // Subscriptions Section
                    if (authProvider.isAuthenticated) ...[
                      const SizedBox(height: 24),
                      Text(
                        l10n.subscriptionsTitle,
                        style: AppTextStyles.getCaptionStyle(context).copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.95),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildSubscriptionsSection(l10n),
                      const SizedBox(height: 8),
                    ],

                    // Account Section
                    if (authProvider.isAuthenticated) ...[
                      const SizedBox(height: 24),
                      Text(
                        l10n.account,
                        style: AppTextStyles.getCaptionStyle(context).copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.95),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Card(
                        color: Theme.of(context).colorScheme.surface,
                        child: ListTile(
                          leading: const Icon(Icons.logout),
                          title: Text(l10n.logout),
                          onTap: () async {
                            await authProvider.logout();
                            if (context.mounted) {
                              context.go('/');
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      Card(
                        color: Theme.of(
                          context,
                        ).colorScheme.error.withValues(alpha: 0.1),
                        child: ListTile(
                          leading: Icon(
                            Icons.delete_forever,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          title: Text(
                            l10n.deleteAccount,
                            style: AppTextStyles.getBodyStyle(context).copyWith(
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                          onTap: () => _showDeleteAccountDialog(context),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubscriptionsSection(AppLocalizations l10n) {
    if (_isLoadingSubscriptions) {
      return Card(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              children: [
                CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.loadingSubscriptions,
                  style: AppTextStyles.getBodyStyle(context),
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (_subscriptionError != null) {
      return Card(
        color: Theme.of(context).colorScheme.error.withValues(alpha: 0.1),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.error, color: Theme.of(context).colorScheme.error),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  l10n.failedToLoadSubscriptions,
                  style: AppTextStyles.getBodyStyle(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.error),
                ),
              ),
              TextButton(
                onPressed: _loadSubscriptions,
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      );
    }

    if (_subscriptionStatus == null || !_subscriptionStatus!.hasSubscription) {
      return Card(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(
                Icons.subscriptions_outlined,
                size: 48,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              const SizedBox(height: 12),
              Text(
                l10n.noActiveSubscription,
                style: AppTextStyles.getBodyStyle(context).copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.6),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return SubscriptionCard(
      subscription: _subscriptionStatus!.subscription!,
      onPortalClosed: _loadSubscriptions,
      isExpired: _subscriptionStatus!.isExpired,
    );
  }

  Widget _buildNewsletterSection(AppLocalizations l10n) {
    if (_isLoadingNewsletters) {
      return Card(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              children: [
                CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.generating,
                  style: AppTextStyles.getBodyStyle(context),
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (_newsletterError != null) {
      return Card(
        color: Theme.of(context).colorScheme.error.withValues(alpha: 0.1),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.error, color: Theme.of(context).colorScheme.error),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  l10n.errorTitle,
                  style: AppTextStyles.getBodyStyle(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.error),
                ),
              ),
              TextButton(
                onPressed: _loadNewsletters,
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      );
    }

    final hasAnySubscriptions = _newsletterSubscriptions != null &&
        (_newsletterSubscriptions!.dailySubscriptions.isNotEmpty ||
            _newsletterSubscriptions!.monthlySubscriptions.isNotEmpty);

    if (!hasAnySubscriptions) {
      return Card(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(
                Icons.email_outlined,
                size: 48,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              const SizedBox(height: 12),
              Text(
                l10n.noNewsletterSubscriptions,
                style: AppTextStyles.getBodyStyle(context).copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.6),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => _showNewsletterSubscriptionDialog(context),
                icon: const Icon(Icons.add),
                label: Text(l10n.addNewsletter),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                l10n.checkSpamFolder,
                style: AppTextStyles.getCaptionStyle(context).copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        // Daily subscriptions
        if (_newsletterSubscriptions!.dailySubscriptions.isNotEmpty) ...[
          Card(
            color: Theme.of(context).colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.today, color: Theme.of(context).colorScheme.primary),
                      const SizedBox(width: 12),
                      Text(
                        l10n.dailySkyOf,
                        style: AppTextStyles.getBodyStyle(context).copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ..._newsletterSubscriptions!.dailySubscriptions.map(
                    (subscription) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  subscription.birthChartName,
                                  style: AppTextStyles.getBodyStyle(context),
                                ),
                                Text(
                                  subscription.place,
                                  style: AppTextStyles.getCaptionStyle(context),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () => _editSubscription(subscription, 'daily'),
                                child: Text(l10n.edit),
                              ),
                              TextButton(
                                onPressed: () => _unsubscribeDaily(subscription.id),
                                child: Text(
                                  l10n.delete,
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],

        // Monthly subscriptions
        if (_newsletterSubscriptions!.monthlySubscriptions.isNotEmpty) ...[
          Card(
            color: Theme.of(context).colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_month, color: Theme.of(context).colorScheme.primary),
                      const SizedBox(width: 12),
                      Text(
                        l10n.monthlySkyOf,
                        style: AppTextStyles.getBodyStyle(context).copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ..._newsletterSubscriptions!.monthlySubscriptions.map(
                    (subscription) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  subscription.birthChartName,
                                  style: AppTextStyles.getBodyStyle(context),
                                ),
                                Text(
                                  subscription.place,
                                  style: AppTextStyles.getCaptionStyle(context),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () => _editSubscription(subscription, 'monthly'),
                                child: Text(l10n.edit),
                              ),
                              TextButton(
                                onPressed: () => _unsubscribeMonthly(subscription.id),
                                child: Text(
                                  l10n.delete,
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],

        // Add newsletter button
        const SizedBox(height: 16),
        Center(
          child: ElevatedButton.icon(
            onPressed: () => _showNewsletterSubscriptionDialog(context),
            icon: const Icon(Icons.add),
            label: Text(l10n.addNewsletter),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Spam folder warning
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Theme.of(context).colorScheme.secondary,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  l10n.checkSpamFolder,
                  style: AppTextStyles.getCaptionStyle(context).copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.9),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _unsubscribeDaily(int newsletterId) async {
    try {
      final newsletterService = NewsletterService(context: context);
      await newsletterService.unsubscribeDailyNewsletter(newsletterId);

      if (mounted) {
        SnackbarUtils.showSuccess(context, AppLocalizations.of(context)!.unsubscribeSuccess);
        _loadNewsletters();
      }
    } catch (e) {
      if (mounted) {
        SnackbarUtils.showError(context, e.toString());
      }
    }
  }

  Future<void> _unsubscribeMonthly(int newsletterId) async {
    try {
      final newsletterService = NewsletterService(context: context);
      await newsletterService.unsubscribeMonthlyNewsletter(newsletterId);

      if (mounted) {
        SnackbarUtils.showSuccess(context, AppLocalizations.of(context)!.unsubscribeSuccess);
        _loadNewsletters();
      }
    } catch (e) {
      if (mounted) {
        SnackbarUtils.showError(context, e.toString());
      }
    }
  }

  void _showNewsletterSubscriptionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const NewsletterSubscriptionDialog(),
    ).then((_) {
      // Reload newsletters after dialog closes
      _loadNewsletters();
    });
  }

  void _editSubscription(NewsletterSubscription subscription, String type) {
    showDialog(
      context: context,
      builder: (context) => NewsletterEditDialog(
        subscription: subscription,
        type: type,
      ),
    ).then((_) {
      // Reload newsletters after dialog closes
      _loadNewsletters();
    });
  }
}
