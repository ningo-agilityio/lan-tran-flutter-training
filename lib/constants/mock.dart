import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salon_appointment/models/user.dart';

// List<User> usersList = [];

class MockData {
  static void getUsers(List<User> usersList) async {
    const String usersApi =
        "https://63ab8e97fdc006ba60609b9b.mockapi.io/endpoint/users";
    final url = Uri.parse(usersApi);

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body) as List;
      final users = responseData.map((user) => User.fromJson(user)).toList();
      final json1 = jsonEncode(users);
      print(json1);
      // {
      //   return User(
      //     id: user['id'],
      //     name: user['name'],
      //     phoneNumber: user['phoneNumber'],
      //     avatarPath: user['avatarPath'],
      //     password: user['password'],
      //   );
      // }).toList();

      usersList = users;
    } else {
      throw Exception('Failed to load users.');
    }
  }
}
