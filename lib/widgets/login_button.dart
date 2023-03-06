import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';
import 'package:salon_appointment/widgets/common/buttons.dart';
import 'text.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.onPress});

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SAButton.outlined(
      onPress: onPress,
      child: LoginText(),
    );
  }
}
