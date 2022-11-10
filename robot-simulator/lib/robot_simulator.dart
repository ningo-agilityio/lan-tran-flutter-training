import 'package:robot_simulator/orientation.dart';
import 'package:robot_simulator/position.dart';

class Robot {
  // Put your code here
  Orientation orientation;
  Position position;
  Robot(this.position, this.orientation) {}
  void move(String commands) {
    commands.split('').forEach((command) {
      if (command == 'L') {
        turnLeft();
      } else if (command == 'R') {
        turnRight();
      } else {
        advanced();
      }
    });
  }

  void advanced() {
    switch (orientation) {
      case Orientation.east:
        position.x++;
        break;
      case Orientation.south:
        position.y--;
        break;
      case Orientation.west:
        position.x--;
        break;
      case Orientation.north:
        position.y++;
        break;
    }
  }

  void turnLeft() {
    switch (orientation) {
      case Orientation.east:
        orientation = Orientation.north;
        break;
      case Orientation.south:
        orientation = Orientation.east;
        break;
      case Orientation.west:
        orientation = Orientation.south;
        break;
      case Orientation.north:
        orientation = Orientation.west;
        break;
    }
  }

  void turnRight() {
    switch (orientation) {
      case Orientation.east:
        orientation = Orientation.south;
        break;
      case Orientation.south:
        orientation = Orientation.west;
        break;
      case Orientation.west:
        orientation = Orientation.north;
        break;
      case Orientation.north:
        orientation = Orientation.east;
        break;
    }
  }

  // Position get position => position;
  // Orientation get orientation => orientation;
}

void main(List<String> args) {
  final robot = Robot(Position(7, 3), Orientation.north);
  robot.move('RAALAL');
  print(robot.position);
  print(robot.orientation);
}
