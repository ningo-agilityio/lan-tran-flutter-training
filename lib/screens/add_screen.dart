import 'package:flutter/material.dart';
import 'package:salon_appointment/apis/appointment_api.dart';
import 'package:salon_appointment/models/appointment.dart';
import 'package:salon_appointment/widgets/common/text.dart';

import '../theme/theme.dart';
import '../widgets/common/buttons.dart';
import '../widgets/date_picker.dart';
import '../widgets/dropdown.dart';
import '../widgets/input.dart';
import '../widgets/time_picker.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final nameController = TextEditingController();
  final descpController = TextEditingController();

  final nameFocusNode = FocusNode();
  final descpFocusNode = FocusNode();

  final inputColor = themeData.colorScheme.onSecondaryContainer;
  late DateTime dateTime = DateTime.now();
  late TimeOfDay startTime = TimeOfDay.now();
  late TimeOfDay endTime = (startTime.minute + 30) >= 60
      ? TimeOfDay(
          hour: startTime.hour + 1,
          minute: (startTime.minute + 30) % 60,
        )
      : TimeOfDay(
          hour: startTime.hour,
          minute: startTime.minute + 30,
        );
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText.appBarTitle(
          text: 'Add appointment',
          style: themeData.textTheme.titleLarge!,
        ),
        actions: [
          SAButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.close,
              color: themeData.colorScheme.secondaryContainer,
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
              Input(
                controller: nameController,
                text: 'Customer Name',
                focusNode: nameFocusNode,
                onEditCompleted: () {
                  FocusScope.of(context).nextFocus();
                },
                color: inputColor,
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
                    initialTime: startTime,
                  );
                  if (time != null && time != startTime) {
                    setState(() {
                      startTime = time;
                    });
                  }
                },
                onEndTimePressed: () async {
                  final TimeOfDay? time = await showTimePicker(
                    context: context,
                    initialTime: endTime,
                  );
                  if (time != null && time != endTime) {
                    setState(() {
                      endTime = time;
                    });
                  }
                },
              ),
              const SizedBox(height: 12),
              DropDown(
                  items: const ['Back', 'Neck & Shoulders'],
                  selectedValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  }),
              const SizedBox(height: 12),
              Input(
                controller: descpController,
                text: 'Description',
                focusNode: descpFocusNode,
                onEditCompleted: () {
                  FocusScope.of(context).unfocus();
                },
                color: inputColor,
                maxLines: 4,
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await AppointmentApi.addAppointment(
                      Appointment(
                        userId: '1',
                        date: dateTime,
                        startTime: startTime,
                        endTime: endTime,
                        services: selectedValue!,
                        description: descpController.text,
                      ),
                    );
                    Navigator.of(context).pop();
                  } catch (e) {
                    throw Exception(e);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeData.colorScheme.primary,
                ),
                child: Text(
                  'Add appointment',
                  style: themeData.textTheme.labelMedium!.copyWith(
                    color: themeData.colorScheme.secondary,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
