import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';

class CustomIcons {
  static Icon appointmentScheduleIcon = Icon(
    Icons.schedule_outlined,
    size: 24,
    color: themeData.colorScheme.tertiary,
  );

  static Icon breakTimeIcon = Icon(
    Icons.schedule_outlined,
    size: 24,
    color: themeData.colorScheme.onSecondaryContainer,
  );

  static Icon calendarScheduleIcon = Icon(
    Icons.schedule_outlined,
    size: 24,
    color: themeData.colorScheme.secondary,
  );

  static Icon addButtonIcon = Icon(
    Icons.add,
    size: 30,
    color: themeData.colorScheme.secondary,
  );
}