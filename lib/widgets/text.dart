import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';

class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Login',
      style: SATheme.lightTheme.textTheme.titleSmall!.copyWith(
        color: SATheme.lightTheme.colorScheme.secondary,
      ),
    );
  }
}

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Forget password?',
      style: SATheme.lightTheme.textTheme.bodyLarge!.copyWith(
        color: SATheme.lightTheme.colorScheme.secondary.withOpacity(0.6429),
      ),
    );
  }
}
