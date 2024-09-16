import 'package:flutter/material.dart';
import 'package:myapp/core/color/my_app_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: MyAppColors.primaryColor, // Dark Blue
      scaffoldBackgroundColor:
          MyAppColors.backgroundColor, // Light Gray Background
      appBarTheme: AppBarTheme(
        color: MyAppColors.appBarBackgroundColor, // Dark Blue
        titleTextStyle: TextStyle(
          color: MyAppColors.textColorLight, // White text
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        iconTheme: IconThemeData(color: MyAppColors.iconPrimary), // White icons
      ),
      colorScheme: ColorScheme.light(
        primary: MyAppColors.primaryColor, // Dark Blue
        secondary: MyAppColors.secondaryColor, // Wine Red
        onPrimary: MyAppColors.textColorLight, // White text on primary
        onSecondary: MyAppColors.textColorLight, // White text on secondary
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: MyAppColors.textColorPrimary, // Dark Blue
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        bodyLarge: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ), // Gray text
        bodyMedium: TextStyle(
          color: Colors.black87,
          fontSize: 14,
        ), // Dark text
        labelLarge: TextStyle(
          color: MyAppColors.textColorLight,
          fontSize: 16,
        ), // White text
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: MyAppColors.buttonTextColor, // White text in buttons
          backgroundColor: MyAppColors.buttonPrimary, // Dark Blue button
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: MyAppColors.buttonPrimary, // Dark Blue button
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: MyAppColors.primaryColor, // Dark Blue
      scaffoldBackgroundColor:
          MyAppColors.darkBackgroundColor, // Dark background
      appBarTheme: AppBarTheme(
        color: MyAppColors.appBarBackgroundColor, // Dark Blue
        titleTextStyle: TextStyle(
          color: MyAppColors.textColorLight, // White text
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        iconTheme: IconThemeData(color: MyAppColors.iconPrimary), // White icons
      ),
      colorScheme: ColorScheme.dark(
        primary: MyAppColors.primaryColor, // Dark Blue
        secondary: MyAppColors.secondaryColor, // Wine Red
        onPrimary: MyAppColors.textColorLight, // White text on primary
        onSecondary: MyAppColors.textColorLight, // White text on secondary
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: MyAppColors.textColorLight, // White text
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        bodyLarge: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ), // Gray text
        bodyMedium: TextStyle(
          color: Colors.white70,
          fontSize: 14,
        ), // White70 text
        labelLarge: TextStyle(
          color: MyAppColors.textColorLight,
          fontSize: 16,
        ), // White text
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: MyAppColors.buttonTextColor, // White text in buttons
          backgroundColor: MyAppColors.buttonPrimary, // Dark Blue button
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: MyAppColors.buttonPrimary, // Dark Blue button
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
