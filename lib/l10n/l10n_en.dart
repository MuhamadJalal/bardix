// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Bardix';

  @override
  String get customerInfo => 'Customer Info';

  @override
  String get enterPhoneNumber => 'Enter Phone Number';

  @override
  String get fullName => 'Full Name';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get address => 'Address';

  @override
  String get next => 'Next';

  @override
  String get enter => 'Enter';

  @override
  String get packageInfo => 'Package Info';

  @override
  String get packageDetails => 'Package Details';

  @override
  String get packageType => 'Package Type';

  @override
  String get selectProductType => 'Select product type';

  @override
  String get large => 'Large';

  @override
  String get medium => 'Medium';

  @override
  String get small => 'Small';

  @override
  String get weight => 'Weight';

  @override
  String get weightHint => 'Weight (kg)';

  @override
  String get weightMeasure => 'kg';

  @override
  String get deliveryNotes => 'Delivery Notes';

  @override
  String get addSpecialInstructions => 'Add any special instructions...';

  @override
  String get paymentSpecification => 'Payment Specification';

  @override
  String get reviewAndSubmit => 'Review & Submit';

  @override
  String get sendRequest => 'Send Request';

  @override
  String get cardNumber => 'Card Number';

  @override
  String get creditCard => 'Credit Card';

  @override
  String get payLater => 'Pay Later';

  @override
  String get cashOnDelivery => 'Cash On Delivery';

  @override
  String get oopsPageNotFound => 'Oops! Page not found.';

  @override
  String get goToHome => 'Go to Home';

  @override
  String get pageNotFound => 'Page Not Found';

  @override
  String get weightIsRequired => 'Weight is required';

  @override
  String get validWeightGreaterThanZero => 'Enter a valid weight greater than 0';

  @override
  String get addressCannotBeEmpty => 'Address cannot be empty';

  @override
  String addressMinLength(Object minLength) {
    return 'Address must be at least $minLength characters long';
  }

  @override
  String get cardNumberIsRequired => 'Card number is required';

  @override
  String get cardNumber16Digits => 'Card number must be 16 digits';

  @override
  String get cardNumberDigitsOnly => 'Card number must contain only digits';

  @override
  String get phoneNumberDigitsOnly => 'Phone number must contain only digits';

  @override
  String phoneNumberLength(Object maxLength, Object minLength) {
    return 'Phone number must be between $minLength and $maxLength digits';
  }

  @override
  String get phoneNumberRequired => 'Phone number is required';

  @override
  String get fullNameIsRequired => 'Full name is required';

  @override
  String get fullNameLettersOnly => 'Full name must contain only letters';

  @override
  String get fullNameMinLength => 'Full name must be at least 3 characters';

  @override
  String get yourNotes => 'Your Notes';

  @override
  String get orderSubmittedSuccessfully => 'Order submitted successfully!';

  @override
  String get error => 'Error:';

  @override
  String get name => 'Name';

  @override
  String get phone => 'Phone';

  @override
  String get notes => 'Notes';

  @override
  String get paymentInfo => 'Payment Info';

  @override
  String get method => 'Method';

  @override
  String get details => 'Details';

  @override
  String get submitOrder => 'Submit Order';

  @override
  String get searchHere => 'Search here';

  @override
  String get noCountryFound => 'No country found with this name';
}
