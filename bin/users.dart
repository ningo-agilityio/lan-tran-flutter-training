import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'dart:math';
import 'dart:isolate';

List<String> rolesList = ["Editor", "Author", "Maintainer", "Subscriber"];
var continueProgram = true;

void main(List<String> args) {
  final user = Users( address: "7777 Mendez Plains",
    company: "Hall-Robbins PLC",
    email: "don85@johnson.com",
    phone: "(616) 865-4180",
    country: "USA",
    dateOfBirth: DateTime.parse('19880523'),
    id: Random().nextInt(10000),
    name: "Jordan Stevenson",
    role: "Editor",
  );

  List<Users> users = [user];

  while (continueProgram) {
    createUser(users);
    print('---');
    readUsers(users);
    print('---');
    updateUser(users);
    print('---');
    findById(users);
    print('---');
    findByName(users);
    print('---');
    findByEmail(users);
    print('---');
    print('Filter:');
    filterRole(users);
    print('---');
    // print('Delete User:');
    // deleteUser(users);
    // print(users);
    continueProgramming();
  } 
}

// data class
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
    return '\n\nUser:'
        '\naddress: $address'
        '\ncompany: $company'
        '\nemail: $email'
        '\nphone: $phone'
        '\ncountry: $country'
        '\ndateOfBirth: $dateOfBirth'
        '\nid: $id'
        '\nname: $name'
        '\nrole: $role\n';
  }
}

// function: check to continue
void continueProgramming() {
  print('Do you want to continue? (Y/n)');
  var hint = stdin.readLineSync();
  switch(hint) {
    case 'Y': 
    case 'y':
      continueProgram = true;
      break;
    case 'n':
      continueProgram = false;
      break;
    default:
      continueProgram = false;
      print('Error!');
      break;
  }
}

// function: print all users
void readUsers(List<Users> users) {
  return print(users);
}

// function: create a user in form
void createUser(List<Users> users) {
  var user = Users(
    address: "7777 Mendez Plains",
    company: "Hall-Robbins PLC",
    email: "don85@johnson.com",
    phone: "(616) 865-4180",
    country: "USA",
    dateOfBirth: DateTime.parse('19880523'),
    id: Random().nextInt(10000),
    name: "Jordan Stevenson",
    role: "Editor",
  );

  // enter information of a user
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
  stdout.write('Date of birth (Format: YYYYMMDD): ');
  String? dateOfBirth = stdin.readLineSync();
  stdout.write('Name: ');
  String? name= stdin.readLineSync();
  stdout.write('Role: ');
  String? role = stdin.readLineSync();

  // add values to variable 'user'
  user.address = address!;
  user.company = company!;
  user.email = email!;
  user.phone = phone!;
  user.country = country!;
  user.dateOfBirth =  DateTime.parse(dateOfBirth!);
  user.name = name!;
  if (rolesList.contains(role))
    user.role = role!;
  else {
    user.role = 'null';
  }

  return users.add(user); // add a user to users list
}

// function: update an information of a user
void updateUser(List<Users> users) {
  print('Which user do you want to update?');
  print('Update ID: ');
  int? updateId = int.parse(stdin.readLineSync()!);
  Users user = users.firstWhere((user) => user.id == updateId);
  print('\nWhich property do you want to update?');
  print(
    '1. Address\n'
    '2. Company\n'
    '3. Email\n'
    '4. Phone\n'
    '5. Country\n'
    '6. Date Of Birth\n'
    '7. Name\n'
    '8. Role\n'
    '0. Exit\n'
  );

  int? select = int.parse(stdin.readLineSync()!);
  switch(select) {
    case 1:
      print('\nAddress: ');
      user.address = stdin.readLineSync()!;
      break;
    case 2:
      print('\nCompany: ');
      user.company = stdin.readLineSync()!;
      break;
    case 3:
      print('\nEmail: ');
      user.email = stdin.readLineSync()!;
      break;
    case 4:
      print('\nPhone: ');
      user.phone = stdin.readLineSync()!;
      break;
    case 5:
      print('\nCountry: ');
      user.country = stdin.readLineSync()!;
      break;
    case 6:
      print('\nDate Of Birth: ');
      user.dateOfBirth = DateTime.parse(stdin.readLineSync()!);
      break;
    case 7:
      print('\nName: ');
      user.name = stdin.readLineSync()!;
      break;
    case 8:
      print('\nRole (Editor, Author, Maintainer, Subscriber): ');
      user.role = stdin.readLineSync()!;
      break;
    case 0:
      print('\nClosed.');
      break;
  }
  
  return print(user);
}

// function: delete a user by id
void deleteUser(List<Users> users) {
  stdout.write('Find By ID: ');
  int? deleteId = int.parse(stdin.readLineSync()!);

  return users.removeWhere((user) => user.id == deleteId); // delete the user has the input id
}

// function: find a user by id
void findById(List<Users> users) {
  stdout.write('Find By ID: ');
  int? findId = int.parse(stdin.readLineSync()!);

  for (var user in users) {
    if (user.id == findId) return print(user); // print the user has the input id
  }
  return print('User not found.');
}

// find a user by name
void findByName(List<Users> users) {
  stdout.write('Find By Name: ');
  String? findName = stdin.readLineSync();

  for (var user in users) {
    if (user.name.contains(findName!)) return print(user); // print the user has the input name
  }
  return print('User not found.');
}

// find a user by email
void findByEmail(List<Users> users) {
  stdout.write('Find By Email: ');
  String? findEmail = stdin.readLineSync();

  for (var user in users) {
    if (user.email.contains(findEmail!)) return print(user); // print the user has the input email
  }
  return print('User not found.');
}

// function: filter users by roles
void filterRole(List<Users> users) {
  stdout.write('Filter By Role: ');
  String? findRole = stdin.readLineSync();

  users.forEach((user) {
    if (user.role == findRole!) return print(user); // print every user has the input role
  });
}
