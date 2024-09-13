import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/auth/auth_page.dart';
import 'package:myapp/auth/log_in_page.dart';
import 'package:myapp/features/users/navigation_bar/navigation_bar_pages.dart';
import 'package:myapp/features/users/onboarding/onboarding_page.dart';
import 'package:myapp/features/users/settings/profile_page.dart';
import 'package:myapp/core/theme/theme_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      themeMode: ThemeMode.light,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const AuthPage(),
        '/signup': (context) => const SignUpPage(),
        '/homepage': (context) => const NavigationBarPages(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
