import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salon_appointment/models/appointment.dart';
import 'package:salon_appointment/theme/theme.dart';
import 'package:salon_appointment/utils.dart';
import 'package:salon_appointment/widgets/appointment_card.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controllers/appointment_controller.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  final controller = AppointmentController();
  final eventsController = StreamController<List<Appointment>?>();

  // Can be toggled on/off by long pressing a date
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;

  final DateFormat dateFormat = DateFormat('dd MMMM, EEEE');

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  void _loadEvents() {
    eventsController.sink.add(null);
    controller.load(_selectedDay!).then((value) {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appointments',
          style: SATheme.lightTheme.textTheme.titleLarge!.copyWith(
            color: SATheme.lightTheme.colorScheme.onSecondary,
          ),
        ),
      ),
      body: Column(
        children: [
          TableCalendar<Appointment>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: CalendarFormat.week,
            rangeSelectionMode: _rangeSelectionMode,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: const CalendarStyle(
              outsideDaysVisible: false,
            ),
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
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          Text(
            dateFormat.format(_selectedDay!),
            style: SATheme.lightTheme.textTheme.labelSmall!.copyWith(
              color: SATheme.lightTheme.colorScheme.onSecondary,
            ),
          ),
          const SizedBox(height: 8),
          StreamBuilder(
            stream: eventsController.stream,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                final events = snapshot.data ?? [];
                if (events.isEmpty) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: Center(
                      child: Text(
                        'There are no appointments.',
                        style: SATheme.lightTheme.textTheme.bodyLarge!.copyWith(
                          color: SATheme.lightTheme.colorScheme.onSecondary,
                        ),
                      ),
                    ),
                  );
                } else {
                  return Expanded(
                    child: Scrollbar(
                      child: ListView.builder(
                        itemCount: events.length,
                        itemBuilder: (_, index) => Padding(
                          padding: const EdgeInsets.all(8),
                          child: AppointmentCard(
                            appointment: events[index],
                          ),
                        ),
                      ),
                    ),
                  );
                }
              }
              return SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
