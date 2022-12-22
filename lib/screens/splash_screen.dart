import 'dart:async';

import 'package:flutter/material.dart';
import 'package:salon_appointment/screens/login_screen.dart';
import 'package:salon_appointment/widgets/logo.dart';
import 'package:salon_appointment/widgets/logo_background.dart';

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
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
      ),
    );
    return Scaffold(
      body: Container(
        width: double.infinity,
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: 80),
                LogoBackground(),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 192),
                Logo(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
