import 'package:flutter/material.dart';
import 'package:salon_appointment/widgets/background_image.dart';
import 'package:salon_appointment/widgets/input.dart';
import 'package:salon_appointment/widgets/forget_password.dart';
import 'package:salon_appointment/widgets/login_button.dart';
import 'package:salon_appointment/screens/calendar_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(),
          Container(
            margin: EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Input(
                  text: 'Phone number',
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16),
                Input(text: 'Password'),
                SizedBox(height: 16),
                ForgetPassword(
                  onPress: () {},
                ),
                SizedBox(height: 24),
                LoginButton(
                  onPress: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CalendarScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
