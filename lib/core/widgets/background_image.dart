import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/background.png'),
          colorFilter: ColorFilter.mode(
            colorScheme.primary.withOpacity(0.5),
            BlendMode.multiply,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
