import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';

class SACustomText {
  static Text loginText = Text(
    'Login',
    style: SATheme.lightTheme.textTheme.titleSmall!.copyWith(
      color: SATheme.lightTheme.colorScheme.secondary,
    ),
  );

  static Text forgetPasswordText = Text(
    'Forget password?',
    style: SATheme.lightTheme.textTheme.bodyLarge!.copyWith(
      color: SATheme.lightTheme.colorScheme.secondary.withOpacity(0.6429),
    ),
  );

  static Text logoText = Text(
    'avisit',
    style: SATheme.lightTheme.textTheme.titleLarge!.copyWith(
      fontSize: 40.0,
      color: SATheme.lightTheme.colorScheme.secondary,
    ),
  );
}
