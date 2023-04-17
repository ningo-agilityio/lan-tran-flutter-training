import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

DateTime autoAddHalfHour(DateTime time) {
  return time.add(const Duration(minutes: 30));
}

DateTime setDateTime(DateTime date, TimeOfDay time) {
  return DateTime(
    date.year,
    date.month,
    date.day,
    time.hour,
    time.minute,
  );
}

String formatTime(DateTime time) {
  final DateFormat timeFormat = DateFormat('HH:mm');
  return timeFormat.format(time).toString();
}

bool isBreakTime(DateTime start, DateTime end) {
  final DateTime beforeTime =
      DateTime(start.year, start.month, start.day, 12, 0);
  final DateTime afterTime =
      DateTime(start.year, start.month, start.day, 15, 20);

  if ((start.isAfter(beforeTime) && start.isBefore(afterTime)) ||
      (end.isAfter(beforeTime) && end.isBefore(afterTime))) {
    return true;
  }
  return false;
}

bool isClosedTime(DateTime start, DateTime end) {
  final DateTime beforeTime =
      DateTime(start.year, start.month, start.day, 22, 0);
  final DateTime afterTime = DateTime(start.year, start.month, start.day, 8, 0);

  if (start.isAfter(beforeTime) ||
      start.isBefore(afterTime) ||
      end.isAfter(beforeTime) ||
      end.isBefore(afterTime)) {
    return true;
  }
  return false;
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year - 10, kToday.month, kToday.day);
final kLastDay = DateTime(kToday.year + 10, kToday.month, kToday.day);

Future<Map<String, dynamic>> getUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String userStr = prefs.getString('user') ?? '{}';
  return jsonDecode(userStr);
}
