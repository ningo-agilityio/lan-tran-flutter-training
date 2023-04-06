import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:salon_appointment/models/appointment.dart';

import 'constants.dart';

class AppointmentApi {
  static Future<List<Appointment>> getAppointments(String userId) async {
    final url = Uri.parse('$apiUrl/appointments?userId=$userId');
    late List<Appointment> responseData = [];

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

  static Future<void> addAppointment(Appointment appointment) async {
    final url = Uri.parse('$apiUrl/appointments');

    final headers = {'Content-Type': 'application/json'};

    // Map<dynamic, dynamic> match = {
    //   'date': '2023-04-06',
    //   'startTime': '2023-04-06T15:58:14.719Z',
    //   'endTime': '2023-04-06T17:21:45.867Z',
    //   'userId': '1',
    //   'services': 'services 1',
    //   'description':
    //       'There is a distinction between a beauty salon and a hair salon and although many small businesses do offer both sets of treatments; beauty salons provide extended services related to skin health, facial aesthetic, foot care, nail manicures, aromatherapy — even meditation, oxygen therapy, mud baths and many other services.',
    //   'isCompleted': false,
    // };

    final map = appointment.toJson();

    final body = json.encode(map);

    try {
      await http.post(url, body: body, headers: headers).then((response) {
        if (kDebugMode) {
          print(response.body);
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
