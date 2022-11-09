class Acronym {
  // Put your code here
  String abbreviate(String phrase) {
    String acronym = '';
    List<String> words = phrase
        .replaceAll(RegExp(r'-'), ' ')
        .replaceAll(RegExp(r'[^A-Za-z0-9\s]'), '')
        .split(' ');
    for (var word in words) {
      if (word != '') {
        acronym += word.split('').first;
      }
    }
    return acronym.toUpperCase();
  }
}
