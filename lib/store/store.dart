import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static final SharedPreferencesManager _instance = SharedPreferencesManager._internal();
  SharedPreferences? _preferences;

  // Private constructor
  SharedPreferencesManager._internal();

  // Factory constructor for singleton
  factory SharedPreferencesManager() {
    return _instance;
  }

  // Initialize SharedPreferences (must be called before using the manager)
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Save a string value
  Future<void> saveString(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  // Get a string value
  String? getString(String key) {
    return _preferences?.getString(key);
  }

  // Save a boolean value
  Future<void> saveBool(String key, bool value) async {
    await _preferences?.setBool(key, value);
  }

  // Get a boolean value
  bool? getBool(String key) {
    return _preferences?.getBool(key);
  }

  // Save an integer value
  Future<void> saveInt(String key, int value) async {
    await _preferences?.setInt(key, value);
  }

  // Get an integer value
  int? getInt(String key) {
    return _preferences?.getInt(key);
  }

  // Save a double value
  Future<void> saveDouble(String key, double value) async {
    await _preferences?.setDouble(key, value);
  }

  // Get a double value
  double? getDouble(String key) {
    return _preferences?.getDouble(key);
  }

  // Save a list of strings
  Future<void> saveStringList(String key, List<String> value) async {
    await _preferences?.setStringList(key, value);
  }

  // Get a list of strings
  List<String>? getStringList(String key) {
    return _preferences?.getStringList(key);
  }

  // Remove a specific key
  Future<void> remove(String key) async {
    await _preferences?.remove(key);
  }

  // Clear all data
  Future<void> clear() async {
    await _preferences?.clear();
  }
}
