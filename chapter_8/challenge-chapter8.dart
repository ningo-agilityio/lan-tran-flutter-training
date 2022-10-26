 
 
void main(List<String> args) {
 
  // Challenge 1: A unique request
  final text = "Write a function that takes a paragraph of text and returns a collection of unique String characters that the text contains.";
  print(paragraphOfText(text)); // [W, r, i, t, e,  , a, f, u, n, c, o, h, k, s, p, g, x, d, l, q, S, .]
 
  // Challenge 2: Counting on you
  print(countOfCharacter(text));
  print(text.length);
 
  // Challenge 3: Mapping users
  final users = <Users>[];
  users.add(Users(1, 'Lan'));
  users.add(Users(2, 'Nhi'));
  users.add(Users(3, 'Mia'));
  print(users.toList());
  print(usersList(users));

 
}
 
// Challenge 1
List paragraphOfText(String text) {
  List characters = text.split(''); // convert Text to List
  final uniqueString = characters.toSet(); // remove same characters
  return uniqueString.toList(); // output is a list of unique characters
}

// Challenge 2
Map<String, int> countOfCharacter(String text){
  Map<String, int> countOfCharacter = {};
  List<String> characters = text.split(''); // convert Text to List
  final uniqueString = characters.toSet(); // remove same characters

  for (int i = 0; i < uniqueString.length; i++) {
    countOfCharacter[uniqueString.elementAt(i)] = uniqueString.elementAt(i).allMatches(text).length;
  } // add counting to map for each character 
 
  return countOfCharacter;
}

// Challenge 3
class Users {
  final int id;
  final String name;

  Users(this.id, this.name);
}

List<Map<String,Object>> usersList(List<Users> users){
  var userList = <Map<String,Object>>[];
  var userMap = <String, Object>{};

  for (Users user in users) {
    userMap = {
      'id': user.id,
      'name':user.name
    }; // add a map of user

    userList.add(userMap); // add map to list
  }

  return userList;
}