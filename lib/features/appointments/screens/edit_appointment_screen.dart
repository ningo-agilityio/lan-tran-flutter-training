import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/generated/l10n.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/date_picker.dart';
import '../../../core/widgets/dropdown.dart';
import '../../../core/widgets/icons.dart';
import '../../../core/widgets/indicator.dart';
import '../../../core/widgets/input.dart';
import '../../../core/widgets/snack_bar.dart';
import '../../../core/widgets/text.dart';
import '../../../core/widgets/time_picker.dart';
import '../api/appointment_api.dart';
import '../model/appointment.dart';

class EditAppointment extends StatefulWidget {
  const EditAppointment({super.key});

  @override
  State<EditAppointment> createState() => _EditAppointmentState();
}

class _EditAppointmentState extends State<EditAppointment> {
  final nameController = TextEditingController();
  final descpController = TextEditingController();

  final nameFocusNode = FocusNode();
  final descpFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final appointment =
        ModalRoute.of(context)!.settings.arguments as Appointment;

    final double indicatorHeight = MediaQuery.of(context).size.height / 2;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
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
                text: 'Edit Appointment',
                style: textTheme.titleLarge!,
              ),
              automaticallyImplyLeading: false,
              actions: [
                SAButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const SAIcons(
                    icon: Icons.close,
                  ),
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
                      style: textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    DatePicker(
                        dateTime: appointment.date,
                        onPressed: () async {
                          final DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: appointment.date,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(appointment.date.year + 5),
                          );

                          if (date != null && date != appointment.date) {
                            setState(() {
                              appointment
                                ..date = date
                                ..startTime = setDateTime(
                                  appointment.date,
                                  TimeOfDay.fromDateTime(appointment.startTime),
                                )
                                ..endTime = setDateTime(
                                  appointment.date,
                                  TimeOfDay.fromDateTime(appointment.endTime),
                                );
                            });
                          }
                        }),
                    const SizedBox(height: 12),
                    TimePicker(
                      startTime: appointment.startTime,
                      endTime: appointment.endTime,
                      onStartTimePressed: () async {
                        final TimeOfDay? time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(appointment.startTime),
                        );
                        if (time != null &&
                            time !=
                                TimeOfDay.fromDateTime(appointment.startTime)) {
                          setState(() {
                            appointment
                              ..startTime = setDateTime(
                                appointment.date,
                                time,
                              )
                              ..endTime =
                                  autoAddHalfHour(appointment.startTime);
                          });
                        }
                      },
                      onEndTimePressed: () async {
                        final TimeOfDay? time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(appointment.endTime),
                        );
                        if (time != null &&
                            time !=
                                TimeOfDay.fromDateTime(appointment.endTime)) {
                          setState(() {
                            appointment.endTime = setDateTime(
                              appointment.date,
                              time,
                            );
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    Dropdown(
                        items: items,
                        selectedValue: appointment.services,
                        onChanged: (value) {
                          setState(() {
                            appointment.services = value!;
                          });
                        }),
                    const SizedBox(height: 12),
                    Input(
                      controller: descpController,
                      text: appointment.description,
                      focusNode: descpFocusNode,
                      onEditCompleted: () {
                        FocusScope.of(context).unfocus();
                      },
                      color: colorScheme.secondaryContainer,
                      maxLines: 4,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: colorScheme.secondaryContainer,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          if (isBreakTime(
                            appointment.startTime,
                            appointment.endTime,
                          )) {
                            SASnackBar.show(
                              context: context,
                              message: S.of(context).breakTimeConflictError,
                            );
                          } else if (isClosedTime(
                            appointment.startTime,
                            appointment.endTime,
                          )) {
                            SASnackBar.show(
                              context: context,
                              message: S.of(context).closedTimeError,
                            );
                          } else {
                            bool isProcessing = true;
                            if (isProcessing) {
                              unawaited(showDialog(
                                context: context,
                                barrierColor: colorScheme.onBackground,
                                builder: (context) => LoadingIndicator(
                                  height: indicatorHeight,
                                ),
                              ));
                            }
                            await AppointmentApi.updateAppointment(
                              Appointment(
                                id: appointment.id,
                                userId: user['id'],
                                date: appointment.date,
                                startTime: appointment.startTime,
                                endTime: appointment.endTime,
                                services: appointment.services,
                                description: descpController.text == ''
                                    ? appointment.description
                                    : descpController.text,
                              ),
                            );
                            setState(() {
                              isProcessing = false;
                              Navigator.popAndPushNamed(
                                  context, '/appointment');
                            });
                          }
                        } catch (e) {
                          SASnackBar.show(
                            context: context,
                            message: e.toString(),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                      ),
                      child: Text(
                        S.of(context).createAppointmentButton,
                        style: textTheme.labelMedium!.copyWith(
                          color: colorScheme.onPrimary,
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
