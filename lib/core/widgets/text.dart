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

  const factory SAText.login({
    required String text,
  }) = _Login;

  const factory SAText.logo({
    required String text,
  }) = _Logo;

  const factory SAText.forgotPassword({
    required String text,
  }) = _ForgotPassword;

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
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
    );
  }
}

class _Login extends SAText {
  const _Login({
    required super.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
    );
  }
}

class _ForgotPassword extends SAText {
  const _ForgotPassword({
    required super.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.6429),
          ),
    );
  }
}

class _Logo extends SAText {
  const _Logo({
    required super.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 40,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
