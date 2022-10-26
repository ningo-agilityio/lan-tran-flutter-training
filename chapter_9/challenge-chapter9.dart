

void main(List<String> args) {

  // challenge 1
  final roy = Platypus(22);
  final karry = Platypus(23);
  final jackson = Platypus(21);
  
  final platynusList = [roy, karry, jackson]; // make a list of Platynus
  platynusList.sort(); // sort by weight of platynus

  platynusList.forEach((platynus) => print('${platynus.weight}')); 

  // challenge 2
  final note = NoteTakingApp();
  print(note.allNotes());
  print(note.findNote(3));

  // challlenge 3
  final timeRemaining = 3.minutes;
  print(timeRemaining);
}

// Challenge 1: Heavy monotremes
abstract class Animal {
  bool isAlive = true;
  void eat();
  void move();

  @override
  String toString() {
    return "I'm a $runtimeType";
  }
}

class Platypus extends Animal implements Comparable {
  double weight; // add weight field
  Platypus(this.weight);

  void layEggs() {
    print('Plop plop');
  }

  @override
  void eat() {
    // TODO: implement eat
    print('Munch munch');
  }

  @override
  void move() {
    // TODO: implement move
    print('Glide glide');
  }
  
  @override
  int compareTo(other) { // override compareTo method for class Comparable
    // TODO: implement compareTo
    if (weight > other.weight) {
      return 1;
    } else if (weight < other.weight) {
      return -1;
    }
    return 0;
  }
}

// Challenge 2: Fake notes
// create an interface
abstract class NoteTakingApp {

  factory NoteTakingApp() => FakeSqlDatabase();

  String findNote(int id);
  List<String> allNotes();
}

// implement the interface
class FakeSqlDatabase implements NoteTakingApp { 
  @override
  List<String> allNotes() {
    // TODO: implement allNotes
    return [
      'Meow meow meow',
      'Moo moo moo',
      'Quack quack quack'
    ];
  }
  
  @override
  String findNote(int id) {
    // TODO: implement findNote
    return 'Platynus is very adorable.';
  }
}

// Challenge 3: Time to code
extension on int{
  Duration get minutes {
    return Duration(minutes: this);
  }
}