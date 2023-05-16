import 'dart:async';

import 'package:flutter/material.dart';
import 'package:salon_appointment/core/utils.dart';

import '../../../core/constants/assets.dart';
import '../../../core/generated/l10n.dart';
import '../../../core/storage/user_storage.dart';
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

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final double indicatorHeight = MediaQuery.of(context).size.height / 2;
    late Map<String, dynamic> user;

    const List<String> items = [
      'Back',
      'Neck & Shoulders',
      'Non-Invasive Body Contouring',
    ];

    return FutureBuilder(
      future: UserStorage.getUser(),
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
                style: textTheme.titleLarge!,
              ),
              automaticallyImplyLeading: false,
              actions: [
                SAButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  child: SAIcons(
                    icon: Assets.closeIcon,
                    color: colorScheme.secondaryContainer,
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
                              startTime = setDateTime(
                                dateTime,
                                TimeOfDay.fromDateTime(startTime),
                              );
                              endTime = setDateTime(
                                dateTime,
                                TimeOfDay.fromDateTime(endTime),
                              );
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
                        if (time != null) {
                          final DateTime tempStartTime =
                              setDateTime(dateTime, time);
                          if (isBeforeNow(tempStartTime)) {
                            setState(() {
                              SASnackBar.show(
                                context: context,
                                message: S.of(context).invalidStartTimeError,
                                isSuccess: false,
                              );
                            });
                          } else if (time !=
                              TimeOfDay.fromDateTime(startTime)) {
                            setState(() {
                              startTime = tempStartTime;
                              endTime = autoAddHalfHour(startTime);
                            });
                          }
                        }
                      },
                      onEndTimePressed: () async {
                        final TimeOfDay? time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(endTime),
                        );
                        if (time != null) {
                          final DateTime tempEndTime =
                              setDateTime(dateTime, time);
                          if (!isAfterStartTime(startTime, tempEndTime)) {
                            setState(() {
                              SASnackBar.show(
                                context: context,
                                message: S.of(context).invalidEndTimeError,
                                isSuccess: false,
                              );
                            });
                          } else if (time != TimeOfDay.fromDateTime(endTime)) {
                            setState(() {
                              endTime = tempEndTime;
                            });
                          }
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
                          if (isBreakTime(startTime, endTime)) {
                            SASnackBar.show(
                              context: context,
                              message: S.of(context).breakTimeConflictError,
                              isSuccess: false,
                            );
                          } else if (isClosedTime(startTime, endTime)) {
                            SASnackBar.show(
                              context: context,
                              message: S.of(context).closedTimeError,
                              isSuccess: false,
                            );
                          } else if (selectedValue == null) {
                            SASnackBar.show(
                              context: context,
                              message: S.of(context).emptyServicesError,
                              isSuccess: false,
                            );
                          } else {
                            bool isProcessing = true;
                            if (isProcessing) {
                              unawaited(
                                showDialog(
                                  context: context,
                                  barrierColor: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
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
                                description: descpController.text == ''
                                    ? S.of(context).defaultDescription
                                    : descpController.text,
                              ),
                            );
                            setState(() {
                              isProcessing = false;
                              SASnackBar.show(
                                context: context,
                                message: S.of(context).addSuccess,
                                isSuccess: true,
                              );
                              Navigator.pushReplacementNamed(
                                context,
                                '/calendar',
                              );
                            });
                          }
                        } catch (e) {
                          SASnackBar.show(
                            context: context,
                            message: e.toString(),
                            isSuccess: false,
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
