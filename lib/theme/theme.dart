import 'dart:ffi';

import 'package:flutter/material.dart';

class ColorName {
  static const primaryColor = const Color(0xFF553BA3);
  static const onPrimaryColor = const Color(0xFF7D32BA);
  static const textColor = const Color(0xFFFFFFFF);
  static const servicesColor = const Color(0xFF0C122A);
  static const descriptionColor = const Color(0xFFA4A8B2);
  static const breakTimeColor = const Color(0xFF474F63);
  static const timeIconColor = const Color(0xFFFDA901);
  static const iconButtonColor = const Color(0xFFBFC8DC);
  static const errorColor = const Color(0xFFF44336);
  static const surfaceColor = const Color(0xFF000000);
  static const backgroundColor = const Color(0xFFFFFFFF);
}

class SAColorScheme {
  static final ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: ColorName.primaryColor,
    onPrimary: ColorName.onPrimaryColor,
    secondary: ColorName.textColor,
    onSecondary: ColorName.servicesColor,
    secondaryContainer: ColorName.descriptionColor,
    onSecondaryContainer: ColorName.breakTimeColor,
    tertiary: ColorName.timeIconColor,
    onTertiary: ColorName.iconButtonColor,
    error: ColorName.errorColor,
    onError: ColorName.errorColor,
    background: ColorName.backgroundColor,
    onBackground: ColorName.backgroundColor,
    surface: ColorName.surfaceColor,
    onSurface: ColorName.surfaceColor,
  );
}

class SATextTheme {
  static TextStyle _defaultTextStyle({
    required double fontSize,
    required FontWeight? fontWeight,
    required double height,
  }) {
    return TextStyle(
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height / fontSize,
      color: SAColorScheme._lightColorScheme.onSecondary,
    );
  }

  static final TextTheme _lightTextTheme = TextTheme(
    titleLarge: _defaultTextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      height: 30,
    ),
    titleMedium: _defaultTextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      height: 25.5,
    ),
    titleSmall: _defaultTextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 20,
    ),
    labelLarge: _defaultTextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 24,
    ),
    labelMedium: _defaultTextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 20,
    ),
    labelSmall: _defaultTextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      height: 20,
    ),
    bodyLarge: _defaultTextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 18,
    ),
    bodyMedium: _defaultTextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 16,
    ),
    bodySmall: _defaultTextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 16,
    ),
  );
}

class SATheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: SAColorScheme._lightColorScheme,
    fontFamily: 'Poppins',
    appBarTheme: AppBarTheme(
      color: SAColorScheme._lightColorScheme.background,
      elevation: 0,
      centerTitle: false,
    ),
    scaffoldBackgroundColor: SAColorScheme._lightColorScheme.background,
    primaryColor: SAColorScheme._lightColorScheme.primary,
    iconTheme: IconThemeData(
      color: SAColorScheme._lightColorScheme.tertiary,
      size: 16,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll<Color>(
            SAColorScheme._lightColorScheme.onTertiary),
        iconSize: MaterialStatePropertyAll<double>(24.0),
      ),
    ),
    textTheme: SATextTheme._lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
  );
}
