import 'package:flutter/material.dart';

import 'package:myapp/features/onboarding/onboarding_page.dart';
import 'package:myapp/theme/theme_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Use system theme
      home: const OnboardingScreen(),
    );
  }
}
