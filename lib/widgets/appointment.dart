import 'package:flutter/material.dart';
import 'package:salon_appointment/widgets/time.dart';
import './time.dart';
import './customer.dart';
import './services.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Time(),
            subtitle: Text('Beauty Salon'),
          )
        ],
      ),
    );
  }
}
