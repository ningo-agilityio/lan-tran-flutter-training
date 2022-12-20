import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'avisit',
      style: TextStyle(
        fontSize: 70,
        fontFamily: 'Poppins',
        color: Colors.white,
      ),
    );
  }
}
