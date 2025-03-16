import 'package:bardix/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppRepoTextStyle {
  AppRepoTextStyle._internal();

  static final AppRepoTextStyle _instance = AppRepoTextStyle._internal();

  factory AppRepoTextStyle() => _instance;

  /*

  /// The 2018 spec has thirteen text styles:
  ///
  /// | NAME           | SIZE |  WEIGHT |  SPACING |             |
  /// |----------------|------|---------|----------|-------------|
  /// | displayLarge   | 96.0 | light   | -1.5     |             |
  /// | displayMedium  | 60.0 | light   | -0.5     |             |
  /// | displaySmall   | 48.0 | regular |  0.0     |             |
  /// | headlineMedium | 34.0 | regular |  0.25    |             |
  /// | headlineSmall  | 24.0 | regular |  0.0     |             |
  /// | titleLarge     | 20.0 | medium  |  0.15    |             |
  /// | titleMedium    | 16.0 | regular |  0.15    |             |
  /// | titleSmall     | 14.0 | medium  |  0.1     |             |
  /// | bodyLarge      | 16.0 | regular |  0.5     |             |
  /// | bodyMedium     | 14.0 | regular |  0.25    |             |
  /// | bodySmall      | 12.0 | regular |  0.4     |             |
  /// | labelLarge     | 14.0 | medium  |  1.25    |             |
  /// | labelSmall     | 10.0 | regular |  1.5     |             |
  ///
  /// ...where "light" is `FontWeight.w300`, "regular" is `FontWeight.w400` and
  /// "medium" is `FontWeight.w500`.
  ///

                          CommonText(
                          text: Translations.of(context).callInfo,
                          textStyle: AppRepoTextStyle().textStyleBodyLarge(),
                          textStyle: AppRepoTextStyle().textStyleBodyMedium(),
                          textStyle: AppRepoTextStyle().textStyleBodySmall(),
                          textStyle: AppRepoTextStyle().textStyleTitleLarge(),
                          textStyle: AppRepoTextStyle().textStyleTitleMedium(),
                          textStyle: AppRepoTextStyle().textStyleTitleSmall(),
                        ),

  * */
  //
  // Blue colors
  /// | displayLarge   | 96.0 | light   | -1.5     |             |
  /// defines a TextStyle with default values of fontSize = 96 px, fontWeight 300 and color of 0xFF004C96
  TextStyle textStyleDisplayLargeBlue(
    BuildContext context, {
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.displayLarge!.copyWith(
    color: AppRepoLightColors().getFontPrimaryColor(),
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w300,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  /// | displayMedium  | 60.0 | light   | -0.5     |             |
  /// defines a TextStyle with default values of fontSize = 60 px, fontWeight 300 and color of 0xFF004C96
  TextStyle textStyleDisplayMediumBlue(
    BuildContext context, {
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.displayMedium!.copyWith(
    color: AppRepoLightColors().getFontPrimaryColor(),
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w300,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  /// | displaySmall   | 48.0 | regular |  0.0     |             |
  /// defines a TextStyle with default values of fontSize = 48 px, fontWeight 400 and color of 0xFF004C96
  TextStyle textStyleDisplaySmallBlue(
    BuildContext context, {
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.displaySmall!.copyWith(
    color: AppRepoLightColors().getFontPrimaryColor(),
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w400,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  /// | headlineLarge | 44.0 | regular |  0.25    |             |
  /// defines a TextStyle with default values of fontSize = 44 px, fontWeight 400 and color of 0xFF004C96
  TextStyle textStyleHeadlineLargeBlue(
    BuildContext context, {
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.headlineLarge!.copyWith(
    color: AppRepoLightColors().getFontPrimaryColor(),
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w400,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  /// | headlineMedium | 34.0 | regular |  0.25    |             |
  /// defines a TextStyle with default values of fontSize = 34 px, fontWeight 400 and color of 0xFF004C96
  TextStyle textStyleHeadlineMediumBlue(
    BuildContext context, {
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.headlineMedium!.copyWith(
    color: AppRepoLightColors().getFontPrimaryColor(),
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w400,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  /// | headlineSmall  | 24.0 | regular |  0.0     |             |
  /// defines a TextStyle with default values of fontSize = 24 px, fontWeight 400 and color of 0xFF004C96
  TextStyle textStyleHeadlineSmallBlue(
    BuildContext context, {
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.headlineSmall!.copyWith(
    color: AppRepoLightColors().getFontPrimaryColor(),
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w400,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  /// | titleLarge     | 20.0 | medium  |  0.15    |             |
  /// defines a TextStyle with default values of fontSize = 20 px, fontWeight 500 and color of 0xFF004C96
  TextStyle textStyleTitleLargeBlue(
    BuildContext context, {
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.titleLarge!.copyWith(
    color: AppRepoLightColors().getFontPrimaryColor(),
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w500,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  /// | titleMedium    | 16.0 | regular |  0.15    |             |
  /// defines a TextStyle with default values of fontSize = 16 px, fontWeight 400 and color of 0xFF004C96
  TextStyle textStyleTitleMediumBlue(
    BuildContext context, {
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.titleMedium!.copyWith(
    color: AppRepoLightColors().getFontPrimaryColor(),
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w400,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  /// | titleSmall     | 14.0 | medium  |  0.1     |             |
  /// defines a TextStyle with default values of fontSize = 14 px, fontWeight 500 and color of 0xFF004C96
  TextStyle textStyleTitleSmallBlue(
    BuildContext context, {
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.titleSmall!.copyWith(
    color: AppRepoLightColors().getFontPrimaryColor(),
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w500,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  /// | bodyLarge      | 16.0 | regular |  0.5     |             |
  /// defines a TextStyle with default values of fontSize = 16 px, fontWeight 400 and color of 0xFF004C96
  TextStyle textStyleBodyLargeBlue(
    BuildContext context, {
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.bodyLarge!.copyWith(
    color: AppRepoLightColors().getFontPrimaryColor(),
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w400,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  /// | bodyMedium     | 14.0 | regular |  0.25    |             |
  /// defines a TextStyle with default values of fontSize = 14 px, fontWeight 400 and color of 0xFF004C96
  TextStyle textStyleBodyMediumBlue(
    BuildContext context, {
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.bodyMedium!.copyWith(
    color: AppRepoLightColors().getFontPrimaryColor(),
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w400,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  /// | bodySmall      | 12.0 | regular |  0.4     |             |
  /// defines a TextStyle with default values of fontSize = 12 px, fontWeight 400 and color of 0xFF004C96
  TextStyle textStyleBodySmallBlue(
    BuildContext context, {
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.bodySmall!.copyWith(
    color: AppRepoLightColors().getFontPrimaryColor(),
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w400,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  /// | labelLarge     | 14.0 | medium  |  1.25    |             |
  /// defines a TextStyle with default values of fontSize = 14 px, fontWeight 500 and color of 0xFF004C96
  TextStyle textStyleLabelLargeBlue(
    BuildContext context, {
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.labelLarge!.copyWith(
    color: AppRepoLightColors().getFontPrimaryColor(),
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w500,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  /// | labelMedium     | 12.0 | medium  |  1.25    |             |
  /// defines a TextStyle with default values of fontSize = 12 px, fontWeight 500 and color of 0xFF004C96
  TextStyle textStyleLabelMediumBlue(
    BuildContext context, {
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.labelMedium!.copyWith(
    color: AppRepoLightColors().getFontPrimaryColor(),
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w500,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  /// | labelSmall     | 10.0 | regular |  1.5     |             |
  /// defines a TextStyle with default values of fontSize = 10 px, fontWeight 400 and color of 0xFF004C96
  TextStyle textStyleLabelSmallBlue(
    BuildContext context, {
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.labelSmall!.copyWith(
    color: AppRepoLightColors().getFontPrimaryColor(),
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w400,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  // default colors
  /// | displayLarge   | 96.0 | light   | -1.5     |             |
  /// defines a TextStyle with default values of fontSize = 96 px, fontWeight 300 and color of 0xFFDF6153
  TextStyle textStyleDisplayLarge(
    BuildContext context, {
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.displayLarge!.copyWith(
    color: color,
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w300,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  /// | displayMedium  | 60.0 | light   | -0.5     |             |
  /// defines a TextStyle with default values of fontSize = 60 px, fontWeight 300 and color of 0xFFDF6153
  TextStyle textStyleDisplayMedium(
    BuildContext context, {
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.displayMedium!.copyWith(
    color: color,
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w300,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  /// | displaySmall   | 48.0 | regular |  0.0     |             |
  /// defines a TextStyle with default values of fontSize = 48 px, fontWeight 400 and color of 0xFFDF6153
  TextStyle textStyleDisplaySmall(
    BuildContext context, {
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.displaySmall!.copyWith(
    color: color,
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w400,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  /// | headlineLarge | 44.0 | regular |  0.25    |             |
  /// defines a TextStyle with default values of fontSize = 44 px, fontWeight 400 and color of 0xFF7B8A95
  TextStyle textStyleHeadlineLarge(
    BuildContext context, {
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.headlineLarge!.copyWith(
    color: color,
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w400,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  /// | headlineMedium | 34.0 | regular |  0.25    |             |
  /// defines a TextStyle with default values of fontSize = 34 px, fontWeight 400 and color of 0xFF7B8A95
  TextStyle textStyleHeadlineMedium(
    BuildContext context, {
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.headlineMedium!.copyWith(
    color: color,
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w400,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  /// | headlineSmall  | 24.0 | regular |  0.0     |             |
  /// defines a TextStyle with default values of fontSize = 24 px, fontWeight 400 and color of 0xFF7B8A95
  TextStyle textStyleHeadlineSmall(
    BuildContext context, {
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.headlineSmall!.copyWith(
    color: color,
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w400,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  /// | titleLarge     | 20.0 | medium  |  0.15    |             |
  /// defines a TextStyle with default values of fontSize = 20 px, fontWeight 500 and color of 0xFF292D32
  TextStyle textStyleTitleLarge(
    BuildContext context, {
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.titleLarge!.copyWith(
    color: color,
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.bold,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  /// | titleMedium    | 16.0 | regular |  0.15    |             |
  /// defines a TextStyle with default values of fontSize = 16 px, fontWeight 400 and color of 0xFF292D32
  TextStyle textStyleTitleMedium(
    BuildContext context, {
    Color? color,
    double? fontSize,
    double? height,
    double? letterSpacing,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.titleMedium!.copyWith(
    color: color,
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w400,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
    letterSpacing: letterSpacing,
  );

  /// | titleSmall     | 14.0 | medium  |  0.1     |             |
  /// defines a TextStyle with default values of fontSize = 14 px, fontWeight 500 and color of 0xFF292D32
  TextStyle textStyleTitleSmall(
    BuildContext context, {
    Color? color,
    double? fontSize,
    double? height,
    double? letterSpacing,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.titleSmall!.copyWith(
    color: color,
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.bold,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
    letterSpacing: letterSpacing,
  );

  /// | bodyLarge      | 16.0 | regular |  0.5     |             |
  /// defines a TextStyle with default values of fontSize = 16 px, fontWeight 400 and color of 0xFF475057
  TextStyle textStyleBodyLarge(
    BuildContext context, {
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.bodyLarge!.copyWith(
    color: color,
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w400,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  /// | bodyMedium     | 14.0 | regular |  0.25    |             |
  /// defines a TextStyle with default values of fontSize = 14 px, fontWeight 400 and color of 0xFF475057
  TextStyle textStyleBodyMedium(
    BuildContext context, {
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
    double? letterSpacing,
  }) => Theme.of(context).textTheme.bodyMedium!.copyWith(
    color: color,
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w400,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
    letterSpacing: letterSpacing,
  );

  /// | bodySmall      | 12.0 | regular |  0.4     |             |
  /// defines a TextStyle with default values of fontSize = 12 px, fontWeight 400 and color of 0xFF475057
  TextStyle textStyleBodySmall(
    BuildContext context, {
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.bodySmall!.copyWith(
    color: color,
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w400,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  /// | labelLarge     | 14.0 | medium  |  1.25    |             |
  /// defines a TextStyle with default values of fontSize = 14 px, fontWeight 500 and color of 0xFF606F7A
  TextStyle textStyleLabelLarge(
    BuildContext context, {
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.labelLarge!.copyWith(
    color: color,
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w500,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  /// | labelMedium     | 12.0 | medium  |  1.25    |             |
  /// defines a TextStyle with default values of fontSize = 12 px, fontWeight 500 and color of 0xFF606F7A
  TextStyle textStyleLabelMedium(
    BuildContext context, {
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.labelMedium!.copyWith(
    color: color,
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w500,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );

  /// | labelSmall     | 10.0 | regular |  1.5     |             |
  /// defines a TextStyle with default values of fontSize = 10 px, fontWeight 400 and color of 0xFF606F7A
  TextStyle textStyleLabelSmall(
    BuildContext context, {
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) => Theme.of(context).textTheme.labelSmall!.copyWith(
    color: color,
    fontSize: fontSize,
    height: height,
    fontWeight: fontWeight ?? FontWeight.w400,
    decoration: textDecoration ?? TextDecoration.none,
    decorationColor: decorationColor ?? Colors.transparent,
  );
}
