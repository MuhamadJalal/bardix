import 'package:bardix/core/utils/size_utils.dart';
import 'package:bardix/core/widgets/common_image_widget.dart';
import 'package:bardix/core/widgets/common_text_controllers.dart';
import 'package:bardix/l10n/l10n.dart';
import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String? icon;
  final ValueNotifier<String?> validationNotifier;
  final Function(String) onChanged;
  final Widget? prefixWidget;
  final TextInputType? keyboardType;

  const BuildTextField({
    super.key,
    required this.title,
    required this.controller,
    this.icon,
    required this.validationNotifier,
    required this.onChanged,
    this.prefixWidget,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<String?>(
    valueListenable: validationNotifier,
    builder: (context, errorMsg, child) {
      return CommonTitledTextFormField(
        controller: controller,
        titleText: title,
        hintText: "${S.of(context).enter} $title",
        errorMessage: errorMsg,
        showErrorMessage: errorMsg != null,
        keyboardType: keyboardType,
        prefixIcon:
            icon == null
                ? null
                : CommonSVGImageProvider(
                  imagePath: icon!,
                  width: 20.convertPxToDp(),
                  height: 20.convertPxToDp(),
                  colorFilter:
                      errorMsg != null
                          ? ColorFilter.mode(
                            Theme.of(context).colorScheme.error,
                            BlendMode.srcIn,
                          )
                          : null,
                ),
        prefixWidget: prefixWidget,
        onChanged: onChanged,
      );
    },
  );
}
