import 'dart:async';

import 'package:flutter/material.dart';
import 'package:salon_appointment/layouts/common_layout.dart';
import 'package:salon_appointment/screens/login_screen.dart';
import 'package:salon_appointment/widgets/logo.dart';

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
