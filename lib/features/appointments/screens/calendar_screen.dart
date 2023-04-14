import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/generated/l10n.dart';
import '../../../core/layouts/main_layout.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/icons.dart';
import '../../../core/widgets/indicator.dart';
import '../../../core/widgets/text.dart';
import '../../auth/model/user.dart';
import '../model/appointment.dart';
import '../repository/appointment_repository.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({
    required this.user,
    super.key,
  });

  final User user;

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final appointmentRepo = AppointmentRepository();
  final eventsController = StreamController<List<Appointment>?>();

  DateFormat dateFormat = DateFormat('dd MMMM, EEEE');

  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  void _loadEvents() {
    eventsController.sink.add(null);
    appointmentRepo.load(_selectedDay!, widget.user.id).then((value) {
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
      user: widget.user,
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
                    Theme.of(context).colorScheme.onSurface,
                    Theme.of(context).colorScheme.primary,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                shape: BoxShape.rectangle,
              ),
              todayDecoration: BoxDecoration(
                color:
                    Theme.of(context).colorScheme.primary.withOpacity(0.0798),
                shape: BoxShape.rectangle,
              ),
              todayTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
              rowDecoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
              weekendStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
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
                      height: MediaQuery.of(context).size.height / 4,
                      child: Center(
                        child: Text(
                          S.of(context).emptyAppointments,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
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
                            Theme.of(context).colorScheme.primary,
                            Theme.of(context).colorScheme.onSurface,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: CalendarSchedule(appointment: events.first),
                    );
                  }
                }
                return LoadingIndicator(
                  height: MediaQuery.of(context).size.height / 4,
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

  String twoDigitsMinute(DateTime time) {
    return (time.minute < 10)
        ? time.minute.toString().padLeft(2, '0')
        : '${time.minute}';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 26, left: 15),
          child: SAIcons.calendarSchedule(),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 22),
                SAText.calendarSchedule(
                  text: dateFormat.format(appointment.date),
                  style: Theme.of(context).textTheme.labelLarge!,
                ),
                const SizedBox(height: 7),
                SAText.calendarSchedule(
                  text:
                      '${appointment.startTime.hour}:${twoDigitsMinute(appointment.startTime)}-${appointment.endTime.hour}:${twoDigitsMinute(appointment.endTime)}',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        height: 24 / 14,
                      ),
                ),
                const SizedBox(height: 12),
                SAText.calendarSchedule(
                  text: appointment.description,
                  style: Theme.of(context).textTheme.bodySmall!,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
