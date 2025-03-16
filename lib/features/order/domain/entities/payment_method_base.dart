import 'package:flutter/material.dart';

/// following the Open/Closed Principle (OCP).
/// This will serve as a blueprint for all payment methods
abstract class PaymentMethodBase {
  ValueNotifier<bool> get isValid;

  String label(BuildContext context);

  Widget buildInput({
    required BuildContext context,
    required TextEditingController controller,
  });
}

abstract class ValidatablePaymentMethod extends PaymentMethodBase {
  String? validate(BuildContext context, String? value);
}
