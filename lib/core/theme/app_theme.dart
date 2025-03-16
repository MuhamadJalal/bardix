import 'package:bardix/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

/// use the AppRepoLightColors or AppRepoDarkColors only
abstract class AppRepoColors {
  Color getPrimaryColor();

  Color getSecondaryColor();

  Color getBackgroundColor();

  Color getIconBackgroundColor();

  Color getOffWhiteBackgroundColor();

  Color getFontPrimaryColor();

  Color getFontSecondaryColor();

  Color getDescriptionFontColor();

  Color getDisplayFontColor();

  Color getHeadlineFontColor();

  Color getBodyFontColor();

  Color getLabelFontColor();

  Color getFontErrorColor();

  Color getTextInputBorderColor();

  Color getHintFontColor();

  Color getHintBlueSideColor();

  Color getHintBlueBackgroundColor();

  Color getHintBackgroundColor();

  Color getAlertColor();

  Color getAlertBackgroundColor();

  Color getSurfaceTintColor();

  Color getInverseSurfaceColor();

  Color getTileColor();

  Color getGreyColor();

  Color getOrangeColor();

  Color getSelectedStarColor();

  Color getUnselectedStarColor();

  Color getStatusActiveFillColor();

  Color getStatusActiveBorderColor();

  Color getStatusActiveFontColor();

  Color getStatusCompletedFillColor();

  Color getStatusCompletedBorderColor();

  Color getStatusCompletedFontColor();

  Color getStatusCanceledFillColor();

  Color getStatusCanceledBorderColor();

  Color getStatusCanceledFontColor();

  Color getStatusWaitingFillColor();

  Color getStatusWaitingBorderColor();

  Color getStatusWaitingFontColor();

  Color getStartSplashGradientColor();

  Color getEndSplashGradientColor();

  Color getTransparentColor();

  Color getIconPrimaryColor();

  Color getIconSecondColor();

  Color getDarkGradiantColor();

  Color getLightGradiantColor();

  Color getCanvasColor();

  Color getCardBackgroundColor();

  Color getDialogBackgroundColor();

  Color getDisabledColor();

  Color getDividerColor();

  Color getFocusColor();

  Color getHighlightColor();

  Color getHoverColor();

  Color getIndicatorColor();

  Color getPrimaryColorDark();

  Color getPrimaryColorLight();

  Color getScaffoldBackgroundColor();

  Color getSecondaryHeaderColor();

  Color getShadowColor();

  Color getShadowBackgroundColor();

  Color getSplashColor();

  Color getUnselectedWidgetColor();

  Color getFontTitleColor();

  Color getAppBarBackgroundColor();

  Color getBottomNavigationBarColor();

  Color getSelectedItemColor();

  Color getUnselectedItemColor();

  Color getButtonColor();

  Color getCheckboxSelectedColor();

  Color getCheckboxUnselectedColor();

  Color getFloatingActionButtonBackgroundColor();

  Color getFloatingActionButtonForegroundColor();

  Color getSnackBarBackgroundColor();

  Color getSnackBarFontColor();

  Color getTextButtonForegroundColor();

  Color getElevatedButtonBackgroundColor();

  Color getElevatedButtonForegroundColor();

  Color getElevatedButtonDisabledColor();

  Color getOutlinedButtonForegroundColor();
}

class AppRepoLightColors extends AppRepoColors {
  AppRepoLightColors._internal();

  static final AppRepoLightColors _instance = AppRepoLightColors._internal();

  factory AppRepoLightColors() => _instance;

  /* TextColor
*   static const Color hint = Color(0xFFA7B2B9);
*   static const Color alert = Color(0xFFF23D3D);
*
*   static const Color display = Color(0xFFDF6153);
*   static const Color headline = Color(0xFF7B8A95);
*   static const Color title = Color(0xFF292D32);
*   static const Color body = Color(0xFF475057);
*   static const Color label = Color(0xFF606F7A);
*/

  @override
  Color getFontPrimaryColor() => const Color(0xFF004C96);

  @override
  Color getFontSecondaryColor() => const Color(0xff161616);

  @override
  Color getFontErrorColor() => const Color(0xffB42318);

  @override
  Color getDescriptionFontColor() => const Color(0xFF606F7A);

  @override
  Color getDisplayFontColor() => const Color(0xFFDF6153);

  @override
  Color getHeadlineFontColor() => const Color(0xFF7B8A95);

  @override
  Color getBodyFontColor() => const Color(0xFF475057);

  @override
  Color getLabelFontColor() => const Color(0xFF606F7A);

  @override
  Color getFontTitleColor() => const Color(0xFF292D32);

  @override
  Color getSnackBarFontColor() => const Color(0xFFA7B2B9);

  @override
  Color getHintFontColor() => const Color(0xFFA7B2B9);

  // end of font colors

  @override
  Color getGreyColor() => Color(0xFFFDEEEC);

  @override
  Color getDarkGradiantColor() => const Color(0xff14573A);

  @override
  Color getLightGradiantColor() => const Color(0xFF004C96);

  @override
  Color getAlertColor() => const Color(0xFFF23D3D);

  @override
  Color getAlertBackgroundColor() => const Color(0xffFECDCA);

  @override
  Color getSurfaceTintColor() => const Color(0xffFEF2F2);

  @override
  Color getInverseSurfaceColor() => const Color(0xffDEEDFF);

  @override
  Color getTileColor() => const Color(0xffEFF7FF);

  @override
  Color getBackgroundColor() => Colors.white;

  @override
  Color getHintBackgroundColor() => const Color(0xffF5FAFF);

  @override
  Color getHintBlueSideColor() => const Color(0xff1570EF);

  @override
  Color getHintBlueBackgroundColor() => const Color(0xffB2DDFF);

  @override
  Color getIconBackgroundColor() => const Color(0xffEFF8FF);

  @override
  Color getIconPrimaryColor() => const Color(0xffF3F4F6);

  @override
  Color getIconSecondColor() => const Color(0xff1849A9);

  @override
  Color getOffWhiteBackgroundColor() => const Color(0xffF9FAFB);

  @override
  Color getOrangeColor() => const Color(0xffDBA102);

  @override
  Color getSelectedStarColor() => const Color(0xffF89308);

  @override
  Color getUnselectedStarColor() => const Color(0xffCBD2D6);

  @override
  Color getStatusActiveFillColor() => const Color(0xffF3FAF3);

  @override
  Color getStatusActiveBorderColor() => const Color(0xff358437);

  @override
  Color getStatusActiveFontColor() => const Color(0xff4CAF4F);

  @override
  Color getStatusCompletedFillColor() => const Color(0xffDEEDFF);

  @override
  Color getStatusCompletedBorderColor() => const Color(0xff004C96);

  @override
  Color getStatusCompletedFontColor() => const Color(0xff004C96);

  @override
  Color getStatusCanceledFillColor() => const Color(0xffFFE1E1);

  @override
  Color getStatusCanceledBorderColor() => const Color(0xffF23D3D);

  @override
  Color getStatusCanceledFontColor() => const Color(0xffF23D3D);

  @override
  Color getStatusWaitingFillColor() => const Color(0xffFFFAEB);

  @override
  Color getStatusWaitingBorderColor() => const Color(0xffF89308);

  @override
  Color getStatusWaitingFontColor() => const Color(0xffF89308);

  @override
  Color getStartSplashGradientColor() => const Color(0xff005EBA);

  @override
  Color getEndSplashGradientColor() => const Color(0xff001830);

  @override
  Color getPrimaryColor() => const Color(0xFF004C96);

  @override
  Color getSecondaryColor() => const Color(0xFFDF6153);

  @override
  Color getTextInputBorderColor() => const Color(0xFFE4E8E9);

  @override
  Color getTransparentColor() => Colors.transparent;

  @override
  Color getCanvasColor() => Colors.white;

  @override
  Color getCardBackgroundColor() => Colors.white;

  @override
  Color getDialogBackgroundColor() => Colors.white;

  @override
  Color getDisabledColor() => const Color(0xFFE4E8E9);

  @override
  Color getDividerColor() => const Color(0xffD2D6DB);

  @override
  Color getFocusColor() => const Color(0xFF004C96);

  @override
  Color getHighlightColor() => Color(0xffF4F6F7);

  // Color getHighlightColor() => Colors.white;

  @override
  Color getHoverColor() => const Color(0xFFDF6153);

  @override
  Color getIndicatorColor() => const Color(0xff161616);

  @override
  Color getPrimaryColorDark() => Colors.black;

  @override
  Color getPrimaryColorLight() => Colors.white;

  @override
  Color getScaffoldBackgroundColor() => Colors.white;

  @override
  Color getSecondaryHeaderColor() => Colors.white;

  @override
  Color getShadowColor() => const Color(0xffE5E7EB);

  @override
  Color getShadowBackgroundColor() => const Color(0xffFCFCFD);

  // Color getShadowColor() => const Color(0xff101828).withValues(alpha:0.24);

  @override
  Color getSplashColor() => const Color(0xFF004C96);

  @override
  Color getUnselectedWidgetColor() => const Color(0xffF3FCF6);

  @override
  Color getAppBarBackgroundColor() => const Color(0xFF004C96);

  @override
  Color getBottomNavigationBarColor() => Colors.white;

  @override
  Color getSelectedItemColor() => const Color(0xFF004C96);

  @override
  Color getUnselectedItemColor() => const Color(0xFFA7B2B9);

  @override
  Color getButtonColor() => const Color(0xFFDF6153);

  @override
  Color getCheckboxSelectedColor() => const Color(0xFF004C96);

  @override
  Color getCheckboxUnselectedColor() => const Color(0xFFA7B2B9);

  @override
  Color getFloatingActionButtonBackgroundColor() => const Color(0xFFDF6153);

  @override
  Color getFloatingActionButtonForegroundColor() => const Color(0xFFA7B2B9);

  @override
  Color getSnackBarBackgroundColor() => const Color(0xffFFFFFF);

  @override
  Color getTextButtonForegroundColor() => const Color(0xFFDF6153);

  @override
  Color getElevatedButtonBackgroundColor() => const Color(0xFFDF6153);

  @override
  Color getElevatedButtonForegroundColor() => const Color(0xffFFFFFF);

  @override
  Color getElevatedButtonDisabledColor() => const Color(0xFFE4E8E9);

  @override
  Color getOutlinedButtonForegroundColor() => const Color(0xFFDF6153);
}

class AppTheming {
  AppTheming._internal();

  static final AppTheming _instance = AppTheming._internal();

  factory AppTheming() => _instance;

  ThemeData getLightTheme() => ThemeData(
    // GENERAL CONFIGURATION
    useMaterial3: false,
    visualDensity: VisualDensity.comfortable,

    // COLOR
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppRepoLightColors().getPrimaryColor(),
      brightness: Brightness.light,
      primary: AppRepoLightColors().getPrimaryColor(),
      secondary: AppRepoLightColors().getSecondaryColor(),
      error: AppRepoLightColors().getAlertColor(),
      surfaceTint: AppRepoLightColors().getSurfaceTintColor(),
      inverseSurface: AppRepoLightColors().getInverseSurfaceColor(),
      surface: AppRepoLightColors().getSelectedStarColor(),
      scrim: AppRepoLightColors().getUnselectedStarColor(),
      surfaceDim: AppRepoLightColors().getStartSplashGradientColor(),
      surfaceBright: AppRepoLightColors().getEndSplashGradientColor(),
      outline: AppRepoLightColors().getLabelFontColor(),

      // order status button active colors
      tertiary: AppRepoLightColors().getStatusActiveBorderColor(),
      tertiaryFixed: AppRepoLightColors().getStatusActiveFillColor(),
      tertiaryFixedDim: AppRepoLightColors().getStatusActiveFontColor(),

      // order status button completed colors
      tertiaryContainer: AppRepoLightColors().getStatusCompletedBorderColor(),
      onTertiaryFixed: AppRepoLightColors().getStatusCompletedFillColor(),
      onTertiaryFixedVariant:
          AppRepoLightColors().getStatusCompletedFontColor(),

      // order status button canceled colors
      onError: AppRepoLightColors().getStatusCanceledBorderColor(),
      errorContainer: AppRepoLightColors().getStatusCanceledFillColor(),
      onErrorContainer: AppRepoLightColors().getStatusCanceledFontColor(),

      // order status button waiting colors
      surfaceContainer: AppRepoLightColors().getStatusWaitingBorderColor(),
      surfaceContainerLow: AppRepoLightColors().getStatusWaitingFillColor(),
      surfaceContainerLowest: AppRepoLightColors().getStatusWaitingFontColor(),
    ),
    brightness: Brightness.light,
    canvasColor: AppRepoLightColors().getCanvasColor(),
    cardColor: AppRepoLightColors().getCardBackgroundColor(),
    dialogTheme: DialogTheme(
      backgroundColor: AppRepoLightColors().getDialogBackgroundColor(),
    ),
    disabledColor: AppRepoLightColors().getDisabledColor(),
    dividerColor: AppRepoLightColors().getDividerColor(),
    focusColor: AppRepoLightColors().getFocusColor(),
    highlightColor: AppRepoLightColors().getHighlightColor(),
    hintColor: AppRepoLightColors().getHintFontColor(),
    hoverColor: AppRepoLightColors().getHoverColor(),
    indicatorColor: AppRepoLightColors().getIndicatorColor(),
    primaryColor: AppRepoLightColors().getPrimaryColor(),
    primaryColorDark: AppRepoLightColors().getPrimaryColorDark(),
    primaryColorLight: AppRepoLightColors().getPrimaryColorLight(),
    scaffoldBackgroundColor: AppRepoLightColors().getScaffoldBackgroundColor(),
    secondaryHeaderColor: AppRepoLightColors().getSecondaryHeaderColor(),
    shadowColor: AppRepoLightColors().getShadowColor(),
    splashColor: AppRepoLightColors().getSplashColor(),
    unselectedWidgetColor: AppRepoLightColors().getUnselectedWidgetColor(),

    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: TextStyle(
        color: AppRepoLightColors().getFontPrimaryColor(),
        fontSize: 14.0.convertPxToDp(),
        fontWeight: FontWeight.w400,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppRepoLightColors().getScaffoldBackgroundColor(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppRepoLightColors().getDisabledColor(),
            width: 1.5.convertPxToDp(),
          ),
          borderRadius: BorderRadius.circular(8.convertPxToDp()),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppRepoLightColors().getDisabledColor(),
            width: 1.5.convertPxToDp(),
          ),
          borderRadius: BorderRadius.circular(8.convertPxToDp()),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppRepoLightColors().getDisabledColor(),
            width: 1.5.convertPxToDp(),
          ),
          borderRadius: BorderRadius.circular(8.convertPxToDp()),
        ),
      ),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          AppRepoLightColors().getScaffoldBackgroundColor(),
        ),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.all(5.convertPxToDp()),
        ),
        surfaceTintColor: WidgetStateProperty.all<Color>(
          AppRepoLightColors().getScaffoldBackgroundColor(),
        ),
        elevation: WidgetStateProperty.all(5),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.convertPxToDp()),
          ),
        ),
      ),
    ),
    sliderTheme: SliderThemeData(
      thumbShape: _CustomSliderThumb(), // Custom Thumb
      activeTrackColor: AppRepoLightColors().getPrimaryColor(),
      inactiveTrackColor: AppRepoLightColors().getUnselectedStarColor(),
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.convertPxToDp()),
      ),
      style: ListTileStyle.drawer,
      selectedColor: AppRepoLightColors().getTileColor(),
      iconColor: AppRepoLightColors().getPrimaryColor(),
      // textColor: AppRepoLightColors().,
      titleTextStyle: TextStyle(
        color: AppRepoLightColors().getFontTitleColor(),
        fontSize: 16.0.convertPxToDp(),
        fontWeight: FontWeight.w700,
      ),
      subtitleTextStyle: TextStyle(
        color: AppRepoLightColors().getDescriptionFontColor(),
        fontSize: 14.0.convertPxToDp(),
        fontWeight: FontWeight.w400,
      ),
      // leadingAndTrailingTextStyle: ,
      // contentPadding: ,
      tileColor: AppRepoLightColors().getTileColor(),
      selectedTileColor: AppRepoLightColors().getTileColor(),
      // horizontalTitleGap: AppRepoLightColors().,
      // minVerticalPadding: AppRepoLightColors().,
      // minLeadingWidth: AppRepoLightColors().,
      // enableFeedback: AppRepoLightColors().,
      // mouseCursor: AppRepoLightColors().,
      // visualDensity: AppRepoLightColors().,
      // minTileHeight: AppRepoLightColors().,
      // titleAlignment: AppRepoLightColors().,
      // controlAffinity: AppRepoLightColors().,
    ),
    tabBarTheme: TabBarThemeData(
      // indicator: ,
      indicatorColor: AppRepoLightColors().getPrimaryColor(),
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: AppRepoLightColors().getDividerColor(),
      dividerHeight: 2.convertPxToDp(),
      labelColor: AppRepoLightColors().getFontPrimaryColor(),
      labelPadding: EdgeInsets.all(5.convertPxToDp()),
      labelStyle: TextStyle(
        color: AppRepoLightColors().getFontPrimaryColor(),
        fontSize: 16.0.convertPxToDp(),
        fontWeight: FontWeight.w700,
      ),
      unselectedLabelColor: AppRepoLightColors().getHeadlineFontColor(),
      unselectedLabelStyle: TextStyle(
        color: AppRepoLightColors().getHeadlineFontColor(),
        fontSize: 16.0.convertPxToDp(),
        fontWeight: FontWeight.w400,
      ),
      tabAlignment: TabAlignment.fill,
      textScaler: TextScaler.linear(1.25.convertPxToDp()),
      indicatorAnimation: TabIndicatorAnimation.elastic,
    ),
    // TYPOGRAPHY & ICONOGRAPHY
    fontFamily: 'Almarai',
    iconTheme: IconThemeData(color: AppRepoLightColors().getIconSecondColor()),
    primaryIconTheme: IconThemeData(
      color: AppRepoLightColors().getIconPrimaryColor(),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: AppRepoLightColors().getDisplayFontColor(),
        fontSize: 96.0.convertPxToDp(),
        decorationColor: AppRepoLightColors().getOffWhiteBackgroundColor(),
      ),
      displayMedium: TextStyle(
        color: AppRepoLightColors().getDisplayFontColor(),
        fontSize: 60.0.convertPxToDp(),
        decorationColor: AppRepoLightColors().getOffWhiteBackgroundColor(),
      ),
      displaySmall: TextStyle(
        color: AppRepoLightColors().getDisplayFontColor(),
        fontSize: 48.0.convertPxToDp(),
        decorationColor: AppRepoLightColors().getOffWhiteBackgroundColor(),
      ),
      headlineLarge: TextStyle(
        color: AppRepoLightColors().getHeadlineFontColor(),
        fontSize: 44.0.convertPxToDp(),
        decorationColor: AppRepoLightColors().getOffWhiteBackgroundColor(),
      ),
      headlineMedium: TextStyle(
        color: AppRepoLightColors().getHeadlineFontColor(),
        fontSize: 34.0.convertPxToDp(),
        decorationColor: AppRepoLightColors().getOffWhiteBackgroundColor(),
      ),
      headlineSmall: TextStyle(
        color: AppRepoLightColors().getHeadlineFontColor(),
        fontSize: 24.0.convertPxToDp(),
        decorationColor: AppRepoLightColors().getOffWhiteBackgroundColor(),
      ),
      titleLarge: TextStyle(
        color: AppRepoLightColors().getFontTitleColor(),
        fontSize: 20.0.convertPxToDp(),
        decorationColor: AppRepoLightColors().getOffWhiteBackgroundColor(),
      ),
      titleMedium: TextStyle(
        color: AppRepoLightColors().getFontTitleColor(),
        fontSize: 16.0.convertPxToDp(),
        decorationColor: AppRepoLightColors().getOffWhiteBackgroundColor(),
      ),
      titleSmall: TextStyle(
        color: AppRepoLightColors().getFontTitleColor(),
        fontSize: 14.0.convertPxToDp(),
        decorationColor: AppRepoLightColors().getOffWhiteBackgroundColor(),
      ),
      bodyLarge: TextStyle(
        color: AppRepoLightColors().getBodyFontColor(),
        fontSize: 16.0.convertPxToDp(),
        decorationColor: AppRepoLightColors().getOffWhiteBackgroundColor(),
      ),
      bodyMedium: TextStyle(
        color: AppRepoLightColors().getBodyFontColor(),
        fontSize: 14.0.convertPxToDp(),
        decorationColor: AppRepoLightColors().getOffWhiteBackgroundColor(),
      ),
      bodySmall: TextStyle(
        color: AppRepoLightColors().getBodyFontColor(),
        fontSize: 12.0.convertPxToDp(),
        decorationColor: AppRepoLightColors().getOffWhiteBackgroundColor(),
      ),
      labelLarge: TextStyle(
        color: AppRepoLightColors().getLabelFontColor(),
        fontSize: 14.0.convertPxToDp(),
        decorationColor: AppRepoLightColors().getOffWhiteBackgroundColor(),
      ),
      labelMedium: TextStyle(
        color: AppRepoLightColors().getLabelFontColor(),
        fontSize: 12.0.convertPxToDp(),
        decorationColor: AppRepoLightColors().getOffWhiteBackgroundColor(),
      ),
      labelSmall: TextStyle(
        color: AppRepoLightColors().getLabelFontColor(),
        fontSize: 10.0.convertPxToDp(),
        decorationColor: AppRepoLightColors().getOffWhiteBackgroundColor(),
      ),
    ),
    primaryTextTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppRepoLightColors().getFontPrimaryColor(),
        decorationColor: AppRepoLightColors().getOffWhiteBackgroundColor(),
      ),
      bodyMedium: TextStyle(
        color: AppRepoLightColors().getFontSecondaryColor(),
        decorationColor: AppRepoLightColors().getOffWhiteBackgroundColor(),
      ),
      bodySmall: TextStyle(
        color: AppRepoLightColors().getFontErrorColor(),
        decorationColor: AppRepoLightColors().getOffWhiteBackgroundColor(),
      ),
    ),

    // COMPONENT THEMES
    badgeTheme: BadgeThemeData(
      backgroundColor: AppRepoLightColors().getGreyColor(),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppRepoLightColors().getBackgroundColor(),
      linearTrackColor: AppRepoLightColors().getPrimaryColor(),
      linearMinHeight: 3.convertPxToDp(),
      circularTrackColor: AppRepoLightColors().getPrimaryColor(),
      refreshBackgroundColor: AppRepoLightColors().getBackgroundColor(),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      hoverColor: AppRepoLightColors().getTextInputBorderColor(),
      focusColor: AppRepoLightColors().getTextInputBorderColor(),
      fillColor: AppRepoLightColors().getBackgroundColor(),
      // fillColor: AppRepoLightColors().getOffWhiteBackgroundColor(),
      labelStyle: TextStyle(
        color: AppRepoLightColors().getHintFontColor(),
        fontSize: 16.0.convertPxToDp(),
        decorationColor: AppRepoLightColors().getOffWhiteBackgroundColor(),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.convertPxToDp()),
      suffixStyle: TextStyle(
        color: AppRepoLightColors().getHintFontColor(),
        fontSize: 16.convertPxToDp(),
        fontWeight: FontWeight.w400,
        decorationColor: AppRepoLightColors().getOffWhiteBackgroundColor(),
      ),
      hintStyle: TextStyle(
        color: AppRepoLightColors().getHintFontColor(),
        fontSize: 16.convertPxToDp(),
        fontWeight: FontWeight.w400,
        decorationColor: AppRepoLightColors().getOffWhiteBackgroundColor(),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppRepoLightColors().getTextInputBorderColor(),
          width: 1.5.convertPxToDp(),
        ),
        borderRadius: BorderRadius.circular(12.convertPxToDp()),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppRepoLightColors().getTextInputBorderColor(),
          width: 1.5.convertPxToDp(),
        ),
        borderRadius: BorderRadius.circular(12.convertPxToDp()),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppRepoLightColors().getTextInputBorderColor(),
          width: 1.5.convertPxToDp(),
        ),
        borderRadius: BorderRadius.circular(12.convertPxToDp()),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppRepoLightColors().getFocusColor(),
          width: 1.5.convertPxToDp(),
        ),
        borderRadius: BorderRadius.circular(12.convertPxToDp()),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppRepoLightColors().getAlertColor(),
          width: 1.5.convertPxToDp(),
        ),
        borderRadius: BorderRadius.circular(12.convertPxToDp()),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppRepoLightColors().getAppBarBackgroundColor(),
      titleTextStyle: TextStyle(
        color: AppRepoLightColors().getFontPrimaryColor(),
        fontSize: 20,
        fontWeight: FontWeight.bold,
        decorationColor: AppRepoLightColors().getOffWhiteBackgroundColor(),
      ),
      iconTheme: IconThemeData(
        color: AppRepoLightColors().getScaffoldBackgroundColor(),
      ),
      actionsIconTheme: IconThemeData(
        color: AppRepoLightColors().getIconBackgroundColor(),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppRepoLightColors().getBottomNavigationBarColor(),
      selectedItemColor: AppRepoLightColors().getSelectedItemColor(),
      unselectedItemColor: AppRepoLightColors().getUnselectedItemColor(),
      showUnselectedLabels: true,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppRepoLightColors().getButtonColor(),
      disabledColor: AppRepoLightColors().getDisabledColor(),
    ),
    cardTheme: CardTheme(
      color: AppRepoLightColors().getCardBackgroundColor(),
      // shadowColor: AppColors.shadowColor,
      elevation: 0,
      margin: EdgeInsets.all(5.convertPxToDp()),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: AppRepoLightColors().getDisabledColor(),
          width: 1.5.convertPxToDp(),
        ),
        borderRadius: BorderRadius.circular(15.convertPxToDp()),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      side: BorderSide(
        color: AppRepoLightColors().getCheckboxUnselectedColor(),
      ),
      fillColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppRepoLightColors().getCheckboxSelectedColor();
        }
        return AppRepoLightColors().getScaffoldBackgroundColor();
      }),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor:
          AppRepoLightColors().getFloatingActionButtonBackgroundColor(),
      foregroundColor:
          AppRepoLightColors().getFloatingActionButtonForegroundColor(),
      hoverColor: AppRepoLightColors().getOrangeColor(),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppRepoLightColors().getSnackBarBackgroundColor(),
      closeIconColor: AppRepoLightColors().getAlertColor(),
      actionBackgroundColor: AppRepoLightColors().getAlertBackgroundColor(),
      contentTextStyle: TextStyle(
        color: AppRepoLightColors().getSnackBarFontColor(),
        decorationColor: AppRepoLightColors().getOffWhiteBackgroundColor(),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppRepoLightColors().getTextButtonForegroundColor(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.convertPxToDp()),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            AppRepoLightColors().getElevatedButtonBackgroundColor(),
        foregroundColor:
            AppRepoLightColors().getElevatedButtonForegroundColor(),
        disabledBackgroundColor:
            AppRepoLightColors().getElevatedButtonDisabledColor(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.convertPxToDp()),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor:
            AppRepoLightColors().getElevatedButtonBackgroundColor(),
        foregroundColor:
            AppRepoLightColors().getElevatedButtonForegroundColor(),
        disabledBackgroundColor:
            AppRepoLightColors().getElevatedButtonDisabledColor(),
        side: BorderSide(color: AppRepoLightColors().getPrimaryColor()),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.convertPxToDp()),
        ),
      ),
    ),
  );
}

/// 🔹 Custom Thumb Shape for SliderThemeData
class _CustomSliderThumb extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(30, 30); // ✅ Thumb size increased to 30px
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final paint =
        Paint()
          ..color = sliderTheme.thumbColor ?? Colors.white
          ..style = PaintingStyle.fill;

    // ✅ Thumb Shape
    canvas.drawCircle(center, 15, paint);

    // ✅ Thumb Border
    final borderPaint =
        Paint()
          ..color = AppRepoLightColors().getPrimaryColor()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;

    canvas.drawCircle(center, 15, borderPaint);
  }
}
