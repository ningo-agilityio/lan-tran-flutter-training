import 'package:flutter/material.dart';
import 'package:salon_appointment/widgets/date_picker.dart';
import 'package:salon_appointment/widgets/dropdown.dart';
import 'package:salon_appointment/widgets/input.dart';
import 'package:salon_appointment/widgets/time_picker.dart';

import '../theme/theme.dart';
import 'common/buttons.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (context, controller) => SingleChildScrollView(
        controller: controller,
        child: Container(
          height: _viewHeight(context),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: SATheme.lightTheme.colorScheme.background,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.0),
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add an appointment',
                      style: SATheme.lightTheme.textTheme.titleLarge,
                    ),
                    SAButton.icon(
                      onPress: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(height: 12.0),
                Input(text: 'Customer Name'),
                SizedBox(height: 12.0),
                DatePicker(dateTime: DateTime.now()),
                SizedBox(height: 12.0),
                TimePicker(startTime: TimeOfDay.now()),
                SizedBox(height: 12.0),
                DropDown(items: ['Back', 'Neck & Shoulders']),
                SizedBox(height: 12.0),
                Input(text: 'Description')
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ModalBottomSheet(),
    );
  }

  static double _viewHeight(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return (keyboardHeight > 0)
        ? screenHeight - keyboardHeight
        : screenHeight * 0.9;
  }
}
