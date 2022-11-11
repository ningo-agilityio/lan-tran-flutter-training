class Diamond {
  // Put your code here
  static const alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  int mid = 0;
  int size = 0;
  List<String> rows(String letter) {
    mid = alphabet.indexOf(letter);
    size = mid * 2 + 1;
    List<String> output = new List.generate(mid + 1, getRow);
    Iterable<String> lastPart = output.reversed.skip(1);
    return [...output, ...lastPart];
  }

  String getRow(int value) {
    String letter = alphabet.substring(value, value + 1);
    List<String> emptyRow = new List.filled(size, " ");
    emptyRow[mid - value] = letter;
    emptyRow[mid + value] = letter;
    return emptyRow.join("");
  }
}
