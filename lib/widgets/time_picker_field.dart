import 'package:flutter/material.dart';
import '../constants/text_styles.dart';

class MysticalTimePickerField extends StatelessWidget {
  final TextEditingController controller;
  final TimeOfDay? selectedTime;
  final String labelText;
  final Function(TimeOfDay) onTimeSelected;
  final String? Function(String?)? validator;
  final bool enabled;

  const MysticalTimePickerField({
    super.key,
    required this.controller,
    required this.selectedTime,
    required this.labelText,
    required this.onTimeSelected,
    this.validator,
    this.enabled = true,
  });

  Future<void> _selectTime(BuildContext context) async {
    if (!enabled) return;

    final time = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Theme.of(context).colorScheme.primary,
              surface: Theme.of(context).colorScheme.surface,
            ),
          ),
          child: child!,
        );
      },
    );

    if (time != null) {
      onTimeSelected(time);
      controller.text = '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      validator: validator,
      readOnly: true,
      enabled: enabled,
      onTap: enabled ? () => _selectTime(context) : null,
      style: AppTextStyles.getBodyStyle(context),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppTextStyles.getFormLabelStyle(context),
        floatingLabelStyle: AppTextStyles.getFloatingLabelStyle(context),
        suffixIcon: Icon(
          Icons.access_time,
          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          size: AppTextStyles.iconMedium,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: theme.colorScheme.outline.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: theme.colorScheme.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: theme.colorScheme.error,
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        filled: true,
        fillColor: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
      ),
    );
  }
}