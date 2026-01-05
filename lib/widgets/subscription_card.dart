import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/subscription.dart';
import '../l10n/app_localizations.dart';
import '../constants/text_styles.dart';
import '../utils/date_utils.dart' as app_date_utils;
import '../services/subscription_service.dart';
import '../utils/snackbar_utils.dart';

class SubscriptionCard extends StatelessWidget {
  final Subscription subscription;
  final VoidCallback? onPortalClosed;
  final bool isExpired;

  const SubscriptionCard({
    super.key,
    required this.subscription,
    this.onPortalClosed,
    this.isExpired = false,
  });

  String _getStatusText(BuildContext context, String status) {
    final l10n = AppLocalizations.of(context)!;
    switch (status.toLowerCase()) {
      case 'active':
        return l10n.subscriptionActive;
      case 'trialing':
        return l10n.subscriptionTrialing;
      case 'past_due':
        return l10n.subscriptionPastDue;
      case 'unpaid':
        return l10n.subscriptionUnpaid;
      case 'incomplete':
      case 'incomplete_expired':
        return l10n.subscriptionIncomplete;
      default:
        return status;
    }
  }

  Color _getStatusColor(BuildContext context, String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return Colors.green;
      case 'trialing':
        return Colors.blue;
      case 'past_due':
      case 'unpaid':
      case 'incomplete':
      case 'incomplete_expired':
        return Theme.of(context).colorScheme.error;
      default:
        return Theme.of(context).colorScheme.onSurface;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Card(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Plan name and status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    subscription.planName,
                    style: AppTextStyles.getH5Style(context),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(context, subscription.status)
                        .withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _getStatusText(context, subscription.status),
                    style: AppTextStyles.getCaptionStyle(context).copyWith(
                      color: _getStatusColor(context, subscription.status),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            
            
            const SizedBox(height: 16),
            
            // Subscription details
            _buildDetailRow(
              context,
              l10n.subscriptionAmount,
              '${subscription.formattedAmount}/${subscription.formattedInterval}',
            ),
            const SizedBox(height: 8),
            if (subscription.currentPeriodStartDate != null) ...[
              _buildDetailRow(
                context,
                l10n.subscriptionStartDate,
                app_date_utils.DateUtils.formatDate(context, subscription.currentPeriodStartDate!),
              ),
              const SizedBox(height: 8),
            ],
            if (subscription.currentPeriodEndDate != null) ...[
              _buildDetailRow(
                context,
                subscription.cancelAtPeriodEnd 
                    ? l10n.subscriptionCancelsOn 
                    : l10n.subscriptionEndDate,
                app_date_utils.DateUtils.formatDate(context, subscription.currentPeriodEndDate!),
              ),
              const SizedBox(height: 8),
            ],
            
            const SizedBox(height: 16),

            // Expired subscription - show reactivation button
            if (isExpired) ...[
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    context.push('/subscription-plans');
                  },
                  icon: const Icon(Icons.refresh),
                  label: Text(l10n.reactivateSubscription),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ]
            // Failed payment warning and actions
            else if (subscription.isFailedPayment) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.error.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.warning_rounded,
                      color: Theme.of(context).colorScheme.error,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        l10n.paymentFailedDescription,
                        style: AppTextStyles.getCaptionStyle(context).copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _ManageSubscriptionButton(
                      subscription: subscription,
                      buttonText: l10n.updatePaymentMethod,
                      isRetryPayment: true,
                      onPortalClosed: onPortalClosed,
                    ),
                  ),
                ],
              ),
            ] else ...[
              // Regular manage subscription button for active subscriptions
              _ManageSubscriptionButton(
                subscription: subscription,
                onPortalClosed: onPortalClosed,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            '$label:',
            style: AppTextStyles.getBodyStyle(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.getBodyStyle(context),
          ),
        ),
      ],
    );
  }
}

class _ManageSubscriptionButton extends StatefulWidget {
  final Subscription subscription;
  final String? buttonText;
  final bool isRetryPayment;
  final VoidCallback? onPortalClosed;

  const _ManageSubscriptionButton({
    required this.subscription,
    this.buttonText,
    this.isRetryPayment = false,
    this.onPortalClosed,
  });

  @override
  State<_ManageSubscriptionButton> createState() => _ManageSubscriptionButtonState();
}

class _ManageSubscriptionButtonState extends State<_ManageSubscriptionButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handleManageSubscription,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.isRetryPayment
              ? Theme.of(context).colorScheme.error
              : Theme.of(context).colorScheme.primary,
          foregroundColor: widget.isRetryPayment
              ? Theme.of(context).colorScheme.onError
              : Theme.of(context).colorScheme.onPrimary,
        ),
        child: _isLoading
            ? SizedBox(
                height: 16,
                width: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: widget.isRetryPayment
                      ? Theme.of(context).colorScheme.onError
                      : Theme.of(context).colorScheme.onPrimary,
                ),
              )
            : Text(widget.buttonText ?? l10n.manageSubscription),
      ),
    );
  }

  Future<void> _handleManageSubscription() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final subscriptionService = SubscriptionService(context: context);
      await subscriptionService.openCustomerPortal();

      // Portal closed - trigger refresh callback
      if (mounted && widget.onPortalClosed != null) {
        widget.onPortalClosed!();
      }
    } catch (e) {
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        SnackbarUtils.showError(
          context,
          l10n.manageSubscription,
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}