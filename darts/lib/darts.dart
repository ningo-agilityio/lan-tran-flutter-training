import 'dart:math';

class Darts {
  // Put your code here
  int score(double x, double y) {
    double distance = sqrt(x * x + y * y);
    if (distance <= 1.0) {
      return 10;
    } else if (distance <= 5.0) {
      return 5;
    } else if (distance <= 10.0) {
      return 1;
    } else {
      return 0;
    }
  }
}

void main(List<String> args) {
  print(Darts().score(-9, 9));
}
