import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salon_appointment/features/appointments/model/appointment.dart';

import '../../../core/constants/constants.dart';

class AppointmentApi {
  static Future<List<Appointment>> getAppointments(String userId) async {
    final url = Uri.parse('$apiUrl/appointments?userId=$userId');

    final response = await http.get(url);
    final responseData = (json.decode(response.body) as List)
        .map((appointment) =>
            Appointment.fromJson(appointment as Map<dynamic, dynamic>))
        .toList();

    return responseData;
  }

  static Future<void> addAppointment(Appointment appointment) async {
    final url = Uri.parse('$apiUrl/appointments');
    final headers = {'Content-Type': 'application/json'};
    final map = appointment.toJson();
    final body = json.encode(map);

    await http.post(url, body: body, headers: headers).then((response) {});
  }

  static Future<void> updateAppointment(Appointment appointment) async {
    final url = Uri.parse('$apiUrl/appointments/${appointment.id}');
    final headers = {'Content-Type': 'application/json'};
    final map = appointment.toJson();
    final body = json.encode(map);

    await http.put(url, body: body, headers: headers);
  }

  static Future<void> deleteAppointment(Appointment appointment) async {
    final url = Uri.parse('$apiUrl/appointments/${appointment.id}');

    await http.delete(url);
  }
}
