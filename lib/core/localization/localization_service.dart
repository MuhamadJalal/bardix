import 'package:bardix/core/utils/storage_helper.dart';
import 'package:flutter/material.dart';

class LocalizationService {
  final ValueNotifier<Locale> currentLocale;

  LocalizationService({Locale? initialLocale})
    : currentLocale = ValueNotifier(initialLocale ?? const Locale('en')) {
    StorageHelper().loadSavedLocale(
      currentLocale,
    ); // Load saved locale on initialization
  }

  Future<void> loadSavedLocale() async {
    Locale? savedLocale = await StorageHelper().loadSavedLocale(currentLocale);
    if (savedLocale.countryCode != null) {
      currentLocale.value = savedLocale; // ✅ Apply saved locale
    }
  }

  // Change the locale and save it to SharedPreferences
  Future<void> changeLocale(Locale newLocale) async {
    // "🌍 Changing Locale to: $newLocale".debug();
    if (newLocale != currentLocale.value) {
      currentLocale.value = newLocale;
      await StorageHelper().saveLocale(newLocale);
      // "✅ Locale Changed: ${currentLocale.value}".debug();
      // ✅ Force UI rebuild by calling setState on a global key
      // Get.updateLocale(newLocale); // ✅ Forces the UI to update with new locale
    }
  }

  Locale get locale => currentLocale.value;
}
