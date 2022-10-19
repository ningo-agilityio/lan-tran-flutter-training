import 'dart:math';

void main(List<String> args) {
  // chalenge 1: find the error
  const firstName = 'Bob';
  if (firstName == 'Bob') {
    const lastName = 'Smith';
  } else if (firstName == 'Ray') {
    const lastName = 'Wenderlich';
  }
  // final fullName = firstName + ' ' + lastName; // lastName is a local constant

  // challenge 2: Boolean challenge
  true && true; // true
  false || false; // false
  (true && 1 != 2) || (4 > 3 && 100 < 1); // true
  ((10 / 2) > 3) && ((10 % 2) == 0); // true

  // challenge 3: Next power of two: powerOfTwo is a power of 2 that above or equal given number
  const number = 45;
  var powerOfTwo = 1;
  while (powerOfTwo < number) {
    powerOfTwo *= 2;
  }
  print(powerOfTwo); // 64

  // challenge 4: Fibonacci: nth fibonacci
  const n = 9;
  var fibonacci = [1,1];
  for (int i = 2; i < n; i++) {
    fibonacci.add(fibonacci[i-2] + fibonacci[i-1]);
  }
  print(fibonacci); // [1, 1, 2, 3, 5, 8, 13, 21, 34]

  // challenge 5: How many times?: 6 iterations happened, sum increments 0, 1, 3, 6, 10, 15
  var sum = 0;
  var counter = 0;
  for (var i = 0; i <= 5; i++) {
    sum += i;
    counter++;
  } 
  print(sum); // 15
  print(counter); // 6

  // challenge 6: The final countdown: countdown from 10 to 0
  var countDown = 10;
  do {
    print(countDown);
    countDown--;
  } while (countDown >= 0);

  // challenge 7: Print a sequence
  var sequence = 0.0;
  do {
    print(sequence.toStringAsFixed(1));
    sequence += 0.1;
  } while (sequence <= 1.0);
}
