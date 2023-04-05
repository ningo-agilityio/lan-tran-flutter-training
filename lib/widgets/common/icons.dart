import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';

class CustomIcons {
  static Icon appointmentSchedule = Icon(
    Icons.schedule_outlined,
    size: 20,
    color: themeData.colorScheme.tertiary,
  );

  static Icon breakTime = Icon(
    Icons.schedule_outlined,
    size: 20,
    color: themeData.colorScheme.onSecondaryContainer,
  );

  static Icon calendarSchedule = Icon(
    Icons.schedule_outlined,
    size: 20,
    color: themeData.colorScheme.secondary,
  );

  static Icon addButton = Icon(
    Icons.add,
    size: 30,
    color: themeData.colorScheme.secondary,
  );
}
