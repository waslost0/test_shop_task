import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A singleton class providing access to local storage using SharedPreferences.
///
/// This class offers methods for retrieving, storing, removing, and clearing data
/// from the device's local storage. It supports various data types, including
/// [String], [int], [bool], [double], and [List<String>].
@Singleton()
class LocalStorageService {
  final SharedPreferences _prefs;

  const LocalStorageService(
    this._prefs,
  );

  /// Retrieves a value from local storage based on the provided key.
  ///
  /// [key] The key associated with the value to retrieve.
  ///
  /// Returns the value if found, otherwise returns null.
  /// The returned value is cast to the specified type `T`.
  T? getValue<T extends Object>({
    required String key,
  }) {
    final value = _prefs.get(key);
    return value as T?;
  }

  /// Stores a value in local storage with the associated key.
  ///
  /// [key] The key to associate with the value.
  /// [value] The value to store.
  ///
  /// Supports various data types: [String], [int], [bool], [double], and [List<String>].
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

  /// Removes a value from local storage based on the provided key.
  ///
  /// [key] The key associated with the value to remove.
  ///
  /// Returns true if the value was successfully removed, false otherwise.
  Future<bool> removeValue({
    required String key,
  }) async {
    final value = await _prefs.remove(key);
    return value;
  }

  /// Clears all data from local storage.
  Future<void> clear() async => _prefs.clear();
}
