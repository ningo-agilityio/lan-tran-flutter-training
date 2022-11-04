class DifferenceOfSquares {
  // Put your code here
  int sumOfSquares(int number) {
    int sum = 0;
    for (var i = 1; i < number + 1; i++) {
      sum += i * i;
    }
    return sum;
  }

  int squareOfSum(int number) {
    int sum = 0;
    for (var i = 1; i < number + 1; i++) {
      sum += i;
    }
    int square = sum * sum;
    return square;
  }

  int differenceOfSquares(int number) {
    return (squareOfSum(number) - sumOfSquares(number));
  }
}
