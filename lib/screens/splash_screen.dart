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
  Widget build(BuildContext context) {
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

  void _buildLoginScreen() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
