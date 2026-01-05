// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) => Subscription(
  id: json['id'] as String,
  status: json['status'] as String,
  currentPeriodStart: (json['current_period_start'] as num?)?.toInt(),
  currentPeriodEnd: (json['current_period_end'] as num?)?.toInt(),
  cancelAtPeriodEnd: json['cancel_at_period_end'] as bool,
  customerId: json['customer_id'] as String,
  planName: json['plan_name'] as String,
  amount: (json['amount'] as num).toInt(),
  currency: json['currency'] as String,
  interval: json['interval'] as String,
  latestInvoiceStatus: json['latest_invoice_status'] as String?,
  latestInvoicePaymentIntent: json['latest_invoice_payment_intent'] as String?,
);

Map<String, dynamic> _$SubscriptionToJson(Subscription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'current_period_start': instance.currentPeriodStart,
      'current_period_end': instance.currentPeriodEnd,
      'cancel_at_period_end': instance.cancelAtPeriodEnd,
      'customer_id': instance.customerId,
      'plan_name': instance.planName,
      'amount': instance.amount,
      'currency': instance.currency,
      'interval': instance.interval,
      'latest_invoice_status': instance.latestInvoiceStatus,
      'latest_invoice_payment_intent': instance.latestInvoicePaymentIntent,
    };

SubscriptionStatusResponse _$SubscriptionStatusResponseFromJson(
  Map<String, dynamic> json,
) => SubscriptionStatusResponse(
  subscription: json['subscription'] == null
      ? null
      : Subscription.fromJson(json['subscription'] as Map<String, dynamic>),
  hasActiveSubscription: json['has_active_subscription'] as bool,
  hasTrialEligibility: json['has_trial_eligibility'] as bool? ?? true,
);

Map<String, dynamic> _$SubscriptionStatusResponseToJson(
  SubscriptionStatusResponse instance,
) => <String, dynamic>{
  'subscription': instance.subscription,
  'has_active_subscription': instance.hasActiveSubscription,
  'has_trial_eligibility': instance.hasTrialEligibility,
};
