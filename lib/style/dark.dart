import 'package:flutter/material.dart';
import 'package:talabat_clone/style/colors.dart';

class DarkTheme {
  static ThemeData get dark {
    return ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.dark, // Switch to dark theme
        primary: main_darker_color, // Darker shade of the primary color
        onPrimary: white_color, // White text/icons on primary
        secondary: main_darker_color, // Darker shade for secondary
        onSecondary: white_color, // White text/icons on secondary
        error: error_color, // Slightly lighter red for better contrast in dark mode
        onError: dark_color, // Dark text/icons on error color
        surface: dark_color, // Dark background for surfaces (cards, dialogs)
        onSurface: white_color, // White text/icons on dark surface
        outline: dark_grey_color, // Darker outline for better contrast
      ),
      textTheme: TextTheme(
        headlineLarge: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        headlineMedium: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyLarge: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
        bodyMedium: const TextStyle(
          fontSize: 16,
          color: Colors.white70,
        ),
        bodySmall: const TextStyle(
          fontSize: 14,
          color: Colors.white60,
        ),
        labelLarge: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ), // Button text
        labelSmall: TextStyle(
          fontSize: 12,
          color: outline_grey_color,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(dragHandleColor: text_grey_color),
      useMaterial3: true,
    );
  }
}
