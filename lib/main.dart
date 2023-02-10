import 'package:flutter/material.dart';
import 'package:salon_appointment/screens/splash_screen.dart';
import 'package:salon_appointment/screens/appointments_screen.dart';
import 'screens/calendar_screen.dart';
import 'theme/theme.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    // DevicePreview(
    //   enabled: true,
    //   builder: (context) => const MyApp(),
    // ),
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: SATheme.lightTheme,
      // ThemeData(
      //   brightness: Brightness.light,
      //   primaryColor: Color(0xFF553BA3),
      //   fontFamily: 'Poppins',
      //   textTheme: TextTheme(
      //     bodyLarge: TextStyle(
      //       fontSize: 15,
      //       fontWeight: FontWeight.w400,
      //       fontFamily: 'Poppins',
      //       color: Color(0xFFFFFFFF),
      //     ),
      //     bodyMedium: TextStyle(
      //       fontSize: 14,
      //       fontWeight: FontWeight.w400,
      //       fontFamily: 'Poppins',
      //       color: Color(0xFF0C122A),
      //     ),
      //     bodySmall: TextStyle(
      //       fontSize: 12,
      //       fontWeight: FontWeight.w400,
      //       fontFamily: 'Poppins',
      //       color: Color(0xFFA4A8B3),
      //     ),
      //   ),
      //   colorScheme:
      //       ColorScheme.fromSwatch().copyWith(secondary: Colors.purple[600]),
      // ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
