import 'package:flutter/material.dart';

class ColorName {
  static const primaryColor = Color(0xFF553BA3);
  static const onPrimaryColor = Color(0xFF7D32BA);
  static const textColor = Color(0xFFFFFFFF);
  static const servicesColor = Color(0xFF0C122A);
  static const descriptionColor = Color(0xFFA4A8B2);
  static const breakTimeColor = Color(0xFF474F63);
  static const timeIconColor = Color(0xFFFDA901);
  static const iconButtonColor = Color(0xFFBFC8DC);
  static const errorColor = Color(0xFFF44336);
  static const surfaceColor = Color(0xFF000000);
  static const backgroundColor = Color(0xFFFFFFFF);
}

const ColorScheme colorScheme = ColorScheme(
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

class SATextTheme {
  static TextStyle _defaultTextStyle({
    required double fontSize,
    required FontWeight? fontWeight,
  }) =>
      TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: colorScheme.onSecondary,
      );

  static final TextTheme _lightTextTheme = TextTheme(
    titleLarge: _defaultTextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: _defaultTextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: _defaultTextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: _defaultTextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: _defaultTextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: _defaultTextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: _defaultTextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  );
}

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: colorScheme,
  fontFamily: 'Poppins',
  appBarTheme: AppBarTheme(
    color: colorScheme.background,
    elevation: 0,
    centerTitle: false,
  ),
  scaffoldBackgroundColor: colorScheme.background,
  primaryColor: colorScheme.primary,
  iconTheme: IconThemeData(
    color: colorScheme.tertiary,
    size: 16,
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStatePropertyAll<Color>(colorScheme.onTertiary),
      iconSize: const MaterialStatePropertyAll<double>(24),
    ),
  ),
  textTheme: SATextTheme._lightTextTheme,
);
