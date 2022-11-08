// Put your code here
bool isValid(String digits) {
  List<String> characters = digits.split('');
  characters.removeWhere((element) => element == '-');
  if (characters.length != 10) {
    return false;
  }
  if (characters.last == 'X') {
    characters.remove('X');
    characters.add('10');
  }
  if (double.tryParse(characters.join()) == null) {
    return false;
  }
  int formula = 0;
  List<int> digit = [];
  for (var element in characters) {
    digit.add(int.parse(element));
  }
  for (int i = 0; i < digit.length; i++) {
    formula += digit[i] * (10 - i);
  }
  if (formula % 11 == 0) {
    return true;
  } else {
    return false;
  }
}

void main(List<String> args) {
  List<String> characters = '3-598-21507-A'.split('');
  characters.removeWhere((element) => element == '-');
  print(characters);
  characters.removeWhere((element) => element == 'X');
  print(characters);
  print(isValid('3-598-21507-A'));
}
