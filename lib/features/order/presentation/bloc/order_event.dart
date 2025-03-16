part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class SubmitOrder extends OrderEvent {}

class ResetOrder extends OrderEvent {}

class UpdateCustomerInfo extends OrderEvent {
  final String customerName;
  final String customerPhone;
  final String customerAddress;

  const UpdateCustomerInfo({
    required this.customerName,
    required this.customerPhone,
    required this.customerAddress,
  });
}

class UpdatePackageDetails extends OrderEvent {
  final String packageType;
  final double packageWeight;
  final String? deliveryNotes;

  const UpdatePackageDetails({
    required this.packageType,
    required this.packageWeight,
    this.deliveryNotes,
  });
}

class UpdatePaymentMethod extends OrderEvent {
  final String? paymentMethod;
  final String? paymentDetails;

  const UpdatePaymentMethod({required this.paymentMethod, this.paymentDetails});
}
