import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:salon_appointment/models/user.dart';

List<User> usersList = [];

class MockData {
  static Future<void> getUsers() async {
    const String usersApi =
        "https://63ab8e97fdc006ba60609b9b.mockapi.io/endpoint/users";
    final url = Uri.parse(usersApi);

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body) as List;
      final users = responseData.map((user) {
        return User(
          id: user['id'] as String,
          name: user['name'] as String,
          phoneNumber: user['phoneNumber'] as String,
          avatarPath: user['avatarPath'] as String,
          password: user['password'] as String,
        );
      }).toList();

      usersList = users;
    } else {
      throw Exception('Failed to load users.');
    }
  }
}
