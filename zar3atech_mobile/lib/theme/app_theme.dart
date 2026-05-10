import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand Colors
  static const Color primary = Color(0xFF154212);
  static const Color primaryContainer = Color(0xFF2D5A27);
  static const Color primaryFixed = Color(0xFFBCF0AE);
  static const Color onPrimaryFixed = Color(0xFF002201);
  
  static const Color secondary = Color(0xFF326B00);
  static const Color secondaryContainer = Color(0xFFAEF67B);

  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF93000A);

  // Surface Colors
  static const Color surface = Color(0xFFF3FBFF);
  static const Color surfaceContainerLow = Color(0xFFEDF5F9);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerHighest = Color(0xFFDCE4E8);
  
  static const Color onSurface = Color(0xFF151D20);
  static const Color onSurfaceVariant = Color(0xFF42493e);
  static const Color outlineVariant = Color(0xFFC2C9BB);
  static const Color secondaryFixed = Color(0xFFaef67b);
  static const Color onPrimaryContainer = Color(0xFF9dd090);
  static const Color surfaceContainerHigh = Color(0xFFe1e9ee);
  static const Color background = Color(0xFFF3FBFF);
  static const Color surfaceBright = Color(0xFFF3FBFF);
  static const Color outline = Color(0xFF72796E);
  // Status Colors
  static const Color statusHealthy = primaryFixed;
  static const Color onStatusHealthy = onPrimaryFixed;
  static const Color statusWarning = Color(0xFFE89A3C); // Earthy Orange
  static const Color onStatusWarning = Color(0xFF4A2B00);
  static const Color statusCritical = errorContainer;
  static const Color onStatusCritical = onErrorContainer;

  static ThemeData get themeData {
    return ThemeData(
      colorScheme: ColorScheme.light(
        primary: primary,
        primaryContainer: primaryContainer,
        secondary: secondary,
        secondaryContainer: secondaryContainer,
        surface: surface,
        onSurface: onSurface,
        error: const Color(0xFFBA1A1A),
      ),
      scaffoldBackgroundColor: surface,
      textTheme: _textTheme,
      useMaterial3: true,
      cardTheme: CardThemeData(
        color: surfaceContainerLowest,
        elevation: 0, // Soft lift via background colors
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: EdgeInsets.zero,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceContainerLow,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: Color(0x33C2C9BB)), // 20% opacity outline_variant
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: Color(0x33C2C9BB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: primary, width: 2),
        ),
        labelStyle: GoogleFonts.inter(
          fontSize: 12,
          color: onSurface,
        ),
      ),
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      // Brand Moments
      displayLarge: GoogleFonts.manrope(
        fontSize: 56,
        fontWeight: FontWeight.bold,
        color: onSurface,
      ),
      displayMedium: GoogleFonts.manrope(
        fontSize: 45,
        fontWeight: FontWeight.bold,
        color: onSurface,
      ),
      displaySmall: GoogleFonts.manrope(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        color: onSurface,
      ),
      headlineMedium: GoogleFonts.manrope(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: onSurface,
      ),
      headlineSmall: GoogleFonts.manrope(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: onSurface,
      ),
      // Technical Data & Labels
      titleLarge: GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: onSurface,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: onSurface,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: onSurface,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: onSurface,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: onSurface,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: onSurface,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: onSurface,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: onSurface,
      ),
    );
  }
}
