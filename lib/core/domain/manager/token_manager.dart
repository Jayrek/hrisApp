import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/common/util/key_strings.dart';

class TokenManager {
  static Future<void> setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(KeyStrings.tokenKey, token);
  }

  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(KeyStrings.tokenKey);
  }

  static Future<void> clearToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(KeyStrings.tokenKey);
  }
}
