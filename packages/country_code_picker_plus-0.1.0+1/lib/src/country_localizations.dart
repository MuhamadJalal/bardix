// lib/src/l10n/country_localizations.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class CountryLocalizations {
  final Locale locale;
  Map<String, String> _localizedValues = {};

  CountryLocalizations(this.locale);

  static CountryLocalizations? of(BuildContext context) {
    return Localizations.of<CountryLocalizations>(
        context, CountryLocalizations);
  }

  Future<void> load() async {
    String jsonStringValues = await rootBundle.loadString(
        'packages/country_code_picker_plus/assets/i18n/${locale.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizedValues =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String getCountryName(String countryCode) {
    return _localizedValues[countryCode] ?? countryCode;
  }

  // Add translation for search hint
  String get searchHint => _localizedValues['search_hint'] ?? 'Search';

  // Add translation for no results
  String get noResults => _localizedValues['no_results'] ?? 'No results found';

  static const LocalizationsDelegate<CountryLocalizations> delegate =
      _CountryLocalizationsDelegate();
}

class _CountryLocalizationsDelegate
    extends LocalizationsDelegate<CountryLocalizations> {
  const _CountryLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Add your supported locales here
    return [
      "ar",
      "en",
      "fr",
    ].contains(locale.languageCode);
  }

  @override
  Future<CountryLocalizations> load(Locale locale) async {
    CountryLocalizations localizations = CountryLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_CountryLocalizationsDelegate old) => false;
}
