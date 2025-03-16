import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<SubmitOrder>(_onSubmitOrder);
    on<ResetOrder>(_onResetOrder);
    on<UpdateCustomerInfo>(_onUpdateCustomerInfo);
    on<UpdatePackageDetails>(_onUpdatePackageDetails);
    on<UpdatePaymentMethod>(_onUpdatePaymentMethod);
  }

  Future<void> _onSubmitOrder(
      SubmitOrder event,
      Emitter<OrderState> emit,
      ) async {
    emit(OrderSubmitting());
    try {
      await _simulateApiCall(); // ✅ Extracted logic for better testing
      emit(OrderSuccess());
    } catch (e) {
      emit(OrderFailure(e.toString()));
    }
  }

  // ✅ Simulate API call (makes it easier to mock in tests)
  Future<void> _simulateApiCall() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  // ✅ Reset Order State
  void _onResetOrder(ResetOrder event, Emitter<OrderState> emit) {
    emit(OrderInitial());
  }

  // ✅ Centralize OrderLoaded State Handling
  void _emitLoadedState({
    String? customerName,
    String? customerPhone,
    String? customerAddress,
    String? packageType,
    double? packageWeight,
    String? deliveryNotes,
    String? paymentMethod,
    dynamic paymentDetails,
    required Emitter<OrderState> emit,
  }) {
    final currentState = state is OrderLoaded ? state as OrderLoaded : null;
    emit(OrderLoaded(
      customerName: customerName ?? currentState?.customerName ?? '',
      customerPhone: customerPhone ?? currentState?.customerPhone ?? '',
      customerAddress: customerAddress ?? currentState?.customerAddress ?? '',
      packageType: packageType ?? currentState?.packageType ?? '',
      packageWeight: packageWeight ?? currentState?.packageWeight ?? 0.0,
      deliveryNotes: deliveryNotes ?? currentState?.deliveryNotes,
      paymentMethod: paymentMethod ?? currentState?.paymentMethod ?? '',
      paymentDetails: paymentDetails ?? currentState?.paymentDetails,
    ));
  }

  // ✅ Update Customer Info
  void _onUpdateCustomerInfo(
      UpdateCustomerInfo event,
      Emitter<OrderState> emit,
      ) {
    _emitLoadedState(
      customerName: event.customerName,
      customerPhone: event.customerPhone,
      customerAddress: event.customerAddress,
      emit: emit,
    );
  }

  // ✅ Update Package Details
  void _onUpdatePackageDetails(
      UpdatePackageDetails event,
      Emitter<OrderState> emit,
      ) {
    _emitLoadedState(
      packageType: event.packageType,
      packageWeight: event.packageWeight,
      deliveryNotes: event.deliveryNotes,
      emit: emit,
    );
  }

  // ✅ Update Payment Method
  void _onUpdatePaymentMethod(
      UpdatePaymentMethod event,
      Emitter<OrderState> emit,
      ) {
    _emitLoadedState(
      paymentMethod: event.paymentMethod,
      paymentDetails: event.paymentDetails,
      emit: emit,
    );
  }
}
