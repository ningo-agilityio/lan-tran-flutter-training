import 'package:flutter/material.dart';

import '../theme/theme.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 234,
          child: Text(
            'avisit',
            style: TextStyle(
              fontSize: 70,
              fontFamily: 'Poppins',
              color: themeData.colorScheme.secondary,
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
              color: themeData.colorScheme.secondary.withOpacity(0.24),
            ),
          ),
        ),
      ],
    );
  }
}
