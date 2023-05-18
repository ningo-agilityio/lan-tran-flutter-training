import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_appointment/core/storage/appointment_storage.dart';
import 'package:salon_appointment/core/storage/user_storage.dart';
import 'package:salon_appointment/features/appointments/api/appointment_api.dart';

import '../model/appointment.dart';
import 'appointment_event.dart';
import 'appointment_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  AppointmentBloc() : super(AppointmentInitial()) {
    on<AppointmenFetch>((event, emit) => _getAppointmentList(emit));
  }

  Future<void> _getAppointmentList(Emitter emit) async {
    try {
      emit(AppointmentLoading());
      final Map<String, dynamic> user = await UserStorage.getUser();
      final List<Appointment> appointments = user['isAdmin']
          ? await AppointmentStorage.getAppointments()
          : await AppointmentApi.getAppointmentsOfUser(user['id']);

      emit(
        AppointmentLoadSuccess(appointments: appointments),
      );
    } on Exception catch (e) {
      emit(AppointmentLoadError(error: e.toString()));
    }
  }
}
