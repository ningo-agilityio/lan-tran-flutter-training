import 'package:flutter/material.dart';
import 'package:profile_layout/flex_screen.dart';
import 'package:profile_layout/profile_screen.dart';
import 'deep_tree.dart';
import 'e_commerce_screen_before.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.green,
        appBarTheme: const AppBarTheme(
          elevation: 10,
          textTheme: TextTheme(
            headline6: TextStyle(
              fontFamily: 'LeckerliOne',
              fontSize: 24,
            ),
          ),
        ),
      ),
      home: ECommerceScreen(),
    );
  }
}
