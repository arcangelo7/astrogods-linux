import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../constants/colors.dart';

class StarryNightBackground extends StatefulWidget {
  final Widget? child;
  final bool showPlanet;
  final bool subtle;

  const StarryNightBackground({
    super.key,
    this.child,
    this.showPlanet = true,
    this.subtle = false,
  });

  @override
  State<StarryNightBackground> createState() => _StarryNightBackgroundState();
}

class _StarryNightBackgroundState extends State<StarryNightBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    final duration = widget.subtle
        ? const Duration(minutes: 3)
        : const Duration(seconds: 60);

    _animationController = AnimationController(
      duration: duration,
      vsync: this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _animationController.repeat();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  double _getLayerValue(int layer) {
    final base = _animationController.value;
    switch (layer) {
      case 1:
        return base;
      case 2:
        return (base * 0.5 + 0.33) % 1.0;
      case 3:
        return (base * 0.33 + 0.66) % 1.0;
      default:
        return base;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark
              ? (widget.subtle
                    ? [Colors.black, Colors.black]
                    : [AppColors.darkBackground, AppColors.darkBackground])
              : [
                  // Aurora effect background
                  AppColors.auroraTop, // Aurora cyan at top
                  AppColors.auroraMiddle, // Golden aurora middle
                  AppColors.lightBackground, // Light background at bottom
                ],
        ),
      ),
      child: Stack(
        children: [
          // Wrap star layers in RepaintBoundary to isolate repaints
          RepaintBoundary(
            child: Stack(
              children: [
                // Stars layer 1
                Positioned.fill(
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return CustomPaint(
                        isComplex: true,
                        painter: StarPainter(
                          animationValue: _getLayerValue(1),
                          starSize: widget.subtle ? 0.6 : 1.0,
                          starCount: widget.subtle ? 60 : 100,
                          seed: 1,
                          starColor: isDark
                              ? (widget.subtle
                                    ? Colors.white.withValues(alpha: 0.12)
                                    : Colors.white)
                              : AppColors.lightSecondary.withValues(alpha: 0.4),
                          subtle: widget.subtle,
                        ),
                      );
                    },
                  ),
                ),
                // Stars layer 2
                Positioned.fill(
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return CustomPaint(
                        isComplex: true,
                        painter: StarPainter(
                          animationValue: _getLayerValue(2),
                          starSize: widget.subtle ? 1.0 : 1.5,
                          starCount: widget.subtle ? 35 : 30,
                          seed: 2,
                          starColor: isDark
                              ? (widget.subtle
                                    ? Colors.white.withValues(alpha: 0.18)
                                    : Colors.white)
                              : AppColors.lightSecondary.withValues(alpha: 0.5),
                          subtle: widget.subtle,
                        ),
                      );
                    },
                  ),
                ),
                // Stars layer 3
                Positioned.fill(
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return CustomPaint(
                        isComplex: true,
                        painter: StarPainter(
                          animationValue: _getLayerValue(3),
                          starSize: widget.subtle ? 1.4 : 3.0,
                          starCount: widget.subtle ? 20 : 20,
                          seed: 3,
                          starColor: isDark
                              ? (widget.subtle
                                    ? Colors.white.withValues(alpha: 0.25)
                                    : Colors.white)
                              : AppColors.lightSecondary.withValues(alpha: 0.6),
                          subtle: widget.subtle,
                        ),
                      );
                    },
                  ),
                ),
                if (widget.showPlanet)
                  Positioned.fill(
                    child: CustomPaint(
                      isComplex: true,
                      willChange: false,
                      painter: PlanetHorizonPainter(isDark: isDark),
                    ),
                  ),
              ],
            ),
          ),
          // Child widget (outside RepaintBoundary to avoid repainting with stars)
          if (widget.child != null) widget.child!,
        ],
      ),
    );
  }
}

class StarPainter extends CustomPainter {
  final double animationValue;
  final double starSize;
  final int starCount;
  final int seed;
  final Color starColor;
  final bool subtle;

  // Cached MaskFilters to avoid recreation on every paint call
  late final MaskFilter _outerGlowFilter;
  late final MaskFilter _innerGlowFilter;

  StarPainter({
    required this.animationValue,
    required this.starSize,
    required this.starCount,
    required this.seed,
    this.starColor = Colors.white,
    this.subtle = false,
  })  : _outerGlowFilter = MaskFilter.blur(BlurStyle.normal, starSize * 2),
        _innerGlowFilter = MaskFilter.blur(BlurStyle.normal, starSize * 0.8);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = starColor
      ..style = PaintingStyle.fill;

    final random = math.Random(seed);

    for (int i = 0; i < starCount; i++) {
      final baseX = random.nextDouble() * size.width * (subtle ? 1.0 : 1.6);
      final baseY = random.nextDouble() * size.height * (subtle ? 1.0 : 2);

      final x = subtle
          ? baseX + (math.sin(animationValue * 2 * math.pi + i * 0.1) * 2)
          : baseX;
      final y = subtle
          ? baseY + (math.cos(animationValue * 2 * math.pi + i * 0.15) * 1.5)
          : (baseY - (animationValue * size.height * 2)) % (size.height * 2);

      if (y >= -starSize &&
          y <= size.height + starSize &&
          x >= -starSize &&
          x <= size.width + starSize) {
        final shouldGlow = subtle ? (i + seed) % 15 < 2 : (i + seed) % 10 < 3;

        if (shouldGlow) {
          final glowIntensity =
              0.5 + (0.5 * math.sin(animationValue * 2 * math.pi + i * 0.2));
          final glowAlpha = subtle ? 0.15 : 0.3;
          final innerGlowAlpha = subtle ? 0.35 : 0.6;

          final glowPaint = Paint()
            ..color = starColor.withValues(alpha: glowAlpha * glowIntensity)
            ..style = PaintingStyle.fill
            ..maskFilter = _outerGlowFilter;

          canvas.drawCircle(Offset(x, y), starSize * 3, glowPaint);

          final innerGlowPaint = Paint()
            ..color = starColor.withValues(
              alpha: innerGlowAlpha * glowIntensity,
            )
            ..style = PaintingStyle.fill
            ..maskFilter = _innerGlowFilter;

          canvas.drawCircle(Offset(x, y), starSize * 1.5, innerGlowPaint);
        }

        paint.color = starColor;
        canvas.drawCircle(Offset(x, y), starSize, paint);
      }
    }
  }

  @override
  bool shouldRepaint(StarPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}

class _PlanetTheme {
  final Color primaryGlow; // Used for halos and most rim effects
  final Color
  secondaryGlow; // Used for secondary halo (only different in light theme)
  final Color planetColor;
  final Color trailColor; // Used for trail effects
  final double haloAlpha1;
  final double haloAlpha2;
  final double trailAlpha1;
  final double trailAlpha2;
  final double rimAlpha;
  final double innerShadowAlpha;
  final double frontRimAlpha;

  const _PlanetTheme({
    required this.primaryGlow,
    required this.secondaryGlow,
    required this.planetColor,
    required this.trailColor,
    required this.haloAlpha1,
    required this.haloAlpha2,
    required this.trailAlpha1,
    required this.trailAlpha2,
    required this.rimAlpha,
    required this.innerShadowAlpha,
    required this.frontRimAlpha,
  });
}

class PlanetHorizonPainter extends CustomPainter {
  final bool isDark;

  const PlanetHorizonPainter({this.isDark = true});

  @override
  void paint(Canvas canvas, Size size) {
    // Calculate common planet parameters
    final double horizonApexFactor = 0.30;
    final double horizonApexY = size.height * horizonApexFactor;
    final double planetRadius = size.width * 1.8;
    final Offset center = Offset(size.width / 2, planetRadius + horizonApexY);
    final double minDim = math.min(size.width, size.height);

    // Theme-specific colors
    final _PlanetTheme theme = isDark
        ? _PlanetTheme(
            primaryGlow: AppColors.cyanBlue, // Used for most glow effects
            secondaryGlow: AppColors.mysticalPurple, // Used for outer halo
            planetColor: Colors.black,
            trailColor: AppColors.cyanBlue,
            haloAlpha1: 0.5,
            haloAlpha2: 0.4,
            trailAlpha1: 0.27,
            trailAlpha2: 0.13,
            rimAlpha: 0.6,
            innerShadowAlpha: 0.85,
            frontRimAlpha: 0.5,
          )
        : _PlanetTheme(
            primaryGlow: AppColors.goldenGlow, // Golden aurora glow
            secondaryGlow: AppColors.amberGlow, // Amber aurora warmth
            planetColor: AppColors.emeraldGreen, // Emerald green planet
            trailColor: AppColors.goldenGlow, // Golden trails
            haloAlpha1: 0.7, // Strong aurora halo
            haloAlpha2: 0.6, // Strong aurora halo
            trailAlpha1: 0.5, // Aurora trails
            trailAlpha2: 0.4, // Aurora trails
            rimAlpha: 0.8, // Very visible aurora rim
            innerShadowAlpha: 0.9, // Strong aurora inner glow
            frontRimAlpha: 0.7, // Strong aurora front rim
          );

    // 1) Atmospheric bloom
    _paintAtmosphericHalos(canvas, size, center, planetRadius, minDim, theme);

    // 2) Rim glow
    _paintRimGlow(canvas, center, planetRadius, theme);

    // 3) Planet with gradient effect (light theme only)
    if (isDark) {
      final Paint planetPaint = Paint()
        ..style = PaintingStyle.fill
        ..color = theme.planetColor;
      canvas.drawCircle(center, planetRadius, planetPaint);
    } else {
      // Create dramatic gradient for light theme planet - positioned for visible hemisphere
      final Paint planetPaint = Paint()
        ..style = PaintingStyle.fill
        ..shader = RadialGradient(
          center: const Alignment(
            0.0,
            -0.8,
          ), // Light source at top of visible hemisphere
          radius: 0.6, // Smaller radius to concentrate effect on visible part
          colors: [
            AppColors.lightGreen, // Bright light green at top
            AppColors.emeraldGreen, // Emerald green
            AppColors.cobaltBlue, // Cobalt blue
            AppColors.navyBlue, // Deep navy at middle
            AppColors.navyBlue, // Very dark - already reached at middle
          ],
          stops: const [
            0.0,
            0.2,
            0.35,
            0.5,
            0.5,
          ], // All transition complete by 50%
        ).createShader(Rect.fromCircle(center: center, radius: planetRadius));
      canvas.drawCircle(center, planetRadius, planetPaint);
    }

    // 4) Inner shadow
    _paintInnerShadow(canvas, center, planetRadius, minDim, theme);

    // 5) Foreground rim
    _paintForegroundRim(canvas, center, planetRadius, minDim, theme);
  }

  void _paintAtmosphericHalos(
    Canvas canvas,
    Size size,
    Offset center,
    double planetRadius,
    double minDim,
    _PlanetTheme theme,
  ) {
    canvas.save();
    final Path screenPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    final Path planetPath = Path()
      ..addOval(Rect.fromCircle(center: center, radius: planetRadius));
    final Path outsidePlanet = Path.combine(
      PathOperation.difference,
      screenPath,
      planetPath,
    );
    canvas.clipPath(outsidePlanet);

    // Outer halo
    final double haloThickness = minDim * 0.08;
    final Paint outerHaloPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = haloThickness
      ..color = theme.secondaryGlow.withValues(alpha: theme.haloAlpha1)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, haloThickness * 0.22)
      ..blendMode = BlendMode.screen;
    canvas.drawCircle(
      center,
      planetRadius + haloThickness * 0.25,
      outerHaloPaint,
    );

    // Mid halo
    final double midThickness = minDim * 0.045;
    final Paint midHaloPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = midThickness
      ..color = theme.primaryGlow.withValues(alpha: theme.haloAlpha2)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, midThickness * 0.28)
      ..blendMode = BlendMode.screen;
    canvas.drawCircle(center, planetRadius + midThickness * 0.30, midHaloPaint);

    // Trail halos
    final double trailThickness1 = minDim * 0.12;
    final Paint trailHaloPaint1 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = trailThickness1
      ..color = theme.trailColor.withValues(alpha: theme.trailAlpha1)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, trailThickness1 * 0.50)
      ..blendMode = isDark ? BlendMode.screen : BlendMode.multiply;
    canvas.drawCircle(
      center,
      planetRadius + trailThickness1 * 0.80,
      trailHaloPaint1,
    );

    final double trailThickness2 = minDim * 0.18;
    final Paint trailHaloPaint2 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = trailThickness2
      ..color = theme.trailColor.withValues(alpha: theme.trailAlpha2)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, trailThickness2 * 0.60)
      ..blendMode = isDark ? BlendMode.screen : BlendMode.multiply;
    canvas.drawCircle(
      center,
      planetRadius + trailThickness2 * 0.90,
      trailHaloPaint2,
    );
    canvas.restore();
  }

  void _paintRimGlow(
    Canvas canvas,
    Offset center,
    double planetRadius,
    _PlanetTheme theme,
  ) {
    final double rimRadius = planetRadius * 1.012;
    final Paint rimPaint = Paint()
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10)
      ..blendMode = BlendMode.screen
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: 1.0,
        colors: [
          Colors.transparent,
          theme.primaryGlow.withValues(alpha: theme.rimAlpha),
          theme.primaryGlow.withValues(alpha: theme.rimAlpha),
          Colors.transparent,
        ],
        stops: const [0.956, 0.975, 0.992, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: rimRadius));
    canvas.drawCircle(center, rimRadius, rimPaint);
  }

  void _paintInnerShadow(
    Canvas canvas,
    Offset center,
    double planetRadius,
    double minDim,
    _PlanetTheme theme,
  ) {
    final double innerShadowWidth = minDim * 0.035;
    final Paint innerShadowPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = innerShadowWidth
      ..color = theme.primaryGlow.withValues(alpha: theme.innerShadowAlpha)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, innerShadowWidth * 0.85)
      ..blendMode = BlendMode.srcOver;
    canvas.drawCircle(
      center,
      planetRadius - innerShadowWidth * 1.2,
      innerShadowPaint,
    );
  }

  void _paintForegroundRim(
    Canvas canvas,
    Offset center,
    double planetRadius,
    double minDim,
    _PlanetTheme theme,
  ) {
    final double frontRimWidth = minDim * 0.016;
    final Paint frontRimPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = frontRimWidth
      ..color = theme.primaryGlow.withValues(alpha: theme.frontRimAlpha)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, frontRimWidth * 0.6)
      ..blendMode = BlendMode.screen;
    canvas.drawCircle(
      center,
      planetRadius - frontRimWidth * 0.2,
      frontRimPaint,
    );
  }

  @override
  bool shouldRepaint(covariant PlanetHorizonPainter oldDelegate) => false;
}
