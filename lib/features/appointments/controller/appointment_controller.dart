import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:salon_appointment/features/appointments/api/appointment_api.dart';
import 'package:salon_appointment/features/appointments/model/appointment.dart';

class AppointmentController {
  Future<List<Appointment>> load(DateTime date, String id) async {
    final appointments = await AppointmentApi.getAppointments(id);
    final dateMap = groupBy(appointments, (p0) => p0.date);
    final dateStr = DateFormat.yMd().format(date);

    for (final d in dateMap.keys) {
      if (DateFormat.yMd().format(d) == dateStr) {
        return dateMap[d]!;
      }
    }

    return [];
  }
}
