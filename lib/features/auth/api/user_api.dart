import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:salon_appointment/features/auth/model/user.dart';

import '../../../constants.dart';

class UserApi {
  static Future<List<User>> getUsers() async {
    final url = Uri.parse('$apiUrl/users');
    late List<User> responseData;

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        responseData = (json.decode(response.body) as List)
            .map((user) => User.fromJson(user as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to load users.');
      }
    } catch (e) {
      throw Exception(e);
    }
    return responseData;
  }
}
