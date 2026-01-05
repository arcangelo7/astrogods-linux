import 'package:flutter/material.dart';
import '../constants/text_styles.dart';

class MysticalTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final VoidCallback? onTap;
  final VoidCallback? onFieldSubmitted;
  final bool readOnly;
  final bool enabled;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLines;

  const MysticalTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.enabled = true,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      validator: validator,
      readOnly: readOnly,
      enabled: enabled,
      onTap: onTap,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      maxLines: maxLines,
      style: AppTextStyles.getBodyStyle(context),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppTextStyles.getFormLabelStyle(context),
        floatingLabelStyle: AppTextStyles.getFloatingLabelStyle(context),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                size: AppTextStyles.iconMedium,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? Icon(
                suffixIcon,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                size: AppTextStyles.iconMedium,
              )
            : null,
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
      onFieldSubmitted: onFieldSubmitted != null
          ? (_) => onFieldSubmitted!()
          : null,
    );
  }
}