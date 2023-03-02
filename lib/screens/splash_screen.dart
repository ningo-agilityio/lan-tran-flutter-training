import 'dart:async';

import 'package:flutter/material.dart';
import 'package:salon_appointment/screens/login_screen.dart';
import 'package:salon_appointment/widgets/logo.dart';
import 'package:salon_appointment/widgets/background_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
        ),
      ),
    );
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(),
          Logo(),
        ],
      ),
    );
  }
}
