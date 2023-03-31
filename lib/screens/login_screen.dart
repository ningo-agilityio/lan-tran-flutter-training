import 'package:flutter/material.dart';
import 'package:salon_appointment/apis/user_api.dart';
import 'package:salon_appointment/controllers/user_controller.dart';
import 'package:salon_appointment/models/user.dart';
import 'package:salon_appointment/screens/scaffold.dart';
import 'package:salon_appointment/theme/theme.dart';
import 'package:salon_appointment/validations/validations.dart';
import 'package:salon_appointment/widgets/common/text.dart';
import 'package:salon_appointment/widgets/forget_password.dart';
import 'package:salon_appointment/widgets/input.dart';
import 'package:salon_appointment/widgets/login_button.dart';

import '../layouts/common_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = UserController();

  String? phoneNumberErrorText;
  String? passwordErrorText;
  String phoneNumber = '';
  String password = '';

  List<User> users = [];

  @override
  void initState() {
    super.initState();
    UserApi.getUsers().then((value) => users = value);
  }

  @override
  Widget build(BuildContext context) {
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final double screenHeight = MediaQuery.of(context).size.height;

    return CommonLayout(
      child: Container(
        margin: const EdgeInsets.all(32),
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
                      child: SACustomText.logoText),
            ),
            SizedBox(
              height: 72,
              child: Input(
                text: 'Phone number',
                keyboardType: TextInputType.number,
                color: SATheme.lightTheme.colorScheme.secondary,
                errorText: phoneNumberErrorText,
                validator: (value) {
                  return FormValidation.isValidPhoneNumber(value!);
                },
                onChanged: (value) {
                  setState(() {
                    phoneNumberErrorText =
                        FormValidation.isValidPhoneNumber(value);
                    phoneNumber = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 72,
              child: Input(
                text: 'Password',
                color: SATheme.lightTheme.colorScheme.secondary,
                errorText: passwordErrorText,
                obscureText: true,
                validator: (value) {
                  return FormValidation.isValidPassword(value!);
                },
                onChanged: (value) {
                  setState(() {
                    passwordErrorText = FormValidation.isValidPassword(value);
                    password = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            ForgetPassword(
              onPress: () {},
            ),
            const SizedBox(height: 24),
            LoginButton(onPress: () {
              FormValidation.isLoginSuccess(users, phoneNumber, password) !=
                      null
                  ? showSnackBar(
                      Text(FormValidation.isLoginSuccess(
                          users, phoneNumber, password)!),
                    )
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScaffold()),
                    );
            }),
          ],
        ),
      ),
    );
  }

  void showSnackBar(Widget content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: content,
      ),
    );
  }
}
