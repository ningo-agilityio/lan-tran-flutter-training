import 'package:flutter/material.dart';

class SAText extends StatelessWidget {
  const SAText({
    required this.text,
    this.style,
    super.key,
  });

  const factory SAText.timePicker({
    required String text,
  }) = _TimePicker;

  const factory SAText.calendarSchedule({
    required String text,
    required TextStyle style,
  }) = _CalendarSchedule;

  const factory SAText.appBarTitle({
    required String text,
    required TextStyle style,
  }) = _AppBarTitle;

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}

class _AppBarTitle extends SAText {
  const _AppBarTitle({
    required super.text,
    required super.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style!.copyWith(
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}

class _CalendarSchedule extends SAText {
  const _CalendarSchedule({
    required super.text,
    required super.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: style!.copyWith(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}

class _TimePicker extends SAText {
  const _TimePicker({
    required super.text,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Text(
      text,
      textAlign: TextAlign.justify,
      style: theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.secondaryContainer,
      ),
    );
  }
}
