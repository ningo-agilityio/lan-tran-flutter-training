import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';

class TimePicker extends StatefulWidget {
  TimePicker({
    required this.startTime,
    super.key,
  });

  TimeOfDay startTime;

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  late TimeOfDay endTime;

  @override
  void initState() {
    super.initState();
    setState(() {
      endTime = (widget.startTime.minute + 30) >= 60
          ? TimeOfDay(
              hour: widget.startTime.hour + 1,
              minute: (widget.startTime.minute + 30) % 60,
            )
          : TimeOfDay(
              hour: widget.startTime.hour,
              minute: widget.startTime.minute + 30,
            );
    });
  }

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
            initialTime: widget.startTime,
            builder: (context, child) {
              return Theme(
                data: themeData.copyWith(
                  colorScheme: ColorScheme.light(
                      onPrimary: themeData.colorScheme.secondary),
                ),
                child: child!,
              );
            },
          ),
          child: Text(
            widget.startTime.format(context),
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
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
                data: themeData.copyWith(
                  colorScheme: ColorScheme.light(
                      onPrimary: themeData.colorScheme.secondary),
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
