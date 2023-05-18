import 'package:salon_appointment/features/appointments/model/appointment.dart';

abstract class AppointmentEvent {
  const AppointmentEvent();
}

class AppointmentFetch extends AppointmentEvent {}

class AppointmentLoad extends AppointmentEvent {}

class AppointmentAdd extends AppointmentEvent {
  const AppointmentAdd({
    required this.appointment,
  });

  final Appointment appointment;
}

class AppointmentEdit extends AppointmentEvent {
  const AppointmentEdit({
    required this.appointment,
  });

  final Appointment appointment;
}

class AppointmentRemovePressed extends AppointmentEvent {
  const AppointmentRemovePressed({
    required this.appointmentId,
  });

  final String appointmentId;
}
