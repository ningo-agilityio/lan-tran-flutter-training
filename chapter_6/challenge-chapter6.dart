import 'dart:math';

void main(List<String> args) {
  var student = Student('Bert', '', 95); // create student Bert using class Student
  print(student.toString());
  student = Student('Ernie', '', 85); // create student Ernie using class Student
  print(student.toString());

  var sphere = Sphere(radius: 12);
  print('Volume: ' + sphere.volume.toStringAsFixed(2));
  print('Surface Area: ' + sphere.surfaceArea.toStringAsFixed(2));
}

// challenge 1: 
class Student{
  final String firstName, lastName;
  int grade;

  Student(this.firstName, this.lastName, this.grade); // constructor initializes all the properties

  @override
  String toString() {
    // TODO: implement toString
    return 'Name: $firstName $lastName, Grade: $grade'; // format printing
  }
}

class Sphere{
  static const pi = 3.1415; // static constant pi
  
  Sphere({required int radius}) // named parameter 'radius'
    : assert(radius > 0), // positive radius
      _radius = radius;

  final int _radius; // private radius

  num get volume => 4 * pi * pow(_radius, 3) / 3; // get volume
  num get surfaceArea => 4 * pi * pow(_radius, 2); // get surface area
}