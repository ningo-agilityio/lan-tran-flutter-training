import 'dart:math';

void main(List<String> args) {
  
  // Challenge 1: Prime time
  if (checkPrime(45)) {
    print('Prime number');
  } else print('Not a prime number'); // Not a prime number

  // Challenge 2: Can you repeat that?: square of 2 four times
  print(repeatTask(4, 2)); // 65536

}

// function: check a number is a prime number or not
bool checkPrime(int number) {
  if (number <= 1) {
    return false;
  }
  if (number == 2) {
    return true;
  }
  for (int i = 2; i < sqrt(number) ; i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}

// function: square of input 'times' times
Function repeatTask = (int times, int input) {
  var square = input;
  for (int i = 0; i < times; i++) {
    square *= square;
  }
  return square;
};