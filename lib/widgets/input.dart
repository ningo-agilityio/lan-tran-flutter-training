import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  String text;
  final TextInputType? keyboardType;
  final _textController = TextEditingController();
  Input({super.key, required this.text, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Color(0x3CFFFFFF),
      ),
      child: TextFormField(
        controller: _textController,
        keyboardType: keyboardType,
        // onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        decoration: InputDecoration(
          hintText: '$text',
          hintStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 15,
            color: Color(0xFFFFFFFF),
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
