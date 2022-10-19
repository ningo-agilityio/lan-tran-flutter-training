void main(List<String> args) {
  print(youAreWonderful(name: 'Lan')); // You're wonderful, Lan. 30 people think so.

  // anonymous function: change the function youAreWonderful into an anonymous function
  final wonderful = (String name, int numberPeople) {
    return 'You\'re wonderful, $name. $numberPeople people think so.';
  };
  print(wonderful('Lan', 10));

  // Anonymous functions in forEach loops
  const people = ['Chris', 'Tiffani', 'Pablo'];
  people.forEach((name) { 
    print('You\'re wonderful, $name.');
  });

  // arrow syntax: change the forEach loop to use arrow syntax
  people.forEach((name) => print('You\'re wonderful, $name.'));
}

// function with 2 optional parameters (name, numberPeople), name is required
String youAreWonderful({required String name, int numberPeople = 30}) {
  return 'You\'re wonderful, $name. $numberPeople people think so.'; 
}
