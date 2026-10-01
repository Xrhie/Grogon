import 'package:flutter/material.dart';

/// Tema warna dan gaya visual Grogon sesuai DESIGN.md dan referensi UI.
class AppColors {
  // Background & Surface
  static const Color background = Color(0xFF101010);
  static const Color surface = Color(0xFF18181A);
  static const Color cardSurface = Color(0xFF1E1E22);

  // Brand & Accents
  static const Color neonGreen = Color(0xFF3BE83B);
  static const Color fireOrange = Color(0xFFFF6D00);
  static const Color diamondBlue = Color(0xFF29B6F6);
  static const Color heartRed = Color(0xFFEF4444);

  // Text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF9E9E9E);
  static const Color textDisabled = Color(0xFF616161);
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      useMaterial3: true,
      fontFamily: null, // System default sans-serif (Roboto on Android)
      colorScheme: const ColorScheme.dark(
        primary: AppColors.neonGreen,
        surface: AppColors.surface,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.background,
        selectedItemColor: AppColors.neonGreen,
        unselectedItemColor: AppColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
    );
  }
}
