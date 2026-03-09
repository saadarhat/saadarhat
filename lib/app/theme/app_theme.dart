import 'package:flutter/material.dart';

class AppTheme {
  static const _primary = Color(0xFF9C4DFF);
  static const _secondary = Color(0xFFFF4DD8);

  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F0A1A),
        colorScheme: const ColorScheme.dark(
          primary: _primary,
          secondary: _secondary,
          surface: Color(0xFF181228),
          error: Color(0xFFFF6B6B),
        ),
        cardTheme: CardTheme(
          color: const Color(0xFF181228),
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF231A38),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      );
}
