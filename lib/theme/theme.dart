import 'dart:ffi';

import 'package:flutter/material.dart';

class ColorName {
  static const primaryColor = const Color(0xFF553BA3);
  static const secondaryColor = const Color(0xFF7D32BA);
  static const scheduleIconColor = const Color(0xFFFDA901);
  static const textColor = const Color(0xFF0C122A);
  static const breakTextColor = const Color(0xFF474F63);
  static const scheduleTextColor = const Color(0xFFA4A8B2);
  static const iconButtonColor = const Color(0xFFBFC8DC);
  static const errorColor = const Color(0xFFF44336);
  static const backgroundColor = const Color(0xFFFFFFFF);
  static const surfacecolor = const Color(0xFF553BA3);
}

ColorScheme _lightColorScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: ColorName.primaryColor,
  onPrimary: ColorName.primaryColor,
  secondary: ColorName.secondaryColor,
  onSecondary: ColorName.secondaryColor,
  error: ColorName.errorColor,
  onError: ColorName.errorColor,
  background: ColorName.backgroundColor,
  onBackground: ColorName.backgroundColor,
  surface: ColorName.surfacecolor,
  onSurface: ColorName.surfacecolor,
);

class SATheme {
  static TextStyle _defaultTextStyle({
    required double fontSize,
    required FontWeight? fontWeight,
    required double height,
  }) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      color: ColorName.primaryColor,
    );
  }

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: _lightColorScheme,
    appBarTheme: AppBarTheme(
      color: _lightColorScheme.background,
      elevation: 0,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: _lightColorScheme.background,
    primaryColor: _lightColorScheme.primary,
    iconTheme: IconThemeData(
      color: ColorName.scheduleIconColor,
      size: 16,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll<Color>(ColorName.iconButtonColor),
        iconSize: MaterialStatePropertyAll<double>(24.0),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: _defaultTextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        height: 30,
      ),
      titleSmall: _defaultTextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 24,
      ),
      labelLarge: _defaultTextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 20,
      ),
      bodySmall: _defaultTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 16,
      ),
      bodyLarge: _defaultTextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 20,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
  );
}
