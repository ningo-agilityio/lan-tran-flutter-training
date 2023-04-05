import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';

class CustomText extends StatelessWidget {
  const CustomText({required this.text, required this.style, super.key});

  const factory CustomText.appBarTitle({
    required String text,
    required TextStyle style,
  }) = _AppBarTitle;

  const factory CustomText.calendarSchedule({
    required String text,
    required TextStyle style,
  }) = _CalendarSchedule;

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}

class _AppBarTitle extends CustomText {
  const _AppBarTitle({
    required super.text,
    required super.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
        color: themeData.colorScheme.onSecondary,
      ),
    );
  }
}

class _CalendarSchedule extends CustomText {
  const _CalendarSchedule({
    required super.text,
    required super.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: style.copyWith(
        color: themeData.colorScheme.secondary,
      ),
    );
  }
}

class SACustomText {
  static Text loginText = Text(
    'Login',
    style: themeData.textTheme.labelMedium!.copyWith(
      color: themeData.colorScheme.secondary,
    ),
  );

  static Text forgetPasswordText = Text(
    'Forget password?',
    style: themeData.textTheme.bodySmall!.copyWith(
      color: themeData.colorScheme.secondary.withOpacity(0.6429),
    ),
  );

  static Text logoText = Text(
    'avisit',
    style: TextStyle(
      fontSize: 40,
      color: themeData.colorScheme.secondary,
    ),
  );
}
