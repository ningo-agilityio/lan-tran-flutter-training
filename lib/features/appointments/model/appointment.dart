import 'package:flutter/material.dart';

class Appointment {
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
      userId: appointment['userId'] as String,
      date: DateTime.parse(appointment['date'].toString()),
      startTime: TimeOfDay.fromDateTime(
          DateTime.parse(appointment['startTime'].toString())),
      endTime: TimeOfDay.fromDateTime(
          DateTime.parse(appointment['endTime'].toString())),
      services: appointment['services'] as String,
      description: appointment['description'] as String,
      isCompleted: appointment['isCompleted'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'date': date.toString(),
        'startTime': startTime.toString(),
        'endTime': endTime.toString(),
        'services': services,
        'description': description,
        'isCompleted': isCompleted,
      };

  final String services;
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String userId;
  final String description;
  final bool isCompleted;
}
