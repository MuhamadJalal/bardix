import 'package:bardix/core/di/service_locator.dart';
import 'package:bardix/core/router/barrel_router.dart';
import 'package:bardix/core/services/navigation_service.dart';
import 'package:bardix/core/services/payment_method_service.dart';
import 'package:bardix/core/theme/app_repo_text_style.dart';
import 'package:bardix/core/utils/size_utils.dart';
import 'package:bardix/core/widgets/animated_progress_widget.dart';
import 'package:bardix/core/widgets/barrel_widgets.dart';
import 'package:bardix/features/order/domain/entities/payment_method_base.dart';
import 'package:bardix/features/order/presentation/bloc/order_bloc.dart';
import 'package:bardix/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _paymentDetailsController = TextEditingController();
  final ValueNotifier<PaymentMethodBase?> _selectedMethodNotifier =
      ValueNotifier<PaymentMethodBase?>(null);
  final ValueNotifier<bool> _isLoadingNotifier = ValueNotifier<bool>(false);
  final paymentMethodService = getIt<PaymentMethodService>();

  @override
  void initState() {
    super.initState();
    final state = getIt<OrderBloc>().state;
    if (state is OrderLoaded) {
      _selectedMethodNotifier.value =
          paymentMethodService.fromString(state.paymentMethod) ??
          paymentMethodService.availableMethods.first;

      _paymentDetailsController.text = state.paymentDetails ?? '';
    }
  }

  @override
  void dispose() {
    _paymentDetailsController.dispose();
    _selectedMethodNotifier.dispose();
    _isLoadingNotifier.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    _isLoadingNotifier.value = true;

    final paymentMethod = _selectedMethodNotifier.value?.label(context);
    final paymentDetails = _paymentDetailsController.text.trim();

    getIt<OrderBloc>().add(
      UpdatePaymentMethod(
        paymentMethod: paymentMethod,
        paymentDetails: paymentDetails,
      ),
    );

    await Future.delayed(const Duration(milliseconds: 200));
    // ignore: use_build_context_synchronously
    context.go(AppRoutes.reviewSubmit);

    _isLoadingNotifier.value = false;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    // Continue Button
    bottomNavigationBar:  SafeArea(
        child: Padding(
            padding: EdgeInsets.only(bottom: 40.convertPxToDp()),
            child:ValueListenableBuilder<PaymentMethodBase?>(
              valueListenable: _selectedMethodNotifier,
              builder:
                  (context, selectedMethod, _) => ValueListenableBuilder<bool>(
                valueListenable: selectedMethod!.isValid,
                // valueListenable: _isLoadingNotifier,
                builder:
                    (context, isValid, child) => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (child, animation) => FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                  child: CommonDefaultButton(
                    animationKey: ValueKey(isValid),
                    isActive: isValid,
                    onPressed: !isValid ? null : _onSubmit,
                    child: Text(
                      S.of(context).next,
                      style: TextStyle(
                        fontSize: 16.convertPxToDp(),
                        fontWeight: FontWeight.w600,
                        color:
                        isValid
                            ? Colors.white
                            : Colors.grey.shade400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        )),
    body: GradientContainer(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.convertPxToDp()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Screen Title: "Payment Specification"
              CommonHeader(
                title: S.of(context).paymentSpecification,
                onBackPressed:
                    () => getIt<NavigationService>().goto(
                      context,
                      AppRoutes.packageDetails,
                    ),
              ),
        
              SizedBox(height: 40.convertPxToDp()),
        
              /// Progress Indicator
              AnimatedProgressWidget(factor: 0.75),
        
              SizedBox(height: 30.convertPxToDp()),
        
              /// Payment Method Selection
              ValueListenableBuilder<PaymentMethodBase?>(
                valueListenable: _selectedMethodNotifier,
                builder:
                    (context, selectedMethod, _) => Column(
                      children:
                          paymentMethodService.availableMethods.map((method) {
                            bool isSelected = method == selectedMethod;
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 8.convertPxToDp(),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  _paymentDetailsController.clear();
                                  _selectedMethodNotifier.value = method;
                                  _selectedMethodNotifier.value?.isValid.value =
                                      false;
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  padding: EdgeInsets.all(16.convertPxToDp()),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(
                                      12.convertPxToDp(),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(
                                          alpha: 0.05,
                                        ),
                                        blurRadius: 8,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                    border: Border.all(
                                      color:
                                          isSelected
                                              ? Theme.of(
                                                context,
                                              ).colorScheme.secondary
                                              : Theme.of(context).dividerColor,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.credit_card,
                                        color:
                                            isSelected
                                                ? Theme.of(
                                                  context,
                                                ).colorScheme.secondary
                                                : Theme.of(context).hintColor,
                                        size: 24.convertPxToDp(),
                                      ),
                                      SizedBox(width: 12.convertPxToDp()),
                                      Expanded(
                                        child: Text(
                                          method.label(context),
                                          style: AppRepoTextStyle()
                                              .textStyleBodyLarge(
                                                context,
                                                color:
                                                    isSelected
                                                        ? Theme.of(
                                                          context,
                                                        ).colorScheme.secondary
                                                        : null,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      if (isSelected)
                                        Icon(
                                          Icons.check_circle,
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.secondary,
                                          size: 24.convertPxToDp(),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                    ),
              ),
        
              SizedBox(height: 40.convertPxToDp()),
        
              /// Payment Input Field
              ValueListenableBuilder<PaymentMethodBase?>(
                valueListenable: _selectedMethodNotifier,
                builder:
                    (context, selectedMethod, _) =>
                        selectedMethod != null
                            ? selectedMethod.buildInput(
                              context: context,
                              controller: _paymentDetailsController,
                            )
                            : const SizedBox.shrink(),
              ),
        
        
              
        
              SizedBox(height: 100.convertPxToDp()),
            ],
          ),
        ),
      ),
    ),
  );
}
