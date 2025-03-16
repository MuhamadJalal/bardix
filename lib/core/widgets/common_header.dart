import 'package:bardix/core/di/service_locator.dart';
import 'package:bardix/core/localization/localization_service.dart';
import 'package:bardix/core/theme/app_repo_text_style.dart';
import 'package:bardix/core/utils/size_utils.dart';
import 'package:bardix/core/widgets/common_text.dart';
import 'package:bardix/l10n/l10n.dart';
import 'package:flutter/material.dart';

class CommonHeader extends StatelessWidget {
  final bool hasBackBtn;
  final String title;
  final VoidCallback? onBackPressed;

  const CommonHeader({
    this.hasBackBtn = true,
    this.onBackPressed,
    this.title = '',
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      if (hasBackBtn) BackButton(onPressed: onBackPressed),
      if (title.isNotEmpty) SizedBox(height: 8.convertPxToDp()),
      if (title.isNotEmpty)
        CommonText(
          // text: S.of(context).title,
          text: title,
          textAlign: TextAlign.start,
          textStyle: AppRepoTextStyle().textStyleTitleMedium(
            context,
            fontWeight: FontWeight.w800,
          ),
        ),
      Spacer(),
      DropdownButton<Locale>(
        value: getIt<LocalizationService>().locale,
        onChanged: (locale) => getIt<LocalizationService>().changeLocale(locale!),
        items:
            S.supportedLocales
                .map(
                  (locale) => DropdownMenuItem(
                    value: locale,
                    child: Text(locale.languageCode),
                  ),
                )
                .toList(),
      ),
      SizedBox(width: 16.convertPxToDp()),
    ],
  );
}
