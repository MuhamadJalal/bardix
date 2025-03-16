import 'package:bardix/l10n/l10n.dart';
import 'package:flutter/material.dart';

extension Validator on String? {
  /*
  usage:
  validator: (value) => value.validatePhoneNumber(minLength: 9, maxLength: 12),
  * */
  String? validatePhoneNumber({
    required BuildContext context,
    required int minLength,
    required int maxLength,
  }) {
    if (this == null || this!.trim().isEmpty) {
      return S.of(context).phoneNumberRequired;
    }
    final phoneRegex = RegExp(r"^\d+$"); // Only allows digits
    if (!phoneRegex.hasMatch(this!.trim())) {
      return S.of(context).phoneNumberDigitsOnly;
    }
    if (this!.length < minLength || this!.length > maxLength) {
      return S.of(context).phoneNumberLength(maxLength, minLength);
    }
    return null; // Valid phone number
  }

  String? validateWeight({required BuildContext context}) {
    if (this!.trim().isEmpty) {
      return S.of(context).weightIsRequired;
    }
    final weight = double.tryParse(this!);
    if (weight == null || weight <= 0) {
      return S.of(context).validWeightGreaterThanZero;
    }
    return null;
  }

  /*
  usage:
    validator: (value) => value.validateFullName,
  * */
  String? validateFullName({required BuildContext context}) {
    if (this == null || this!.trim().isEmpty) {
      return S.of(context).fullNameIsRequired;
    }
    final nameRegex = RegExp(
        r'^[a-zA-Z\u0600-\u06FF\s-]+$'
    ); // Only allows letters and spaces
    if (!nameRegex.hasMatch(this!.trim())) {
      return S.of(context).fullNameLettersOnly;
    }
    if (this!.trim().length < 3) {
      return S.of(context).fullNameMinLength;
    }
    return null; // Valid full name
  }

  /*
 Validate if address is not empty and has a minimum length
  usage:
    validator: (value) => value.validateAddress(minLength: x),
  * */
  String? validateAddress({required BuildContext context, int minLength = 5}) {
    if (this == null || this!.trim().isEmpty) {
      return S.of(context).addressCannotBeEmpty;
    }
    if (this!.trim().length < minLength) {
      return S.of(context).addressMinLength(minLength);
    }
    return null;
  }

  String? validateCardNumber({required BuildContext context}) {
    if (this == null || this!.trim().isEmpty) {
      return S.of(context).cardNumberIsRequired;
    }
    if (this!.length != 16) {
      return S.of(context).cardNumber16Digits;
    }
    final cardNumber = RegExp(r"^\d+$"); // Only allows digits
    if (!cardNumber.hasMatch(this!.trim())) {
      return S.of(context).cardNumberDigitsOnly;
    }
    return null;
  }
}
