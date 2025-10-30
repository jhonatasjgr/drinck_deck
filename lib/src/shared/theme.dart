import 'package:flutter/material.dart';

class AppColors {
  static const Color darkBrown = Color(0xFF3E2C2A);
  static const Color gold = Color(0xFFD4AF37);
  static const Color offWhite = Color(0xFFF5F3F1);

  static const Color categoryLeve = Color(0xFF4CAF50);
  static const Color categoryMedio = Color(0xFFFFC107);
  static const Color categoryPesado = Color(0xFFE53935);
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      primaryColor: AppColors.gold,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkBrown,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: AppColors.gold,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: AppColors.gold),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.gold,
          foregroundColor: AppColors.darkBrown,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[850],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        labelStyle: const TextStyle(color: AppColors.offWhite),
        hintStyle: TextStyle(color: AppColors.offWhite.withOpacity(0.5)),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[850],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          labelStyle: const TextStyle(color: AppColors.offWhite),
        ),
        textStyle: const TextStyle(color: AppColors.offWhite),
      ),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.gold,
        secondary: AppColors.offWhite,
        surface: AppColors.darkBrown,
        onSurface: AppColors.offWhite,
      ),
    );
  }
}
