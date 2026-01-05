import 'package:flutter/material.dart';

class AppTextStyles {
  // Typography scale based on semantic hierarchy

  // Headlines
  static const double heroSize = 64.0; // Hero titles (main brand titles)
  static const double h1Size = 48.0; // Large titles (home screen desktop)
  static const double h2Size = 42.0; // Main titles (home screen mobile)
  static const double h3Size =
      30.0; // Section titles (birth chart name, auth titles)
  static const double h4Size = 24.0; // Screen titles, section headers
  static const double h5Size = 22.0; // Markdown H2 equivalent
  static const double h6Size = 19.0; // Markdown H3 equivalent

  // Body text
  static const double bodyLargeSize = 20.0; // Subtitles (home screen mobile)
  static const double bodyMediumSize =
      18.0; // Birth chart info, large body text
  static const double bodySmallSize = 17.0; // Markdown paragraphs
  static const double bodySize = 16.0; // Form fields, standard body text

  // Supporting text
  static const double captionSize = 14.0; // Form labels, small text
  static const double smallSize = 13.0; // Warning text
  static const double tinySize = 12.0; // Location search secondary

  // Font weights
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semibold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extrabold = FontWeight.w800;

  // Line heights
  static const double tightLineHeight = 1.2;
  static const double normalLineHeight = 1.3;
  static const double relaxedLineHeight = 1.4;
  static const double looseLineHeight = 1.6;

  // Letter spacing
  static const double tightLetterSpacing = 1.2;
  static const double normalLetterSpacing = 1.5;
  static const double wideLetterSpacing = 3.0;

  // Icon sizes
  static const double iconSmall = 16.0;
  static const double iconMedium = 20.0;

  // SEMANTIC TEXT STYLES

  // Headlines
  static TextStyle getHeroStyle(BuildContext context) {
    return TextStyle(
      fontSize: heroSize,
      fontWeight: extrabold,
      letterSpacing: wideLetterSpacing,
      height: tightLineHeight,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle getH1Style(BuildContext context) {
    return TextStyle(
      fontSize: h1Size,
      fontWeight: extrabold,
      letterSpacing: wideLetterSpacing,
      height: tightLineHeight,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle getH2Style(BuildContext context) {
    return TextStyle(
      fontSize: h2Size,
      fontWeight: extrabold,
      letterSpacing: wideLetterSpacing,
      height: tightLineHeight,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle getH3Style(BuildContext context) {
    return TextStyle(
      fontSize: h3Size,
      fontWeight: bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle getH4Style(BuildContext context) {
    return TextStyle(
      fontSize: h4Size,
      fontWeight: light,
      color: Theme.of(context).colorScheme.onSurface,
      height: normalLineHeight,
    );
  }

  static TextStyle getH5Style(BuildContext context) {
    return TextStyle(
      fontSize: h5Size,
      height: relaxedLineHeight,
      fontWeight: bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle getH6Style(BuildContext context) {
    return TextStyle(
      fontSize: h6Size,
      height: relaxedLineHeight,
      fontWeight: semibold,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  // Subtitles
  static TextStyle getSubtitleLargeStyle(BuildContext context) {
    return TextStyle(
      fontSize: bodyLargeSize,
      fontWeight: light,
      letterSpacing: normalLetterSpacing,
      height: relaxedLineHeight,
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
    );
  }

  static TextStyle getSubtitleMediumStyle(BuildContext context) {
    return TextStyle(
      fontSize: bodyMediumSize,
      fontWeight: regular,
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
    );
  }

  // Body text
  static TextStyle getBodyLargeStyle(BuildContext context) {
    return TextStyle(
      fontSize: bodySmallSize,
      height: looseLineHeight,
      fontWeight: regular,
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
    );
  }

  static TextStyle getBodyStyle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.onSurface,
      fontSize: bodySize,
      fontWeight: regular,
    );
  }

  // Form elements
  static TextStyle getFormLabelStyle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
      fontSize: captionSize,
      fontWeight: light,
    );
  }

  static TextStyle getFloatingLabelStyle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: captionSize,
      fontWeight: regular,
    );
  }

  // Interactive elements
  static const TextStyle buttonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: bodySize,
    fontWeight: semibold,
    letterSpacing: tightLetterSpacing,
  );

  static TextStyle getLinkStyle(BuildContext context) {
    return TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: semibold);
  }

  // Special text styles
  static TextStyle getCaptionStyle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
      fontSize: captionSize,
      fontWeight: regular,
    );
  }

  static TextStyle getSmallTextStyle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
      fontSize: tinySize,
    );
  }

  static TextStyle getWarningStyle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.error,
      fontSize: smallSize,
      fontWeight: medium,
    );
  }

  static TextStyle getButtonStyle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: bodySize,
      fontWeight: medium,
    );
  }

  // Snackbar
  static TextStyle getSnackbarTextStyle(BuildContext context, Color backgroundColor) {
    return TextStyle(
      color: ThemeData.estimateBrightnessForColor(backgroundColor) == Brightness.dark
          ? Colors.white
          : Colors.black,
      fontWeight: medium,
      fontSize: bodySize,
    );
  }

  // Markdown styles
  static TextStyle getMarkdownParagraphStyle(BuildContext context) =>
      getBodyLargeStyle(context);
  static TextStyle getMarkdownH2Style(BuildContext context) => getH5Style(context);
  static TextStyle getMarkdownH3Style(BuildContext context) => getH6Style(context);

  static TextStyle getMarkdownStrongStyle(BuildContext context) {
    return TextStyle(
      fontWeight: bold,
      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.9),
    );
  }

  static TextStyle getMarkdownEmStyle(BuildContext context) {
    return TextStyle(
      fontStyle: FontStyle.italic,
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
    );
  }

  // Location search styles
  static TextStyle getLocationMainStyle(BuildContext context) {
    return TextStyle(
      fontWeight: medium,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle getLocationSecondaryStyle(BuildContext context) {
    return TextStyle(
      fontSize: tinySize,
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
    );
  }

  static TextStyle getLocationLoadingStyle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
      fontSize: captionSize,
    );
  }

  // Drawer
  static const TextStyle drawerHeaderStyle = TextStyle(
    color: Colors.white,
    fontSize: h4Size,
    fontWeight: bold,
  );
}
