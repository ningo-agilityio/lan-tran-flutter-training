import 'package:flutter/material.dart';
import './time.dart';
import './customer.dart';
import './services.dart';
import './description.dart';

class AppointmentCard extends StatelessWidget {
  String services = '';
  TimeOfDay startTime = TimeOfDay(hour: 0, minute: 0);
  TimeOfDay endTime = TimeOfDay(hour: 0, minute: 0);
  String customer = '';
  String description = '';

  AppointmentCard({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.customer,
    required this.services,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xFF553BA3).withOpacity(0.16),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Card(
        // shadowColor: Color(0xFF553BA3).withOpacity(0.16),
        // elevation: 8,
        borderOnForeground: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Time(
                startTime: startTime,
                endTime: endTime,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Customer(customerName: customer),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Services(services: services),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Description(description: description),
            ),
          ],
        ),
      ),
    );
  }
}
