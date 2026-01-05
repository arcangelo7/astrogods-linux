import 'package:flutter/material.dart';
import '../constants/text_styles.dart';

class MysticalCheckbox extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool value;
  final Function(bool) onChanged;
  final bool enabled;

  const MysticalCheckbox({
    super.key,
    required this.title,
    this.subtitle,
    required this.value,
    required this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final checkboxTile = CheckboxListTile(
      title: Text(
        title,
        style: AppTextStyles.getBodyStyle(context),
      ),
      subtitle: subtitle != null
          ? Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                subtitle!,
                style: AppTextStyles.getWarningStyle(context),
              ),
            )
          : null,
      value: value,
      onChanged: enabled ? (newValue) => onChanged(newValue ?? false) : null,
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Theme.of(context).colorScheme.primary,
      checkColor: isDark ? Theme.of(context).colorScheme.surface : Colors.white,
      tileColor: Colors.transparent,
      contentPadding: const EdgeInsets.only(left: 8.0, right: 16.0),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
          width: 1,
        ),
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
      ),
      child: checkboxTile,
    );
  }
}
