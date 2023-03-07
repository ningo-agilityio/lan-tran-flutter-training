import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  DatePicker({
    super.key,
    required this.dateTime,
  });

  DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.schedule,
            size: 24.0,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
          Text(
            DateFormat('MM/dd/yyyy').format(dateTime),
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () => showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(DateTime.now().year + 5),
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
              icon: Icon(
                Icons.calendar_month,
                size: 24.0,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
