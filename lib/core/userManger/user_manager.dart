
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_enum.dart';

class UserManager {
  UserRole? _role;
  bool _isLoggedIn = false;

  UserRole? get role => _role;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> loadUserState() async {
    final prefs = await SharedPreferences.getInstance();
    _role = UserRole.values.firstWhere(
      (e) => e.toString() == prefs.getString('role'),
      orElse: () => UserRole.student, // Default role if not found
    );
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  }

  void login(UserRole role) {
    _role = role;
    _isLoggedIn = true;
    // Save state to persistent storage
    _saveUserState();
  }

  void logout() {
    _role = null;
    _isLoggedIn = false;
    // Clear state from persistent storage
    _clearUserState();
  }

  void _saveUserState() {
    // Save user role and login status to persistent storage
  }

  void _clearUserState() {
    // Clear user role and login status from persistent storage
  }

  // void loadUserState() {
  //   // Load user role and login status from persistent storage
  //   // Example:
  //    _role = loadedRole;
  //   _isLoggedIn = loadedLoginStatus;
  // }
}
