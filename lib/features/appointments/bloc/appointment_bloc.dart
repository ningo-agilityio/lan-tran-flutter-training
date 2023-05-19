import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_appointment/features/appointments/repository/appointment_repository.dart';

import '../model/appointment.dart';
import 'appointment_event.dart';
import 'appointment_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  AppointmentBloc() : super(AppointmentInitial()) {
    on<AppointmentLoad>(_getAppointmentList);
  }

  Future<void> _getAppointmentList(
    AppointmentLoad event,
    Emitter<AppointmentState> emit,
  ) async {
    try {
      emit(AppointmentLoading());
      final List<Appointment> appointments =
          await AppointmentRepository.load(event.date);

      emit(
        AppointmentLoadSuccess(appointments: appointments),
      );
    } on Exception catch (e) {
      emit(AppointmentLoadError(error: e.toString()));
    }
  }
}
