import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/theme.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/icons.dart';
import '../../../core/widgets/input.dart';
import '../../../core/widgets/text.dart';
import '../../../generated/l10n.dart';
import '../api/appointment_api.dart';
import '../model/appointment.dart';

class NewAppointmentScreen extends StatefulWidget {
  const NewAppointmentScreen({super.key});

  @override
  State<NewAppointmentScreen> createState() => _NewAppointmentScreenState();
}

class _NewAppointmentScreenState extends State<NewAppointmentScreen> {
  final nameController = TextEditingController();
  final descpController = TextEditingController();

  final nameFocusNode = FocusNode();
  final descpFocusNode = FocusNode();

  final inputColor = themeData.colorScheme.secondaryContainer;
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
          text: S.of(context).newAppointmentAppBarTitle,
          style: themeData.textTheme.titleLarge!,
        ),
        automaticallyImplyLeading: false,
        actions: [
          SAButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            child: CustomIcons.close,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              // const SizedBox(height: 12),
              // Input(
              //   controller: nameController,
              //   text: 'Customer Name',
              //   focusNode: nameFocusNode,
              //   onEditCompleted: () {
              //     FocusScope.of(context).nextFocus();
              //   },
              //   color: inputColor,
              // ),
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
                text: S.of(context).description,
                focusNode: descpFocusNode,
                onEditCompleted: () {
                  FocusScope.of(context).unfocus();
                },
                color: inputColor,
                maxLines: 4,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: inputColor,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
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
                  S.of(context).createAppointmentButton,
                  style: themeData.textTheme.labelMedium!.copyWith(
                    color: themeData.colorScheme.onPrimary,
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
            color: themeData.colorScheme.secondaryContainer,
          ),
          Text(
            dateFormat.format(dateTime),
            style: themeData.textTheme.labelLarge!.copyWith(
              color: themeData.colorScheme.secondaryContainer,
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
                color: themeData.colorScheme.secondaryContainer,
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

  TimeOfDay startTime;
  TimeOfDay endTime;
  VoidCallback onStartTimePressed;
  VoidCallback onEndTimePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const CustomText.timePicker(text: 'From:'),
        OutlinedButton(
          onPressed: onStartTimePressed,
          child: CustomText.timePicker(text: startTime.format(context)),
        ),
        const Padding(
          padding: EdgeInsets.all(8),
          child: CustomText.timePicker(text: 'To:'),
        ),
        OutlinedButton(
          onPressed: onEndTimePressed,
          child: CustomText.timePicker(text: endTime.format(context)),
        ),
      ],
    );
  }
}

class DropDown extends StatelessWidget {
  DropDown({
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    super.key,
  });

  final List<String> items;
  String? selectedValue;
  Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 44,
      width: 345,
      decoration: BoxDecoration(
          color: themeData.colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: themeData.colorScheme.secondaryContainer,
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
