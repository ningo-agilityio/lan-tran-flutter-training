import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/api/user_api.dart';
import '../../features/auth/model/user.dart';

class UserStorage {
  /// Save a [List] of [String] user encode
  static Future<void> setUsers() async {
    final List<User> users = await UserApi.getUsers();
    final List<String> usersEncode = [];
    for (final e in users) {
      usersEncode.add(jsonEncode(e.toJson()));
    }

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('users', usersEncode);
  }

  /// Returns a [List] of [User] from storage
  static Future<List<User>> getUsers() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? usersEncode = prefs.getStringList('users');
    final List<User> users = [];
    for (final e in usersEncode!) {
      users.add(User.fromJson(jsonDecode(e)));
    }
    return users;
  }

  /// Returns a [Map] of a user from storage
  static Future<void> setUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userEncode = jsonEncode(user.toJson());
    await prefs.setString('user', userEncode);
  }

  /// Returns a [Map] of a user from storage
  static Future<Map<String, dynamic>> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userStr = prefs.getString('user') ?? '{}';
    return jsonDecode(userStr);
  }
}
