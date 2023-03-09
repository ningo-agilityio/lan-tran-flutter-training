import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';
import 'package:intl/intl.dart';

class TimePicker extends StatelessWidget {
  TimePicker({
    super.key,
    required this.startTime,
  });

  TimeOfDay startTime;
  TimeOfDay endTime = (DateTime.now().minute + 30) >= 60
      ? TimeOfDay(
          hour: DateTime.now().hour + 1,
          minute: (DateTime.now().minute + 30) % 60,
        )
      : TimeOfDay(
          hour: DateTime.now().hour,
          minute: DateTime.now().minute + 30,
        );

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
            initialTime: startTime,
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
            initialTime: endTime,
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
