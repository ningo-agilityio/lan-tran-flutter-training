import 'dart:core';
import 'dart:io';
import 'dart:math';

List<String> rolesList = ["Editor", "Author", "Maintainer", "Subscriber"];
var continueProgram = true;
// var newFormat = DateFormat('dd MMM yyyy');
List<User> users = [];

void main(List<String> args) {
  final user = User(
      email: "don85@johnson.com",
      phone: "6168654180",
      dateOfBirth: DateTime.parse('19880523'),
      id: Random().nextInt(10000),
      name: "Jordan Stevenson");

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

  String get getEmail => _email;
  set setEmail(String email) => _email = email;
  String get getPhone => _phone;
  set setPhone(String phone) => _phone = phone;
  DateTime get getDate => _dateOfBirth;
  set setDate(DateTime dateOfBirth) => _dateOfBirth = dateOfBirth;
  int get getId => _id;
  set setId(int id) => _id = id;
  String get getName => _name;
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
        '\nphone: ${_phone.replaceAllMapped(RegExp(r'(\d{3})(\d{3})(\d+)'), (match) => '(${match[1]}) ${match[2]}-${match[3]}')}'
        '\ncountry: $country'
        '\ndateOfBirth: $_dateOfBirth'
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
  int? option = int.parse(
      stdin.readLineSync()!); // enter an integer to select an option in menu
  print('\n');

  switch (option) {
    case 1: // execute function read users list
      readUser(users);
      print('\n---');
      break;
    case 2: // execute function create a user
      createUser(users);
      print('\nCreate Successful.');
      print('\n---');
      break;
    case 3: // execute function update a user
      updateUser(users);
      print('\nUpdate Successful.');
      print('\n---');
      break;
    case 4: // execute function delete a user
      deleteUser(users);
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
  // define an empty user
  var user = User(
    address: '',
    company: '',
    email: '',
    phone: '',
    country: '',
    dateOfBirth: DateTime.now(),
    id: Random().nextInt(10000),
    name: '',
    role: '',
  );

  // enter information of a user
  print('Create a user:\n');
  stdout.write('Address: ');
  String? address = stdin.readLineSync(); // enter a string for address
  stdout.write('Company: ');
  String? company = stdin.readLineSync(); // enter a string for company
  stdout.write('Email: ');
  String? email = stdin.readLineSync(); // enter a string for email
  stdout.write('Phone: ');
  String? phone = stdin.readLineSync(); // enter a string for phone
  stdout.write('Country: ');
  String? country = stdin.readLineSync(); // enter a string for phone
  stdout.write('Date of birth (Format: YYYYMMDD): ');
  String? dateOfBirth = stdin.readLineSync()!; // enter a string for dateOfBirth
  stdout.write('Name: ');
  String? name = stdin.readLineSync(); // enter a string for name
  // stdout.write('Role: ');
  // String? role = stdin.readLineSync(); // enter a string for role

  // add values to variable 'user'
  user.address = address!;
  user.company = company!;
  // email validation: example@gmail.com
  var exp = RegExp(r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$');
  if (exp.hasMatch(email!)) {
    user.setEmail = email;
  }
  // phone validation: length = 10
  // phone format: (xxx) xxx-xxxx
  if (phone!.length == 10) {
    user.setPhone = phone.replaceAllMapped(RegExp(r'(\d{3})(\d{3})(\d+)'),
        (match) => '(${match[1]}) ${match[2]}-${match[3]}');
  }
  user.country = country!;
  // date of birth: set now() as default
  if (dateOfBirth.isEmpty) {
    user.setDate = DateTime.now();
  } else {
    user.setDate = DateTime.parse(dateOfBirth);
  }
  user.setName = name!;
  // role validation: must be in rolesList
  user.role = rolesList[Random().nextInt(4)];

  return users.add(user); // add a user to users list
}

// function: update an information of a user
void updateUser(List<User> users) {
  print('Which user do you want to update?');
  // define the user want to update
  User userUpdated;
  // execute function findById
  int updateId = findById(users);

  if (updateId == -1) {
    return print(
        'Not exist ID.'); // ID not found then close function updateUser
  } else {
    userUpdated = users[updateId]; // set found user to userUpdated
  }

  print('\nWhich property do you want to update?');
  print('1. Address\n'
      '2. Company\n'
      '3. Email\n'
      '4. Phone\n'
      '5. Country\n'
      '6. Date Of Birth\n'
      '7. Name\n'
      '8. Role\n'
      '0. Exit\n');

  // enter an integer to select a property want to update
  int? select = int.parse(stdin.readLineSync()!);
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
      //Email Validation
      var exp = RegExp(r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$');
      if (exp.hasMatch(email!)) {
        userUpdated.setEmail = email;
      }
      break;
    case 4: // Update Phone
      print('\nPhone: ');
      String? phone = stdin.readLineSync();
      // Phone Validation: length = 10
      if (phone!.length == 10) {
        userUpdated.setPhone = phone.replaceAllMapped(
            // Phone Format: (xxx) xxx-xxxx
            RegExp(r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$'),
            (match) => '(${match[1]}) ${match[2]}-${match[3]}');
      }
      break;
    case 5: // Update Country
      print('\nCountry: ');
      userUpdated.country = stdin.readLineSync()!;
      break;
    case 6: // Update Date Of Birth
      print('\nDate Of Birth: ');
      String? dateOfBirth = stdin.readLineSync();
      if (dateOfBirth!.isEmpty) {
        userUpdated.setDate = DateTime.now();
      } else {
        userUpdated.setDate = DateTime.parse(dateOfBirth);
      }
      break;
    case 7:
      print('\nName: ');
      userUpdated.name = stdin.readLineSync()!;
      break;
    case 8:
      print('\nRole (Editor, Author, Maintainer, Subscriber): ');
      userUpdated.role = stdin.readLineSync()!;
      break;
    case 0:
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
  // stdout.write('Delete ID: ');
  // int? deleteId = int.parse(stdin.readLineSync()!);

  // for (var user in users) {
  //   if (user.id == deleteId) {
  //     return users.removeWhere((user) => user.id == deleteId);
  //   } // delete the user has the input id
  // }

  int deleteId = findById(users);
  if (deleteId == -1) {
    return print('\nNot exist ID.\n');
  } else {
    users.removeWhere((user) => user.id == deleteId);
    return print('\nDelete Successful.');
  }
}

// function: find a user by id
int findById(List<User> users) {
  stdout.write('\nEnter an ID: ');
  String? stringId = stdin.readLineSync();
  int? findId;
  int index;

  if (stringId != null) {
    findId = int.tryParse(stringId);
    index = users.indexWhere((user) => user.id == findId);
    return index;
  } else {
    return -1;
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

  for (var user in users) {
    if (user.role == findRole!) {
      print(user);
    } // print every user has the input role
  }
}
