import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salon_appointment/models/user.dart';

// List<User> usersList = [];

class MockData {
  static Future<List<User>> getUsers() async {
    const String usersApi =
        "https://63ab8e97fdc006ba60609b9b.mockapi.io/endpoint/users";
    final url = Uri.parse(usersApi);

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
}
