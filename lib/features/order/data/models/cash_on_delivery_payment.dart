import 'package:bardix/features/order/domain/entities/payment_method_base.dart';
import 'package:bardix/l10n/l10n.dart';
import 'package:flutter/material.dart';

class CashOnDeliveryPayment extends PaymentMethodBase {
  @override
  String label(context) => S.of(context).cashOnDelivery;

  @override
  ValueNotifier<bool> get isValid =>
      ValueNotifier(true);

  @override
  Widget buildInput({
    required BuildContext context,
    required TextEditingController controller,
  }) => const SizedBox.shrink(); // No input required for COD
}
