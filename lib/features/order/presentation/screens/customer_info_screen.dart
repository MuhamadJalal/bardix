import 'package:bardix/core/app_constants/app_repo_assets.dart';
import 'package:bardix/core/di/service_locator.dart';
import 'package:bardix/core/localization/localization_service.dart';
import 'package:bardix/core/router/app_routs.dart';
import 'package:bardix/core/utils/size_utils.dart';
import 'package:bardix/core/utils/validations.dart';
import 'package:bardix/core/widgets/animated_progress_widget.dart';
import 'package:bardix/core/widgets/barrel_widgets.dart';
import 'package:bardix/features/order/presentation/bloc/order_bloc.dart';
import 'package:bardix/features/order/presentation/widgets/build_text_field.dart';
import 'package:bardix/l10n/l10n.dart';
import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class CustomerInfoScreen extends StatefulWidget {
  const CustomerInfoScreen({super.key});

  @override
  State<CustomerInfoScreen> createState() => CustomerInfoScreenState();
}

class CustomerInfoScreenState extends State<CustomerInfoScreen> {
  late final ValueNotifier<String?> _fullNameValidMsg;
  late final ValueNotifier<String?> _phoneValidMsg;
  late final ValueNotifier<String?> _addressValidMsg;

  late final TextEditingController _fullNameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;

  final ValueNotifier<Country> selectedCountry = ValueNotifier(
    getDefaultCountry(),
  );
  final ValueNotifier<bool> _isButtonEnabled = ValueNotifier(false);


  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _initializeValidators();
    _updateButtonState();
  }

  void _initializeControllers() {
    final state =
        getIt.isRegistered<OrderBloc>() ? getIt<OrderBloc>().state : null;

    _fullNameController = TextEditingController(
      text: state is OrderLoaded ? state.customerName : '',
    );
    _phoneController = TextEditingController(
      text: state is OrderLoaded ? state.customerPhone : '',
    );
    _addressController = TextEditingController(
      text: state is OrderLoaded ? state.customerAddress : '',
    );
  }

  void _initializeValidators() {
    _fullNameValidMsg = ValueNotifier<String?>(null);
    _phoneValidMsg = ValueNotifier<String?>(null);
    _addressValidMsg = ValueNotifier<String?>(null);
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();

    _fullNameValidMsg.dispose();
    _phoneValidMsg.dispose();
    _addressValidMsg.dispose();

    selectedCountry.dispose();
    _isButtonEnabled.dispose();

    super.dispose();
  }

  void _updateButtonState() =>
      _isButtonEnabled.value =
          _fullNameValidMsg.value == null &&
          _phoneValidMsg.value == null &&
          _addressValidMsg.value == null &&
          _fullNameController.text.isNotEmpty &&
          _phoneController.text.isNotEmpty &&
          _addressController.text.isNotEmpty;

  void _onSubmit(BuildContext context) {
    HapticFeedback.mediumImpact(); // Provide feedback on successful submission
    getIt<OrderBloc>().add(
      UpdateCustomerInfo(
        customerName: _fullNameController.text.trim(),
        customerPhone: _phoneController.text.trim(),
        customerAddress: _addressController.text.trim(),
      ),
    );
    context.go(AppRoutes.packageDetails);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    // Continue Button
    bottomNavigationBar:  SafeArea(
      child: Padding(
        padding: EdgeInsets.only(bottom: 40.convertPxToDp()),
        child: ValueListenableBuilder<bool>(
          valueListenable: _isButtonEnabled,
          builder:
              (context, isEnabled, child) => AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder:
                (child, animation) =>
                ScaleTransition(scale: animation, child: child),
            child: CommonDefaultButton(
              animationKey: ValueKey(isEnabled),
              isActive: isEnabled,
              onPressed: isEnabled ? () => _onSubmit(context) : null,
              child: Text(
                S.of(context).next,
                style: TextStyle(
                  fontSize: 16.convertPxToDp(),
                  fontWeight: FontWeight.bold,
                  color:
                  isEnabled
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).hintColor,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  body: GradientContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.convertPxToDp()),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Screen Title: "Customer Info"
              CommonHeader(hasBackBtn: false, title: S.of(context).customerInfo),
              SizedBox(height: 40.convertPxToDp()),

              /// Progress Indicator factor set to static value as it is not a core functionality
              // Progress Indicator
              AnimatedProgressWidget(factor: 0.25),
              SizedBox(height: 30.convertPxToDp()),

              // Full Name Input
              BuildTextField(
                title: S.of(context).fullName,
                controller: _fullNameController,
                icon: AppRepoAssets().userImage,
                validationNotifier: _fullNameValidMsg,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  _fullNameValidMsg.value = value.validateFullName(
                    context: context,
                  );
                  _updateButtonState();
                },
              ),

              SizedBox(height: 16.convertPxToDp()),

              // Phone Number Input
              BuildTextField(
                title: S.of(context).phoneNumber,
                controller: _phoneController,
                validationNotifier: _phoneValidMsg,
                keyboardType: TextInputType.phone,
                prefixWidget: CountryCodePickerWidget(
                  locale: getIt<LocalizationService>().locale.languageCode,
                  selectedCountry: selectedCountry,
                ),
                onChanged: (value) {
                  final countryRules =
                      countryPhoneRules[selectedCountry.value.code];
                  _phoneValidMsg.value = value.validatePhoneNumber(
                    context: context,
                    minLength: countryRules?["minLength"] ?? 9,
                    maxLength: countryRules?["maxLength"] ?? 12,
                  );
                  _updateButtonState();
                },
              ),

              SizedBox(height: 16.convertPxToDp()),

              // Address Input
              BuildTextField(
                title: S.of(context).address,
                controller: _addressController,
                icon: AppRepoAssets().locationImage,
                validationNotifier: _addressValidMsg,
                keyboardType: TextInputType.streetAddress,
                onChanged: (value) {
                  _addressValidMsg.value = value.validateAddress(
                    context: context,
                  );
                  _updateButtonState();
                },
              ),


              SizedBox(height: 40.convertPxToDp()),
            ],
          ),
        ),
      ),
    ),
  );
}
