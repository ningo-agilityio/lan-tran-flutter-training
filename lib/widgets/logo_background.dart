import 'package:flutter/material.dart';

class LogoBackground extends StatelessWidget {
  const LogoBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'av',
      style: TextStyle(
        fontSize: 220,
        fontFamily: 'Poppins',
        color: Colors.white.withOpacity(0.24),
      ),
    );
  }
}
