import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:salon_appointment/widgets/appointment.dart';
import 'package:intl/intl.dart';

import '../utils.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  late final ValueNotifier<List<Appointment>> _selectedEvents;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by long pressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  DateFormat format = DateFormat('dd MMMM, EEEE');

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Appointment> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Appointment> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appointments',
          style: SATheme.lightTheme.textTheme.titleLarge!
              .copyWith(color: ColorName.textColor),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: ColorName.textColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
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
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
            ),
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          Container(
            child: Text(
              '${DateFormat('dd MMMM, EEEE').format(_selectedDay!)}',
              style: SATheme.lightTheme.textTheme.labelLarge!.copyWith(
                color: Color(0xFF0C122A),
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Appointment>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return Scrollbar(
                  child: ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppointmentCard(
                          startTime: value[index].startTime,
                          endTime: value[index].endTime,
                          customer: value[index].customer,
                          services: value[index].services,
                          description: value[index].description,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
