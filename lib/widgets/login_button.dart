import 'package:flutter/material.dart';
import 'package:salon_appointment/screens/calendar.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(Size(311, 44)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
              side: const BorderSide(
                width: 10.0,
                color: Colors.white,
              ),
            ),
          ),
          alignment: Alignment.center,
        ),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Calendar(),
            ),
          );
        },
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
