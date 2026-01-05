import 'package:flutter/material.dart';
import '../constants/text_styles.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double height;
  final double borderRadius;
  final List<Color>? gradientColors;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final bool enabled;
  final bool isLoading;
  final double? fontSize;
  final double? letterSpacing;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height = 56,
    this.borderRadius = 30,
    this.gradientColors,
    this.textStyle,
    this.padding,
    this.enabled = true,
    this.isLoading = false,
    this.fontSize,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    final defaultGradient = [
      Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.primaryContainer,
    ];

    // Calculate appropriate font size based on text length
    double calculateFontSize() {
      if (fontSize != null) return fontSize!;

      final textLength = text.length;
      if (textLength > 20) {
        return AppTextStyles.bodySize * 0.85; // Reduce by 15% for long text
      } else if (textLength > 15) {
        return AppTextStyles.bodySize * 0.9; // Reduce by 10% for medium text
      }
      return AppTextStyles.bodySize;
    }

    // Adjust padding based on text length
    EdgeInsetsGeometry calculatePadding() {
      if (padding != null) return padding!;

      final textLength = text.length;
      if (textLength > 20) {
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 16);
      } else if (textLength > 15) {
        return const EdgeInsets.symmetric(horizontal: 32, vertical: 17);
      }
      return const EdgeInsets.symmetric(horizontal: 48, vertical: 18);
    }

    final defaultTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.onPrimary,
      fontSize: calculateFontSize(),
      letterSpacing: letterSpacing ?? AppTextStyles.normalLetterSpacing,
      fontWeight: AppTextStyles.semibold,
    );

    final defaultPadding = calculatePadding();

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: enabled
            ? LinearGradient(
                colors: gradientColors ?? defaultGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: enabled
            ? null
            : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: enabled
            ? [
                BoxShadow(
                  color: (gradientColors?.first ?? defaultGradient.first)
                      .withValues(alpha: 0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ]
            : null,
      ),
      child: ElevatedButton(
        onPressed: enabled && !isLoading ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: padding ?? defaultPadding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              )
            : FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text,
                  style: enabled
                      ? (textStyle ?? defaultTextStyle)
                      : (textStyle ?? defaultTextStyle).copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
      ),
    );
  }
}
