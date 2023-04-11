import 'package:flutter/material.dart';
import 'package:salon_appointment/core/theme/theme.dart';

class CustomIcons {
  static Icon appointmentSchedule = Icon(
    Icons.schedule_outlined,
    color: themeData.colorScheme.tertiary,
  );

  static Icon breakTime = Icon(
    Icons.schedule_outlined,
    color: themeData.colorScheme.secondaryContainer,
  );

  static Icon calendarSchedule = Icon(
    Icons.schedule_outlined,
    color: themeData.colorScheme.onPrimary,
  );

  static Icon add = Icon(
    Icons.add,
    size: 30,
    color: themeData.colorScheme.onPrimary,
  );

  static Icon close = Icon(
    Icons.close,
    color: themeData.colorScheme.onSecondary,
  );
}
