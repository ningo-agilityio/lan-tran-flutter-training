import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salon_appointment/layouts/main_layout.dart';
import 'package:salon_appointment/models/appointment.dart';
import 'package:salon_appointment/theme/theme.dart';
import 'package:salon_appointment/widgets/calendar_schedule.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controllers/appointment_controller.dart';
import '../utils.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final controller = AppointmentController();
  final eventsController = StreamController<List<Appointment>?>();

  final colorScheme = themeData.colorScheme;

  DateFormat dateFormat = DateFormat('dd MMMM, EEEE');

  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  void _loadEvents() {
    eventsController.sink.add(null);
    controller.load(_selectedDay!, '1').then((value) {
      eventsController.sink.add(value);
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    if (_selectedDay != null) {
      _loadEvents();
    }
  }

  @override
  void dispose() {
    eventsController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentIndex: 1,
      title: 'Calendar',
      child: Column(
        children: [
          TableCalendar<Appointment>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            startingDayOfWeek: StartingDayOfWeek.monday,
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  _rangeStart = null;
                  _rangeEnd = null;
                  _rangeSelectionMode = RangeSelectionMode.toggledOff;
                });

                _loadEvents();
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          StreamBuilder(
              stream: eventsController.stream,
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  final events = snapshot.data ?? [];
                  if (events.isEmpty) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      child: Center(
                        child: Text(
                          'There are no appointments.',
                          style: themeData.textTheme.bodyLarge!.copyWith(
                            color: colorScheme.onSecondary,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      margin: const EdgeInsets.only(top: 8),
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      height: 228,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            colorScheme.primary,
                            colorScheme.onSurface,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: CalendarSchedule(appointment: events.first),
                    );
                  }
                }
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
