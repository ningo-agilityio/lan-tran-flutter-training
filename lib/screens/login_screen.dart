import 'package:flutter/material.dart';
import 'package:salon_appointment/widgets/background_image.dart';
import 'package:salon_appointment/widgets/text_input.dart';
import 'package:salon_appointment/widgets/forget_password.dart';
import 'package:salon_appointment/widgets/login_button.dart';

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
                TextInput(
                  text: 'Phone number',
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16),
                TextInput(
                  text: 'Password',
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 16),
                ForgetPassword(),
                SizedBox(height: 24),
                LoginButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
