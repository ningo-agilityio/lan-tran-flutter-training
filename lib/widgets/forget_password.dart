import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';
import 'package:salon_appointment/widgets/text.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    super.key,
    required this.onPress,
  });

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onPress,
        child: ForgetPasswordText(),
      ),
    );
  }
}
