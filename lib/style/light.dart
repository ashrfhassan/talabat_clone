import 'package:flutter/material.dart';
import 'package:talabat_clone/style/colors.dart';

class LightTheme {
  static ThemeData get light {
    return ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: main_color,
        onPrimary: white_color,
        secondary: main_color,
        onSecondary: white_color,
        error: error_color,
        onError: white_color,
        surface: white_color,
        onSurface: dark_color,
        outline: light_grey_color,
        onTertiary: text_grey_color,
      ),
      textTheme: TextTheme(
        headlineLarge: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        headlineMedium: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyLarge: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        bodyMedium: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
        bodySmall: const TextStyle(
          fontSize: 14,
          color: Colors.black54,
        ),
        labelLarge: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ), // Button text
        labelSmall: TextStyle(
          fontSize: 12,
          color: light_grey_color,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        dragHandleColor: text_grey_color,
        dragHandleSize: const Size(40, 3),
      ),
      useMaterial3: true,
    );
  }
}
