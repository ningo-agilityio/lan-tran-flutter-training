import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';
import 'package:salon_appointment/validations/validations.dart';

class Input extends StatelessWidget {
  Input({
    required this.text,
    required this.controller,
    required this.focusNode,
    required this.onEditCompleted,
    this.color,
    this.height,
    super.key,
  });

  factory Input.phoneNumber({
    required String text,
    required TextEditingController controller,
    required FocusNode focusNode,
    required VoidCallback onEditCompleted,
    double? height,
    String? errorText,
    Function(String)? onChanged,
  }) = _InputPhoneNumber;

  factory Input.password({
    required String text,
    required TextEditingController controller,
    required FocusNode focusNode,
    required VoidCallback onEditCompleted,
    double? height,
    String? errorText,
    Function(String)? onChanged,
  }) = _InputPassword;

  final String text;
  final Color? color;
  final FocusNode focusNode;
  final VoidCallback onEditCompleted;
  final TextEditingController controller;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        enableInteractiveSelection: true,
        focusNode: focusNode,
        style: themeData.textTheme.labelSmall!.copyWith(
          color: color,
        ),
        decoration: InputDecoration(
          hintText: text,
          hintStyle: themeData.textTheme.labelSmall!.copyWith(
            color: color,
          ),
        ),
        onEditingComplete: onEditCompleted,
      ),
    );
  }
}

class _InputPhoneNumber extends Input {
  _InputPhoneNumber({
    required super.text,
    required super.controller,
    required super.focusNode,
    required super.onEditCompleted,
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
        focusNode: focusNode,
        keyboardType: TextInputType.phone,
        style: themeData.textTheme.labelSmall!.copyWith(
          color: themeData.colorScheme.secondary,
        ),
        decoration: InputDecoration(
          hintText: text,
          errorText: errorText,
        ),
        onEditingComplete: onEditCompleted,
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
    required super.focusNode,
    required super.onEditCompleted,
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
        focusNode: focusNode,
        obscureText: true,
        style: themeData.textTheme.labelSmall!.copyWith(
          color: themeData.colorScheme.secondary,
        ),
        decoration: InputDecoration(
          hintText: text,
          errorText: errorText,
        ),
        onEditingComplete: onEditCompleted,
        validator: FormValidation.isValidPassword,
        onChanged: onChanged,
      ),
    );
  }
}
