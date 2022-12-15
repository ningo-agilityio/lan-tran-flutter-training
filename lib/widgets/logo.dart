import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 200, left: 100),
      child: Text(
        'avisit',
        style: TextStyle(
          fontSize: 72,
          fontFamily: 'Poppins',
          color: Colors.white,
        ),
      ),
    );
  }
}
