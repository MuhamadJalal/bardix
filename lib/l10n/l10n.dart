import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_ar.dart';
import 'l10n_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S)!;
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Bardix'**
  String get title;

  /// No description provided for @customerInfo.
  ///
  /// In en, this message translates to:
  /// **'Customer Info'**
  String get customerInfo;

  /// No description provided for @enterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter Phone Number'**
  String get enterPhoneNumber;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @enter.
  ///
  /// In en, this message translates to:
  /// **'Enter'**
  String get enter;

  /// No description provided for @packageInfo.
  ///
  /// In en, this message translates to:
  /// **'Package Info'**
  String get packageInfo;

  /// No description provided for @packageDetails.
  ///
  /// In en, this message translates to:
  /// **'Package Details'**
  String get packageDetails;

  /// No description provided for @packageType.
  ///
  /// In en, this message translates to:
  /// **'Package Type'**
  String get packageType;

  /// No description provided for @selectProductType.
  ///
  /// In en, this message translates to:
  /// **'Select product type'**
  String get selectProductType;

  /// No description provided for @large.
  ///
  /// In en, this message translates to:
  /// **'Large'**
  String get large;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @small.
  ///
  /// In en, this message translates to:
  /// **'Small'**
  String get small;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// No description provided for @weightHint.
  ///
  /// In en, this message translates to:
  /// **'Weight (kg)'**
  String get weightHint;

  /// No description provided for @weightMeasure.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get weightMeasure;

  /// No description provided for @deliveryNotes.
  ///
  /// In en, this message translates to:
  /// **'Delivery Notes'**
  String get deliveryNotes;

  /// No description provided for @addSpecialInstructions.
  ///
  /// In en, this message translates to:
  /// **'Add any special instructions...'**
  String get addSpecialInstructions;

  /// No description provided for @paymentSpecification.
  ///
  /// In en, this message translates to:
  /// **'Payment Specification'**
  String get paymentSpecification;

  /// No description provided for @reviewAndSubmit.
  ///
  /// In en, this message translates to:
  /// **'Review & Submit'**
  String get reviewAndSubmit;

  /// No description provided for @sendRequest.
  ///
  /// In en, this message translates to:
  /// **'Send Request'**
  String get sendRequest;

  /// No description provided for @cardNumber.
  ///
  /// In en, this message translates to:
  /// **'Card Number'**
  String get cardNumber;

  /// No description provided for @creditCard.
  ///
  /// In en, this message translates to:
  /// **'Credit Card'**
  String get creditCard;

  /// No description provided for @payLater.
  ///
  /// In en, this message translates to:
  /// **'Pay Later'**
  String get payLater;

  /// No description provided for @cashOnDelivery.
  ///
  /// In en, this message translates to:
  /// **'Cash On Delivery'**
  String get cashOnDelivery;

  /// No description provided for @oopsPageNotFound.
  ///
  /// In en, this message translates to:
  /// **'Oops! Page not found.'**
  String get oopsPageNotFound;

  /// No description provided for @goToHome.
  ///
  /// In en, this message translates to:
  /// **'Go to Home'**
  String get goToHome;

  /// No description provided for @pageNotFound.
  ///
  /// In en, this message translates to:
  /// **'Page Not Found'**
  String get pageNotFound;

  /// No description provided for @weightIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Weight is required'**
  String get weightIsRequired;

  /// No description provided for @validWeightGreaterThanZero.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid weight greater than 0'**
  String get validWeightGreaterThanZero;

  /// No description provided for @addressCannotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Address cannot be empty'**
  String get addressCannotBeEmpty;

  /// No description provided for @addressMinLength.
  ///
  /// In en, this message translates to:
  /// **'Address must be at least {minLength} characters long'**
  String addressMinLength(Object minLength);

  /// No description provided for @cardNumberIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Card number is required'**
  String get cardNumberIsRequired;

  /// No description provided for @cardNumber16Digits.
  ///
  /// In en, this message translates to:
  /// **'Card number must be 16 digits'**
  String get cardNumber16Digits;

  /// No description provided for @cardNumberDigitsOnly.
  ///
  /// In en, this message translates to:
  /// **'Card number must contain only digits'**
  String get cardNumberDigitsOnly;

  /// No description provided for @phoneNumberDigitsOnly.
  ///
  /// In en, this message translates to:
  /// **'Phone number must contain only digits'**
  String get phoneNumberDigitsOnly;

  /// No description provided for @phoneNumberLength.
  ///
  /// In en, this message translates to:
  /// **'Phone number must be between {minLength} and {maxLength} digits'**
  String phoneNumberLength(Object maxLength, Object minLength);

  /// No description provided for @phoneNumberRequired.
  ///
  /// In en, this message translates to:
  /// **'Phone number is required'**
  String get phoneNumberRequired;

  /// No description provided for @fullNameIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Full name is required'**
  String get fullNameIsRequired;

  /// No description provided for @fullNameLettersOnly.
  ///
  /// In en, this message translates to:
  /// **'Full name must contain only letters'**
  String get fullNameLettersOnly;

  /// No description provided for @fullNameMinLength.
  ///
  /// In en, this message translates to:
  /// **'Full name must be at least 3 characters'**
  String get fullNameMinLength;

  /// No description provided for @yourNotes.
  ///
  /// In en, this message translates to:
  /// **'Your Notes'**
  String get yourNotes;

  /// No description provided for @orderSubmittedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Order submitted successfully!'**
  String get orderSubmittedSuccessfully;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error:'**
  String get error;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @paymentInfo.
  ///
  /// In en, this message translates to:
  /// **'Payment Info'**
  String get paymentInfo;

  /// No description provided for @method.
  ///
  /// In en, this message translates to:
  /// **'Method'**
  String get method;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @submitOrder.
  ///
  /// In en, this message translates to:
  /// **'Submit Order'**
  String get submitOrder;

  /// No description provided for @searchHere.
  ///
  /// In en, this message translates to:
  /// **'Search here'**
  String get searchHere;

  /// No description provided for @noCountryFound.
  ///
  /// In en, this message translates to:
  /// **'No country found with this name'**
  String get noCountryFound;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return SAr();
    case 'en': return SEn();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
