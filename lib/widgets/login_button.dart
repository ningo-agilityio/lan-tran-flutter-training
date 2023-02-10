import 'package:flutter/material.dart';
import 'package:salon_appointment/screens/calendar_screen.dart';
import 'package:salon_appointment/theme/theme.dart';
import 'text.dart';

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
        child: LoginText(),
        // Text(
        //   'Login',
        //   style: appointmentLightTheme.textTheme.bodyMedium!.copyWith(
        //     // fontSize: 16,
        //     fontFamily: 'Poppins',
        //     fontWeight: FontWeight.w500,
        //     color: Color(0xFFFFFFFF),
        //   ),
        // ),
      ),
    );
  }
}
