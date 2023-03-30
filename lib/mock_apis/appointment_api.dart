import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salon_appointment/models/appointment.dart';
import 'package:salon_appointment/models/user.dart';

const String apiUrl = 'https://63ab8e97fdc006ba60609b9b.mockapi.io/endpoint';

class AppointmentApi {
  static Future<List<Appointment>> getAppointments() async {
    final url = Uri.parse('$apiUrl/appointments');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final responseData = (json.decode(response.body) as List)
          .map(
            (appointment) =>
                Appointment.fromJson(appointment as Map<dynamic, dynamic>),
          )
          .toList();
      return responseData;
    } else {
      throw Exception('Failed to load appointments.');
    }
  }

  static Future<Appointment> addAppointment() async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      // headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      // },
      // body: jsonEncode(<String, dynamic>{
      //   'title': title,
      // }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Appointment.fromJson(
          jsonDecode(response.body) as Map<dynamic, dynamic>);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create appointment.');
    }
  }
}
