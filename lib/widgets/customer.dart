import 'package:flutter/material.dart';

class Customer extends StatelessWidget {
  const Customer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Row(
          children: [
            Image.asset(
              'assets/bg.jpeg',
              width: 20,
              height: 20,
              fit: BoxFit.fill,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Hailee Steinfeld',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF553BA3),
              ),
            )
          ],
        ),
      ),
    );
  }
}
