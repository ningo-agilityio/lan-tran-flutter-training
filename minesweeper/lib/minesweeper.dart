class Minesweeper {
  // Put your code here.
  var board = <String>[];
  var annotatedBoard = <String>[];

  Minesweeper(this.board) {
    generateGrid();
  }

  void generateGrid() {
    for (int x = 0; x < board.length; x++) {
      // create an empty row
      String row = '';
      for (int y = 0; y < board[x].length; y++)
        // add elements to row[x]
        // '*' not changed
        row +=
            board[x][y] == '*' ? board[x][y] : currentPosition(x, y, board[x]);
      // add row to annotatedBoard
      annotatedBoard.add(row);
    }
  }

  String currentPosition(int x, int y, String thisRow) {
    final startY = y - 1 >= 0 ? y - 1 : 0;
    final endY = y + 1 < thisRow.length ? y + 2 : thisRow.length;
    int score = 0;
    // row contains point
    String isAdjacent = thisRow.substring(startY, endY);
    // row above point if point not in the first row
    if (x != 0) {
      isAdjacent += board[x - 1].substring(startY, endY);
    }
    // row under point if point not in the last row
    if (x + 1 < board.length) {
      isAdjacent += board[x + 1].substring(startY, endY);
    }
    // count '*' around point
    score = RegExp(r'\*').allMatches(isAdjacent).length;
    // if score equals 0 return space else return String '$score'
    return score == 0 ? ' ' : score.toString();
  }

  // get annotatedBoard
  List<String> get annotated => annotatedBoard;
}
