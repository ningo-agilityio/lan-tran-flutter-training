import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';
import 'package:intl/intl.dart';

class TimePicker extends StatelessWidget {
  TimePicker({
    super.key,
    required this.startTime,
    required this.endTime,
  });

  TimeOfDay startTime;
  TimeOfDay endTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'From:',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
        ),
        OutlinedButton(
          onPressed: () => showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
            builder: (context, child) {
              return Theme(
                data: SATheme.lightTheme.copyWith(
                  colorScheme: ColorScheme.light(
                      onPrimary: SATheme.lightTheme.colorScheme.secondary),
                ),
                child: child!,
              );
            },
          ),
          child: Text(
            startTime.format(context),
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'To:',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
          ),
        ),
        OutlinedButton(
          onPressed: () => showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
            builder: (context, child) {
              return Theme(
                data: SATheme.lightTheme.copyWith(
                  colorScheme: ColorScheme.light(
                      onPrimary: SATheme.lightTheme.colorScheme.secondary),
                ),
                child: child!,
              );
            },
          ),
          child: Text(
            endTime.format(context),
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
          ),
        ),
      ],
    );
  }
}
