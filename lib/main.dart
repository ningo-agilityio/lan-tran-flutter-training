import 'package:flutter/material.dart';

import 'core/theme/theme.dart';
import 'features/appointments/add_screen.dart';
import 'features/appointments/appointments_screen.dart';
import 'features/appointments/calendar_screen.dart';
import 'features/auth/splash_screen.dart';

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
        '/add': (context) => const AddScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
