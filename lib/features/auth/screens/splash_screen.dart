import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/layouts/common_layout.dart';
import '../../../core/theme/theme.dart';
import '../../../generated/l10n.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ),
      ),
    );
    return const CommonLayout(
      child: Logo(),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 180,
          child: Text(
            S.of(context).logo,
            style: TextStyle(
              fontSize: 70,
              fontFamily: 'Poppins',
              color: themeData.colorScheme.onPrimary,
            ),
          ),
        ),
        Positioned(
          top: 28,
          child: Text(
            S.of(context).logoText,
            style: TextStyle(
              fontSize: 220,
              fontFamily: 'Poppins',
              color: themeData.colorScheme.onPrimary.withOpacity(0.24),
            ),
          ),
        ),
      ],
    );
  }
}
