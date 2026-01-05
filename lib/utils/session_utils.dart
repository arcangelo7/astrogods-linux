import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../services/api_client.dart';
import '../providers/auth_provider.dart';
import 'snackbar_utils.dart';

class SessionUtils {
  static bool _isAuthExpired(String? errorKey) {
    return errorKey == 'auth.token_expired' ||
        errorKey == 'auth.invalid_token' ||
        errorKey == 'auth.missing_token' ||
        errorKey == 'auth.token_revoked';
  }

  static bool isConnectionError(String? errorKey) {
    return errorKey == 'connection.error' ||
        errorKey == 'connection.timeout' ||
        errorKey == 'connection.unavailable';
  }

  static String getLocalizedConnectionError(
    BuildContext context,
    String? errorKey,
  ) {
    final l10n = AppLocalizations.of(context)!;
    switch (errorKey) {
      case 'connection.timeout':
        return l10n.connectionTimeout;
      case 'connection.unavailable':
        return l10n.serverUnavailable;
      default:
        return l10n.connectionError;
    }
  }

  static void _handleExpiration(BuildContext context, String errorMessage) {
    SnackbarUtils.showError(context, errorMessage);

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.logout();

    context.go('/login');
  }

  static bool handleSessionExpiration(BuildContext context, ApiException e) {
    if (_isAuthExpired(e.errorKey)) {
      _handleExpiration(context, e.message);
      return true;
    }
    return false;
  }

  static bool handleSessionExpirationByKey(
    BuildContext context,
    String? errorKey,
    String errorMessage,
  ) {
    if (_isAuthExpired(errorKey)) {
      _handleExpiration(context, errorMessage);
      return true;
    }
    return false;
  }

  static void handleApiException(
    BuildContext context,
    ApiException e,
    Function(String) showError,
  ) {
    if (!handleSessionExpiration(context, e)) {
      if (isConnectionError(e.errorKey)) {
        showError(getLocalizedConnectionError(context, e.errorKey));
      } else {
        showError(e.message);
      }
    }
  }

}
