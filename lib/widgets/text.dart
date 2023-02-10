import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';

class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Login',
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            // fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            color: Color(0xFFFFFFFF),
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
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            height: 18,
            fontFamily: 'Poppins',
            color: Color(0xFFFFFFFF).withOpacity(0.64),
          ),
    );
  }
}
