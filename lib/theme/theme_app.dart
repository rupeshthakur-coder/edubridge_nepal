import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: const Color(0xFF1E2742),
      scaffoldBackgroundColor: const Color(0xFFF3F6FD),
      appBarTheme: const AppBarTheme(
        color: Color(0xFF1E2742),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF1E2742),
        secondary: Color(0xFF9A2143),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            color: Color(0xFF1E2742),
            fontWeight: FontWeight.bold,
            fontSize: 24),
        bodyLarge: TextStyle(color: Colors.grey, fontSize: 16),
        bodyMedium: TextStyle(color: Colors.black87, fontSize: 14),
        labelLarge: TextStyle(color: Colors.white, fontSize: 16),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF1E2742),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFF1E2742),
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: const Color(0xFF1E2742),
      scaffoldBackgroundColor: const Color(0xFF121212),
      appBarTheme: const AppBarTheme(
        color: Color(0xFF1E2742),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF1E2742),
        secondary: Color(0xFF9A2143),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        bodyLarge: TextStyle(color: Colors.grey, fontSize: 16),
        bodyMedium: TextStyle(color: Colors.white70, fontSize: 14),
        labelLarge: TextStyle(color: Colors.white, fontSize: 16),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF1E2742),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFF1E2742),
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
