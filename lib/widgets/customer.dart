import 'package:flutter/material.dart';

class Customer extends StatelessWidget {
  final String customerName;
  Customer({super.key, required this.customerName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Row(
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/user.png'),
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              '${customerName}',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF553BA3),
              ),
            )
          ],
        ),
      ),
    );
  }
}
