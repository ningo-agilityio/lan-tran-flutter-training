import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/layouts/main_layout.dart';
import '../../../core/theme/theme.dart';
import '../../../core/widgets/icons.dart';
import '../../../core/widgets/text.dart';
import '../../../generated/l10n.dart';
import '../../../utils.dart';
import '../model/appointment.dart';
import '../repository/appointment_repository.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final controller = AppointmentRepository();
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
      title: S.of(context).calendarAppBarTitle,
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
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              cellMargin: EdgeInsets.zero,
              selectedDecoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    themeData.colorScheme.onSurface,
                    themeData.colorScheme.primary,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                shape: BoxShape.rectangle,
              ),
              todayDecoration: BoxDecoration(
                color: themeData.colorScheme.primary.withOpacity(0.0798),
                shape: BoxShape.rectangle,
              ),
              todayTextStyle: TextStyle(
                color: themeData.colorScheme.secondary,
              ),
              rowDecoration: BoxDecoration(
                border: Border.all(
                  color: themeData.colorScheme.surface,
                ),
              ),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                color: themeData.colorScheme.secondary,
              ),
              weekendStyle: TextStyle(
                color: themeData.colorScheme.secondary,
              ),
            ),
            daysOfWeekHeight: 44,
            rowHeight: 52,
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
                          S.of(context).emptyAppointments,
                          style: themeData.textTheme.bodyLarge!.copyWith(
                            color: colorScheme.secondary,
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

class CalendarSchedule extends StatelessWidget {
  CalendarSchedule({
    required this.appointment,
    super.key,
  });

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
