import 'dart:core';
import 'dart:io';
import 'dart:math';
import 'package:intl/intl.dart';

var continueProgram = true;
List<User> users = [];
List<String> addresses = [
  '78 Hoa Son 6',
  '75 Hoa Son 3',
  '549 Tran Thi Ly',
  '119 Ngo Van So',
  '53 Ton Dan'
];

List<String> companies = ['Agility', 'Axon Active', 'Enclave', 'VNG', 'KMS'];
List<String> emails = [
  'lantrannk@gmail.com',
  'nhitran@gmail.com',
  'ni.ngo@gmail.com',
  'vuint@gmail.com',
  'baochauleanh@gmail.com'
];

List<String> phones = [
  '0794542105',
  '0905929922',
  '0946439269',
  '0905494951',
  '0934923012'
];
List<String> countries = [
  'Vietnam',
  'Canada',
  'America',
  'Australia',
  'Britain'
];
List<String> dateOfBirths = [
  '20010902',
  '20000504',
  '19830928',
  '19850826',
  '19820709'
];
List<String> names = ['Lan Tran', 'Nhi Tran', 'Hung Le', 'Ni Ngo', 'Dung Tran'];
List<String> roles = ["Editor", "Author", "Maintainer", "Subscriber"];

void main(List<String> args) {
  final user = User(
    address: "7777 Mendez Plains",
    company: "Hall-Robbins PLC",
    email: "don85@johnson.com",
    phone: "6168654180",
    country: "USA",
    dateOfBirth: DateTime.parse("19880523"),
    id: Random().nextInt(8999) + 1000,
    name: "Jordan Stevenson",
    role: "Editor",
  );

  users.add(user);

  while (continueProgram) {
    menuFunctions();
    menuOption();
    continueProgramming();
  }
}

// data class
class User {
  String address, company, email, phone, country, name, role;
  DateTime dateOfBirth;
  final int id;

  User({
    this.address = '',
    this.company = '',
    required this.email,
    required this.phone,
    this.country = '',
    required this.dateOfBirth,
    required this.id,
    required this.name,
    this.role = '',
  })  : assert(email.contains('@') && email.contains('.')),
        assert(phone.length == 10),
        _email = email,
        _phone = phone,
        _dateOfBirth = dateOfBirth,
        _id = id,
        _name = name;

  set setEmail(String email) => _email = email;
  set setPhone(String phone) => _phone = phone;
  set setDate(DateTime dateOfBirth) => _dateOfBirth = dateOfBirth;
  set setId(int id) => _id = id;
  set setName(String name) => _name = name;

  String _email, _phone, _name;
  DateTime _dateOfBirth;
  late final int _id;

  // factory User.fromJson(Map<String, Object?> jsonMap) {
  //   return User(
  //       address: jsonMap['address'] as String,
  //       company: jsonMap['company'] as String,
  //       email: jsonMap['email'] as String,
  //       phone: jsonMap['phone'] as String,
  //       country: jsonMap['country'] as String,
  //       dateOfBirth: jsonMap['dateOfBirth'] as DateTime,
  //       id: jsonMap['id'] as int,
  //       name: jsonMap['name'] as String,
  //       role: jsonMap['role'] as String);
  // }

  // Map<String, Object?> toJson() {
  //   final Map<String, Object?> usersMap = {};
  //   usersMap['address'] = address;
  //   usersMap['company'] = company;
  //   usersMap['email'] = _email;
  //   usersMap['phone'] = _phone;
  //   usersMap['country'] = country;
  //   usersMap['dateOfBirth'] = _dateOfBirth;
  //   usersMap['id'] = _id;
  //   usersMap['name'] = _name;
  //   usersMap['role'] = role;

  //   return usersMap;
  // }

  @override
  String toString() {
    // implement toString
    return '\n\nUser:'
        '\naddress: $address'
        '\ncompany: $company'
        '\nemail: $_email'
        '\nphone: ${formatPhone(_phone)}'
        '\ncountry: $country'
        '\ndateOfBirth: ${formatDate(_dateOfBirth)}'
        '\nid: $_id'
        '\nname: $_name'
        '\nrole: $role\n';
  }
}

// function: check to continue
void continueProgramming() {
  print('\nDo you want to continue? (Y/n)');
  var hint = stdin.readLineSync();
  switch (hint) {
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

// menu to select function want to execute
void menuFunctions() {
  print('\n1. Read Users List');
  print('\n2. Create User');
  print('\n3. Update User');
  print('\n4. Delete User');
  print('\n5. Find User By ID');
  print('\n6. Find User By Name');
  print('\n7. Find User By Email');
  print('\n8. Filter Users By Role');
  print('\n---');
}

// select an option to execute
void menuOption() {
  stdout.write('\nSelect an option: ');
  int? option;
  try {
    option = int.parse(
        stdin.readLineSync()!); // enter an integer to select an option in menu
  } catch (error) {
    print('\n$error');
  }
  print('\n');

  switch (option) {
    case 1: // execute function read users list
      readUser(users);
      print('\n---');
      break;
    case 2: // execute function create a user
      createUser(users);
      print('\nCreate Finished.');
      print('\n---');
      break;
    case 3: // execute function update a user
      updateUser(users);
      print('\nUpdate Finished.');
      print('\n---');
      break;
    case 4: // execute function delete a user
      deleteUser(users);
      print('\nDelete Finished.');
      print('\n---');
      break;
    case 5: // execute function find a user by id
      int findResult = findById(users);
      if (findResult == -1) {
        print('User not found');
      } else {
        print(users[findResult]);
      }
      print('\n---');
      break;
    case 6: // execute function find a user by name
      findByName(users);
      print('\n---');
      break;
    case 7: // execute function find a user by email
      findByEmail(users);
      print('\n---');
      break;
    case 8: // execute function filter users by roles
      filterRole(users);
      print('\n---');
      break;
  }
}

// function: print all users
void readUser(List<User> users) {
  return print(users);
}

// function: create a user in form
void createUser(List<User> users) {
  print('Create a user:\n');

  var user = User(
      address: addresses[Random().nextInt(5)],
      company: companies[Random().nextInt(5)],
      email: emails[Random().nextInt(5)],
      phone: phones[Random().nextInt(5)],
      country: countries[Random().nextInt(5)],
      dateOfBirth: DateTime.parse(dateOfBirths[Random().nextInt(5)]),
      id: Random().nextInt(8999) + 1000,
      name: names[Random().nextInt(5)],
      role: roles[Random().nextInt(4)]);

  // String? email, phone, dateOfBirth, name;

  // print('\nEmail: ');
  // email = stdin.readLineSync();
  // var exp = RegExp(r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$');
  // while (email == '' || !exp.hasMatch(email!)) {
  //   print('Invalid Email.');
  //   print('\nEmail: ');
  //   email = stdin.readLineSync();
  // }
  // user.setEmail = email;

  // print('\nPhone: ');
  // phone = stdin.readLineSync();
  // while (phone == '' || phone!.length != 10) {
  //   print('Invalid Phone.');
  //   print('\nPhone: ');
  //   phone = stdin.readLineSync();
  // }
  // user.setPhone = phone;

  // print('\nDate Of Birth: ');
  // dateOfBirth = stdin.readLineSync();
  // while (dateOfBirth == '' || dateOfBirth!.length != 8) {
  //   print('Invalid Date Of Birth.');
  //   print('\nDate Of Birth ("yyyymmdd"): ');
  //   dateOfBirth = stdin.readLineSync();
  //   try {
  //     user.setDate = DateTime.parse(dateOfBirth!);
  //   } catch (error) {
  //     print('\n$error\n');
  //     print('---');
  //   }
  // }

  // print('\nName: ');
  // name = stdin.readLineSync();
  // while (name == '') {
  //   print('Invalid Name.');
  //   print('\nName: ');
  //   name = stdin.readLineSync();
  // }
  // user.setName = name!;

  return users.add(user);
}

// function: update an information of a user
void updateUser(List<User> users) {
  print('Which user do you want to update?');
  // define the user want to update
  User userUpdated;
  // execute function findById for index
  int updateId = findById(users);

  if (updateId == -1) {
    return print(
        'Not exist ID.'); // ID not found then close function updateUser
  } else {
    userUpdated = users[updateId]; // set found user to userUpdated
  }

  print('\nWhich property do you want to update?');
  print('1. Address: ${userUpdated.address}\n'
      '2. Company: ${userUpdated.company}\n'
      '3. Email: ${userUpdated.email}\n'
      '4. Phone: ${formatPhone(userUpdated.phone)}\n'
      '5. Country: ${userUpdated.country}\n'
      '6. Date Of Birth: ${formatDate(userUpdated.dateOfBirth)}\n'
      '7. Name: ${userUpdated.name}\n'
      '8. Role: ${userUpdated.role}\n'
      '0. Exit\n');

  print('\nUpdate Property: ');
  // enter an integer to select a property want to update
  int? select;
  try {
    select = int.parse(
        stdin.readLineSync()!); // enter an integer to select a property
  } catch (error) {
    print('\n$error');
  }

  switch (select) {
    case 1: // update Address
      print('\nAddress: ');
      userUpdated.address = stdin.readLineSync()!;
      break;
    case 2: // Update Company
      print('\nCompany: ');
      userUpdated.company = stdin.readLineSync()!;
      break;
    case 3: // Update Email
      print('\nEmail: ');
      String? email = stdin.readLineSync();
      var exp = RegExp(r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$');
      // Email Validation
      if (exp.hasMatch(email!)) {
        userUpdated.setEmail = email;
      } else {
        print('\nInvalid Email.');
      }
      break;
    case 4: // Update Phone
      print('\nPhone: ');
      String? phone = stdin.readLineSync();
      // Phone Validation: length = 10
      if (phone!.length == 10) {
        userUpdated.setPhone = phone;
      } else {
        print('\nInvalid Phone.');
      }
      break;
    case 5: // Update Country
      print('\nCountry: ');
      userUpdated.country = stdin.readLineSync()!;
      break;
    case 6: // Update Date Of Birth
      print('\nDate Of Birth: ');
      String? dateOfBirth = stdin.readLineSync();

      if (dateOfBirth!.isNotEmpty) {
        userUpdated.setDate = DateTime.parse(dateOfBirth);
      } else {
        print('\nInvalid Date.');
      }
      break;
    case 7: // Update Name
      print('\nName: ');
      userUpdated.setName = stdin.readLineSync()!;
      break;
    case 8: // Update Role
      print('\nRole (Editor, Author, Maintainer, Subscriber): ');
      userUpdated.role = stdin.readLineSync()!;
      break;
    case 0: // Close function
      print('\nClosed.');
      break;
    default:
      print('\nNot exist option.');
      break;
  }

  return print(userUpdated);
}

// function: delete a user by id
void deleteUser(List<User> users) {
  int deleteIndex = findById(users); // execute function findById for index
  if (deleteIndex == -1) {
    return print('\nNot exist ID.\n'); // not exist index
  } else {
    users.removeAt(deleteIndex); // remove the user has input id
    return print(users);
  }
}

// function: find a user by id
int findById(List<User> users) {
  stdout.write('\nEnter an ID: ');
  String? stringId = stdin.readLineSync(); // input a string
  int? findId;
  int index;

  if (stringId != null) {
    findId = int.tryParse(stringId); // convert input from string to int
    index = users.indexWhere(
        (user) => user.id == findId); // find index the user has input id
    return index; // return index if id exists
  } else {
    return -1; // return -1 if not exist id
  }
}

// find a user by name
void findByName(List<User> users) {
  stdout.write('Find By Name: ');
  String? findName = stdin.readLineSync();

  for (var user in users) {
    if (user.name.contains(findName!)) {
      return print(user);
    } // print the user has the input name
  }
  return print('User not found.');
}

// find a user by email
void findByEmail(List<User> users) {
  stdout.write('Find By Email: ');
  String? findEmail = stdin.readLineSync();

  for (var user in users) {
    if (user.email.contains(findEmail!)) {
      return print(user);
    } // print the user has the input email
  }
  return print('User not found.');
}

// function: filter users by roles
void filterRole(List<User> users) {
  stdout.write('Filter By Role: ');
  String? findRole = stdin.readLineSync();
  int flag = 0;

  for (var user in users) {
    if (user.role == findRole!) {
      flag = 1; // role exist
      print(user);
    } // print every user has the input role
  }
  if (flag == 0) {
    return print(
        'Not exist role.'); // if no user printed then role not exist in users list
  }
}

String formatPhone(String phone) {
  String formattedPhone = phone.replaceAllMapped(RegExp(r'(\d{3})(\d{3})(\d+)'),
      (match) => '(${match[1]}) ${match[2]}-${match[3]}');
  return formattedPhone;
}

// function: format date to "dd MMM yyyy" (EX: 23 May 1988)
String formatDate(DateTime date) {
  var newFormat = DateFormat("dd MMM yyyy"); // create a new date format
  String formattedDate = newFormat.format(date); // format input
  return formattedDate; // return formatted date
}
