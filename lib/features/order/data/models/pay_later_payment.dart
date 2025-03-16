import 'package:bardix/core/di/service_locator.dart';
import 'package:bardix/core/localization/localization_service.dart';
import 'package:bardix/core/theme/app_repo_text_style.dart';
import 'package:bardix/core/utils/validations.dart';
import 'package:bardix/core/widgets/barrel_widgets.dart';
import 'package:bardix/features/order/domain/entities/payment_method_base.dart';
import 'package:bardix/l10n/l10n.dart';
import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:flutter/material.dart';

class PayLaterPayment extends ValidatablePaymentMethod {
  final ValueNotifier<Country> selectedCountry = ValueNotifier(
    getDefaultCountry(),
  );
  final ValueNotifier<String?> phoneValidMsg = ValueNotifier<String?>(null);

  // ✅ Create a single instance of ValueNotifier<bool>
  final ValueNotifier<bool> _isValid = ValueNotifier(false);

  @override
  ValueNotifier<bool> get isValid => _isValid;

  @override
  String label(context) => S.of(context).payLater;

  @override
  Widget buildInput({
    required BuildContext context,
    required TextEditingController controller,
  }) => ValueListenableBuilder<String?>(
    valueListenable: phoneValidMsg,
    builder:
        (context, errorMsg, child) => Directionality(
          textDirection: TextDirection.ltr,
          child: CommonTitledTextFormField(
            controller: controller,
            keyboardType: TextInputType.phone,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            hintText: S.of(context).enterPhoneNumber,
            textStyle: AppRepoTextStyle().textStyleTitleSmall(context),
            prefixWidget: CountryCodePickerWidget(
              locale: getIt<LocalizationService>().locale.languageCode,
              selectedCountry: selectedCountry,
            ),
            errorMessage: errorMsg,
            showErrorMessage: errorMsg != null,
            onChanged: (value) {
              phoneValidMsg.value = validate(context, value);
              // ✅ Update the existing instance of _isValid
              _isValid.value = phoneValidMsg.value == null;
            },
          ),
        ),
  );

  @override
  String? validate(BuildContext context, String? value) {
    final countryRules = countryPhoneRules[selectedCountry.value.code];
    final minLength = countryRules?["minLength"] ?? 9;
    final maxLength = countryRules?["maxLength"] ?? 12;
    return value?.validatePhoneNumber(
      context: context,
      minLength: minLength,
      maxLength: maxLength,
    );
  }
}
