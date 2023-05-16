import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/appointments/api/appointment_api.dart';
import '../../features/appointments/model/appointment.dart';

class AppointmentStorage {
  /// Save a [List] of [String] appointment encode
  static Future<void> setAppointments() async {
    final List<Appointment> appointments =
        await AppointmentApi.getAppointments();

    final List<String> appointmentsEncode =
        appointments.map((e) => jsonEncode(e.toJson())).toList();

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('appointments', appointmentsEncode);
  }

  /// Returns a [List] of [Appointment] from storage
  static Future<List<Appointment>> getAppointments() async {
    await setAppointments();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<Appointment> appointments = prefs
        .getStringList('appointments')!
        .map((e) => Appointment.fromJson(jsonDecode(e)))
        .toList();

    return appointments;
  }
}
