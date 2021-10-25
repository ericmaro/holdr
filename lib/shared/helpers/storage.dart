import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static Future<bool> setString(String key, String value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return await _prefs.setString(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return await _prefs.setBool(key, value);
  }

  static Future<String?> getString(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(key);
  }

  static Future<bool?> getBool(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getBool(key);
  }

  static Future<bool> remove(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.remove(key);
  }
}
