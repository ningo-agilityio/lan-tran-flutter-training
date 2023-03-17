import 'package:flutter/material.dart';

class User {
  User({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.avatarPath,
    required this.password,
  });

  String id;
  String name;
  String phoneNumber;
  String avatarPath;
  String password;

  factory User.fromJson(Map<String, dynamic> user) {
    return User(
      id: user['id'] as String,
      name: user['name'] as String,
      phoneNumber: user['phoneNumber'] as String,
      avatarPath: user['avatarPath'] as String,
      password: user['password'] as String,
    );
  }
}
