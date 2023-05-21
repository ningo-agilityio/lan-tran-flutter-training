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

class AppointmentAdding extends AppointmentState {}

class AppointmentAdded extends AppointmentState {}

class AppointmentAddError extends AppointmentState {
  const AppointmentAddError({this.error});

  final String? error;
}

class AppointmentEditting extends AppointmentState {}

class AppointmentEditted extends AppointmentState {}

class AppointmentEditError extends AppointmentState {
  const AppointmentEditError({this.error});

  final String? error;
}

class AppointmentRemoving extends AppointmentState {}

class AppointmentRemoved extends AppointmentState {}

class AppointmentRemoveError extends AppointmentState {
  const AppointmentRemoveError({this.error});

  final String? error;
}
