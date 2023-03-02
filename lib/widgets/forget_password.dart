import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';
import 'package:salon_appointment/widgets/text.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Forget password?',
            style: SATheme.lightTheme.textTheme.bodySmall!.copyWith(
              color: Color(0xFFFFFFFF).withOpacity(0.64),
            ),
          ),
        ),
      ],
    );
  }
}
