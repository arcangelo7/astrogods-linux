import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static const double heroSize = 64.0;
  static const double h1Size = 48.0;
  static const double h2Size = 42.0;
  static const double h3Size = 30.0;
  static const double h4Size = 24.0;
  static const double h5Size = 22.0;
  static const double h6Size = 19.0;

  static const double bodyLargeSize = 20.0;
  static const double bodyMediumSize = 18.0;
  static const double bodySmallSize = 17.0;
  static const double bodySize = 16.0;

  static const double captionSize = 14.0;
  static const double smallSize = 13.0;
  static const double tinySize = 12.0;

  static const FontWeight thin = FontWeight.w100;
  static const FontWeight light = FontWeight.w400;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semibold = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extrabold = FontWeight.w500;

  static const double tightLineHeight = 1.2;
  static const double normalLineHeight = 1.3;
  static const double relaxedLineHeight = 1.4;
  static const double looseLineHeight = 1.6;

  static const double tightLetterSpacing = 1.2;
  static const double normalLetterSpacing = 1.5;
  static const double wideLetterSpacing = 3.0;

  static const double iconSmall = 16.0;
  static const double iconMedium = 20.0;
  static TextStyle getHeroStyle(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: heroSize,
      fontWeight: extrabold,
      letterSpacing: wideLetterSpacing,
      height: tightLineHeight,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle getH1Style(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: h1Size,
      fontWeight: extrabold,
      letterSpacing: wideLetterSpacing,
      height: tightLineHeight,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle getH2Style(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: h2Size,
      fontWeight: extrabold,
      letterSpacing: wideLetterSpacing,
      height: tightLineHeight,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle getH3Style(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: h3Size,
      fontWeight: bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle getH4Style(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: h4Size,
      fontWeight: light,
      color: Theme.of(context).colorScheme.onSurface,
      height: normalLineHeight,
    );
  }

  static TextStyle getH5Style(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: h5Size,
      height: relaxedLineHeight,
      fontWeight: bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle getH6Style(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: h6Size,
      height: relaxedLineHeight,
      fontWeight: semibold,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle getSubtitleLargeStyle(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: bodyLargeSize,
      fontWeight: light,
      letterSpacing: normalLetterSpacing,
      height: relaxedLineHeight,
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
    );
  }

  static TextStyle getSubtitleMediumStyle(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: bodyMediumSize,
      fontWeight: regular,
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
    );
  }

  static TextStyle getBodyLargeStyle(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: bodySmallSize,
      height: looseLineHeight,
      fontWeight: regular,
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
    );
  }

  static TextStyle getBodyStyle(BuildContext context) {
    return GoogleFonts.roboto(
      color: Theme.of(context).colorScheme.onSurface,
      fontSize: bodySize,
      fontWeight: regular,
    );
  }

  static TextStyle getFormLabelStyle(BuildContext context) {
    return GoogleFonts.roboto(
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
      fontSize: captionSize,
      fontWeight: light,
    );
  }

  static TextStyle getFloatingLabelStyle(BuildContext context) {
    return GoogleFonts.roboto(
      color: Theme.of(context).colorScheme.primary,
      fontSize: captionSize,
      fontWeight: regular,
    );
  }

  static TextStyle get buttonTextStyle => GoogleFonts.roboto(
    color: Colors.white,
    fontSize: bodySize,
    fontWeight: semibold,
    letterSpacing: tightLetterSpacing,
  );

  static TextStyle getLinkStyle(BuildContext context) {
    return GoogleFonts.roboto(color: Theme.of(context).colorScheme.primary, fontWeight: semibold);
  }

  static TextStyle getCaptionStyle(BuildContext context) {
    return GoogleFonts.roboto(
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
      fontSize: captionSize,
      fontWeight: regular,
    );
  }

  static TextStyle getSmallTextStyle(BuildContext context) {
    return GoogleFonts.roboto(
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
      fontSize: tinySize,
    );
  }

  static TextStyle getWarningStyle(BuildContext context) {
    return GoogleFonts.roboto(
      color: Theme.of(context).colorScheme.error,
      fontSize: smallSize,
      fontWeight: medium,
    );
  }

  static TextStyle getButtonStyle(BuildContext context) {
    return GoogleFonts.roboto(
      color: Theme.of(context).colorScheme.primary,
      fontSize: bodySize,
      fontWeight: medium,
    );
  }

  static TextStyle getSnackbarTextStyle(BuildContext context, Color backgroundColor) {
    return GoogleFonts.roboto(
      color: ThemeData.estimateBrightnessForColor(backgroundColor) == Brightness.dark
          ? Colors.white
          : Colors.black,
      fontWeight: medium,
      fontSize: bodySize,
    );
  }

  static TextStyle getMarkdownParagraphStyle(BuildContext context) =>
      getBodyLargeStyle(context);
  static TextStyle getMarkdownH2Style(BuildContext context) => getH5Style(context);
  static TextStyle getMarkdownH3Style(BuildContext context) => getH6Style(context);

  static TextStyle getMarkdownStrongStyle(BuildContext context) {
    return GoogleFonts.roboto(
      fontWeight: bold,
      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.9),
    );
  }

  static TextStyle getMarkdownEmStyle(BuildContext context) {
    return GoogleFonts.roboto(
      fontStyle: FontStyle.italic,
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
    );
  }

  static TextStyle getLocationMainStyle(BuildContext context) {
    return GoogleFonts.roboto(
      fontWeight: medium,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle getLocationSecondaryStyle(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: tinySize,
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
    );
  }

  static TextStyle getLocationLoadingStyle(BuildContext context) {
    return GoogleFonts.roboto(
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
      fontSize: captionSize,
    );
  }

  static TextStyle get drawerHeaderStyle => GoogleFonts.roboto(
    color: Colors.white,
    fontSize: h4Size,
    fontWeight: bold,
  );
}
