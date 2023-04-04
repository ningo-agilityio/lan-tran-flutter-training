import 'package:flutter/material.dart';
import 'package:salon_appointment/validations/validations.dart';

class Input extends StatefulWidget {
  const Input({
    required this.text,
    required this.controller,
    this.keyboardType,
    this.color,
    this.obscureText = false,
    super.key,
  });

  final String text;
  final TextInputType? keyboardType;
  final Color? color;
  final bool obscureText;
  final TextEditingController controller;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final _focusNode = FocusNode();

  String? errorText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: widget.controller,
        enableInteractiveSelection: true,
        focusNode: _focusNode,
        keyboardType: widget.keyboardType,
        style: TextStyle(color: widget.color),
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          hintText: widget.text,
          hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: widget.color,
              ),
          contentPadding: const EdgeInsets.all(8.0),
          errorText: errorText,
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 5.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          fillColor: Theme.of(context).colorScheme.secondary.withOpacity(0.235),
        ),
        onEditingComplete: () {
          FocusScope.of(context).nextFocus();
        },
        validator: (value) {
          if (widget.text == 'Phone number') {
            return FormValidation.isValidPhoneNumber(value);
          }
          if (widget.text == 'Password') {
            return FormValidation.isValidPassword(value);
          }
          return null;
        },
        onChanged: (value) {
          setState(() {
            if (widget.text == 'Phone number') {
              errorText = FormValidation.isValidPhoneNumber(value);
            }
            if (widget.text == 'Password') {
              errorText = FormValidation.isValidPassword(value);
            }
          });
        },
      ),
    );
  }
}
