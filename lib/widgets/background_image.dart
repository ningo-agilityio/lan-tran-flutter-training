import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpeg'),
          colorFilter: ColorFilter.mode(
            Color(0xFF553BA3).withOpacity(0.5),
            BlendMode.multiply,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
