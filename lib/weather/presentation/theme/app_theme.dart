import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTheme {
  static const sun = Color(0xFFFFC94A);
  static const moon = Color(0xFFF3E9C6);
  static const rain = Color(0xFF9AD1FF);

  /// Secondary text on the sky.
  static const muted = Color(0xCCFFFFFF);
  static const hairline = Color(0x29FFFFFF);
  static const sheet = Color(0xFF101938);

  static const tabularFigures = [FontFeature.tabularFigures()];

  /// Fraunces carries the two things people read first, the temperature and
  /// the place; Instrument Sans does everything else.
  static ThemeData build() {
    final scheme =
        ColorScheme.fromSeed(
          seedColor: const Color(0xFF3373D6),
          brightness: Brightness.dark,
        ).copyWith(
          primary: Colors.white,
          onPrimary: const Color(0xFF12224A),
          surface: sheet,
          onSurface: Colors.white,
          onSurfaceVariant: muted,
        );
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      // Shown for the frame before the sky gradient paints.
      scaffoldBackgroundColor: const Color(0xFF070B1F),
    );

    final sans = GoogleFonts.instrumentSansTextTheme(
      base.textTheme,
    ).apply(bodyColor: Colors.white, displayColor: Colors.white);
    final textTheme = sans.copyWith(
      displayLarge: GoogleFonts.fraunces(
        fontSize: 124,
        height: 1,
        fontWeight: FontWeight.w300,
        letterSpacing: -5,
        color: Colors.white,
      ),
      headlineMedium: GoogleFonts.fraunces(
        fontSize: 28,
        height: 1.15,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      headlineSmall: GoogleFonts.fraunces(
        fontSize: 22,
        height: 1.2,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      titleLarge: sans.titleLarge?.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: sans.titleMedium?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: sans.bodyLarge?.copyWith(fontSize: 16, height: 1.45),
      bodyMedium: sans.bodyMedium?.copyWith(fontSize: 14, height: 1.4),
      bodySmall: sans.bodySmall?.copyWith(
        fontSize: 13,
        height: 1.35,
        color: muted,
      ),
    );

    return base.copyWith(
      textTheme: textTheme,
      iconTheme: const IconThemeData(color: Colors.white),
      dividerTheme: const DividerThemeData(
        color: hairline,
        thickness: 1,
        space: 1,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          textStyle: textTheme.titleMedium,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          minimumSize: const Size(0, 48),
          textStyle: textTheme.titleMedium,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xFFF2F4FA),
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: const Color(0xFF12224A),
        ),
        actionTextColor: const Color(0xFF164CB5),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: sheet,
        showDragHandle: true,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.white,
        linearTrackColor: Colors.transparent,
      ),
    );
  }
}
