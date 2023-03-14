import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';

class Input extends StatelessWidget {
  String text;
  final TextInputType? keyboardType;
  final _textController = TextEditingController();
  final Color? color;
  Input({
    super.key,
    required this.text,
    this.keyboardType,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 311,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.235),
      ),
      child: TextFormField(
        controller: _textController,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: color,
              ),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 5.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
