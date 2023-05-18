import 'package:salon_appointment/features/appointments/model/appointment.dart';

abstract class AppointmentEvent {
  const AppointmentEvent();
}

class FetchAppointment extends AppointmentEvent {}

class LoadAppointment extends AppointmentEvent {}

class AddAppointment extends AppointmentEvent {}

class EditAppointment extends AppointmentEvent {
  const EditAppointment({
    required this.appointment,
  });

  final Appointment appointment;
}

class RemoveAppointment extends AppointmentEvent {
  const RemoveAppointment({
    required this.appointmentId,
  });

  final String appointmentId;
}
