import 'package:flutter/material.dart';
import 'package:salon_appointment/apis/appointment_api.dart';
import 'package:salon_appointment/controllers/user_controller.dart';
import 'package:salon_appointment/models/appointment.dart';
import 'package:salon_appointment/models/user.dart';
import 'package:salon_appointment/screens/calendar_screen.dart';
import 'package:salon_appointment/validations/validations.dart';
import 'package:salon_appointment/widgets/common/buttons.dart';
import 'package:salon_appointment/widgets/common/text.dart';
import 'package:salon_appointment/widgets/forget_password.dart';
import 'package:salon_appointment/widgets/input.dart';
import 'package:salon_appointment/widgets/time.dart';

import '../layouts/common_layout.dart';
import '../validations/errors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = UserController();

  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  final phoneNumberFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  String? phoneNumberErrorText;
  String? passwordErrorText;

  String phoneNumber = '';
  String password = '';

  List<User> users = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final double screenHeight = MediaQuery.of(context).size.height;

    return CommonLayout(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 32),
        height: screenHeight - keyboardHeight,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 60,
              ),
              child: (keyboardHeight > 0)
                  ? const SizedBox(
                      height: 60,
                    )
                  : Container(
                      padding: const EdgeInsets.only(
                        bottom: 147,
                      ),
                      child: SACustomText.logoText,
                    ),
            ),
            Input.phoneNumber(
              text: 'Phone number',
              controller: phoneNumberController,
              height: 72,
              focusNode: phoneNumberFocusNode,
              onEditCompleted: () {
                FocusScope.of(context).nextFocus();
              },
              errorText: phoneNumberErrorText,
              onChanged: (value) {
                setState(() {
                  phoneNumberErrorText =
                      FormValidation.isValidPhoneNumber(value);
                  phoneNumber = phoneNumberController.text;
                });
              },
            ),
            const SizedBox(height: 16),
            Input.password(
              text: 'Password',
              controller: passwordController,
              height: 72,
              focusNode: passwordFocusNode,
              onEditCompleted: () {
                FocusScope.of(context).unfocus();
              },
              errorText: passwordErrorText,
              onChanged: (value) {
                setState(() {
                  passwordErrorText = FormValidation.isValidPassword(value);
                  password = passwordController.text;
                });
              },
            ),
            const SizedBox(height: 16),
            ForgetPassword(
              onPressed: () {},
            ),
            const SizedBox(height: 24),
            SAButton.outlined(
                child: SACustomText.loginText,
                onPressed: () async {
                  if (FormValidation.isValidPassword(password) != null ||
                      FormValidation.isValidPhoneNumber(phoneNumber) != null) {
                    showSnackBar(Errors.INVALID_ACCOUNT);
                    return;
                  }
                  final User? user =
                      await controller.getUser(phoneNumber, password);
                  if (user == null) {
                    showSnackBar(Errors.INCORRECT_ACCOUNT);
                    return;
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CalendarScreen()),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }

  void showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(text),
      ),
    );
  }
}
