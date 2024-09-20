import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_shop_task/core/logic/app_model.dart';

final localStorageServiceProvider = Provider<LocalStorageService>(
  (ref) {
    var appModel = ref.read(appModelProvider);
    return LocalStorageService(appModel.sharedPref);
  },
);

class LocalStorageService {
  final SharedPreferences _prefs;

  const LocalStorageService(
    this._prefs,
  );

  T? getValue<T extends Object>({
    required String key,
  }) {
    final value = _prefs.get(key);
    return value as T?;
  }

  Future<void> setValue({
    required String key,
    required Object value,
  }) async {
    if (value is String) {
      await _prefs.setString(key, value);
      return;
    }
    if (value is int) {
      await _prefs.setInt(key, value);
      return;
    }
    if (value is bool) {
      await _prefs.setBool(key, value);
      return;
    }
    if (value is double) {
      await _prefs.setDouble(key, value);
      return;
    }
    if (value is List<String>) {
      await _prefs.setStringList(key, value);
      return;
    }
  }

  Future<bool> removeValue({
    required String key,
  }) async {
    final value = await _prefs.remove(key);
    return value;
  }

  Future<void> clear() async => _prefs.clear();
}
