import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const String _sessionTokenKey = 'session_token';

  static const String usernameKey = 'username';

  // Method to retrieve the username
  static Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(usernameKey) ?? ''; // Return an empty string if no username is stored
  }

  // Method to save the username
  static Future<void> setUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(usernameKey, username);
  }


  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(_sessionTokenKey);
    return token != null && token.isNotEmpty;
  }

  static Future<void> setSessionToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_sessionTokenKey, token);
  }

  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_sessionTokenKey);
  }
}
