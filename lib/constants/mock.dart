import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salon_appointment/models/appointment.dart';
import 'package:salon_appointment/models/user.dart';

const String apiUrl = "https://63ab8e97fdc006ba60609b9b.mockapi.io/endpoint";

class MockData {
  static Future<List<User>> getUsers() async {
    final url = Uri.parse("$apiUrl/users");

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final responseData = (json.decode(response.body) as List)
          .map((user) => User.fromJson(user))
          .toList();
      return responseData;
    } else {
      throw Exception('Failed to load users.');
    }
  }

  static Future<List<Appointment>> getAppointments() async {
    final url = Uri.parse("$apiUrl/appointments");

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final responseData = (json.decode(response.body) as List)
          .map((appointment) => Appointment.fromJson(appointment))
          .toList();
      return responseData;
    } else {
      throw Exception('Failed to load appointments.');
    }
  }
}
