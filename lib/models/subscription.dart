import 'package:json_annotation/json_annotation.dart';

part 'subscription.g.dart';

@JsonSerializable()
class Subscription {
  final String id;
  final String status;
  @JsonKey(name: 'current_period_start')
  final int? currentPeriodStart;
  @JsonKey(name: 'current_period_end')
  final int? currentPeriodEnd;
  @JsonKey(name: 'cancel_at_period_end')
  final bool cancelAtPeriodEnd;
  @JsonKey(name: 'customer_id')
  final String customerId;
  @JsonKey(name: 'plan_name')
  final String planName;
  final int amount;
  final String currency;
  final String interval;
  @JsonKey(name: 'latest_invoice_status')
  final String? latestInvoiceStatus;
  @JsonKey(name: 'latest_invoice_payment_intent')
  final String? latestInvoicePaymentIntent;

  Subscription({
    required this.id,
    required this.status,
    this.currentPeriodStart,
    this.currentPeriodEnd,
    required this.cancelAtPeriodEnd,
    required this.customerId,
    required this.planName,
    required this.amount,
    required this.currency,
    required this.interval,
    this.latestInvoiceStatus,
    this.latestInvoicePaymentIntent,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionToJson(this);

  // Helper getters for formatted display
  DateTime? get currentPeriodStartDate => currentPeriodStart != null
      ? DateTime.fromMillisecondsSinceEpoch(currentPeriodStart! * 1000)
      : null;
  
  DateTime? get currentPeriodEndDate => currentPeriodEnd != null
      ? DateTime.fromMillisecondsSinceEpoch(currentPeriodEnd! * 1000)
      : null;

  String get formattedAmount {
    final amountInCurrency = amount / 100;
    return '${amountInCurrency.toStringAsFixed(2)} €';
  }

  String get formattedInterval {
    switch (interval) {
      case 'month':
        return 'mensile';
      case 'year':
        return 'annuale';
      default:
        return interval;
    }
  }

  bool get isFailedPayment {
    return status == 'past_due' ||
           status == 'unpaid' ||
           status == 'incomplete' ||
           status == 'incomplete_expired';
  }

}

@JsonSerializable()
class SubscriptionStatusResponse {
  final Subscription? subscription;
  @JsonKey(name: 'has_active_subscription')
  final bool hasActiveSubscription;
  @JsonKey(name: 'has_trial_eligibility')
  final bool hasTrialEligibility;

  SubscriptionStatusResponse({
    this.subscription,
    required this.hasActiveSubscription,
    this.hasTrialEligibility = true,
  });

  factory SubscriptionStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionStatusResponseToJson(this);

  bool get hasSubscription => subscription != null;

  bool get isActive => subscription?.status == 'active' || subscription?.status == 'trialing';

  bool get isFailedPayment => subscription?.isFailedPayment ?? false;

  bool get isExpired => hasSubscription && !isActive && !isFailedPayment;
}