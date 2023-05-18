import 'package:salon_appointment/features/appointments/model/appointment.dart';

abstract class AppointmentEvent {
  const AppointmentEvent();
}

class AppointmenFetch extends AppointmentEvent {}

class AppointmentLoad extends AppointmentEvent {}

class AppointmentAdd extends AppointmentEvent {}

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
