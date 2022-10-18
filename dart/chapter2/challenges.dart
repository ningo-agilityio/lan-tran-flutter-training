import 'dart:math';

void main(List<String> args) {
  // challenge 1: Variables
  const myAge = 21;
  int dogs = 2;
  print(dogs += 1);

  // challenge 2: Make it compile
  int age =16;
  print(age);
  age = 30;
  print(age);

  // challenge 3: Compute the answer
  const x = 46;
  const y = 10;
  const answer1 = (x * 100) + y;
  print(answer1);
  const answer2 = (x * 100) + (y * 100);
  print(answer2);
  const answer3 = (x * 100) + (y / 10);
  print(answer3);

  // challenge 4: Average rating
  const rating1 = 12.0, rating2 = 3.0, rating3 = 5.0;
  const averageRating = (rating1 + rating2 + rating3) / 3;
  print(averageRating);

  // challenge 5: Quadratic equations
  const a = 2.0, b = 9.0, c = 7.0;
  double X = (-b + sqrt(b*b - 4*a*c)) / (2*a);
  final root1 = X;
  X = (-b - sqrt(b*b - 4*a*c)) / (2*a);
  final root2 = X;
  print('$root1 $root2');
}
