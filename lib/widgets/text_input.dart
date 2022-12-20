import 'package:flutter/material.dart';

String text = '';
final _textController = TextEditingController();

Widget TextInput({text}) {
  return Container(
    color: Color.fromRGBO(255, 255, 255, 0.24),
    child: TextFormField(
      controller: _textController,
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
