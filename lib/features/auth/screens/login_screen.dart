import 'dart:async';

import 'package:flutter/material.dart';
import 'package:salon_appointment/core/widgets/indicator.dart';
import 'package:salon_appointment/core/widgets/snack_bar.dart';

import '../../../core/layouts/common_layout.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/input.dart';
import '../../../core/widgets/text.dart';
import '../../../generated/l10n.dart';
import '../../appointments/screens/calendar_screen.dart';
import '../model/user.dart';
import '../repository/user_repository.dart';
import '../validations/errors.dart';
import '../validations/validations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = UserRepository();

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
    controller.getUser().then((value) => users = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double indicatorHeight = MediaQuery.of(context).size.height / 2;

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
                      child: CustomText.logoText,
                    ),
            ),
            Input.phoneNumber(
              text: S.of(context).phoneNumber,
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
              text: S.of(context).password,
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
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: CustomText.forgetPasswordText,
              ),
            ),
            const SizedBox(height: 24),
            SAButton.outlined(
                child: CustomText.loginText,
                onPressed: () {
                  if (FormValidation.isValidPassword(password) != null ||
                      FormValidation.isValidPhoneNumber(phoneNumber) != null) {
                    CustomSnackBar.show(
                      context: context,
                      message: Errors.INVALID_ACCOUNT,
                    );
                    return;
                  }
                  final isSuccess = FormValidation.isLoginSuccess(
                      users, phoneNumber, password);
                  if (isSuccess) {
                    showDialog(
                      context: context,
                      barrierColor: Colors.black12,
                      builder: (context) => LoadingIndicator(
                        height: indicatorHeight,
                      ),
                    );
                    Timer(const Duration(seconds: 3), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CalendarScreen()),
                      );
                    });
                  } else {
                    CustomSnackBar.show(
                      context: context,
                      message: Errors.INCORRECT_ACCOUNT,
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
