import 'package:flutter/material.dart';

class Appointment {
  final String services;
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String userId;
  final String description;
  final bool isCompleted;

  Appointment({
    required this.userId,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.services,
    required this.description,
    this.isCompleted = false,
  });

  factory Appointment.fromJson(Map<dynamic, dynamic> appointment) {
    return Appointment(
      userId: appointment['userId'],
      date: DateTime.parse(appointment['date'].toString()),
      startTime: TimeOfDay.fromDateTime(
          DateTime.parse(appointment['startTime'].toString())),
      endTime: TimeOfDay.fromDateTime(
          DateTime.parse(appointment['endTime'].toString())),
      services: appointment['services'],
      description: appointment['description'],
      isCompleted: appointment['isCompleted'] as bool,
    );
  }
}
