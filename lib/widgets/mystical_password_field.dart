import 'package:flutter/material.dart';
import '../constants/text_styles.dart';

class MysticalPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final VoidCallback? onFieldSubmitted;

  const MysticalPasswordField({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.textInputAction,
    this.onFieldSubmitted,
  });

  @override
  State<MysticalPasswordField> createState() => _MysticalPasswordFieldState();
}

class _MysticalPasswordFieldState extends State<MysticalPasswordField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: widget.controller,
      obscureText: _obscurePassword,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      style: AppTextStyles.getBodyStyle(context),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: AppTextStyles.getFormLabelStyle(context),
        floatingLabelStyle: AppTextStyles.getFloatingLabelStyle(context),
        prefixIcon: Icon(
          Icons.lock_outline,
          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          size: AppTextStyles.iconMedium,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility_off : Icons.visibility,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            size: AppTextStyles.iconMedium,
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
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
      onFieldSubmitted: widget.onFieldSubmitted != null
          ? (_) => widget.onFieldSubmitted!()
          : null,
    );
  }
}
