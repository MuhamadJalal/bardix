import 'package:bardix/core/app_constants/app_repo_assets.dart';
import 'package:bardix/core/di/service_locator.dart';
import 'package:bardix/core/router/barrel_router.dart';
import 'package:bardix/core/services/navigation_service.dart';
import 'package:bardix/core/utils/size_utils.dart';
import 'package:bardix/core/utils/validations.dart';
import 'package:bardix/core/widgets/animated_progress_widget.dart';
import 'package:bardix/core/widgets/barrel_widgets.dart';
import 'package:bardix/features/order/presentation/bloc/order_bloc.dart';
import 'package:bardix/features/order/presentation/widgets/common_dropdown_widget.dart';
import 'package:bardix/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PackageDetailsScreen extends StatefulWidget {
  const PackageDetailsScreen({super.key});

  @override
  State<PackageDetailsScreen> createState() => PackageDetailsScreenState();
}

class PackageDetailsScreenState extends State<PackageDetailsScreen> {
  late final TextEditingController _weightController;
  late final TextEditingController _notesController;

  late final ValueNotifier<String?> _weightValidMsg;
  late final ValueNotifier<String?> _packageTypeValidMsg;
  late final ValueNotifier<String?> _packageType;

  final ValueNotifier<bool> _isButtonEnabled = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    final state = getIt<OrderBloc>().state;
    if (state is OrderLoaded) {
      _weightController = TextEditingController(
        text: state.packageWeight > 0 ? state.packageWeight.toString() : '',
      );
      _notesController = TextEditingController(text: state.deliveryNotes ?? '');
      _packageType = ValueNotifier(state.packageType);
    } else {
      _weightController = TextEditingController();
      _notesController = TextEditingController();
      _packageType = ValueNotifier(null);
    }

    _weightValidMsg = ValueNotifier(null);
    _packageTypeValidMsg = ValueNotifier(null);

    _weightController.addListener(_updateButtonState);
    _notesController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _weightController.dispose();
    _notesController.dispose();
    _weightValidMsg.dispose();
    _packageTypeValidMsg.dispose();
    _packageType.dispose();
    _isButtonEnabled.dispose();
    super.dispose();
  }

  void _updateButtonState() =>
      _isButtonEnabled.value =
          _weightValidMsg.value == null &&
          _packageTypeValidMsg.value == null &&
          _packageType.value != null &&
          _weightController.text.isNotEmpty;

  void _onSubmit() {
    getIt<OrderBloc>().add(
      UpdatePackageDetails(
        packageType: _packageType.value!,
        packageWeight: double.parse(_weightController.text.trim()),
        deliveryNotes:
            _notesController.text.trim().isEmpty
                ? null
                : _notesController.text.trim(),
      ),
    );
    context.go(AppRoutes.payment);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    // Continue Button
    bottomNavigationBar:  SafeArea(
        child: Padding(
            padding: EdgeInsets.only(bottom: 40.convertPxToDp()),
            child:ValueListenableBuilder<bool>(
              valueListenable: _isButtonEnabled,
              builder:
                  (context, isEnabled, child) => AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder:
                    (child, animation) =>
                    FadeTransition(opacity: animation, child: child),
                child: CommonDefaultButton(
                  animationKey: ValueKey(isEnabled),
                  isActive: isEnabled,
                  onPressed: isEnabled ? _onSubmit : null,
                  child: Text(
                    S.of(context).next,
                    style: TextStyle(
                      fontSize: 16.convertPxToDp(),
                      fontWeight: FontWeight.w600,
                      color:
                      isEnabled ? Colors.white : Colors.grey.shade400,
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
              // Screen Title: "Package Info"
              CommonHeader(
                title: S.of(context).packageInfo,
                onBackPressed:
                    () => getIt<NavigationService>().goto(
                      context,
                      AppRoutes.customerInfo,extra: context.read<OrderBloc>()
                    ),
              ),
              SizedBox(height: 40.convertPxToDp()),

              // Progress Bar
              AnimatedProgressWidget(factor: 0.50),
              SizedBox(height: 24.convertPxToDp()),

              // Package Type Dropdown
              Text(
                S.of(context).packageType,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8.convertPxToDp()),
              ValueListenableBuilder<String?>(
                valueListenable: _packageTypeValidMsg,
                builder:
                    (context, errorMsg, child) => CommonDropdownWidget(
                      prefixImage: AppRepoAssets().typeImage,
                      value: _packageType.value,
                      hintText: S.of(context).selectProductType,
                      items: [
                        S.of(context).small,
                        S.of(context).medium,
                        S.of(context).large,
                      ],
                      onChanged: (value) {
                        _packageType.value = value;
                        _packageTypeValidMsg.value = null;
                        _updateButtonState();
                      },
                    ),
              ),

              SizedBox(height: 16.convertPxToDp()),

              // Weight Input Field
              Text(
                S.of(context).weightHint,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8.convertPxToDp()),
              ValueListenableBuilder<String?>(
                valueListenable: _weightValidMsg,
                builder:
                    (context, errorMsg, child) => CommonTitledTextFormField(
                      controller: _weightController,
                      hintText: "0.0",
                      keyboardType: TextInputType.number,
                      errorMessage: errorMsg,
                      showErrorMessage: errorMsg != null,
                      onChanged: (value) {
                        _weightValidMsg.value = value.validateWeight(
                          context: context,
                        );
                        _updateButtonState();
                      },
                    ),
              ),

              SizedBox(height: 16.convertPxToDp()),

              // Delivery Notes Input Field
              Text(
                S.of(context).deliveryNotes,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8.convertPxToDp()),
              CommonTitledTextFormField(
                controller: _notesController,
                showErrorMessage: false,
                hintText: S.of(context).addSpecialInstructions,
                maxLines: 5,
                keyboardType: TextInputType.text,
                onChanged: (value) => _updateButtonState(),
              ),



              SizedBox(height: 40.convertPxToDp()),
            ],
          ),
        ),
      ),
    ),
  );
}
