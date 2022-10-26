void main(List<String> args) {
  final orange = Fruit('orange');
  print(orange.describeColor);
  final watermelon = Watermelon('green');
  print(watermelon.describeColor);

  final sodaBottle = Bottle();
  print(sodaBottle.open());

  final sumCalculator = Calculator();
  sumCalculator.sum(13, 45);
}

// extends
class Fruit {
  String color;
  Fruit(this.color);

  String get describeColor => '$color';
}

class Melon extends Fruit {
  Melon (String color)
    : super(color);
}

class Watermelon extends Melon {
  Watermelon (String color)
    : super(color);

  @override
  // TODO: implement describeColor
  String get describeColor => 'Watermelon: $color'; // override method 'describeColor' to vary the output
}

class Cantaloupe extends Melon {
  Cantaloupe (String color)
    : super(color);
}

// interface: implements
abstract class Bottle {
  String? open();

  factory Bottle() => SodaBottle(); // factory to return SodaBottle instance
}

class SodaBottle implements Bottle {

  @override
  String? open() {
    // TODO: implement open
    return 'Fizz fizz';
  }
}

// mixins
class Calculator with Adder{}

mixin Adder{
  void sum(int a, int b) {
    print(a + b);
  }
}
