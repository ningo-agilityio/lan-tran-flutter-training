import 'package:collection/collection.dart';

class Isogram {
  // Put your code here
  bool isIsogram(String word) {
    if (word == '') {
      return true;
    }
    List<int> wordCharCode = List.from(
        word.toLowerCase().codeUnits); // lower case word to code point
    wordCharCode.removeWhere((element) =>
        element == 32 || element == 45); // remove spaces and hyphens
    List<int> wordCharCodeSet =
        wordCharCode.toSet().toList(); // remove duplicate code point
    if (ListEquality<int>().equals(wordCharCode, wordCharCodeSet)) {
      // first word compare to word after removing duplicate
      return true;
    } else {
      return false;
    }
  }
}
