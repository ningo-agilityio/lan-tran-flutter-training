import 'package:intl/intl.dart';

import '../../../core/storage/user_storage.dart';
import '../api/appointment_api.dart';
import '../model/appointment.dart';

class AppointmentRepository {
  Future<List<Appointment>> load(DateTime date) async {
    final Map<String, dynamic> userJson = await UserStorage.getUser();

    final appointments = await AppointmentApi.getAppointments(userJson['id']);
    final dateStr = DateFormat.yMd().format(date);

    final List<Appointment> appointmentsOfDate = appointments
        .where((e) => DateFormat.yMd().format(e.date) == dateStr)
        .toList()
      ..sort((a, b) => a.startTime.compareTo(b.startTime));

    return appointmentsOfDate;
  }
}
