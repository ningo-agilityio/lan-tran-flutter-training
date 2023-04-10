import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salon_appointment/widgets/common/icons.dart';
import 'package:salon_appointment/widgets/common/text.dart';

import '../models/appointment.dart';
import '../theme/theme.dart';

class CalendarSchedule extends StatelessWidget {
  CalendarSchedule({required this.appointment, super.key});

  final Appointment appointment;

  DateFormat dateFormat = DateFormat('dd MMMM, EEEE');

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 26, left: 15),
          child: CustomIcons.calendarSchedule,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 22),
                CustomText.calendarSchedule(
                  text: dateFormat.format(appointment.date),
                  style: themeData.textTheme.labelLarge!,
                ),
                const SizedBox(height: 7),
                CustomText.calendarSchedule(
                  text:
                      '${appointment.startTime.format(context)}-${appointment.endTime.format(context)}',
                  style: themeData.textTheme.bodyLarge!.copyWith(
                    height: 24 / 14,
                  ),
                ),
                const SizedBox(height: 12),
                CustomText.calendarSchedule(
                  text: appointment.description,
                  style: themeData.textTheme.bodySmall!,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
