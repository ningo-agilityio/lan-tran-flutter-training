import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/appointments/api/appointment_api.dart';
import '../../features/appointments/model/appointment.dart';

class AppointmentStorage {
  /// Save a [List] of [String] appointment encode
  static Future<void> setAppointments(String userId) async {
    final List<Appointment> appointments =
        await AppointmentApi.getAppointments(userId);

    final List<String> appointmentsEncode = [];
    for (final e in appointments) {
      appointmentsEncode.add(jsonEncode(e.toJson()));
    }

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('appointments', appointmentsEncode);
  }

  /// Returns a [List] of [Appointment] from storage
  static Future<List<Appointment>> getAppointments() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? appointmentsEncode =
        prefs.getStringList('appointments');

    final List<Appointment> appointments = [];
    for (final e in appointmentsEncode!) {
      appointments.add(Appointment.fromJson(jsonDecode(e)));
    }
    return appointments;
  }
}
