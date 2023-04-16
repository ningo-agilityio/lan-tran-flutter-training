import 'package:flutter/material.dart';
import 'package:salon_appointment/core/widgets/text.dart';

class TimePicker extends StatelessWidget {
  const TimePicker({
    required this.startTime,
    required this.endTime,
    required this.onStartTimePressed,
    required this.onEndTimePressed,
    super.key,
  });

  final DateTime startTime;
  final DateTime endTime;
  final VoidCallback onStartTimePressed;
  final VoidCallback onEndTimePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SAText.timePicker(text: 'From:'),
        OutlinedButton(
          onPressed: onStartTimePressed,
          child: SAText.timePicker(
            text: (startTime.minute < 10)
                ? '${startTime.hour}:${startTime.minute.toString().padLeft(2, '0')}'
                : '${startTime.hour}:${startTime.minute}',
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8),
          child: SAText.timePicker(text: 'To:'),
        ),
        OutlinedButton(
          onPressed: onEndTimePressed,
          child: SAText.timePicker(
            text: (endTime.minute < 10)
                ? '${endTime.hour}:${endTime.minute.toString().padLeft(2, '0')}'
                : '${endTime.hour}:${endTime.minute}',
          ),
        ),
      ],
    );
  }
}
