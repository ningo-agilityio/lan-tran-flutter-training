import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlinedButton(
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(Size(311, 44)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
              side: BorderSide(width: 10.0, color: Color(0xFFFFFFFF)),
            ),
          ),
          alignment: Alignment.center,
        ),
        onPressed: () {},
        child: const Text(
          'Login',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Poppins',
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
