import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:salon_appointment/models/appointment.dart';

const String apiUrl = 'https://63ab8e97fdc006ba60609b9b.mockapi.io/endpoint';

class AppointmentApi {
  static Future<List<Appointment>> getAppointments(String userId) async {
    final url = Uri.parse('$apiUrl/appointments?userId=$userId');
    late List<Appointment> responseData;

    final response = await http.get(url);

    try {
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
      if (kDebugMode) {
        print(e);
      }
    }

    return responseData;
  }
}
