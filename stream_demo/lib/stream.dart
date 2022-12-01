import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class ColorStream {
  late Stream colorStream;

  Stream<Color> getColors() async* {
    final List<Color> colors = [
      Colors.blueGrey,
      Colors.amber,
      Colors.deepPurple,
      Colors.lightBlue,
      Colors.teal
    ];

    yield* Stream.periodic(Duration(seconds: 1), (int t) {
      int index = t % 5;
      return colors[index];
    });
  }
}

// class NumberStream {
//   StreamController<int> controller = StreamController<int>();

//   addNumberToSink(int newNumber) {
//     controller.sink.add(newNumber);
//   }

//   close() {
//     controller.close();
//   }
// }

class NumberStream {
  StreamController<int> controller = StreamController<int>();

  Stream<int> getNumbers() async* {
    yield* Stream.periodic(Duration(seconds: 1), (int t) {
      Random random = Random();
      int myNum = random.nextInt(10);
      return myNum;
    });
  }
}
