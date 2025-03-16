import 'package:bardix/core/localization/localization_service.dart';
import 'package:bardix/core/services/navigation_service.dart';
import 'package:bardix/core/services/payment_method_service.dart';
import 'package:bardix/core/theme/blocs/theme_bloc.dart';
import 'package:bardix/features/order/data/models/cash_on_delivery_payment.dart';
import 'package:bardix/features/order/data/models/credit_card_payment.dart';
import 'package:bardix/features/order/data/models/pay_later_payment.dart';
import 'package:bardix/features/order/presentation/bloc/order_bloc.dart';
import 'package:bardix/features/splash/bloc/splash_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

// void injectorSetup() {
//   // ✅ Register Core Services
//   _registerCoreServices();
//
//   // ✅ Register BLoCs
//   _registerBlocs();
//
//   // ✅ Register Payment Methods
//   _registerPaymentMethods();
//
//   // ✅ Register PaymentMethodService
//   _registerPaymentMethodService();
// }
//
// void _registerCoreServices() {
//   getIt.registerSingleton<LocalizationService>(LocalizationService());
//   getIt.registerLazySingleton<NavigationService>(() => NavigationService());
// }
//
// void _registerBlocs() {
//   getIt.registerLazySingleton<ThemeBloc>(() => ThemeBloc());
//   getIt.registerLazySingleton<SplashBloc>(() => SplashBloc());
//
//   // ✅ Ensure OrderBloc is registered properly
//   if (!getIt.isRegistered<OrderBloc>()) {
//     getIt.registerLazySingleton<OrderBloc>(() => OrderBloc());
//   }
// }
//
// void _registerPaymentMethods() {
//   getIt.registerLazySingleton<CreditCardPayment>(() => CreditCardPayment());
//   getIt.registerLazySingleton<CashOnDeliveryPayment>(
//     () => CashOnDeliveryPayment(),
//   );
//   getIt.registerLazySingleton<PayLaterPayment>(() => PayLaterPayment());
// }
//
// void _registerPaymentMethodService() {
//   if (!getIt.isRegistered<PaymentMethodService>()) {
//     getIt.registerLazySingleton<PaymentMethodService>(
//       () => PaymentMethodService({
//         'credit card': getIt<CreditCardPayment>(),
//         'بطاقة ائتمان': getIt<CreditCardPayment>(),
//         'cashondelivery': getIt<CashOnDeliveryPayment>(),
//         'الدفع عند الاستلام': getIt<CashOnDeliveryPayment>(),
//         'paylater': getIt<PayLaterPayment>(),
//         'الدفع لاحقًا': getIt<PayLaterPayment>(),
//       }),
//     );
//   }
// }
Future<void> injectorSetup() async {
  _registerCoreServices();
  _registerBlocs();
  _registerPaymentMethods();
  _registerPaymentMethodService();
}

void _registerCoreServices() {
  if (!getIt.isRegistered<LocalizationService>()) {
    getIt.registerSingleton<LocalizationService>(LocalizationService());
  }
  if (!getIt.isRegistered<NavigationService>()) {
    getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  }
}

void _registerBlocs() {
  if (!getIt.isRegistered<ThemeBloc>()) {
    getIt.registerLazySingleton<ThemeBloc>(() => ThemeBloc());
  }

  if (!getIt.isRegistered<SplashBloc>()) {
    getIt.registerLazySingleton<SplashBloc>(() => SplashBloc());
  }

  // ✅ Ensure OrderBloc is registered
  if (!getIt.isRegistered<OrderBloc>()) {
    getIt.registerLazySingleton<OrderBloc>(() => OrderBloc());
  }
}
void _registerPaymentMethods() {
  if (!getIt.isRegistered<CreditCardPayment>()) {
    getIt.registerLazySingleton<CreditCardPayment>(() => CreditCardPayment());
  }
  if (!getIt.isRegistered<CashOnDeliveryPayment>()) {
    getIt.registerLazySingleton<CashOnDeliveryPayment>(
      () => CashOnDeliveryPayment(),
    );
  }
  if (!getIt.isRegistered<PayLaterPayment>()) {
    getIt.registerLazySingleton<PayLaterPayment>(() => PayLaterPayment());
  }
}

/// Registers the `PaymentMethodService` as a lazy singleton in the service locator.
///
/// The keys represent the payment method names in English and Arabic:
/// - `'credit card'` and `'بطاقة ائتمان'` → `CreditCardPayment`
/// - `'cashondelivery'` and `'الدفع عند الاستلام'` → `CashOnDeliveryPayment`
/// - `'paylater'` and `'الدفع لاحقًا'` → `PayLaterPayment`
///
/// Example usage:
/// ```dart
/// final paymentService = getIt<PaymentMethodService>();
/// final method = paymentService.getMethod('credit card');
/// ```
void _registerPaymentMethodService() {
  if (!getIt.isRegistered<PaymentMethodService>()) {
    getIt.registerLazySingleton<PaymentMethodService>(
      () => PaymentMethodService({
        'credit card': getIt<CreditCardPayment>(),
        'بطاقة ائتمان': getIt<CreditCardPayment>(),
        'cashondelivery': getIt<CashOnDeliveryPayment>(),
        'الدفع عند الاستلام': getIt<CashOnDeliveryPayment>(),
        'paylater': getIt<PayLaterPayment>(),
        'الدفع لاحقًا': getIt<PayLaterPayment>(),
      }),
    );
  }
}
