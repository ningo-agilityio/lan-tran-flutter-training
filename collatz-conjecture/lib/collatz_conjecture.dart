class CollatzConjecture {
  // Put your code here
  int steps(int number) {
    int step = 0;
    int result = number;
    if (result > 0) {
      while (result > 0) {
        if (result == 1) {
          break;
        }
        if (result.isEven) {
          result = (result / 2).round();
          step++;
        } else {
          result = result * 3;
          result += 1;
          step++;
        }
      }
    } else {
      throw new ArgumentError('Only positive integers are allowed');
    }
    return step;
  }
}

void main(List<String> args) {
  print(CollatzConjecture().steps(12));
}
