import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:salon_appointment/features/appointments/screens/edit_appointment_screen.dart';

import 'core/generated/l10n.dart';
import 'core/theme/theme.dart';
import 'features/appointments/screens/appointments_screen.dart';
import 'features/appointments/screens/calendar_screen.dart';
import 'features/appointments/screens/new_appointment_screen.dart';
import 'features/auth/screens/login_screen.dart';
import 'features/auth/screens/profile_screen.dart';
import 'splash_screen.dart';

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
      title: 'Salon Appointment',
      theme: themeData,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/calendar': (context) => const CalendarScreen(),
        '/appointment': (context) => const AppointmentScreen(),
        '/newAppointment': (context) => const NewAppointmentScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/edit': (context) => const EditAppointment(),
      },
    );
  }
}
