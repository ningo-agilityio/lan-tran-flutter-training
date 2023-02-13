import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';

class Time extends StatelessWidget {
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  Time({super.key, required this.startTime, required this.endTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
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
                '${startTime.format(context)}-${endTime.format(context)}',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF0C122A),
                ),
              )
            ],
          ),
          // Text(
          //   'Beauty Salon',
          //   style: SATheme.lightTheme.textTheme.bodySmall!.copyWith(
          //     color: Color(0xFFA4A8B2),
          //   ),
          // ),
        ],
      ),
    );
  }
}
