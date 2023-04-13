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
      date: DateTime.parse(appointment['date'] as String),
      startTime: DateTime.parse(appointment['startTime'] as String),
      endTime: DateTime.parse(appointment['endTime'] as String),
      services: appointment['services'] as String,
      description: appointment['description'] as String,
      isCompleted: appointment['isCompleted'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'date': date.toIso8601String(),
        'startTime': startTime.toIso8601String(),
        'endTime': endTime.toIso8601String(),
        'services': services,
        'description': description,
        'isCompleted': isCompleted,
      };

  final String services;
  final DateTime date;
  final DateTime startTime;
  final DateTime endTime;
  final String userId;
  final String description;
  final bool isCompleted;
}
