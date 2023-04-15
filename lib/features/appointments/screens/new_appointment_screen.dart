import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salon_appointment/core/utils.dart';

import '../../../core/generated/l10n.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/icons.dart';
import '../../../core/widgets/indicator.dart';
import '../../../core/widgets/input.dart';
import '../../../core/widgets/snack_bar.dart';
import '../../../core/widgets/text.dart';
import '../api/appointment_api.dart';
import '../model/appointment.dart';

class NewAppointmentScreen extends StatefulWidget {
  const NewAppointmentScreen({
    super.key,
  });

  @override
  State<NewAppointmentScreen> createState() => _NewAppointmentScreenState();
}

class _NewAppointmentScreenState extends State<NewAppointmentScreen> {
  final nameController = TextEditingController();
  final descpController = TextEditingController();

  final nameFocusNode = FocusNode();
  final descpFocusNode = FocusNode();

  late DateTime dateTime = DateTime.now();
  late DateTime startTime = DateTime.now();
  late DateTime endTime = autoAddHalfHour(startTime);

  String? selectedValue;

  DateTime autoAddHalfHour(DateTime time) {
    return time.add(const Duration(minutes: 30));
  }

  @override
  Widget build(BuildContext context) {
    final double indicatorHeight = MediaQuery.of(context).size.height / 2;
    late Map<String, dynamic> user;

    const List<String> items = [
      'Back',
      'Neck & Shoulders',
      'Non-Invasive Body Contouring',
    ];

    return FutureBuilder(
      future: getUser(),
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return SnackBar(content: Text(snapshot.error.toString()));
        }
        if (snapshot.hasData) {
          user = snapshot.data!;

          return Scaffold(
            appBar: AppBar(
              title: SAText.appBarTitle(
                text: S.of(context).newAppointmentAppBarTitle,
                style: Theme.of(context).textTheme.titleLarge!,
              ),
              automaticallyImplyLeading: false,
              actions: [
                SAButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const SAIcons.close(),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    Text(
                      user['name'],
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    DatePicker(
                        dateTime: dateTime,
                        onPressed: () async {
                          final DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: dateTime,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(dateTime.year + 5),
                          );

                          if (date != null && date != dateTime) {
                            setState(() {
                              dateTime = date;
                            });
                          }
                        }),
                    const SizedBox(height: 12),
                    TimePicker(
                      startTime: startTime,
                      endTime: endTime,
                      onStartTimePressed: () async {
                        final TimeOfDay? time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(startTime),
                        );
                        if (time != null &&
                            time != TimeOfDay.fromDateTime(startTime)) {
                          setState(() {
                            startTime = DateTime(
                              dateTime.year,
                              dateTime.month,
                              dateTime.day,
                              time.hour,
                              time.minute,
                            );
                            endTime = autoAddHalfHour(startTime);
                          });
                        }
                      },
                      onEndTimePressed: () async {
                        final TimeOfDay? time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(endTime),
                        );
                        if (time != null &&
                            time != TimeOfDay.fromDateTime(endTime)) {
                          setState(() {
                            endTime = DateTime(
                              dateTime.year,
                              dateTime.month,
                              dateTime.day,
                              time.hour,
                              time.minute,
                            );
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    Dropdown(
                        items: items,
                        selectedValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                          });
                        }),
                    const SizedBox(height: 12),
                    Input(
                      controller: descpController,
                      text: S.of(context).description,
                      focusNode: descpFocusNode,
                      onEditCompleted: () {
                        FocusScope.of(context).unfocus();
                      },
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      maxLines: 4,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          bool isProcessing = true;
                          if (isProcessing) {
                            unawaited(
                              showDialog(
                                context: context,
                                barrierColor:
                                    Theme.of(context).colorScheme.onBackground,
                                builder: (context) => LoadingIndicator(
                                  height: indicatorHeight,
                                ),
                              ),
                            );
                          }
                          await AppointmentApi.addAppointment(
                            Appointment(
                              userId: user['id'],
                              date: dateTime,
                              startTime: startTime,
                              endTime: endTime,
                              services: selectedValue!,
                              description: descpController.text,
                            ),
                          );
                          setState(() {
                            isProcessing = false;
                          });

                          Navigator.pushReplacementNamed(context, '/calendar');
                        } catch (e) {
                          SASnackBar.show(
                            context: context,
                            message: e.toString(),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      child: Text(
                        S.of(context).createAppointmentButton,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return LoadingIndicator(
          height: indicatorHeight,
        );
      },
    );
  }
}

class DatePicker extends StatelessWidget {
  DatePicker({
    required this.dateTime,
    required this.onPressed,
    super.key,
  });

  VoidCallback onPressed;
  DateTime dateTime;
  DateFormat dateFormat = DateFormat('MM/dd/yyyy');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.schedule,
            size: 24,
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          Text(
            dateFormat.format(dateTime),
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  fontWeight: FontWeight.w400,
                ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.calendar_month,
                size: 24,
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimePicker extends StatelessWidget {
  TimePicker({
    required this.startTime,
    required this.endTime,
    required this.onStartTimePressed,
    required this.onEndTimePressed,
    super.key,
  });

  DateTime startTime;
  DateTime endTime;
  VoidCallback onStartTimePressed;
  VoidCallback onEndTimePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SAText.timePicker(text: 'From:'),
        OutlinedButton(
          onPressed: onStartTimePressed,
          child: SAText.timePicker(
            text: (startTime.minute < 10)
                ? '${startTime.hour}:${startTime.minute.toString().padLeft(2, '0')}'
                : '${startTime.hour}:${startTime.minute}',
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8),
          child: SAText.timePicker(text: 'To:'),
        ),
        OutlinedButton(
          onPressed: onEndTimePressed,
          child: SAText.timePicker(
            text: (endTime.minute < 10)
                ? '${endTime.hour}:${endTime.minute.toString().padLeft(2, '0')}'
                : '${endTime.hour}:${endTime.minute}',
          ),
        ),
      ],
    );
  }
}

class Dropdown extends StatelessWidget {
  const Dropdown({
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    super.key,
  });

  final List<String> items;
  final String? selectedValue;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 44,
      width: 345,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).colorScheme.secondaryContainer,
          )),
      child: DropdownButton<String>(
        hint: const Text('Select Services'),
        value: selectedValue,
        onChanged: onChanged,
        items: items
            .map<DropdownMenuItem<String>>((value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ))
            .toList(),
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        underline: const SizedBox(),
        isExpanded: true,
      ),
    );
  }
}
