// Put your code here
int score(String word) {
  List<String> characters = word.split('');
  List<String> value1Char = [
    'A',
    'a',
    'E',
    'e',
    'I',
    'i',
    'O',
    'o',
    'U',
    'u',
    'L',
    'l',
    'N',
    'n',
    'R',
    'r',
    'S',
    's',
    'T',
    't'
  ];
  List<String> value2Char = ['D', 'd', 'G', 'g'];
  List<String> value3Char = ['B', 'b', 'C', 'c', 'M', 'm', 'P', 'p'];
  List<String> value4Char = ['F', 'f', 'H', 'h', 'V', 'v', 'W', 'w', 'Y', 'y'];
  List<String> value5Char = ['K', 'k'];
  List<String> value8Char = ['J', 'j', 'X', 'j'];
  List<String> value10Char = ['Q', 'q', 'Z', 'z'];
  int scrabbleScore = 0;
  for (String char in characters) {
    if (value1Char.contains(char)) {
      scrabbleScore += 1;
    } else if (value2Char.contains(char)) {
      scrabbleScore += 2;
    } else if (value3Char.contains(char)) {
      scrabbleScore += 3;
    } else if (value4Char.contains(char)) {
      scrabbleScore += 4;
    } else if (value5Char.contains(char)) {
      scrabbleScore += 5;
    } else if (value8Char.contains(char)) {
      scrabbleScore += 8;
    } else if (value10Char.contains(char)) {
      scrabbleScore += 10;
    }
  }
  return scrabbleScore;
}
