import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salon_appointment/core/utils.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/constants/assets.dart';
import '../../../core/generated/l10n.dart';
import '../../../core/layouts/main_layout.dart';
import '../../../core/widgets/icons.dart';
import '../../auth/model/user.dart';
import '../model/appointment.dart';
import '../repository/appointment_repository.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({
    required this.user,
    super.key,
  });

  final User user;

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final appointmentRepo = AppointmentRepository();
  final eventsController = StreamController<List<Appointment>?>();

  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;

  DateFormat dateFormat = DateFormat('dd MMMM, EEEE');

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
      currentIndex: 0,
      title: S.of(context).appointmentAppBarTitle,
      child: Column(
        children: [
          TableCalendar<Appointment>(
            headerVisible: false,
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: CalendarFormat.week,
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
              todayTextStyle:
                  TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            daysOfWeekHeight: 44,
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
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
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
                        S.of(context).emptyAppointments,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
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
                            user: widget.user,
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

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    required this.appointment,
    required this.user,
    super.key,
  });

  final Appointment appointment;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: false,
      elevation: 2,
      shadowColor: Theme.of(context).colorScheme.primary.withOpacity(0.16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Time(
              startTime: appointment.startTime,
              endTime: appointment.endTime,
            ),
            const SizedBox(height: 24),
            Customer(user: user),
            const SizedBox(height: 24),
            Services(services: appointment.services),
            const SizedBox(height: 24),
            Description(description: appointment.description),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class Time extends StatelessWidget {
  const Time({
    required this.startTime,
    required this.endTime,
    super.key,
  });

  final DateTime startTime;
  final DateTime endTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SAIcons(
              icon: Assets.scheduleIcon,
              size: 20,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              '${startTime.hour}:${(startTime.minute < 10) ? startTime.minute.toString().padLeft(2, '0') : startTime.minute}-${endTime.hour}:${(endTime.minute < 10) ? endTime.minute.toString().padLeft(2, '0') : endTime.minute}',
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ],
    );
  }
}

class Customer extends StatelessWidget {
  const Customer({
    required this.user,
    super.key,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.onPrimary,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(user.avatar),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            user.name,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          )
        ],
      ),
    );
  }
}

class Services extends StatelessWidget {
  const Services({
    required this.services,
    super.key,
  });

  final String services;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          const SizedBox(
            width: 34,
          ),
          Expanded(
            child: Text(
              services,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    required this.description,
    super.key,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Expanded(
        child: Text(
          description,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
        ),
      ),
    );
  }
}
