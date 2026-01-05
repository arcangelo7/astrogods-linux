import 'package:flutter/material.dart';

class AppColors {
  // Brand-specific colors (only those needed for starry night background)
  static const Color darkBackground = Color(0xFF0C1116);
  static const Color mysticalPurple = Color(0xFF8F00FF);
  static const Color cyanBlue = Color(0xFF51AFFF);

  // Theme seed color
  static const Color seedColor = Color(0xFF1E3A8A);

  // Light theme - minimalist palette matching dark mode approach
  static const Color lightBackground = Color(0xFFF8FAFC); // Very light background
  static const Color lightAccent = Color(0xFF1E3A8A); // Single royal blue accent
  static const Color lightSecondary = Color(0xFF64748B); // Subtle gray for stars
  static const Color lightHalo = Color(0xFF0EA5E9); // Brighter cyan-blue for halo contrast
  static const Color lightTrail = Color(0xFF0F172A); // Dark trail for multiply blend mode
  
  // Planet colors for light theme
  static const Color emeraldGreen = Color(0xFF226C3B); // Emerald green for planet
  static const Color cobaltBlue = Color(0xFF1E3A8A); // Cobalt blue for gradient
  static const Color navyBlue = Color(0xFF0F172A); // Navy blue for deeper gradient
  
  // Aurora effect colors for light theme
  static const Color goldenGlow = Color(0xFFFFC107); // Primary golden glow
  static const Color amberGlow = Color(0xFFFFB300); // Secondary amber glow
  static const Color lightGreen = Color(0xFF4ADE80); // Light green for planet top
  
  // Sky colors for light theme aurora
  static const Color auroraTop = Color(0xFFA0E7E5); // Aurora cyan at top
  static const Color auroraMiddle = Color(0xFFFBE7C6); // Warm golden middle
}
