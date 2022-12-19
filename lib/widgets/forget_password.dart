import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Forget password?',
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'Poppins',
            color: Color.fromRGBO(255, 255, 255, 0.642861),
          ),
        ),
      ),
    );
  }
}
