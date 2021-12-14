import 'package:flutter_guide_examples/core/constant/enum/local_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LocaleManager {
  static final LocaleManager _instance = LocaleManager._init();

  SharedPreferences? _preferences;
  static LocaleManager get instance => _instance;

  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }
  static Future prefrencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> clearAll() async {
    await _preferences!.clear();
  }

  Future<void> clearAllSaveFirst() async {
    if (_preferences != null) {
      await _preferences!.clear();
      await setBoolValue(LocalKeysPreferencesKeys.user, true);
    }
  }

  Future<void> setStringValue(LocalKeysPreferencesKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  Future<void> setBoolValue(LocalKeysPreferencesKeys key, bool value) async {
    await _preferences!.setBool(key.toString(), value);
  }

  String getStringValue(LocalKeysPreferencesKeys key) =>
      _preferences?.getString(key.toString()) ?? '';

  bool getBoolValue(LocalKeysPreferencesKeys key) =>
      _preferences!.getBool(key.toString()) ?? false;
}