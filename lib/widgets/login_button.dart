import 'package:flutter/material.dart';
import 'package:salon_appointment/screens/calendar_screen.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFFFFFFF),
        ),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(Size(311, 44)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
              side: const BorderSide(
                width: 0.0,
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Color(0x00FFFFFF)),
          alignment: Alignment.center,
        ),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CalendarScreen(),
            ),
          );
        },
        child: const Text(
          'Login',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Poppins',
            color: Color(0xFFFFFFFF),
            backgroundColor: Color(0xFFFFFF),
          ),
        ),
      ),
    );
  }
}
