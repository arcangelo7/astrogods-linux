import '../l10n/app_localizations.dart';

class AuthValidators {
  static String? validateEmail(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) {
      return l10n.pleaseFillAllFields;
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return l10n.invalidEmail;
    }
    return null;
  }

  static String? validatePassword(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) {
      return l10n.pleaseFillAllFields;
    }
    if (value.length < 8) {
      return l10n.passwordTooShort;
    }
    return null;
  }

  static String? validateConfirmPassword(
    String? value,
    String originalPassword,
    AppLocalizations l10n,
  ) {
    if (value == null || value.isEmpty) {
      return l10n.pleaseFillAllFields;
    }
    if (value != originalPassword) {
      return l10n.passwordsDoNotMatch;
    }
    return null;
  }

  static String? validateRequiredField(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) {
      return l10n.pleaseFillAllFields;
    }
    return null;
  }
}
