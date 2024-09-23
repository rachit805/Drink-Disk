import 'package:flutter/material.dart';

class AppTheme {
  // Define primary, secondary, and accent colors
  static const Color primaryColor = Color(0xFF7B1E3E); // Deep Burgundy
  // Represents the richness and sophistication of wine.

  static const Color secondaryColor = Color(0xFFD4AF37); // Gold
  // Adds a touch of luxury and class, perfect for highlighting key elements like buttons or icons.
  static const Color accentColor = Color(0xFFF5E6CC); // Cream
  // Softens the overall look, great for backgrounds or secondary elements, making the content stand out.
  static const Color darkGreyColor = Color(0xFF333333); // Dark Grey
  //Dark Grey for text and key headings.
  static const Color lightGreyColor = Color(0xFFE0E0E0); // Light Grey
  //  Light Grey for dividers, background, or subtle elements.
  static const Color errorColor = Color(0xFFE57373); // Red for error alerts
  //For warnings or critical actions (such as unavailable items).

  // Define Text Themes with custom fonts
  static TextTheme textTheme = const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Playfair Display',
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: darkGreyColor,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: darkGreyColor,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );

  // Define the overall theme
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      hintColor: accentColor,
      scaffoldBackgroundColor: Colors.white,

      // Define Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          textStyle: textTheme.labelLarge,
        ),
      ),

      // Define AppBar Theme
      appBarTheme: const AppBarTheme(
        color: primaryColor,
        titleTextStyle: TextStyle(
          fontFamily: 'Playfair Display',
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),

      // Define Text Theme
      textTheme: textTheme,

      // Define Icon Theme
      iconTheme: const IconThemeData(
        color: secondaryColor,
      ),

      // Define Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: lightGreyColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
      // colorScheme: ColorScheme(background: Colors.white).copyWith(error: errorColor),
    );
  }
}
