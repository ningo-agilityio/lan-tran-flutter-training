import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

/// Returns a [DateTime] added 30 minutes from [time]
DateTime autoAddHalfHour(DateTime time) {
  return time.add(const Duration(minutes: 30));
}

/// returns a [DateTime] with date of [date] and time of [time]
DateTime setDateTime(DateTime date, TimeOfDay time) {
  return DateTime(
    date.year,
    date.month,
    date.day,
    time.hour,
    time.minute,
  );
}

/// Returns a [String] of [DateTime] formatted from [time]
String formatTime(DateTime time) {
  final DateFormat timeFormat = DateFormat('HH:mm');
  return timeFormat.format(time).toString();
}

/// Returns [bool] that [start] or [end] conflict the break time or not
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

/// Returns [bool] that [start] or [end] conflict the close time or not
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

bool isBeforeNow(DateTime time) {
  return time.isBefore(DateTime.now());
}

bool isAfterStartTime(DateTime start, DateTime end) {
  return end.isAfter(
    start.add(const Duration(minutes: 30)),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year - 10, kToday.month, kToday.day);
final kLastDay = DateTime(kToday.year + 10, kToday.month, kToday.day);
