import 'dart:math';

void main(List<String> args) {

  // Challenge 1: Random nothings
  int? result = random();
  if (result == null) {
    result = 0;
  }
  print(result); // 0 or 42

  // Challenge 2: Naming customs
  final ray = Name(givenName: 'Ray', surName: 'Wenderlich', surnameIsFirst: false);
  final lan = Name(givenName: 'Lan', surName: 'Tran', surnameIsFirst: true);
  final nhi = Name(givenName: 'Nhi');
  print(ray.toString()); // Ray Wenderlich
  print(lan.toString()); // Tran Lan
  print(nhi.toString()); // Nhi
}

// function: return randomly 42 or null
int? random() {
  var random = [null, 42];
  return random[Random().nextInt(2)]; // return randomly 42 or null
}

// class: name of people
class Name {
  String givenName;
  String? surName; // not everyone has a surname
  bool surnameIsFirst;

  Name({required this.givenName, this.surName, this.surnameIsFirst = true}); // constructor

  @override
  String toString() {
    // TODO: implement toString
    if (surName == null) {
      return '$givenName'; // not have surname
    }
    if (surnameIsFirst) {
      return '$surName $givenName'; // surname first
    }
    return '$givenName $surName'; // surname last
  }
}
