import 'package:animate_do/animate_do.dart';
import 'package:bardix/core/di/service_locator.dart';
import 'package:bardix/core/router/barrel_router.dart';
import 'package:bardix/core/services/navigation_service.dart';
import 'package:bardix/core/services/payment_method_service.dart';
import 'package:bardix/core/theme/app_repo_text_style.dart';
import 'package:bardix/core/utils/size_utils.dart';
import 'package:bardix/core/widgets/animated_progress_widget.dart';
import 'package:bardix/core/widgets/barrel_widgets.dart';
import 'package:bardix/features/order/presentation/bloc/order_bloc.dart';
import 'package:bardix/features/order/presentation/widgets/build_card_section.dart';
import 'package:bardix/features/order/presentation/widgets/info_row.dart';
import 'package:bardix/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ReviewSubmitScreen extends StatelessWidget {
  const ReviewSubmitScreen({super.key});

  void _onSubmit(BuildContext context) {
    context.read<OrderBloc>().add(SubmitOrder());
    HapticFeedback.mediumImpact(); // Add haptic feedback on submission
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state is OrderSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                S.of(context).orderSubmittedSuccessfully,
                style: AppRepoTextStyle().textStyleBodyLarge(
                  context,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              behavior: SnackBarBehavior.floating,
            ),
          );
          context.read<OrderBloc>().add(ResetOrder());
          context.go(AppRoutes.customerInfo, extra: context.read<OrderBloc>());
        } else if (state is OrderFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${S.of(context).error}: ${state.error}',
                style: AppRepoTextStyle().textStyleBodyLarge(
                  context,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
              backgroundColor: Theme.of(context).colorScheme.error,
              behavior: SnackBarBehavior.floating,
            ),
          );
          HapticFeedback.heavyImpact(); // Haptic feedback on error
        }
      },
      builder: (context, state) => Scaffold(
    // Continue Button
    bottomNavigationBar:  SafeArea(
        child: Padding(
            padding: EdgeInsets.only(bottom: 40.convertPxToDp()),
            child: state is OrderSubmitting
                ? const Center(child: CircularProgressIndicator())
                : CommonDefaultButton(
              animationKey: ValueKey(true),
              isActive: true,
              onPressed: () => _onSubmit(context),
              child: Text(
                S.of(context).submitOrder,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
        )),
    body: GradientContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.convertPxToDp()),
        child: state is OrderLoaded ?
               FadeInUp(
                duration: const Duration(milliseconds: 400),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Screen Title: "Review & Submit"
                      CommonHeader(
                        title: S.of(context).reviewAndSubmit,
                        onBackPressed:
                            () => getIt<NavigationService>().goto(
                              context,
                              AppRoutes.payment,
                            ),
                      ),

                      SizedBox(height: 40.convertPxToDp()),

                      AnimatedProgressWidget(factor: 1.00),
                      SizedBox(height: 30.convertPxToDp()),

                      BuildCardSection(
                        title: S.of(context).customerInfo,
                        children: [
                          InfoRow(
                            label: S.of(context).name,
                            value: state.customerName,
                          ),
                          InfoRow(
                            label: S.of(context).phone,
                            value: state.customerPhone,
                          ),
                          InfoRow(
                            label: S.of(context).address,
                            value: state.customerAddress,
                          ),
                        ],
                      ),

                      BuildCardSection(
                        title: S.of(context).packageDetails,
                        children: [
                          InfoRow(
                            label: S.of(context).packageType,
                            value: state.packageType,
                          ),
                          InfoRow(
                            label: S.of(context).weight,
                            value:
                                '${state.packageWeight} ${S.of(context).weightMeasure}',
                          ),
                          if (state.deliveryNotes != null)
                            InfoRow(
                              label: S.of(context).notes,
                              value: state.deliveryNotes!,
                            ),
                        ],
                      ),

                      BuildCardSection(
                        title: S.of(context).paymentInfo,
                        children: [
                          InfoRow(
                            label: S.of(context).method,
                            value:
                                getIt<PaymentMethodService>()
                                    .fromString(state.paymentMethod)
                                    ?.label(context) ??
                                state.paymentMethod,
                          ),
                          if (state.paymentDetails != null)
                            InfoRow(
                              label: S.of(context).details,
                              value: state.paymentDetails!,
                            ),
                        ],
                      ),



                      SizedBox(height: 40.convertPxToDp()),
                    ],
                  ),
                ),
              ) :  const Center(child: CircularProgressIndicator())
        ),
      ),
    ),
  );
}
