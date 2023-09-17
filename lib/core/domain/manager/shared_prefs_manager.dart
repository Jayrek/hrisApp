import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/common/util/key_strings.dart';

class SharedPrefsManager {
  static late final SharedPreferences instance;

  static Future<SharedPreferences> init() async =>
      instance = await SharedPreferences.getInstance();

  void setStringPref(String key, String value) async =>
      await instance.setString(
        key,
        value,
      );

  Future<String> getStringPref(String key) async =>
      instance.getString(key) ?? '';

  void clearPreference() {
    instance.remove(KeyStrings.tokenKey);
    instance.remove(KeyStrings.fullName);
  }
}
