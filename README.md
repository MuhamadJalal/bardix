# BaridX Order Creation App

## 📱 App Name
**Bardix**

---

## 📝 Brief
BaridX is a multi-step order creation app built using Flutter and BLoC for state management. It allows users to create and manage orders by providing customer details, package details, and payment information.

---

## 🏛️ Structure Diagram
```text

lib
├── core
│   ├── app_constants/
│   ├── di/
│   ├── localization/
│   ├── router/
│   ├── theme/
│   ├── utils/
│   └── widgets/
├── data
│   ├── models/
│   ├── repository/
├── features
│   ├── order/
│   │   ├── bloc/
│   │   ├── screens/
│   │   └── widgets/
│   └── splash
│       ├── bloc/
│       └── screens/
└── l10n/

```

---

## 🚀 Installation
1. **Clone the repository**:
```bash
git clone https://github.com/MuhamadJalal/bardix.git
```

2. **Navigate to the project directory**:
```bash
cd bardix
```

3. **Install dependencies**:
```bash
flutter pub get
```

4. **Generate localization files**:
```bash
flutter gen-l10n
```

5. **Run the app**:
```bash
flutter run
```

---

## ✅ Requirements
- Flutter 3.29.0 or higher
- Dart 3.7.0 or higher
- Android SDK or Xcode (for iOS)

---

## 💳 How to Add a New Payment Method
1. **Create a new class extending `PaymentMethodBase`**
```dart
class NewPaymentMethod extends PaymentMethodBase {
  @override
  String get label => 'New Payment';

  @override
  Widget buildInput({required TextEditingController controller}) =>
      TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: S.current.newPaymentHint,
          border: OutlineInputBorder(),
        ),
        validator: (value) => value?.validateCardNumber(localization: S.current),
      );
}
```

2. **Register the new payment method in `service_locator.dart`**
```dart
getIt.registerLazySingleton<NewPaymentMethod>(() => NewPaymentMethod());
```

3. **Add it to `PaymentMethodService`**
```dart
case 'newpayment':
case 'دفع جديد':
  return getIt<NewPaymentMethod>();
```

4. **Update available methods list:**
```dart
List<PaymentMethodBase> get availableMethods => [
  getIt<CreditCardPayment>(),
  getIt<CashOnDeliveryPayment>(),
  getIt<PayLaterPayment>(),
  getIt<NewPaymentMethod>(),
];
```

---

## 🌍 How to Update l10n and Add New Strings
1. **Add a new key-value pair** in `lib/l10n/app_en.arb` and `lib/l10n/app_ar.arb`:
- `lib/l10n/app_en.arb`
```json
{
  "newPaymentHint": "Enter new payment details"
}
```
- `lib/l10n/app_ar.arb`
```json
{
  "newPaymentHint": "أدخل تفاصيل الدفع الجديدة"
}
```

2. **Generate localization files**:
```bash
flutter gen-l10n
```

3. **Use the new string in the app**:
```dart
S.current.newPaymentHint
```

---

## 🛠️ Best Practices
- Follow SOLID principles for maintainability.
- Keep feature-specific logic inside the respective feature module.
- Ensure state is managed using BLoC.
- Avoid `setState`; prefer `ValueNotifier` or BLoC.

---

## 📂 Project Structure Overview
- **Core** – Shared code (DI, theme, extensions)
- **Features** – Independent modules for each feature
- **L10n** – Localization files
- **Assets** – SVG, PNG, and other resources

---

## 🚨 Troubleshooting
1. **Localization not working:**
    - Ensure `l10n.yaml` is correctly configured.
    - Run `flutter gen-l10n` after updating the ARB files.

2. **DI not working:**
    - Ensure the payment method is registered in `service_locator.dart`.

---

## 👨‍💻 Contributors
- [MuhamadJalal](https://github.com/MuhamadJalal/bardix.git)

---

## 📄 License
This project is licensed under the MIT License.

