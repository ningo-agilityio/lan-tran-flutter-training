import 'package:flutter/material.dart';
import 'package:salon_appointment/screens/appointments_screen.dart';
import 'package:salon_appointment/screens/calendar_screen.dart';
import 'package:salon_appointment/screens/splash_screen.dart';
import 'package:salon_appointment/theme/theme.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      routes: {
        '/calendar': (context) => const CalendarScreen(),
        '/appointment': (context) => const AppointmentScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
