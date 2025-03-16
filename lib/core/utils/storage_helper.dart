import 'dart:async';

import 'package:bardix/core/app_constants/app_repo_shared_pref_keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  // Singleton instance
  static final StorageHelper _instance = StorageHelper._internal();

  factory StorageHelper() => _instance;

  StorageHelper._internal();

  // Private getter to prevent multiple instances
  Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  /// Generic method to set a value in SharedPreferences
  Future<void> setValue<T>(String key, T value) async {
    final prefs = await _prefs;
    if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else {
      throw UnsupportedError("Type ${T.runtimeType} is not supported");
    }
  }

  /// Generic method to retrieve a value from SharedPreferences
  FutureOr<T> getValue<T>(String key, {T? defaultValue}) async {
    final prefs = await _prefs;
    if (T == bool) {
      return (prefs.getBool(key) ?? false) as T;
    } else if (T == int) {
      return (prefs.getInt(key) ?? 0) as T;
    } else if (T == double) {
      return (prefs.getDouble(key) ?? 0.0) as T;
    } else if (T == String) {
      return (prefs.getString(key) ?? '') as T;
    } else {
      throw UnsupportedError("Type ${T.runtimeType} is not supported");
    }
  }

  /// Load saved locale
  Future<Locale> loadSavedLocale(ValueNotifier<Locale> currentLocale) async {
    String? savedLocaleCode = await getValue<String>(
      AppRepoSharedPrefKeys().appLocaleSharedPref,
    );
    if (savedLocaleCode.isNotEmpty) {
      currentLocale.value = Locale(savedLocaleCode);
      return Locale(savedLocaleCode);
    }
    return currentLocale.value;
  }

  /// Save selected locale
  Future<void> saveLocale(Locale locale) async {
    await setValue<String>(
      AppRepoSharedPrefKeys().appLocaleSharedPref,
      locale.languageCode,
    );
  }
}
