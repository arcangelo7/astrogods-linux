import '../config/stripe_config.dart';
import 'subscription.dart';

enum PlanType { monthly, semiannual, annual }

enum PlanTier { standard, premium }

enum CardStyle { normal, alternative, main }

enum PlanBadge { currentPlan, upgrade, downgrade, none }

class SubscriptionPlan {
  final String title;
  final String price;
  final String period;
  final String billingInfo;
  final String? originalPrice;
  final String? discountedPrice;
  final String? discount;
  final String? extraInfo;
  final String? saveAmount;
  final String? annualTotal;
  final List<String> features;
  final List<String>? excludedFeatures;
  final PlanTier tier;
  final PlanType type;
  final CardStyle cardStyle;
  final String priceId;
  final PlanBadge badge;
  final bool isCurrentPlan;
  final DateTime? nextRenewalDate;

  const SubscriptionPlan({
    required this.title,
    required this.price,
    required this.period,
    required this.billingInfo,
    this.originalPrice,
    this.discountedPrice,
    this.discount,
    this.extraInfo,
    this.saveAmount,
    this.annualTotal,
    required this.features,
    this.excludedFeatures,
    required this.tier,
    required this.type,
    this.cardStyle = CardStyle.normal,
    required this.priceId,
    this.badge = PlanBadge.none,
    this.isCurrentPlan = false,
    this.nextRenewalDate,
  });

  bool get isPremium => tier == PlanTier.premium;

  SubscriptionPlan copyWith({
    String? title,
    String? price,
    String? period,
    String? billingInfo,
    String? originalPrice,
    String? discountedPrice,
    String? discount,
    String? extraInfo,
    String? saveAmount,
    String? annualTotal,
    List<String>? features,
    List<String>? excludedFeatures,
    PlanTier? tier,
    PlanType? type,
    CardStyle? cardStyle,
    String? priceId,
    PlanBadge? badge,
    bool? isCurrentPlan,
    DateTime? nextRenewalDate,
  }) {
    return SubscriptionPlan(
      title: title ?? this.title,
      price: price ?? this.price,
      period: period ?? this.period,
      billingInfo: billingInfo ?? this.billingInfo,
      originalPrice: originalPrice ?? this.originalPrice,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      discount: discount ?? this.discount,
      extraInfo: extraInfo ?? this.extraInfo,
      saveAmount: saveAmount ?? this.saveAmount,
      annualTotal: annualTotal ?? this.annualTotal,
      features: features ?? this.features,
      excludedFeatures: excludedFeatures ?? this.excludedFeatures,
      tier: tier ?? this.tier,
      type: type ?? this.type,
      cardStyle: cardStyle ?? this.cardStyle,
      priceId: priceId ?? this.priceId,
      badge: badge ?? this.badge,
      isCurrentPlan: isCurrentPlan ?? this.isCurrentPlan,
      nextRenewalDate: nextRenewalDate ?? this.nextRenewalDate,
    );
  }

  static SubscriptionPlan? findPlanByPriceId(
    List<SubscriptionPlan> plans,
    String priceId,
  ) {
    try {
      return plans.firstWhere((plan) => plan.priceId == priceId);
    } catch (e) {
      return null;
    }
  }

  static List<SubscriptionPlan> annotateWithCurrentPlan(
    List<SubscriptionPlan> plans,
    Subscription? currentSubscription,
  ) {
    if (currentSubscription == null) {
      return plans;
    }

    final isActiveSubscription =
        currentSubscription.status == 'active' ||
        currentSubscription.status == 'trialing';
    if (!isActiveSubscription) {
      return plans;
    }

    final currentPriceId = _extractPriceIdFromSubscription(currentSubscription);
    if (currentPriceId == null) {
      return plans;
    }

    final currentPlan = findPlanByPriceId(plans, currentPriceId);
    if (currentPlan == null) {
      return plans;
    }

    return plans.map((plan) {
      if (plan.priceId == currentPriceId) {
        return plan.copyWith(
          badge: PlanBadge.currentPlan,
          isCurrentPlan: true,
          nextRenewalDate: currentSubscription.currentPeriodEndDate,
        );
      }

      final badge = _determinePlanBadge(plan, currentPlan);
      return plan.copyWith(badge: badge);
    }).toList();
  }

  static String? _extractPriceIdFromSubscription(Subscription subscription) {
    final amountInEuros = (subscription.amount / 100).toStringAsFixed(2);
    final interval = subscription.interval;

    final priceMap = <String, String>{
      '4.99-month': StripeConfig.premiumMonthly,
      '23.94-month': StripeConfig.premiumSemestral,
      '3.99-month': StripeConfig.premiumSemestral,
      '2.99-month': StripeConfig.standardMonthly,
      '14.35-month': StripeConfig.standardSemestral,
      '2.39-month': StripeConfig.standardSemestral,
      '35.88-year': StripeConfig.premiumAnnual,
      '2.99-year': StripeConfig.premiumAnnual,
      '23.88-year': StripeConfig.standardAnnual,
      '1.99-year': StripeConfig.standardAnnual,
    };

    final key = '$amountInEuros-$interval';
    return priceMap[key];
  }

  static PlanBadge _determinePlanBadge(
    SubscriptionPlan targetPlan,
    SubscriptionPlan currentPlan,
  ) {
    final tierComparison = _compareTiers(targetPlan.tier, currentPlan.tier);

    if (tierComparison > 0) {
      return PlanBadge.upgrade;
    } else if (tierComparison < 0) {
      return PlanBadge.downgrade;
    }

    return PlanBadge.none;
  }

  static int _compareTiers(PlanTier tier1, PlanTier tier2) {
    const tierOrder = {PlanTier.standard: 0, PlanTier.premium: 1};
    return (tierOrder[tier1] ?? 0) - (tierOrder[tier2] ?? 0);
  }

  static int _compareDurations(PlanType type1, PlanType type2) {
    const durationOrder = {
      PlanType.monthly: 0,
      PlanType.semiannual: 1,
      PlanType.annual: 2,
    };
    return (durationOrder[type1] ?? 0) - (durationOrder[type2] ?? 0);
  }

  static List<SubscriptionPlan> sortByPriority(List<SubscriptionPlan> plans) {
    final sortedPlans = List<SubscriptionPlan>.from(plans);

    sortedPlans.sort((a, b) {
      if (a.isCurrentPlan && !b.isCurrentPlan) return -1;
      if (!a.isCurrentPlan && b.isCurrentPlan) return 1;

      if (a.badge == PlanBadge.upgrade && b.badge != PlanBadge.upgrade) {
        return -1;
      }
      if (a.badge != PlanBadge.upgrade && b.badge == PlanBadge.upgrade) {
        return 1;
      }

      if (a.badge == PlanBadge.downgrade && b.badge != PlanBadge.downgrade) {
        return 1;
      }
      if (a.badge != PlanBadge.downgrade && b.badge == PlanBadge.downgrade) {
        return -1;
      }

      final tierComp = _compareTiers(b.tier, a.tier);
      if (tierComp != 0) return tierComp;

      return _compareDurations(b.type, a.type);
    });

    return sortedPlans;
  }

  static List<String> getPremiumFeatures(dynamic localizations) {
    return [
      localizations.birthChartReadings,
      localizations.couplesChartReadings,
      localizations.dailyMonthlyTransits,
      localizations.horoscopeNewsletter,
    ];
  }

  static List<String> getStandardFeatures(dynamic localizations) {
    return [localizations.birthChartReadings];
  }

  static List<String> getStandardExcludedFeatures(dynamic localizations) {
    return [
      localizations.couplesChartReadings,
      localizations.dailyMonthlyTransits,
      localizations.horoscopeNewsletter,
    ];
  }

  static List<SubscriptionPlan> getMonthlyPlans(dynamic localizations) {
    return [
      SubscriptionPlan(
        title: localizations.premiumMonthly,
        price: '4,99 €',
        period: localizations.monthPeriod,
        billingInfo: localizations.billedMonthly,
        features: getPremiumFeatures(localizations),
        tier: PlanTier.premium,
        type: PlanType.monthly,
        priceId: StripeConfig.premiumMonthly,
      ),
      SubscriptionPlan(
        title: localizations.standardMonthly,
        price: '2,99 €',
        period: localizations.monthPeriod,
        billingInfo: localizations.billedMonthly,
        features: getStandardFeatures(localizations),
        excludedFeatures: getStandardExcludedFeatures(localizations),
        tier: PlanTier.standard,
        type: PlanType.monthly,
        priceId: StripeConfig.standardMonthly,
      ),
    ];
  }

  static List<SubscriptionPlan> getSemiannualPlans(dynamic localizations) {
    return [
      SubscriptionPlan(
        title: localizations.premiumSemiannual,
        price: '3,99 €',
        period: localizations.monthPeriod,
        billingInfo: localizations.billedSemiannually,
        originalPrice: '29,94 €',
        discountedPrice: '23,94 €',
        discount: localizations.save20Percent,
        extraInfo: localizations.oneMonthFree,
        features: getPremiumFeatures(localizations),
        tier: PlanTier.premium,
        type: PlanType.semiannual,
        priceId: StripeConfig.premiumSemestral,
      ),
      SubscriptionPlan(
        title: localizations.standardSemiannual,
        price: '2,39 €',
        period: localizations.monthPeriod,
        billingInfo: localizations.billedSemiannually,
        originalPrice: '17,94 €',
        discountedPrice: '14,35 €',
        discount: localizations.save20Percent,
        extraInfo: localizations.oneMonthFree,
        features: getStandardFeatures(localizations),
        excludedFeatures: getStandardExcludedFeatures(localizations),
        tier: PlanTier.standard,
        type: PlanType.semiannual,
        priceId: StripeConfig.standardSemestral,
      ),
    ];
  }

  static List<SubscriptionPlan> getAnnualPlans(dynamic localizations) {
    return [
      SubscriptionPlan(
        title: localizations.premiumAnnual,
        price: '2,99 €',
        period: localizations.monthPeriod,
        billingInfo: localizations.billedAnnually,
        originalPrice: '59,88 €',
        discountedPrice: '35,88 €',
        discount: localizations.save40Percent,
        extraInfo: localizations.fourMonthsFree,
        features: getPremiumFeatures(localizations),
        tier: PlanTier.premium,
        type: PlanType.annual,
        priceId: StripeConfig.premiumAnnual,
      ),
      SubscriptionPlan(
        title: localizations.standardAnnual,
        price: '1,99 €',
        period: localizations.monthPeriod,
        billingInfo: localizations.billedAnnually,
        originalPrice: '35,88 €',
        discountedPrice: '23,88 €',
        discount: localizations.save33Percent,
        extraInfo: localizations.fourMonthsFree,
        features: getStandardFeatures(localizations),
        excludedFeatures: getStandardExcludedFeatures(localizations),
        tier: PlanTier.standard,
        type: PlanType.annual,
        priceId: StripeConfig.standardAnnual,
      ),
    ];
  }

  static List<SubscriptionPlan> getSimplifiedPlans(dynamic localizations) {
    return [
      SubscriptionPlan(
        title: localizations.premiumAnnual,
        price: '2,99 €',
        period: 'mese',
        billingInfo: localizations.billedAnnually,
        originalPrice: '4,99 €',
        saveAmount: '24 €',
        annualTotal: '35,88 €',
        features: getPremiumFeatures(localizations),
        tier: PlanTier.premium,
        type: PlanType.annual,
        cardStyle: CardStyle.main,
        priceId: StripeConfig.premiumAnnual,
      ),
      SubscriptionPlan(
        title: localizations.premiumMonthly,
        price: '4,99 €',
        period: 'mese',
        billingInfo: localizations.billedMonthly,
        features: getPremiumFeatures(localizations),
        tier: PlanTier.premium,
        type: PlanType.monthly,
        cardStyle: CardStyle.alternative,
        priceId: StripeConfig.premiumMonthly,
      ),
    ];
  }
}
