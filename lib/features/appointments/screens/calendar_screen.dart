import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/constants/assets.dart';
import '../../../core/generated/l10n.dart';
import '../../../core/layouts/main_layout.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/icons.dart';
import '../../../core/widgets/indicator.dart';
import '../../../core/widgets/text.dart';
import '../bloc/appointment_bloc.dart';
import '../model/appointment.dart';
import '../repository/appointment_repository.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({
    super.key,
  });

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final appointmentRepo = AppointmentRepository();

  DateFormat dateFormat = DateFormat('dd MMMM, EEEE');

  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final double indicatorHeight = MediaQuery.of(context).size.height / 4;

    return BlocProvider<AppointmentBloc>(
      create: (context) =>
          AppointmentBloc()..add(AppointmentLoad(_selectedDay!)),
      child: MainLayout(
        currentIndex: 1,
        title: S.of(context).calendarAppBarTitle,
        child: Column(
          children: [
            BlocBuilder<AppointmentBloc, AppointmentState>(
              builder: (context, state) {
                return TableCalendar<Appointment>(
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
                          colorScheme.onSurface,
                          colorScheme.primary,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    todayDecoration: BoxDecoration(
                      color: colorScheme.primary.withOpacity(0.0798),
                      shape: BoxShape.rectangle,
                    ),
                    todayTextStyle: TextStyle(
                      color: colorScheme.secondary,
                    ),
                    rowDecoration: BoxDecoration(
                      border: Border.all(
                        color: colorScheme.surface,
                      ),
                    ),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(
                      color: colorScheme.secondary,
                    ),
                    weekendStyle: TextStyle(
                      color: colorScheme.secondary,
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

                      context
                          .read<AppointmentBloc>()
                          .add(AppointmentLoad(_selectedDay!));
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
                );
              },
            ),
            BlocBuilder<AppointmentBloc, AppointmentState>(
              builder: (context, state) {
                if (state is AppointmentLoading) {
                  return SAIndicator(
                    height: indicatorHeight,
                  );
                }
                if (state is AppointmentLoadSuccess &&
                    state.appointments!.isNotEmpty) {
                  final events = state.appointments;
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
                    child: CalendarSchedule(appointment: events!.first),
                  );
                }
                return SizedBox(
                  height: indicatorHeight,
                  child: Center(
                    child: Text(
                      S.of(context).emptyAppointments,
                      style: textTheme.bodyLarge!.copyWith(
                        color: colorScheme.secondary,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CalendarSchedule extends StatelessWidget {
  const CalendarSchedule({
    required this.appointment,
    super.key,
  });

  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('dd MMMM, EEEE');
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 26, left: 15),
          child: SAIcons(
            icon: Assets.scheduleIcon,
            size: 20,
            color: colorScheme.onPrimary,
          ),
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
                  style: textTheme.labelLarge!,
                ),
                const SizedBox(height: 7),
                SAText.calendarSchedule(
                  text:
                      '${formatTime(appointment.startTime)}-${formatTime(appointment.endTime)}',
                  style: textTheme.bodyLarge!.copyWith(
                    height: 24 / 14,
                  ),
                ),
                const SizedBox(height: 12),
                SAText.calendarSchedule(
                  text: appointment.description,
                  style: textTheme.bodySmall!,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
