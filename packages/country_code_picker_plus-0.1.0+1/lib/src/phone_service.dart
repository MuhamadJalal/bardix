import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:country_code_picker_plus/src/country.dart';
import 'package:flutter/services.dart';
import 'constants.dart';

class PhoneService {
  static List<Country> getPotentialCountries(
      String number, List<Country> countries) {
    List<Country> result = [];
    if (number.isNotEmpty && number.length < 5) {
      List<String> potentialCodes =
          generatePotentialDialCodes(number, 0, number.length);
      for (var code in potentialCodes) {
        for (var country in countries) {
          if (code == country.dialCode) {
            result.add(country);
          }
        }
      }
    }
    if (number.length >= 5) {
      String intlCode = number.substring(0, 4);
      List<String> potentialCodes = generatePotentialDialCodes(intlCode, 0, 4);
      for (var code in potentialCodes) {
        for (var country in countries) {
          if (code == country.dialCode) {
            result.add(country);
          }
        }
      }
    }
    return result;
  }

  static List<String> generatePotentialDialCodes(
      String number, int index, int length) {
    List<String> digits = number.split('');
    List<String> potentialCodes = [];
    String aggregate = '+${digits[index]}';
    potentialCodes.add(aggregate);
    while (index < length - 1) {
      index += 1;
      aggregate = aggregate + digits[index];
      potentialCodes.add(aggregate);
    }
    return potentialCodes;
  }

  static Future<bool?> parsePhoneNumber(String number, String iso) async {
    try {
      return PhoneNumberHelper.isValidPhoneNumber(number, iso);
    } on PlatformException {
      return false;
    }
  }

  static Future<String?> getNormalizedPhoneNumber(
      String number, String iso) async {
    try {
      return PhoneNumberHelper.getNormalizedPhoneNumber(number, iso);
    } catch (e) {
      return null;
    }
  }

  static Future<List<Country>> fetchCountryData(
      BuildContext context, String jsonFile) async {
    var list = await DefaultAssetBundle.of(context).loadString(jsonFile);
    List<Country> elements = [];
    var jsonList = json.decode(list);
    jsonList.forEach((s) {
      Map elem = Map.from(s);
      elements.add(Country(
          name: elem['en_short_name'],
          code: elem['alpha_2_code'],
          dialCode: elem['dial_code'],
          flagUri: 'assets/flags/${elem['alpha_2_code'].toLowerCase()}.png'));
    });
    return elements;
  }
}
class PhoneNumberHelper {
  /// Normalizes a phone number by removing non-numeric characters and adding the correct country code if missing
  static String? getNormalizedPhoneNumber(String number, String iso) {
    if (number.isEmpty) return null;

    // Remove all non-numeric characters except '+'
    String cleanedNumber = number.replaceAll(RegExp(r'[^\d+]'), '');

    // If the number already starts with '+', assume it's already international
    if (cleanedNumber.startsWith('+')) {
      return cleanedNumber;
    }

    // Get country dial code for ISO country
    String? countryCode = countryDialCodes[iso.toUpperCase()];
    if (countryCode == null) return null; // Return null if country not found

    // If the number starts with the country code, assume it's already correct
    if (cleanedNumber.startsWith(countryCode)) {
      return '+$cleanedNumber';
    }

    // Otherwise, prepend the country code
    return '+$countryCode$cleanedNumber';
  }


  /// Validates a phone number based on country-specific rules
  static bool isValidPhoneNumber(String number, String iso) {
    if (number.isEmpty) return false;

    // Remove all non-numeric characters except '+'
    String cleanedNumber = number.replaceAll(RegExp(r'[^\d+]'), '');

    // Check if the ISO country code exists
    if (!countryPhoneRules.containsKey(iso.toUpperCase())) return false;

    var countryData = countryPhoneRules[iso.toUpperCase()]!;
    String countryCode = countryData["code"];
    int minLength = countryData["minLength"];
    int maxLength = countryData["maxLength"];

    // Remove + sign if present for length validation
    String numericNumber = cleanedNumber.startsWith('+') ? cleanedNumber.substring(1) : cleanedNumber;

    // If the number starts with the country code, remove it for local length check
    if (numericNumber.startsWith(countryCode)) {
      numericNumber = numericNumber.substring(countryCode.length);
    }

    // Check if the number length is within the valid range
    return numericNumber.length >= minLength && numericNumber.length <= maxLength;
  }
}
