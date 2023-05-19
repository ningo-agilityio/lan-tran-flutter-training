import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/generated/l10n.dart';
import '../../../core/layouts/common_layout.dart';
import '../../../core/validations/validations.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/indicator.dart';
import '../../../core/widgets/input.dart';
import '../../../core/widgets/snack_bar.dart';
import '../../../core/widgets/text.dart';
import '../bloc/auth_bloc.dart';
import '../model/user.dart';
import '../repository/user_repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userRepo = UserRepository();

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
    try {
      userRepo.load().then((value) => users = value);
    } catch (e) {
      SASnackBar.show(
        context: context,
        message: e.toString(),
        isSuccess: false,
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double indicatorHeight = MediaQuery.of(context).size.height / 2;

    return BlocProvider(
      create: (context) => AuthBloc(),
      child: CommonLayout(
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
                        child: SAText(
                          text: S.of(context).logo,
                          style: TextStyle(
                            fontSize: 40,
                            color: colorScheme.onPrimary,
                          ),
                        ),
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
                  child: SAText(
                    text: S.of(context).forgotPassword,
                    style: textTheme.bodySmall!.copyWith(
                      color: colorScheme.onPrimary.withOpacity(0.6429),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                child: BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is LoginLoading) {
                      loadingIndicator.show(
                        context: context,
                        height: indicatorHeight,
                      );
                    }
                    if (state is LoginSuccess) {
                      loadingIndicator.hide(context);
                      Navigator.pushReplacementNamed(context, '/calendar');
                    }
                    if (state is LoginError) {
                      loadingIndicator.hide(context);
                      switch (state.error) {
                        case 'invalid-account':
                          SASnackBar.show(
                            context: context,
                            message: S.of(context).invalidAccountError,
                            isSuccess: false,
                          );
                          break;
                        case 'incorrect-account':
                          SASnackBar.show(
                            context: context,
                            message: S.of(context).incorrectAccountError,
                            isSuccess: false,
                          );
                          break;
                        default:
                          SASnackBar.show(
                            context: context,
                            message: state.error,
                            isSuccess: false,
                          );
                          break;
                      }
                    }
                  },
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return SAButton.outlined(
                        child: SAText(
                          text: S.of(context).loginButton,
                          style: textTheme.labelMedium!.copyWith(
                            color: colorScheme.onPrimary,
                          ),
                        ),
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context).add(
                            LoginEvent(
                              phoneNumber: phoneNumberController.text,
                              password: passwordController.text,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
