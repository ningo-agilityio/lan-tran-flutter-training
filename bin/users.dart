import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'dart:math';
import 'dart:isolate';

List<String> rolesList = ["Editor", "Author", "Maintainer", "Subcriber"];

void main(List<String> args) {
  final user = Users( address: "7777 Mendez Plains",
    company: "Hall-Robbins PLC",
    email: "don85@johnson.com",
    phone: "(616) 865-4180",
    country: "USA",
    dateOfBirth: DateTime.utc(1988,5,23),
    id: Random().nextInt(10000),
    name: "Jordan Stevenson",
    role: "Editor",
  );

  List<Users> users = [user];
  createUser(users);
  print('---');
  print(users);
  print('---');
  findById(users);
  print('---');
  findByName(users);
  print('---');
  findByEmail(users);
  print('---');
  print('Filter:');
  // filterRole(users);
}

class Users {
  String address, company, email, phone, country, name, role;
  DateTime dateOfBirth;
  final int id;

  Users({
    required this.address,
    required this.company,
    required this.email,
    required this.phone,
    required this.country,
    required this.dateOfBirth,
    required this.id,
    required this.name,
    required this.role,
  });

  factory Users.fromJson(Map<String, Object?> jsonMap) {
    return Users(
        address: jsonMap['address'] as String,
        company: jsonMap['company'] as String,
        email: jsonMap['email'] as String,
        phone: jsonMap['phone'] as String,
        country: jsonMap['country'] as String,
        dateOfBirth: jsonMap['dateOfBirth'] as DateTime,
        id: jsonMap['id'] as int,
        name: jsonMap['name'] as String,
        role: jsonMap['role'] as String);
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'address: $address'
        '\ncompany: $company'
        '\nemail: $email'
        '\nphone: $phone'
        '\ncountry: $country'
        '\ndateOfBirth: $dateOfBirth'
        '\nid: $id'
        '\nname: $name'
        '\nrole: $role';
  }
}

void createUser(List<Users> users) {
  var user = Users(
    address: "7777 Mendez Plains",
    company: "Hall-Robbins PLC",
    email: "don85@johnson.com",
    phone: "(616) 865-4180",
    country: "USA",
    dateOfBirth: DateTime.parse('1988-05-23'),
    id: Random().nextInt(10000),
    name: "Jordan Stevenson",
    role: "Editor",
  );

  print('Create a user:\n');
  stdout.write('Address: ');
  String? address = stdin.readLineSync();
  stdout.write('Company: ');
  String? company = stdin.readLineSync();
  stdout.write('Email: ');
  String? email = stdin.readLineSync();
  stdout.write('Phone: ');
  String? phone = stdin.readLineSync();
  stdout.write('Country: ');
  String? country = stdin.readLineSync();
  stdout.write('Date of birth: ');
  String? dateOfBirth = stdin.readLineSync();
  // stdout.write('ID: ');
  // int? id = int.parse(stdin.readLineSync()!);
  // user.id = id;
  stdout.write('Name: ');
  String? name= stdin.readLineSync();
  stdout.write('Role: ');
  String? role = stdin.readLineSync();

  user.address = address!;
  user.company = company!;
  user.email = email!;
  user.phone = phone!;
  user.country = country!;
  user.dateOfBirth = DateTime.parse(dateOfBirth!);
  user.name = name!;
  if (rolesList.contains(role))
    user.role = role!;
  else {
    user.role = 'null';
  }

  return users.add(user);
}

void findById(List<Users> users) {
  stdout.write('Find By ID: ');
  int? findId = int.parse(stdin.readLineSync()!);

  users.forEach((user) {
    if (user.id == findId) return print(user);
  });
  return print('User not found.');
}

void findByName(List<Users> users) {
  stdout.write('Find By Name: ');
  String? findName = stdin.readLineSync();

  users.forEach((user) {
    if (user.name.contains(findName!)) return print(user);
  });
  return print('User not found.');
}

void findByEmail(List<Users> users) {
  stdout.write('Find By Email: ');
  String? findEmail = stdin.readLineSync();

  users.forEach((user) {
    if (user.email.contains(findEmail!)) return print(user);
  });
  return print('User not found.');
}

// void filterRole(List<Users> users) {
//   stdout.write('Email: ');
//   String? findRole = stdin.readLineSync();

//   users.forEach((user) {
//     if (user.role == findRole!) return print(user);
//   });
// }
