import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'mystical_checkbox.dart';

class UnknownTimeCheckbox extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;
  final bool enabled;

  const UnknownTimeCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return MysticalCheckbox(
      title: l10n.dontKnowBirthTime,
      subtitle: value ? l10n.withoutBirthTimeWarning : null,
      value: value,
      onChanged: onChanged,
      enabled: enabled,
    );
  }
}
