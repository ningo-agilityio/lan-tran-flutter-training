import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';

class Input extends StatefulWidget {
  Input({
    super.key,
    required this.text,
    this.keyboardType,
    this.color,
    this.onChanged,
    this.validator,
    this.errorText,
  });

  String text;
  final TextInputType? keyboardType;
  final Color? color;
  final Function(String)? onChanged;
  String? Function(String?)? validator;
  final String? errorText;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final _textController = TextEditingController();

  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: _textController,
        enableInteractiveSelection: true,
        focusNode: _focusNode,
        keyboardType: widget.keyboardType,
        style: TextStyle(color: SATheme.lightTheme.colorScheme.secondary),
        decoration: InputDecoration(
          hintText: widget.text,
          hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: widget.color,
              ),
          contentPadding: EdgeInsets.all(8.0),
          errorText: widget.errorText,
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 5.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          fillColor: Theme.of(context).colorScheme.secondary.withOpacity(0.235),
        ),
        onEditingComplete: () {
          FocusScope.of(context).nextFocus();
        },
        validator: widget.validator,
        onChanged: widget.onChanged,
      ),
    );
  }
}
