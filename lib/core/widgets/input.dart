import 'package:flutter/material.dart';
import 'package:salon_appointment/features/auth/validations/validations.dart';

class Input extends StatelessWidget {
  const Input({
    required this.text,
    required this.controller,
    required this.focusNode,
    required this.onEditCompleted,
    this.color,
    this.height,
    this.maxLines,
    this.border,
    super.key,
  });

  const factory Input.phoneNumber({
    required String text,
    required TextEditingController controller,
    required FocusNode focusNode,
    required VoidCallback onEditCompleted,
    double? height,
    String? errorText,
    Function(String)? onChanged,
  }) = _PhoneNumberInput;

  const factory Input.password({
    required String text,
    required TextEditingController controller,
    required FocusNode focusNode,
    required VoidCallback onEditCompleted,
    double? height,
    String? errorText,
    Function(String)? onChanged,
  }) = _PasswordInput;

  final String text;
  final Color? color;
  final FocusNode focusNode;
  final VoidCallback onEditCompleted;
  final TextEditingController controller;
  final double? height;
  final int? maxLines;
  final OutlineInputBorder? border;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        enableInteractiveSelection: true,
        focusNode: focusNode,
        style: textTheme.labelSmall!.copyWith(
          color: color,
        ),
        decoration: InputDecoration(
          hintText: text,
          hintStyle: textTheme.labelSmall!.copyWith(
            color: color,
          ),
          border: border,
        ),
        maxLines: maxLines,
        onEditingComplete: onEditCompleted,
      ),
    );
  }
}

class _PhoneNumberInput extends Input {
  const _PhoneNumberInput({
    required super.text,
    required super.controller,
    required super.focusNode,
    required super.onEditCompleted,
    super.height,
    this.errorText,
    this.onChanged,
  });

  final String? errorText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        enableInteractiveSelection: true,
        focusNode: focusNode,
        keyboardType: TextInputType.phone,
        style: theme.textTheme.labelSmall!.copyWith(
          color: theme.colorScheme.onPrimary,
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
class _PasswordInput extends Input {
  const _PasswordInput({
    required super.text,
    required super.controller,
    required super.focusNode,
    required super.onEditCompleted,
    super.height,
    this.errorText,
    this.onChanged,
  });

  final String? errorText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        enableInteractiveSelection: true,
        focusNode: focusNode,
        obscureText: true,
        style: theme.textTheme.labelSmall!.copyWith(
          color: theme.colorScheme.onPrimary,
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
