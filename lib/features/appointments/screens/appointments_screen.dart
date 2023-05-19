import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/constants/assets.dart';
import '../../../core/generated/l10n.dart';
import '../../../core/layouts/main_layout.dart';
import '../../../core/storage/user_storage.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/dialog.dart';
import '../../../core/widgets/icons.dart';
import '../../../core/widgets/indicator.dart';
import '../../../core/widgets/snack_bar.dart';
import '../api/appointment_api.dart';
import '../bloc/appointment_bloc.dart';
import '../bloc/appointment_event.dart';
import '../bloc/appointment_state.dart';
import '../model/appointment.dart';
import '../repository/appointment_repository.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({
    super.key,
  });

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final appointmentRepo = AppointmentRepository();

  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;

  DateFormat dateFormat = DateFormat('dd MMMM, EEEE');

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  late Map<String, dynamic> user;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    UserStorage.getUser().then((value) => user = value);
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final double indicatorHeight = MediaQuery.of(context).size.height / 2;
    final l10n = S.of(context);

    return BlocProvider<AppointmentBloc>(
      create: (context) => AppointmentBloc(),
      child: MainLayout(
        currentIndex: 0,
        title: l10n.appointmentAppBarTitle,
        child: Column(
          children: [
            BlocBuilder<AppointmentBloc, AppointmentState>(
                builder: (context, state) {
              return TableCalendar<Appointment>(
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
                  todayTextStyle: TextStyle(color: colorScheme.secondary),
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

                    context
                        .read<AppointmentBloc>()
                        .add(AppointmentLoad(_selectedDay!));
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              );
            }),
            Text(
              dateFormat.format(_selectedDay!),
              style: textTheme.labelSmall!.copyWith(
                color: colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 8),
            BlocListener<AppointmentBloc, AppointmentState>(
              listener: (context, state) {
                if (state is AppointmentLoading) {
                  loadingIndicator.show(
                    context: context,
                    height: indicatorHeight,
                  );
                }
                if (state is AppointmentRemoved) {
                  Navigator.pop(context, true);
                  context.read<AppointmentBloc>().add(
                        AppointmentLoad(_selectedDay!),
                      );
                }
                if (state is AppointmentRemoveError) {
                  SASnackBar.show(
                    context: context,
                    message: state.error!,
                    isSuccess: false,
                  );
                }
              },
              child: BlocBuilder<AppointmentBloc, AppointmentState>(
                builder: (context, state) {
                  if (state is AppointmentLoading) {
                    return SAIndicator(
                      height: indicatorHeight,
                    );
                  }
                  if (state is AppointmentLoadSuccess &&
                      state.appointments!.isNotEmpty) {
                    final events = state.appointments;
                    return Expanded(
                      child: Scrollbar(
                        child: ListView.builder(
                          itemCount: events!.length,
                          itemBuilder: (_, index) => Padding(
                            padding: const EdgeInsets.all(8),
                            child: AppointmentCard(
                              name: user['name'],
                              avatar: user['avatar'],
                              appointment: events[index],
                              onEditPressed: () {
                                if (events[index]
                                        .date
                                        .difference(DateTime.now())
                                        .inHours <
                                    24) {
                                  SASnackBar.show(
                                    context: context,
                                    message: l10n.unableEditError,
                                    isSuccess: false,
                                  );
                                } else {
                                  Navigator.pushNamed(
                                    context,
                                    '/edit',
                                    arguments: events[index],
                                  );
                                }
                              },
                              onRemovePressed: () {
                                AlertConfirmDialog.show(
                                  context: context,
                                  title: l10n.removeConfirmTitle,
                                  message: l10n.removeConfirmMessage,
                                  onPressedRight: () {
                                    context.read<AppointmentBloc>().add(
                                          AppointmentRemovePressed(
                                            appointmentId: events[index].id!,
                                          ),
                                        );
                                  },
                                  onPressedLeft: () {
                                    Navigator.pop(context, false);
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: Center(
                      child: Text(
                        l10n.emptyAppointments,
                        style: textTheme.bodyLarge!.copyWith(
                          color: colorScheme.secondary,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    required this.appointment,
    required this.name,
    required this.avatar,
    required this.onEditPressed,
    required this.onRemovePressed,
    super.key,
  });

  final Appointment appointment;
  final String name;
  final String avatar;
  final VoidCallback onEditPressed;
  final VoidCallback onRemovePressed;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Time(
                  startTime: appointment.startTime,
                  endTime: appointment.endTime,
                ),
                Row(
                  children: [
                    SAButton.icon(
                      onPressed: onEditPressed,
                      child: const SAIcons(
                        icon: Assets.editIcon,
                      ),
                    ),
                    SAButton.icon(
                      onPressed: onRemovePressed,
                      child: const SAIcons(
                        icon: Assets.removeIcon,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 24),
            Customer(
              name: name,
              avatar: avatar,
            ),
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
    final ThemeData theme = Theme.of(context);

    return Column(
      children: [
        Row(
          children: [
            SAIcons(
              icon: Assets.scheduleIcon,
              size: 20,
              color: theme.colorScheme.secondary,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              '${formatTime(startTime)}-${formatTime(endTime)}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }
}

class Customer extends StatelessWidget {
  const Customer({
    required this.name,
    required this.avatar,
    super.key,
  });

  final String name;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorScheme.onPrimary,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(avatar),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          name,
          style: textTheme.bodyLarge!.copyWith(
            color: colorScheme.primary,
          ),
        )
      ],
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
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        const SizedBox(
          width: 34,
        ),
        Expanded(
          child: Text(
            services,
            style: textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
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
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
          child: Text(
            description,
            style: textTheme.bodySmall!.copyWith(
              color: colorScheme.onSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
