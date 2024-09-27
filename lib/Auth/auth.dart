import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  static const String _emailKey = 'user_email';
  static const String _passwordKey = 'user_password';
  static const String _isLoggedInKey = 'is_logged_in';

  // Save user credentials to SharedPreferences
  static Future<void> saveCredentials(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_emailKey, email);
    await prefs.setString(_passwordKey, password);
    await prefs.setBool(_isLoggedInKey, true);
  }

  // Check if user is already signed in
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  // Retrieve saved email and password
  static Future<Map<String, String?>> getCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString(_emailKey);
    String? password = prefs.getString(_passwordKey);
    return {'email': email, 'password': password};
  }

  // Clear user credentials on logout
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_emailKey);
    await prefs.remove(_passwordKey);
    await prefs.setBool(_isLoggedInKey, false);
  }
}
