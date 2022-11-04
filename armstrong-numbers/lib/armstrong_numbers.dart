import 'dart:math';

class ArmstrongNumbers {
  // Put your code here
  bool isArmstrongNumber(int number) {
    int powerNum = number.toString().length;
    List<int> numbers = [];
    int dividedNumber = number;
    for (var i = 0; i < powerNum; i++) {
      numbers.add(dividedNumber % 10);
      dividedNumber ~/= 10;
    }
    int sum = 0;
    for (var num in numbers) {
      sum += pow(num, powerNum).toInt();
    }
    if (sum == number) {
      return true;
    } else {
      return false;
    }
  }
}
