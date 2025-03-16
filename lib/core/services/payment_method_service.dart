import 'package:bardix/features/order/domain/entities/payment_method_base.dart';

abstract class PaymentMethodFactory {
  PaymentMethodBase? fromString(String value);
}

class PaymentMethodService implements PaymentMethodFactory {
  final Map<String, PaymentMethodBase> _methods;

  PaymentMethodService(this._methods);

  @override
  PaymentMethodBase? fromString(String value) => _methods[value.toLowerCase()];

  List<PaymentMethodBase> get availableMethods =>
      _methods.values.toSet().toList();
}
