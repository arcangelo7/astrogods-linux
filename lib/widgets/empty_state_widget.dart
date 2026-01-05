import 'package:flutter/material.dart';
import '../constants/text_styles.dart';

class EmptyStateWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? description;
  final Widget? primaryAction;
  final Widget? secondaryAction;
  final double iconSize;
  final bool compact;

  const EmptyStateWidget({
    super.key,
    required this.icon,
    required this.title,
    this.description,
    this.primaryAction,
    this.secondaryAction,
    this.iconSize = 64,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 16.0 : 24.0,
        vertical: compact ? 8.0 : 16.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon with subtle background
          Container(
            width: compact ? 64 : 96,
            height: compact ? 64 : 96,
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: compact ? 40 : 56,
              color: colorScheme.primary.withValues(alpha: 0.7),
            ),
          ),

          SizedBox(height: compact ? 12 : 20),

          // Title
          Text(
            title,
            style: compact
                ? AppTextStyles.getBodyStyle(context).copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  )
                : AppTextStyles.getH6Style(context),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          // Description
          if (description != null) ...[
            SizedBox(height: compact ? 8 : 12),
            Text(
              description!,
              style: compact
                  ? AppTextStyles.getCaptionStyle(context).copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    )
                  : AppTextStyles.getBodyStyle(context).copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],

          // Actions
          if (primaryAction != null || secondaryAction != null) ...[
            SizedBox(height: compact ? 16 : 24),

            // Primary action
            if (primaryAction != null) ...[
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: compact ? double.infinity : 250,
                  minHeight: 48,
                ),
                child: primaryAction!,
              ),
            ],

            // Secondary action
            if (secondaryAction != null) ...[
              SizedBox(height: compact ? 8 : 12),
              secondaryAction!,
            ],
          ],
        ],
      ),
    );
  }
}
