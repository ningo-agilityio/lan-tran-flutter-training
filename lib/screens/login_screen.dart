import 'package:flutter/material.dart';
import 'package:salon_appointment/screens/scaffold.dart';
import 'package:salon_appointment/theme/theme.dart';
import 'package:salon_appointment/widgets/background_image.dart';
import 'package:salon_appointment/widgets/common/text.dart';
import 'package:salon_appointment/widgets/input.dart';
import 'package:salon_appointment/widgets/forget_password.dart';
import 'package:salon_appointment/widgets/login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? phoneNumberErrorText = '';
  String? passwordErrorText = '';
  String phoneNumber = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(),
          Container(
            margin: EdgeInsets.all(32.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 60.0,
                      bottom: 147.0,
                    ),
                    child: SACustomText.logoText,
                  ),
                  SizedBox(
                    height: 72.0,
                    child: Input(
                      text: 'Phone number',
                      keyboardType: TextInputType.phone,
                      color: SATheme.lightTheme.colorScheme.secondary,
                      errorText: phoneNumberErrorText == ''
                          ? null
                          : phoneNumberErrorText,
                      validator: (value) {
                        return isValidPhoneNumber(value!);
                      },
                      onChanged: (value) {
                        setState(() {
                          phoneNumberErrorText = isValidPhoneNumber(value);
                          phoneNumber = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 72.0,
                    child: Input(
                      text: 'Password',
                      color: SATheme.lightTheme.colorScheme.secondary,
                      errorText:
                          passwordErrorText == '' ? null : passwordErrorText,
                      validator: (value) {
                        return isValidPassword(value!);
                      },
                      onChanged: (value) {
                        setState(() {
                          passwordErrorText = isValidPassword(value);
                          password = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  ForgetPassword(
                    onPress: () {},
                  ),
                  SizedBox(height: 24),
                  LoginButton(onPress: () {
                    disableLoginButton()
                        ? showSnackBar(Text('Information is invalid.'))
                        : isLoginSuccess();
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? isValidPhoneNumber(String? phoneNumber) {
    if (phoneNumber == '') {
      return 'Phone number is blank.';
    } else if (phoneNumber!.length != 10) {
      return 'Phone number is invalid.';
    }
    return null;
  }

  String? isValidPassword(String? password) {
    if (password == '') {
      return 'Password is blank.';
    } else if (password!.length < 6) {
      return 'Password must be at least 6 characters.';
    }
    return null;
  }

  bool disableLoginButton() {
    return isValidPassword(password) != null ||
        isValidPhoneNumber(phoneNumber) != null;
  }

  void isLoginSuccess() {
    for (var user in users) {
      if (!user.containsValue(phoneNumber)) {
        showSnackBar(Text('Phone number is not exist.'));
      } else if (!user.containsValue(password)) {
        showSnackBar(Text('Password is incorrect.'));
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainScaffold(),
          ),
        );
      }
    }
  }

  void showSnackBar(Widget content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: content,
      ),
    );
  }

  List<Map<String, String>> users = [
    {'phoneNumber': '0905123456', 'password': '111111'},
  ];
}
