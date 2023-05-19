import '../model/appointment.dart';

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

class AppointmentAdded extends AppointmentState {}

class AppointmentAddError extends AppointmentState {
  const AppointmentAddError({this.error});

  final String? error;
}

class AppointmentRemoved extends AppointmentState {}

class AppointmentRemoveError extends AppointmentState {
  const AppointmentRemoveError({this.error});

  final String? error;
}
