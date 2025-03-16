// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class SAr extends S {
  SAr([String locale = 'ar']) : super(locale);

  @override
  String get title => 'بارديكس';

  @override
  String get customerInfo => 'معلومات العميل';

  @override
  String get enterPhoneNumber => 'أدخل رقم الجوال';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get phoneNumber => 'رقم الجوال';

  @override
  String get address => 'العنوان';

  @override
  String get next => 'التالي';

  @override
  String get enter => 'إدخال';

  @override
  String get packageInfo => 'معلومات الطرد';

  @override
  String get packageDetails => 'تفاصيل الطرد';

  @override
  String get packageType => 'نوع الطرد';

  @override
  String get selectProductType => 'اختر نوع المنتج';

  @override
  String get large => 'كبير';

  @override
  String get medium => 'متوسط';

  @override
  String get small => 'صغير';

  @override
  String get weight => 'الوزن';

  @override
  String get weightHint => 'الوزن (كجم)';

  @override
  String get weightMeasure => 'كجم';

  @override
  String get deliveryNotes => 'ملاحظات التسليم';

  @override
  String get addSpecialInstructions => 'أضف أي تعليمات خاصة...';

  @override
  String get paymentSpecification => 'تفاصيل الدفع';

  @override
  String get reviewAndSubmit => 'مراجعة وتقديم';

  @override
  String get sendRequest => 'إرسال الطلب';

  @override
  String get cardNumber => 'رقم البطاقة';

  @override
  String get creditCard => 'بطاقة ائتمان';

  @override
  String get payLater => 'الدفع لاحقًا';

  @override
  String get cashOnDelivery => 'الدفع عند الاستلام';

  @override
  String get oopsPageNotFound => 'عذرًا! الصفحة غير موجودة.';

  @override
  String get goToHome => 'الذهاب إلى الصفحة الرئيسية';

  @override
  String get pageNotFound => 'الصفحة غير موجودة';

  @override
  String get weightIsRequired => 'الوزن مطلوب';

  @override
  String get validWeightGreaterThanZero => 'أدخل وزنًا صالحًا أكبر من 0';

  @override
  String get addressCannotBeEmpty => 'العنوان لا يمكن أن يكون فارغًا';

  @override
  String addressMinLength(Object minLength) {
    return 'يجب أن يكون العنوان على الأقل $minLength حرفًا';
  }

  @override
  String get cardNumberIsRequired => 'رقم البطاقة مطلوب';

  @override
  String get cardNumber16Digits => 'يجب أن يتكون رقم البطاقة من 16 رقمًا';

  @override
  String get cardNumberDigitsOnly => 'يجب أن يحتوي رقم البطاقة على أرقام فقط';

  @override
  String get phoneNumberDigitsOnly => 'يجب أن يحتوي رقم الجوال على أرقام فقط';

  @override
  String phoneNumberLength(Object maxLength, Object minLength) {
    return 'يجب أن يكون رقم الجوال بين $minLength و $maxLength رقمًا';
  }

  @override
  String get phoneNumberRequired => 'رقم الجوال مطلوب';

  @override
  String get fullNameIsRequired => 'الاسم الكامل مطلوب';

  @override
  String get fullNameLettersOnly => 'يجب أن يحتوي الاسم الكامل على أحرف فقط';

  @override
  String get fullNameMinLength => 'يجب أن يتكون الاسم الكامل من 3 أحرف على الأقل';

  @override
  String get yourNotes => 'ملاحظاتك';

  @override
  String get orderSubmittedSuccessfully => 'تم تقديم الطلب بنجاح!';

  @override
  String get error => 'خطأ:';

  @override
  String get name => 'الاسم:';

  @override
  String get phone => 'الهاتف:';

  @override
  String get notes => 'ملاحظات:';

  @override
  String get paymentInfo => 'معلومات الدفع';

  @override
  String get method => 'الطريقة:';

  @override
  String get details => 'التفاصيل:';

  @override
  String get submitOrder => 'إرسال الطلب';

  @override
  String get searchHere => 'ابحث هنا';

  @override
  String get noCountryFound => 'لا يوجد بلد بهذا الاسم';
}
