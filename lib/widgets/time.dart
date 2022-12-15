import 'package:flutter/material.dart';

class Time extends StatelessWidget {
  const Time({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.schedule_sharp,
            color: Color.fromARGB(255, 255, 170, 0),
            size: 20,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            '12:00-15:20 (3:20)',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF0C122A),
            ),
          )
        ],
      ),
    );
  }
}
