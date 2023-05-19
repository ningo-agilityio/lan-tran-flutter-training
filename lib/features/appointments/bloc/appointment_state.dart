part of 'appointment_bloc.dart';

abstract class AppointmentState {
  const AppointmentState();
}

class AppointmentInitial extends AppointmentState {}

class AppointmentLoading extends AppointmentState {}

class AppointmentLoadSuccess extends AppointmentState {
  const AppointmentLoadSuccess({this.appointments});

  final List<Appointment>? appointments;
}

class AppointmentLoadError extends AppointmentState {
  const AppointmentLoadError({this.error});

  final String? error;
}

class AppointmentAddSuccess extends AppointmentState {}

class AppointmentAddError extends AppointmentState {
  const AppointmentAddError({this.error});

  final String? error;
}
