import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Positioned(
          top: 195,
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
          top: 80,
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
