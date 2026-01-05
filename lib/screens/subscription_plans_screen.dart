import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/text_styles.dart';
import '../widgets/starry_night_background.dart';
import '../l10n/app_localizations.dart';
import '../services/stripe_service.dart' show StripeService, CheckoutException;
import '../services/api_client.dart' show ApiException;
import '../services/subscription_service.dart';
import '../utils/snackbar_utils.dart';
import '../utils/session_utils.dart';
import '../models/subscription_plan.dart';
import '../models/subscription.dart';
import '../widgets/subscription/subscription_button.dart';
import '../widgets/subscription/trial_info_container.dart';
import '../widgets/subscription/price_display.dart';
import '../widgets/subscription/plan_features.dart';
import '../widgets/subscription/plan_badge.dart';
import '../widgets/subscription/renewal_date_display.dart';

class SubscriptionPlansScreen extends StatefulWidget {
  const SubscriptionPlansScreen({super.key});

  @override
  State<SubscriptionPlansScreen> createState() =>
      _SubscriptionPlansScreenState();
}

class _SubscriptionPlansScreenState extends State<SubscriptionPlansScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _showAllPlans = false;
  bool _hasTrialEligibility = true;
  bool _isLoadingTrialEligibility = true;
  SubscriptionStatusResponse? _subscriptionStatus;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    ); // Start with monthly when showing all plans

    // Add listener to rebuild when tab changes
    _tabController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    _loadSubscriptionStatus();
    _checkForSessionId();
  }

  Future<void> _loadSubscriptionStatus() async {
    try {
      final subscriptionService = SubscriptionService(context: context);
      final status = await subscriptionService.getSubscriptionStatus();

      if (mounted) {
        setState(() {
          _subscriptionStatus = status;
          _hasTrialEligibility = status.hasTrialEligibility;
          _isLoadingTrialEligibility = false;
        });
      }
    } catch (e) {
      // On error, default to showing trial (better UX)
      if (mounted) {
        setState(() {
          _hasTrialEligibility = true;
          _isLoadingTrialEligibility = false;
        });
      }
    }
  }

  Future<void> _checkForSessionId() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final uri = Uri.base;
      final sessionId = uri.queryParameters['session_id'];

      if (sessionId != null && sessionId.isNotEmpty) {
        // Show loading while confirming session
        if (mounted) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        AppLocalizations.of(context)!.confirmingSubscription,
                        style: AppTextStyles.getBodyStyle(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        try {
          await StripeService.confirmSession(context, sessionId);
          if (mounted) {
            // Close loading dialog
            Navigator.of(context).pop();

            final localizations = AppLocalizations.of(context)!;
            // Show success with a more prominent feedback
            SnackbarUtils.showSuccess(
              context,
              localizations.subscriptionActivated,
            );

            // Clean URL by removing session_id parameter
            context.go('/subscription-plans');

            // Refresh the page to show updated subscription status
            setState(() {});
          }
        } catch (e) {
          if (mounted) {
            // Close loading dialog if still showing
            Navigator.of(context).pop();

            final localizations = AppLocalizations.of(context)!;
            SnackbarUtils.showCopyableErrorSnackBar(
              context,
              '${localizations.subscriptionConfirmationFailed}: ${e.toString()}',
            );
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String? _getButtonLabel(SubscriptionPlan plan, AppLocalizations localizations) {
    if (_subscriptionStatus?.hasActiveSubscription ?? false) {
      return localizations.changePlan;
    }

    return null;
  }

  void _handleManageSubscription(BuildContext context, {String? priceId}) async {
    try {
      final subscriptionService = SubscriptionService(context: context);
      await subscriptionService.openCustomerPortal(priceId: priceId);
    } catch (e) {
      if (context.mounted) {
        SnackbarUtils.showError(context, e.toString());
      }
    }
  }

  void _handlePlanAction(BuildContext context, SubscriptionPlan plan) async {
    if (_subscriptionStatus?.hasActiveSubscription ?? false) {
      _handleManageSubscription(context, priceId: plan.priceId);
    } else {
      _handleStripeCheckout(context, plan);
    }
  }

  void _handleStripeCheckout(
    BuildContext context,
    SubscriptionPlan plan,
  ) async {
    final localizations = AppLocalizations.of(context)!;

    try {
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      // Get the correct price ID from plan
      final String priceId = plan.priceId;

      if (kIsWeb) {
        final checkoutUrl = await StripeService.createCheckoutSession(context, priceId);

        // Hide loading indicator
        if (context.mounted) {
          Navigator.of(context).pop();
        }

        if (checkoutUrl != null) {
          await StripeService.launchStripeCheckout(checkoutUrl);
        } else {
          throw Exception('No checkout URL received');
        }
      } else {
        final setupData = await StripeService.createPaymentIntent(context, priceId);

        await StripeService.initPaymentSheet(
          setupIntentClientSecret: setupData['setup_intent'],
          customerId: setupData['customer_id'],
          customerEphemeralKeySecret: setupData['ephemeral_key'],
        );

        // Hide loading indicator before presenting sheet
        if (context.mounted) {
          Navigator.of(context).pop();
        }

        await StripeService.presentPaymentSheet();

        // Setup successful, now create subscription with trial
        if (context.mounted) {
          await StripeService.createSubscriptionFromSetup(
            context: context,
            customerId: setupData['customer_id'],
            priceId: setupData['price_id'],
          );
        }

        // Subscription created
        if (context.mounted) {
          SnackbarUtils.showSuccess(
            context,
            localizations.subscriptionActivated,
          );
          setState(() {});
        }
      }
    } on ApiException catch (e) {
      if (context.mounted) {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }

        // Check if this is the "already subscribed" error using errorKey
        if (e.errorKey == 'subscription.already_exists') {
          SnackbarUtils.showErrorWithAction(
            context,
            e.message,
            localizations.manageSubscription,
            () => context.push('/settings'),
          );
        } else {
          SessionUtils.handleApiException(
            context,
            e,
            (message) => SnackbarUtils.showError(context, message),
          );
        }
      }
    } on CheckoutException catch (e) {
      if (context.mounted) {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
        if (e.message.contains('cancelled')) {
          return;
        }
        SnackbarUtils.showError(context, e.message);
      }
    } catch (e) {
      if (context.mounted) {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
        SnackbarUtils.showError(context, localizations.paymentProcessingError);
      }
    }
  }

  List<SubscriptionPlan> _getAllPlans() {
    final localizations = AppLocalizations.of(context)!;
    return [
      ...SubscriptionPlan.getMonthlyPlans(localizations),
      ...SubscriptionPlan.getSemiannualPlans(localizations),
      ...SubscriptionPlan.getAnnualPlans(localizations),
    ];
  }

  List<SubscriptionPlan> _getCurrentPlans() {
    final localizations = AppLocalizations.of(context)!;
    List<SubscriptionPlan> plans;

    switch (_tabController.index) {
      case 0:
        plans = SubscriptionPlan.getMonthlyPlans(localizations);
        break;
      case 1:
        plans = SubscriptionPlan.getSemiannualPlans(localizations);
        break;
      case 2:
        plans = SubscriptionPlan.getAnnualPlans(localizations);
        break;
      default:
        plans = SubscriptionPlan.getMonthlyPlans(localizations);
    }

    final allPlans = _getAllPlans();
    final annotatedAllPlans = SubscriptionPlan.annotateWithCurrentPlan(
      allPlans,
      _subscriptionStatus?.subscription,
    );

    final annotatedPlans = plans.map((plan) {
      final matchingPlan = annotatedAllPlans.firstWhere(
        (p) => p.priceId == plan.priceId,
        orElse: () => plan,
      );
      return plan.copyWith(
        badge: matchingPlan.badge,
        isCurrentPlan: matchingPlan.isCurrentPlan,
        nextRenewalDate: matchingPlan.nextRenewalDate,
      );
    }).toList();

    return SubscriptionPlan.sortByPriority(annotatedPlans);
  }

  List<SubscriptionPlan> _getSimplifiedPlans() {
    final localizations = AppLocalizations.of(context)!;
    final plans = SubscriptionPlan.getSimplifiedPlans(localizations);

    final allPlans = _getAllPlans();
    final annotatedAllPlans = SubscriptionPlan.annotateWithCurrentPlan(
      allPlans,
      _subscriptionStatus?.subscription,
    );

    final annotatedPlans = plans.map((plan) {
      final matchingPlan = annotatedAllPlans.firstWhere(
        (p) => p.priceId == plan.priceId,
        orElse: () => plan,
      );
      return plan.copyWith(
        badge: matchingPlan.badge,
        isCurrentPlan: matchingPlan.isCurrentPlan,
        nextRenewalDate: matchingPlan.nextRenewalDate,
      );
    }).toList();

    return SubscriptionPlan.sortByPriority(annotatedPlans);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StarryNightBackground(
        showPlanet: true,
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
                title: Text(localizations.viewPlans),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/');
                    }
                  },
                ),
              ),
              Expanded(
                child: _isLoadingTrialEligibility
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        padding: const EdgeInsets.all(16.0),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: MediaQuery.of(context).size.height -
                                MediaQuery.of(context).padding.top -
                                kToolbarHeight -
                                32,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 16),
                              Text(
                                localizations.chooseAstrologicalPath,
                                style: AppTextStyles.getH2Style(context),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 24),
                              if (_showAllPlans) ...[
                                _buildTabSelector(),
                                const SizedBox(height: 24),
                                _buildTabContent(localizations),
                                const SizedBox(height: 16),
                                Center(
                                  child: FilledButton.tonal(
                                    onPressed: () {
                                      setState(() {
                                        _showAllPlans = false;
                                      });
                                    },
                                    style: FilledButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 12),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          localizations.hideOtherPlans,
                                          style: AppTextStyles.getBodyStyle(context),
                                        ),
                                        const SizedBox(width: 8),
                                        const Icon(Icons.expand_less, size: 20),
                                      ],
                                    ),
                                  ),
                                ),
                              ] else ...[
                                _buildSimplifiedLayout(),
                              ],
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

  Widget _buildTabSelector() {
    final localizations = AppLocalizations.of(context)!;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).colorScheme.surface,
          ),
          padding: const EdgeInsets.all(4),
          child: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            labelColor: Theme.of(context).colorScheme.onPrimaryContainer,
            unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
            dividerColor: Colors.transparent,
            labelPadding: EdgeInsets.symmetric(
              horizontal: isSmallScreen ? 2 : 4,
            ),
            isScrollable: false,
            tabs: [
              Tab(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 6 : 12,
                    vertical: 8,
                  ),
                  child: Text(
                    isSmallScreen ? 'Mens.' : localizations.monthly,
                    style: AppTextStyles.getCaptionStyle(context).copyWith(
                      fontSize: isSmallScreen ? 12 : 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 6 : 12,
                    vertical: 8,
                  ),
                  child: Text(
                    isSmallScreen ? '6 M.' : localizations.semiannual,
                    style: AppTextStyles.getCaptionStyle(context).copyWith(
                      fontSize: isSmallScreen ? 12 : 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 6 : 12,
                    vertical: 8,
                  ),
                  child: Text(
                    isSmallScreen ? 'Ann.' : localizations.annual,
                    style: AppTextStyles.getCaptionStyle(context).copyWith(
                      fontSize: isSmallScreen ? 12 : 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSimplifiedLayout() {
    final localizations = AppLocalizations.of(context)!;
    final plans = _getSimplifiedPlans();

    return Column(
      children: [
        for (int i = 0; i < plans.length; i++) ...[
          _buildPlanCard(plans[i], localizations),
          if (i < plans.length - 1) const SizedBox(height: 16),
        ],
        const SizedBox(height: 24),
        // Explore other plans button
        FilledButton.tonal(
          onPressed: () {
            setState(() {
              _showAllPlans = true;
            });
          },
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                localizations.exploreOtherPlans,
                style: AppTextStyles.getBodyStyle(context),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.expand_more, size: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabContent(AppLocalizations localizations) {
    final plans = _getCurrentPlans();
    return Column(
      children: [
        for (int i = 0; i < plans.length; i++) ...[
          _buildPlanCard(plans[i], localizations),
          if (i < plans.length - 1) const SizedBox(height: 16),
        ],
      ],
    );
  }

  Widget _buildPlanCard(SubscriptionPlan plan, AppLocalizations localizations) {
    final isMainCard = plan.cardStyle == CardStyle.main && !plan.isCurrentPlan;
    final isAlternativeCard = plan.cardStyle == CardStyle.alternative && !plan.isCurrentPlan;
    final isCurrentPlan = plan.isCurrentPlan;
    final colorScheme = Theme.of(context).colorScheme;

    PriceDisplayStyle priceStyle;
    SubscriptionButtonStyle buttonStyle;
    FeaturesDisplayStyle featuresStyle;
    TrialContainerStyle? trialStyle;

    if (isCurrentPlan) {
      priceStyle = PriceDisplayStyle.main;
      buttonStyle = SubscriptionButtonStyle.main;
      featuresStyle = FeaturesDisplayStyle.main;
      trialStyle = null;
    } else if (isMainCard) {
      priceStyle = PriceDisplayStyle.main;
      buttonStyle = SubscriptionButtonStyle.main;
      featuresStyle = FeaturesDisplayStyle.main;
      trialStyle = TrialContainerStyle.main;
    } else if (isAlternativeCard) {
      priceStyle = PriceDisplayStyle.alternative;
      buttonStyle = SubscriptionButtonStyle.alternative;
      featuresStyle = FeaturesDisplayStyle.alternative;
      trialStyle = null;
    } else {
      priceStyle = PriceDisplayStyle.normal;
      buttonStyle = SubscriptionButtonStyle.main;
      featuresStyle = FeaturesDisplayStyle.normal;
      trialStyle = TrialContainerStyle.normal;
    }

    return Card(
      elevation: isCurrentPlan ? 12 : (isMainCard ? 8 : (isAlternativeCard ? 2 : 4)),
      color: colorScheme.surface,
      child: Container(
        decoration: (isCurrentPlan || isMainCard)
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isCurrentPlan ? colorScheme.primary : colorScheme.primary,
                  width: isCurrentPlan ? 3 : 2,
                ),
              )
            : null,
        child: Padding(
          padding: EdgeInsets.all(isCurrentPlan || isMainCard ? 20 : (isAlternativeCard ? 16 : 20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (plan.badge != PlanBadge.none) ...[
                Center(
                  child: PlanBadgeWidget(badge: plan.badge),
                ),
                const SizedBox(height: 12),
              ] else if (isMainCard && !isCurrentPlan) ...[
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          colorScheme.primary,
                          colorScheme.primary.withValues(alpha: 0.8),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.primary.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.stars,
                          color: colorScheme.onPrimary,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          localizations.recommendedPlan,
                          style: AppTextStyles.getBodyStyle(context).copyWith(
                            color: colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
              Text(
                plan.title,
                style: isMainCard
                    ? AppTextStyles.getH4Style(context)
                    : isAlternativeCard
                        ? AppTextStyles.getH5Style(context)
                        : AppTextStyles.getH4Style(context).copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              PriceDisplay(
                price: plan.price,
                period: plan.period,
                originalPrice: plan.originalPrice,
                discount: plan.discount,
                saveAmount: plan.saveAmount,
                annualTotal: plan.annualTotal,
                extraInfo: plan.extraInfo,
                displayStyle: priceStyle,
              ),
              if (plan.originalPrice != null && plan.discountedPrice != null) ...[
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      plan.originalPrice!,
                      style: AppTextStyles.getCaptionStyle(context).copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      plan.discountedPrice!,
                      style: AppTextStyles.getBodyStyle(context).copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
              Text(
                plan.billingInfo,
                style: AppTextStyles.getCaptionStyle(context),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: isMainCard ? 16 : 24),
              PlanFeatures(
                features: plan.features,
                excludedFeatures: plan.excludedFeatures,
                displayStyle: featuresStyle,
              ),
              SizedBox(height: isMainCard ? 16 : 24),
              if (isCurrentPlan && plan.nextRenewalDate != null) ...[
                Center(
                  child: RenewalDateDisplay(renewalDate: plan.nextRenewalDate!),
                ),
                const SizedBox(height: 16),
              ],
              if (!_isLoadingTrialEligibility &&
                  _hasTrialEligibility &&
                  !isCurrentPlan &&
                  trialStyle != null) ...[
                TrialInfoContainer(containerStyle: trialStyle),
                SizedBox(height: isMainCard ? 12 : 16),
              ],
              if (isCurrentPlan)
                FilledButton.icon(
                  onPressed: () => _handleManageSubscription(context),
                  icon: const Icon(Icons.settings),
                  label: Text(localizations.manageSubscription),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                )
              else
                SubscriptionButton(
                  isLoading: _isLoadingTrialEligibility,
                  hasTrialEligibility: _hasTrialEligibility && !(_subscriptionStatus?.hasActiveSubscription ?? false),
                  onPressed: () => _handlePlanAction(context, plan),
                  buttonStyle: buttonStyle,
                  customText: _getButtonLabel(plan, localizations),
                ),
              if (isMainCard || isAlternativeCard) ...[
                const SizedBox(height: 6),
                Text(
                  localizations.thenPricePerMonth(plan.price),
                  style: AppTextStyles.getCaptionStyle(context),
                  textAlign: TextAlign.center,
                ),
              ],
              SizedBox(height: isMainCard ? 12 : 16),
              if (isMainCard || isAlternativeCard)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.security, color: Colors.green, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      localizations.moneyBackGuarantee,
                      style: AppTextStyles.getCaptionStyle(context).copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
