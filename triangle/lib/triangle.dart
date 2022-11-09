class Triangle {
  // Put your code here
  bool equilateral(double a, double b, double c) {
    return checkSides(a, b, c) && (a == b && b == c);
  }

  bool isosceles(double a, double b, double c) {
    return checkSides(a, b, c) && (a == b || b == c || c == a);
  }

  bool scalene(double a, double b, double c) {
    Set<double> scalene = {a, b, c}; // compare sides
    return checkSides(a, b, c) && scalene.length == 3;
  }

  bool checkSides(double a, double b, double c) {
    return (a > 0 && b > 0 && c > 0 && a + b >= c && b + c >= a && c + a >= b);
  }
}
