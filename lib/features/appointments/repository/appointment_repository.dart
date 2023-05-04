import 'package:intl/intl.dart';
import 'package:salon_appointment/core/utils.dart';
import 'package:salon_appointment/features/appointments/api/appointment_api.dart';
import 'package:salon_appointment/features/appointments/model/appointment.dart';

class AppointmentRepository {
  Future<List<Appointment>> load(DateTime date) async {
    final Map<String, dynamic> userJson = await getUser();

    final appointments = await AppointmentApi.getAppointments(userJson['id']);
    final dateStr = DateFormat.yMd().format(date);

    final List<Appointment> appointmentsOfDate = appointments
        .where((e) => DateFormat.yMd().format(e.date) == dateStr)
        .toList();

    return appointmentsOfDate;
  }
}
