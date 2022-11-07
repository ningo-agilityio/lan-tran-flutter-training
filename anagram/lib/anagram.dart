import 'package:collection/collection.dart';

class Anagram {
  // Put your code here
  List<String> findAnagrams(String target, List<String> candidates) {
    List<String> findAnagrams = [];
    List<int> targetCharCode = List.from(target.codeUnits);
    targetCharCode.sort();
    for (int i = 0; i < candidates.length; i++) {
      List<int> candidateCharCode = List.from(candidates[i].codeUnits);
      candidateCharCode.sort();
      if (ListEquality<int>().equals(targetCharCode, candidateCharCode)) {
        findAnagrams.add(candidates[i]);
      }
    }
    return findAnagrams;
  }
}
