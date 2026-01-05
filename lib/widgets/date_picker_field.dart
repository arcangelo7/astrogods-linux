import 'package:flutter/material.dart';
import '../constants/text_styles.dart';

class MysticalDatePickerField extends StatelessWidget {
  final TextEditingController controller;
  final DateTime? selectedDate;
  final String labelText;
  final Function(DateTime) onDateSelected;
  final String? Function(String?)? validator;
  final bool enabled;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? initialDate;

  const MysticalDatePickerField({
    super.key,
    required this.controller,
    required this.selectedDate,
    required this.labelText,
    required this.onDateSelected,
    this.validator,
    this.enabled = true,
    this.firstDate,
    this.lastDate,
    this.initialDate,
  });

  Future<void> _selectDate(BuildContext context) async {
    if (!enabled) return;

    final date = await showDatePicker(
      context: context,
      initialDate: initialDate ?? 
          selectedDate ?? 
          DateTime.now(),
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime.now(),
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

    if (date != null) {
      onDateSelected(date);
      controller.text = '${date.day}/${date.month}/${date.year}';
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
      onTap: () => _selectDate(context),
      style: AppTextStyles.getBodyStyle(context),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppTextStyles.getFormLabelStyle(context),
        floatingLabelStyle: AppTextStyles.getFloatingLabelStyle(context),
        suffixIcon: Icon(
          Icons.calendar_today,
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