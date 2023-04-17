import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salon_appointment/features/auth/model/user.dart';

import '../../../core/constants/constants.dart';

class UserApi {
  static Future<List<User>> getUsers() async {
    final url = Uri.parse('$apiUrl/users');

    final response = await http.get(url);
    final responseData = (json.decode(response.body) as List)
        .map((user) => User.fromJson(user as Map<String, dynamic>))
        .toList();

    return responseData;
  }
}
