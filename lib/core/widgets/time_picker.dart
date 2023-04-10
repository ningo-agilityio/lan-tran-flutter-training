import 'package:flutter/material.dart';
import 'package:salon_appointment/core/widgets/common/text.dart';

class TimePicker extends StatelessWidget {
  TimePicker({
    required this.startTime,
    required this.endTime,
    required this.onStartTimePressed,
    required this.onEndTimePressed,
    super.key,
  });

  TimeOfDay startTime;
  TimeOfDay endTime;
  VoidCallback onStartTimePressed;
  VoidCallback onEndTimePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const CustomText.timePicker(text: 'From:'),
        OutlinedButton(
          onPressed: onStartTimePressed,
          child: CustomText.timePicker(text: startTime.format(context)),
        ),
        const Padding(
          padding: EdgeInsets.all(8),
          child: CustomText.timePicker(text: 'To:'),
        ),
        OutlinedButton(
          onPressed: onEndTimePressed,
          child: CustomText.timePicker(text: endTime.format(context)),
        ),
      ],
    );
  }
}
