class Pangram {
  // Put your code here
  bool isPangram(String sentence) {
    String lowerSentence = sentence.toLowerCase();
    List<String> splitSentence = lowerSentence.split('').toSet().toList();
    splitSentence.sort();
    String stringSentence = splitSentence.join();
    if (stringSentence.contains('abcdefghijklmnopqrstuvwxyz')) {
      return true;
    }
    return false;
  }
}
