import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:salon_appointment/models/user.dart';

import 'constants.dart';

class UserApi {
  static Future<List<User>> getUsers() async {
    final url = Uri.parse('$apiUrl/users');
    late List<User> responseData;

    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        responseData = (json.decode(response.body) as List)
            .map((user) => User.fromJson(user as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to load users.');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return responseData;
  }
}
