import 'package:bardix/core/utils/validations.dart';
import 'package:bardix/core/widgets/barrel_widgets.dart';
import 'package:bardix/features/order/domain/entities/payment_method_base.dart';
import 'package:bardix/l10n/l10n.dart';
import 'package:flutter/material.dart';

class CreditCardPayment extends PaymentMethodBase {
  final ValueNotifier<String?> creditCardValidMsg = ValueNotifier<String?>(
    null,
  );

  // ✅ Create a single instance of ValueNotifier<bool>
  final ValueNotifier<bool> _isValid = ValueNotifier(false);

  @override
  ValueNotifier<bool> get isValid => _isValid;

  @override
  String label(context) => S.of(context).creditCard;

  @override
  Widget buildInput({
    required BuildContext context,
    required TextEditingController controller,
  }) => ValueListenableBuilder<String?>(
    valueListenable: creditCardValidMsg,
    builder:
        (context, errorMsg, child) => CommonTitledTextFormField(
          controller: controller,
          hintText: S.of(context).cardNumber,
          keyboardType: TextInputType.number,
          errorMessage: errorMsg,
          showErrorMessage: errorMsg != null,
          onChanged: (value) {
            creditCardValidMsg.value = value.validateCardNumber(
              context: context,
            );
            // ✅ Update the existing instance of _isValid
            _isValid.value = creditCardValidMsg.value == null;
          },
        ),
  );
}
