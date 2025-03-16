part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object?> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoaded extends OrderState {
  final String customerName;
  final String customerPhone;
  final String customerAddress;
  final String packageType;
  final double packageWeight;
  final String? deliveryNotes;
  final String paymentMethod;
  final String? paymentDetails;

  @override
  String toString() =>
      'OrderLoaded{customerName: $customerName, customerPhone: $customerPhone, customerAddress: $customerAddress, packageType: $packageType, packageWeight: $packageWeight, deliveryNotes: $deliveryNotes, paymentMethod: $paymentMethod, paymentDetails: $paymentDetails}';

  const OrderLoaded({
    required this.customerName,
    required this.customerPhone,
    required this.customerAddress,
    required this.packageType,
    required this.packageWeight,
    this.deliveryNotes,
    required this.paymentMethod,
    this.paymentDetails,
  });

  OrderLoaded copyWith({
    String? customerName,
    String? customerPhone,
    String? customerAddress,
    String? packageType,
    double? packageWeight,
    String? deliveryNotes,
    String? paymentMethod,
    String? paymentDetails,
  }) => OrderLoaded(
    customerName: customerName ?? this.customerName,
    customerPhone: customerPhone ?? this.customerPhone,
    customerAddress: customerAddress ?? this.customerAddress,
    packageType: packageType ?? this.packageType,
    packageWeight: packageWeight ?? this.packageWeight,
    deliveryNotes: deliveryNotes ?? this.deliveryNotes,
    paymentMethod: paymentMethod ?? this.paymentMethod,
    paymentDetails: paymentDetails ?? this.paymentDetails,
  );

  @override
  List<Object?> get props => [
    customerName,
    customerPhone,
    customerAddress,
    packageType,
    packageWeight,
    deliveryNotes,
    paymentMethod,
    paymentDetails,
  ];
}

class OrderSubmitting extends OrderState {}

class OrderSuccess extends OrderState {}

class OrderFailure extends OrderState {
  final String error;

  const OrderFailure(this.error);
}
