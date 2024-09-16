import 'package:myapp/core/constants/app_enum.dart';

import 'package:shared_preferences/shared_preferences.dart';

class UserManager {
  UserRole? _role;
  bool _isLoggedIn = false;

  UserRole? get role => _role;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> login(UserRole role) async {
    _role = role;
    _isLoggedIn = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('role', role.toString());
    await prefs.setBool('isLoggedIn', _isLoggedIn);
  }

  Future<void> logout() async {
    _role = null;
    _isLoggedIn = false;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('role');
    await prefs.remove('isLoggedIn');
  }

  Future<void> loadUserState() async {
    final prefs = await SharedPreferences.getInstance();
    _role = UserRole.values.firstWhere(
      (e) => e.toString() == prefs.getString('role'),
      orElse: () => UserRole.student, // Default role if not found
    );
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  }
}
