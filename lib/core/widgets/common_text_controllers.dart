import 'package:bardix/core/app_constants/app_repo_assets.dart';
import 'package:bardix/core/theme/app_repo_text_style.dart';
import 'package:bardix/core/utils/size_utils.dart';
import 'package:bardix/core/widgets/common_image_widget.dart';
import 'package:bardix/core/widgets/common_text.dart';
import 'package:bardix/l10n/l10n.dart';
import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Country getDefaultCountry() => Country.fromJson({
  "num_code": "682",
  "alpha_2_code": "SA",
  "alpha_3_code": "SAU",
  "en_short_name": "Saudi Arabia",
  "nationality": "Saudi, Saudi Arabian",
  "dial_code": "+966",
  "ar_name": "السعودية",
  "flag": "----",
});

class CountryCodePickerWidget extends StatelessWidget {
  final ValueNotifier<Country> selectedCountry;
  final String locale;
  final String? title;
  final bool showTooltip;
  final bool isInputFieldEnabled;
  final bool isRequired;
  final EdgeInsets? titlePadding;

  const CountryCodePickerWidget({
    super.key,
    required this.locale,
    required this.selectedCountry,
    this.title,
    this.showTooltip = true,
    this.isInputFieldEnabled = true,
    this.isRequired = true,
    this.titlePadding,
  });

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
    valueListenable: selectedCountry,
    builder:
        (BuildContext context, Country value, Widget? child) =>
            CountryCodePicker(
              locale: locale,
              selectedCountry: value,
              onChanged: (Country country) => selectedCountry.value = country,
              initialSelection: "SA",
              favorite: const [],
              textStyle: AppRepoTextStyle().textStyleTitleMediumBlue(context),
              padding: EdgeInsets.all(10.convertPxToDp()),
              showCountryOnly: false,
              searchDecoration: InputDecoration(
                hintText: S.of(context).searchHere,
                hintTextDirection: TextDirection.rtl,
                prefixIcon: CommonSVGImageProvider(
                  imagePath: AppRepoAssets().searchImage,
                  width: 20.convertPxToDp(),
                  height: 20.convertPxToDp(),
                ),
              ),
              searchStyle: AppRepoTextStyle().textStyleTitleMedium(
                context,
                fontWeight: FontWeight.w600,
              ),
              dialogTextStyle: AppRepoTextStyle().textStyleTitleMedium(
                context,
                fontWeight: FontWeight.w600,
              ),
              emptySearchBuilder:
                  (BuildContext context) => CommonText(
                    text: S.of(context).noCountryFound,
                    // Translations.of(context).noSearchCountry,
                    textAlign: TextAlign.center,
                    textStyle: AppRepoTextStyle().textStyleTitleLarge(
                      context,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
              showOnlyCountryWhenClosed: false,
              alignLeft: false,
              showFlag: true,
              showFlagDialog: true,
              hideMainText: false,
              showFlagMain: true,
              flagDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.convertPxToDp()),
              ),
              // builder: (Country? country){},
              flagWidth: 34.convertPxToDp(),
              enabled: true,
              textOverflow: TextOverflow.ellipsis,
              // barrierColor: ,
              // backgroundColor: ,
              // boxDecoration: ,
              // comparator: ,
              // countryFilter: ,
              hideSearch: false,
              hideCloseIcon: true,
              showDropDownButton: true,
              // dialogSize: ,
              dialogBackgroundColor: Theme.of(context).highlightColor,
              closeIcon: const Icon(Icons.close),
              divider: CommonSVGImageProvider(
                imagePath: AppRepoAssets().verticalLineImage,
                boxFit: BoxFit.fill,
              ),
              // countryList: countryCodes,
              dialogItemPadding: EdgeInsets.symmetric(
                horizontal: 16.convertPxToDp(),
                vertical: 14.convertPxToDp(),
              ),
              searchPadding: EdgeInsets.symmetric(
                horizontal: 10.convertPxToDp(),
                vertical: 8.convertPxToDp(),
              ),
              mode: CountryCodePickerMode.bottomSheet,
              icon: CommonSVGImageProvider(
                imagePath: AppRepoAssets().dropdownArrowImage,
                width: 24.convertPxToDp(),
                boxFit: BoxFit.scaleDown,
              ),
              // iconDisabledColor: ,
              // iconEnabledColor: ,
              // iconSize: ,
              // elevation: ,
              // shadowColor: ,
              // surfaceTintColor: ,
              insetAnimationDuration: const Duration(milliseconds: 100),
              insetAnimationCurve: Curves.decelerate,
              // insetPadding: ,
              clipBehavior: Clip.none,
              // shape: ,
              // alignment: ,
            ),
  );
}

class CommonTitledTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final CrossAxisAlignment? crossAxisAlignment;
  final String? titleText;
  final String? initialValue;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;
  final Color? titleTextColor;
  final String? hintText;
  final String? errorText;
  final String? fontFamily;
  final bool isObscureText;
  final bool isRequired;
  final ValueNotifier<bool>? isValid;
  final bool isBordered;
  final bool isEnabled;
  final bool readOnly;
  final bool showErrorMessage;
  final bool? enableInteractiveSelection;
  final Color? borderColor;
  final double? borderWidth;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? hintFontSize;
  final FontWeight? hintFontWeight;
  final double? hintLetterSpacing;
  final double? cursorHeight;
  final Color? textFieldColor;
  final Color? fillColor;
  final Color? textColor;
  final Color? cursorColor;
  final Color? hintTextColor;
  final String? tooltipMessage;
  final Widget? prefixWidget;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final VoidCallback? onPrefixIconPress;
  final Widget? suffixWidget;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final VoidCallback? onSuffixIconPress;
  final int? maxLines;
  final int? maxLength;
  final bool autoFocus;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final Widget? titlePrefixWidget;
  final EdgeInsets? contentPadding;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign? textAlign;
  final GlobalKey<FormFieldState>? formKey;

  // final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final String? Function(String?)? onFieldSubmitted;
  final String? Function(PointerDownEvent event)? onTapOutside;
  final InputBorder? disabledBorder;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;

  // final InputBorder? border;
  final AutovalidateMode? autoValidateMode;
  final EdgeInsets? titlePadding;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final TextStyle? titleTextStyle;
  final String? errorMessage;
  final TextStyle? errorMessageTextStyle;

  const CommonTitledTextFormField({
    super.key,
    this.controller,
    this.initialValue,
    this.crossAxisAlignment,
    this.titleText,
    this.titleFontSize,
    this.titleFontWeight,
    this.titleTextColor,
    this.hintText,
    this.errorText,
    this.fontFamily,
    this.borderColor,
    this.borderWidth,
    this.fontSize,
    this.fontWeight,
    this.hintFontSize,
    this.hintFontWeight,
    this.hintLetterSpacing,
    this.cursorHeight,
    this.textFieldColor,
    this.fillColor,
    this.textColor,
    this.cursorColor,
    this.hintTextColor,
    this.tooltipMessage,
    this.prefixWidget,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.onPrefixIconPress,
    this.suffixWidget,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.onSuffixIconPress,
    this.maxLines,
    this.maxLength,
    this.autoFocus = false,
    this.focusNode,
    this.onTap,
    this.titlePrefixWidget,
    this.contentPadding,
    this.keyboardType,
    this.inputFormatters,
    this.textAlign,
    this.formKey,
    // this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTapOutside,
    this.isObscureText = false,
    this.isRequired = false,
    this.isValid,
    this.isBordered = false,
    this.isEnabled = true,
    this.readOnly = false,
    required this.showErrorMessage /*= false*/,
    this.enableInteractiveSelection,
    this.onSaved,
    this.disabledBorder,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    // this.border,
    this.autoValidateMode,
    this.titlePadding,
    this.textStyle,
    this.titleTextStyle,
    this.errorMessage,
    this.errorMessageTextStyle,
    this.hintTextStyle,
  });

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
    children: <Widget>[
      if (titleText != null && titleText!.isNotEmpty)
        Padding(
          padding:
              titlePadding ??
              EdgeInsets.symmetric(horizontal: 10.convertPxToDp()),
          child: CommonRichText(
            text: isRequired ? '* ' : null,
            textColor: Theme.of(context).snackBarTheme.closeIconColor,
            fontSize: 16.convertPxToDp(),
            textStyle: textStyle,
            secondText: titleText,
            secondTextAlign: TextAlign.start,
            secondTextStyle: AppRepoTextStyle().textStyleTitleSmall(
              context,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      if (titleText != null && titleText!.isNotEmpty)
        SizedBox(height: 12.convertPxToDp()),
      InkWell(
        onTap: onTap,
        child: TextFormField(
          enabled: isEnabled,
          readOnly: readOnly,
          key: formKey,
          autofocus: autoFocus,
          focusNode: focusNode,
          obscureText: isObscureText,
          controller: controller,
          maxLines: maxLines ?? 1,
          maxLength: maxLength,
          textAlign: textAlign ?? TextAlign.start,
          style: AppRepoTextStyle().textStyleTitleMedium(
            context,
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          onTap: onTap ?? () {},
          // validator: validator,
          onChanged: onChanged,
          onSaved: onSaved,
          onFieldSubmitted: onFieldSubmitted,
          onTapOutside:
              onTapOutside ??
              // (PointerDownEvent event) => g.Get.focusScope!.unfocus(),
              (PointerDownEvent event) => FocusScope.of(context).unfocus(),
          textAlignVertical: TextAlignVertical.center,
          autovalidateMode:
              autoValidateMode ?? AutovalidateMode.onUserInteraction,
          cursorColor: cursorColor,
          cursorHeight: cursorHeight,
          enableInteractiveSelection: enableInteractiveSelection,
          decoration: InputDecoration(
            labelStyle: AppRepoTextStyle().textStyleTitleMedium(
              context,
              color: Theme.of(context).hintColor,
            ),
            filled: true,
            fillColor: fillColor,
            counterText: '',
            contentPadding:
                contentPadding ?? EdgeInsets.all(16.0.convertPxToDp()),
            enabledBorder: enabledBorder,
            disabledBorder: disabledBorder,
            focusedBorder: focusedBorder,
            focusedErrorBorder: focusedErrorBorder,
            hintText: hintText ?? '',
            hintStyle: hintTextStyle,
            // errorText: errorText,
            // errorMaxLines: 2,
            error:
                showErrorMessage
                    ? Row(
                      children: [
                        CommonSVGImageProvider(
                          imagePath: AppRepoAssets().errorImage,
                          width: 20.convertPxToDp(),
                          height: 20.convertPxToDp(),
                        ),
                        SizedBox(width: 8.convertPxToDp()),
                        Expanded(
                          child: CommonText(
                            text: errorMessage ?? '',
                            textAlign: TextAlign.start,
                            textStyle: AppRepoTextStyle().textStyleBodySmall(
                              context,
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                        ),
                      ],
                    )
                    : null,
            // errorStyle: TextStyle(
            //   color: Theme.of(context).snackBarTheme.closeIconColor,
            //   fontSize: 14.convertPxToDp(),
            // ),
            errorBorder: errorBorder,
            suffixIconConstraints: suffixIconConstraints,
            suffixIcon:
                suffixWidget ??
                (suffixIcon != null
                    ? IconButton(
                      onPressed: onSuffixIconPress,
                      icon: suffixIcon!,
                    )
                    : null),
            prefixIconConstraints: prefixIconConstraints,
            prefixIcon:
                prefixWidget ??
                (prefixIcon != null
                    ? IconButton(
                      onPressed: onPrefixIconPress,
                      icon: prefixIcon!,
                    )
                    : null),
          ),
        ),
      ),
      // if (showErrorMessage) SizedBox(height: 8.convertPxToDp()),
      // if (showErrorMessage)
      //   Row(
      //     children: [
      //       CommonSVGImageProvider(
      //         imagePath: AppRepoAssets().errorImage,
      //         width: 20.convertPxToDp(),
      //         height: 20.convertPxToDp(),
      //       ),
      //       SizedBox(height: 16.convertPxToDp()),
      //       CommonText(
      //         text: errorMessage ?? '',
      //         textStyle: AppRepoTextStyle().textStyleBodySmall(
      //           context,
      //           color: Theme.of(context).colorScheme.error,
      //         ),
      //         maxLines: ' $errorMessage'.length,
      //       ),
      //     ],
      //   ),
      // if (showErrorMessage) SizedBox(height: 15.convertPxToDp()),
    ],
  );
}
