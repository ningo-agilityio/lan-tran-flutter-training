import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/theme/theme.dart';
import 'features/appointments/screens/appointments_screen.dart';
import 'features/appointments/screens/calendar_screen.dart';
import 'features/appointments/screens/new_appointment_screen.dart';
import 'features/auth/screens/splash_screen.dart';
import 'generated/l10n.dart';

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
        '/add': (context) => const NewAppointmentScreen(),
      },
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const SplashScreen(),
    );
  }
}
