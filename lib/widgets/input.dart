import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';
import 'package:salon_appointment/validations/validations.dart';

class Input extends StatelessWidget {
  Input({
    required this.text,
    required this.controller,
    this.color,
    this.height,
    super.key,
  });

  factory Input.phoneNumber({
    required String text,
    required TextEditingController controller,
    double? height,
    String? errorText,
    Function(String)? onChanged,
  }) = _InputPhoneNumber;

  factory Input.password({
    required String text,
    required TextEditingController controller,
    double? height,
    String? errorText,
    Function(String)? onChanged,
  }) = _InputPassword;

  final String text;
  final Color? color;
  final TextEditingController controller;
  final double? height;
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        enableInteractiveSelection: true,
        focusNode: _focusNode, // pass from screen
        style: lightTheme.textTheme.labelSmall!.copyWith(
          color: color,
        ),
        decoration: InputDecoration(
            hintText: text,
            hintStyle: lightTheme.textTheme.labelSmall!.copyWith(
              color: color,
            )),
        onEditingComplete: () {
          FocusScope.of(context).nextFocus();
        },
      ),
    );
  }
}

class _InputPhoneNumber extends Input {
  _InputPhoneNumber({
    required super.text,
    required super.controller,
    super.height,
    this.errorText,
    this.onChanged,
  });

  String? errorText;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        enableInteractiveSelection: true,
        focusNode: _focusNode,
        keyboardType: TextInputType.phone,
        style: lightTheme.textTheme.labelSmall!.copyWith(
          color: lightTheme.colorScheme.secondary,
        ),
        decoration: InputDecoration(
          hintText: text,
          errorText: errorText,
        ),
        onEditingComplete: () {
          FocusScope.of(context).nextFocus();
        },
        validator: FormValidation.isValidPhoneNumber,
        onChanged: onChanged,
      ),
    );
  }
}

@immutable
class _InputPassword extends Input {
  _InputPassword({
    required super.text,
    required super.controller,
    super.height,
    this.errorText,
    this.onChanged,
  });

  String? errorText;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        enableInteractiveSelection: true,
        focusNode: _focusNode,
        obscureText: true,
        style: lightTheme.textTheme.labelSmall!.copyWith(
          color: lightTheme.colorScheme.secondary,
        ),
        decoration: InputDecoration(
          hintText: text,
          errorText: errorText,
        ),
        onEditingComplete: () {
          FocusScope.of(context).unfocus();
        },
        validator: FormValidation.isValidPassword,
        onChanged: onChanged,
      ),
    );
  }
}
