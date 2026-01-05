import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

String translateConnectionError(BuildContext context, String errorMessage) {
  final l10n = AppLocalizations.of(context)!;

  switch (errorMessage) {
    case 'connection_error':
      return l10n.connectionError;
    case 'server_unavailable':
      return l10n.serverUnavailable;
    case 'connection_timeout':
      return l10n.connectionTimeout;
    default:
      return errorMessage;
  }
}
