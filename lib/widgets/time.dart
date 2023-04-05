import 'package:flutter/material.dart';
import 'package:salon_appointment/widgets/common/icons.dart';

class Time extends StatelessWidget {
  const Time({
    required this.startTime,
    required this.endTime,
    super.key,
  });

  final TimeOfDay startTime;
  final TimeOfDay endTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomIcons.appointmentSchedule,
            const SizedBox(
              width: 10,
            ),
            Text(
              '${startTime.format(context)}-${endTime.format(context)}',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF0C122A),
              ),
            )
          ],
        ),
      ],
    );
  }
}
