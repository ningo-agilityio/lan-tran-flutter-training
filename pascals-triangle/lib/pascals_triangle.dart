class PascalsTriangle {
  // Put your code here
  List<Object> rows(int number) {
    List<List<int>> pascalTriangle = [];
    if (number == 0) {
      return [];
    }
    for (int i = 0; i < number; i++) {
      final row =
          List.filled(i + 1, 1); // initiate a list include (i+1) elements '1'
      for (int j = 1; j <= i ~/ 2; ++j) {
        row[j] =
            row[i - j] = pascalTriangle.last[j - 1] + pascalTriangle.last[j];
      }
      pascalTriangle.add(List.unmodifiable(row));
    }
    return pascalTriangle;
  }
}
