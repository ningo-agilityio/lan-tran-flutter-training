class WordCount {
  // Put your code here
  Map<String, int> countWords(String sentence) {
    Map<String, int> countWords = {};
    var words = sentence
        .replaceAll(RegExp(r"[.,?!:;" "@&@\$%\^]+"), " ") // remove punctuation
        .replaceAll(RegExp(r"^\'"), " ") // remove \' at the first
        .replaceAll(RegExp(r"\'$"), " ") // remove \' at the last
        .trim()
        .toLowerCase()
        .split(' ');

    words.removeWhere((element) => element == '');
    for (int i = 0; i < words.length; i++) {
      countWords[words[i]] =
          (countWords.containsKey(words[i])) ? countWords[words[i]]! + 1 : 1;
    }
    return countWords;
  }
}
