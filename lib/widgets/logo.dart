import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 192.0,
          child: Text(
            'avisit',
            style: TextStyle(
              fontSize: 70,
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: 80.0,
          child: Text(
            'av',
            style: TextStyle(
              fontSize: 220,
              fontFamily: 'Poppins',
              color: Colors.white.withOpacity(0.24),
            ),
          ),
        ),
      ],
    );
  }
}
