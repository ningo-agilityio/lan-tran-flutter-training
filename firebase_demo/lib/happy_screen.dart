import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class HappyScreen extends StatefulWidget {
  const HappyScreen({super.key});

  @override
  State<HappyScreen> createState() => _HappyScreenState();
}

class _HappyScreenState extends State<HappyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Happy Happy!'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('I\'m happy!'),
          onPressed: () {
            FirebaseAnalytics.instance
                .logEvent(name: 'Happy', parameters: null);
          },
        ),
      ),
    );
  }
}
