import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:salon_appointment/widgets/time.dart';
import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Appointment {
  String services = '';
  TimeOfDay startTime = TimeOfDay(hour: 0, minute: 0);
  TimeOfDay endTime = TimeOfDay(hour: 0, minute: 0);
  String customer = '';
  String description = '';
  bool isCompleted = false;

  Appointment({
    required this.customer,
    required this.startTime,
    required this.endTime,
    required this.services,
    required this.description,
    required this.isCompleted,
  });
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Appointment>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(
  List.generate(50, (index) => index),
  key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
  value: (item) => List.generate(
    item % 4 + 1,
    (index) => Appointment(
      customer: '',
      startTime: TimeOfDay(hour: 0, minute: 0),
      endTime: TimeOfDay(hour: 0, minute: 0),
      services: '',
      description: '',
      isCompleted: false,
    ),
  ),
)..addAll({
    kToday: [
      Appointment(
        customer: 'Hailee Steinfeld',
        startTime: TimeOfDay(hour: 12, minute: 0),
        endTime: TimeOfDay(hour: 15, minute: 20),
        services: 'Non-Invasive Body Contouring, Back, Neck & Shoulders',
        description:
            'There is a distinction between a beauty salon and a hair salon and although many small businesses do offer both sets of treatments; beauty salons provide extended services related to skin health, facial aesthetic, foot care, nail manicures, aromatherapy — even meditation, oxygen therapy, mud baths and many other services.',
        isCompleted: true,
      ),
      Appointment(
        customer: 'Hailee Steinfeld',
        startTime: TimeOfDay(hour: 12, minute: 0),
        endTime: TimeOfDay(hour: 15, minute: 20),
        services: 'Back, Neck & Shoulders',
        description:
            'There is a distinction between a beauty salon and a hair salon and although many small businesses do offer both sets of treatments; beauty salons provide extended services related to skin health, facial aesthetic, foot care, nail manicures, aromatherapy — even meditation, oxygen therapy, mud baths and many other services.',
        isCompleted: false,
      ),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year - 10, kToday.month, kToday.day);
final kLastDay = DateTime(kToday.year + 10, kToday.month, kToday.day);
