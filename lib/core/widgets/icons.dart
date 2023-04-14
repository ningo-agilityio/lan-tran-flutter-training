import 'package:flutter/material.dart';

class SAIcons extends StatelessWidget {
  const SAIcons({super.key});

  const factory SAIcons.appointmentSchedule() = _AppointmentSchedule;
  const factory SAIcons.breakTime() = _BreakTime;
  const factory SAIcons.calendarSchedule() = _CalendarSchedule;
  const factory SAIcons.add() = _Add;
  const factory SAIcons.close() = _Close;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _AppointmentSchedule extends SAIcons {
  const _AppointmentSchedule();

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.schedule_outlined,
      color: Theme.of(context).colorScheme.tertiary,
    );
  }
}

class _BreakTime extends SAIcons {
  const _BreakTime();

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.schedule_outlined,
      color: Theme.of(context).colorScheme.secondaryContainer,
    );
  }
}

class _CalendarSchedule extends SAIcons {
  const _CalendarSchedule();

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.schedule_outlined,
      color: Theme.of(context).colorScheme.onPrimary,
    );
  }
}

class _Add extends SAIcons {
  const _Add();

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.add,
      size: 30,
      color: Theme.of(context).colorScheme.onPrimary,
    );
  }
}

class _Close extends SAIcons {
  const _Close();

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.close,
      color: Theme.of(context).colorScheme.onSecondary,
    );
  }
}
