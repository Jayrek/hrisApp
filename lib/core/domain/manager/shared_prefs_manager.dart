import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/common/util/key_strings.dart';

class SharedPrefsManager {
  static late final SharedPreferences instance;

  static Future<SharedPreferences> init() async =>
      instance = await SharedPreferences.getInstance();

  void setToken(String token) async => await instance.setString(
        KeyStrings.tokenKey,
        token,
      );

  Future<String> getToken() async =>
      instance.getString(
        KeyStrings.tokenKey,
      ) ??
      '';

  void setFullName(String fullName) async => await instance.setString(
        KeyStrings.fullName,
        fullName,
      );

  Future<String> getFullName() async =>
      instance.getString(
        KeyStrings.fullName,
      ) ??
      '';

  void clearPreference() {
    instance.remove(KeyStrings.tokenKey);
    instance.remove(KeyStrings.fullName);
  }
}
