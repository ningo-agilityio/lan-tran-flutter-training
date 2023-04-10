import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';
import './common/text.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onPressed,
        child: SACustomText.forgetPasswordText,
      ),
    );
  }
}
