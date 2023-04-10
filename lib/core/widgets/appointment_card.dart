import 'package:flutter/material.dart';
import 'package:salon_appointment/core/theme/theme.dart';

import './description.dart';
import './services.dart';
import './time.dart';
import '../../features/appointments/model/appointment.dart';

class AppointmentCard extends StatelessWidget {
  Appointment appointment;

  AppointmentCard({
    super.key,
    required this.appointment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: themeData.colorScheme.primary.withOpacity(0.16),
            blurRadius: 10,
          ),
        ],
      ),
      child: Card(
        borderOnForeground: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Time(
                startTime: appointment.startTime,
                endTime: appointment.endTime,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12),
              // child: Customer(user: User(),),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Services(services: appointment.services),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Description(description: appointment.description),
            ),
          ],
        ),
      ),
    );
  }
}
