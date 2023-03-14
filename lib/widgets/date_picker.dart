import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  DatePicker({
    super.key,
    required this.dateTime,
  });

  DateTime dateTime;
  DateFormat dateFormat = DateFormat('MM/dd/yyyy');

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
            dateFormat.format(dateTime),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  fontWeight: FontWeight.w400,
                ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () => showDatePicker(
                context: context,
                initialDate: dateTime,
                firstDate: dateTime,
                lastDate: DateTime(dateTime.year + 5),
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
