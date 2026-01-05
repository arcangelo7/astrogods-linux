import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/text_styles.dart';
import '../l10n/app_localizations.dart';

class SnackbarUtils {
  static void showCopyableErrorSnackBar(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 4),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Expanded(
              child: Text(
                message, 
                style: AppTextStyles.getSnackbarTextStyle(context, Theme.of(context).colorScheme.error)
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: Icon(
                Icons.copy, 
                color: ThemeData.estimateBrightnessForColor(Theme.of(context).colorScheme.error) == Brightness.dark
                    ? Colors.white
                    : Colors.black,
                size: 18
              ),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: message));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      AppLocalizations.of(context)!.errorMessageCopied,
                      style: AppTextStyles.getSnackbarTextStyle(context, Theme.of(context).colorScheme.primary),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    behavior: SnackBarBehavior.floating,
                    margin: const EdgeInsets.all(16),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        duration: duration,
      ),
    );
  }

  static void showErrorSnackBar(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 4),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message, 
          style: AppTextStyles.getSnackbarTextStyle(context, Theme.of(context).colorScheme.error)
        ),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        duration: duration,
      ),
    );
  }

  static void showSuccessSnackBar(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message, 
          style: AppTextStyles.getSnackbarTextStyle(context, Theme.of(context).colorScheme.primary)
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        duration: duration,
      ),
    );
  }

  static void showErrorWithAction(
    BuildContext context,
    String message,
    String actionLabel,
    VoidCallback onActionPressed, {
    Duration duration = const Duration(seconds: 5),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Expanded(
              child: Text(
                message, 
                style: AppTextStyles.getSnackbarTextStyle(context, Theme.of(context).colorScheme.error)
              ),
            ),
            const SizedBox(width: 12),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                onActionPressed();
              },
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onError,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: Text(
                actionLabel,
                style: AppTextStyles.getCaptionStyle(context).copyWith(
                  color: Theme.of(context).colorScheme.onError,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        duration: duration,
      ),
    );
  }

  static void showInfoSnackBar(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 4),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message, 
          style: AppTextStyles.getSnackbarTextStyle(context, Theme.of(context).colorScheme.primary)
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        duration: duration,
      ),
    );
  }

  // Convenience methods
  static void showError(BuildContext context, String message) =>
      showErrorSnackBar(context, message);

  static void showSuccess(BuildContext context, String message) =>
      showSuccessSnackBar(context, message);

  static void showInfo(BuildContext context, String message) =>
      showInfoSnackBar(context, message);
}
