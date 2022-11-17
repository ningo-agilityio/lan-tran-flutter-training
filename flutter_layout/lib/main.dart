import 'package:flutter/material.dart';
import 'immutable_widget.dart';
import './basic_screen.dart';

void main() => runApp(StaticApp());

class StaticApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: ImmutableWidget(),
      home: BasicScreen(),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: BasicScreen(),
  //   );
  // }
}
