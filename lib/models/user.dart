// class User {
//   User({
//     required this.id,
//     required this.name,
//     required this.phoneNumber,
//     required this.avatarPath,
//     required this.password,
//   });

//   String id;
//   String name;
//   String phoneNumber;
//   String avatarPath;
//   String password;

//   factory User.fromJson(Map<String, dynamic> user) {
//     return User(
//       id: user['id'] =! null ? user['id'] as String : '',
//       name: user['name'] as String,
//       phoneNumber: user['phoneNumber'] as String,
//       avatarPath: user['avatarPath'] as String,
//       password: user['password'] as String,
//     );
//   }
// }

// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

class User {
  User({
    required this.id,
    required this.phoneNumber,
    required this.name,
    required this.avatar,
    required this.password,
  });

  String id;
  String phoneNumber;
  String name;
  String avatar;
  String password;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] != null ? json["id"] as String : '',
        phoneNumber:
            json["phoneNumber"] != null ? json["phoneNumber"] as String : '',
        name: json["name"] != null ? json["name"] as String : '',
        avatar: json["avatar"] != null ? json["avatar"] as String : '',
        password: json["password"] != null ? json["password"] as String : '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phoneNumber": phoneNumber,
        "name": name,
        "avatar": avatar,
        "password": password,
      };
}
