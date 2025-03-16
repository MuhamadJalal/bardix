import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? fontHeight;
  final Color? textColor;
  final Color? decorationColor;
  final double? decorationThickness;
  final TextDecoration? textDecoration;
  final GestureTapCallback? onTap;

  const CommonText({
    super.key,
    this.text,
    this.textStyle,
    this.textAlign,
    this.overflow,
    this.fontSize,
    this.fontHeight,
    this.maxLines,
    this.fontWeight,
    this.textColor,
    this.decorationColor,
    this.decorationThickness,
    this.textDecoration,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Text(
      text ?? '',
      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxLines ?? '$text '.length,
      overflow: overflow ?? TextOverflow.ellipsis,
      softWrap: true,
      style:
          textStyle ??
          TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            height: fontHeight,
            decoration: textDecoration,
            decorationThickness: decorationThickness,
            decorationColor: decorationColor,
            color: textColor ?? Theme.of(context).primaryColorLight,
          ),
    ),
  );
}

class CommonRichText extends StatelessWidget {
  final String? text;
  final TextAlign? textAlign;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? fontHeight;
  final Color? textColor;
  final TextDecoration? textDecoration;
  final TextStyle? textStyle;
  final String? secondText;
  final TextAlign? secondTextAlign;
  final int? secondMaxLines;
  final double? secondFontSize;
  final FontWeight? secondFontWeight;
  final double? secondFontHeight;
  final Color? secondTextColor;
  final Color? secondDecorationColor;
  final double? secondDecorationThickness;
  final TextDecoration? secondTextDecoration;
  final TextStyle? secondTextStyle;
  final void Function()? onTap;

  const CommonRichText({
    super.key,
    this.onTap,
    this.text,
    this.textAlign,
    this.fontSize,
    this.fontHeight,
    this.maxLines,
    this.fontWeight,
    this.textColor,
    this.textDecoration,
    this.textStyle,
    this.secondText,
    this.secondTextAlign,
    this.secondMaxLines,
    this.secondFontSize,
    this.secondFontWeight,
    this.secondFontHeight,
    this.secondTextColor,
    this.secondTextDecoration,
    this.secondDecorationColor,
    this.secondDecorationThickness,
    this.secondTextStyle,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: RichText(
      text: TextSpan(
        text: text ?? '',
        style:
            textStyle ??
            TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              height: fontHeight,
              decoration: textDecoration,
              color:
                  textColor ??
                  Theme.of(context).inputDecorationTheme.fillColor!,
            ),
        children: <TextSpan>[
          TextSpan(
            text: secondText,
            style:
                secondTextStyle ??
                TextStyle(
                  fontSize: secondFontSize,
                  fontWeight: secondFontWeight,
                  height: secondFontHeight,
                  decoration: secondTextDecoration,
                  decorationThickness: secondDecorationThickness,
                  decorationColor: secondDecorationColor,
                  color:
                      secondTextColor ??
                      Theme.of(context).inputDecorationTheme.fillColor!,
                ),
          ),
        ],
      ),
      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    ),
  );
}
