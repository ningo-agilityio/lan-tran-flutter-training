import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:salon_appointment/models/appointment.dart';

import 'constants.dart';

class AppointmentApi {
  static Future<List<Appointment>> getAppointments(String userId) async {
    final url = Uri.parse('$apiUrl/appointments?userId=$userId');
    late List<Appointment> responseData = [];

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        responseData = (json.decode(response.body) as List)
            .map(
              (appointment) =>
                  Appointment.fromJson(appointment as Map<dynamic, dynamic>),
            )
            .toList();
      } else {
        throw Exception('Failed to load appointments.');
      }
    } catch (e) {
      throw Exception(e);
    }

    return responseData;
  }

  static Future<void> addAppointment(Appointment appointment) async {
    final url = Uri.parse('$apiUrl/appointments');
    final headers = {'Content-Type': 'application/json'};
    final map = appointment.toJson();
    final body = json.encode(map);

    try {
      await http.post(url, body: body, headers: headers).then((response) {
        if (kDebugMode) {
          print(response.body);
        }
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
