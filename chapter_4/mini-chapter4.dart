import 'dart:math';

// enums
enum AudioState {
  playing,
  paused,
  stopped,
}

void main(List<String> args) {

  // boolean: myAge is a teenager or not
  const myAge = 21;
  const isTeenager = (myAge >= 13 && myAge <= 19);
  print(isTeenager); // false

  // boolean: myAge and maryAge are both teenagers or not
  const maryAge = 30;
  const bothTeenagers = (isTeenager && (maryAge >= 13 && maryAge <= 19));
  print(bothTeenagers); // false

  // boolean: ray is reader or not
  const reader = 'Lan Tran';
  const ray = 'Ray Wenderlich';
  const rayIsReader = reader == ray;
  print(rayIsReader); // false

  // the if statement: myAge is a teenager or not
  // myAge = 21;
  if (myAge >= 13 && myAge <= 19) {
    print('Teenager');
  } else {
    print('Not a teenager');
  } // Not a teenager

  // ternary conditional operator: myAge is a teenager or not
  var answer = (myAge >= 13 && myAge <= 19) ? 'Teenager' : 'Not a teenager';
  print(answer); // Not a teenager

  /* enum AudioState {
    playing,
    paused,
    stopped,
  } */
  // switch case: the audio state
  const audioState = AudioState.playing;
  switch (audioState) {
    case AudioState.playing:
      print('The audio is playing.');
      break;
    case AudioState.paused:
      print('The audio paused.');
      break;
    case AudioState.stopped:
      print('The audio stopped.');
      break;
  } // The audio is playing.

  // loops
  // while loop: count from 0 to 9
  print('While Loop:');
  var counter = 0;
  while (counter < 10) {
    print('counter is $counter');
    counter++;
  }

  // for loop: square of number from 1 to 10
  print('For Loop:');
  for (int i = 1; i <= 10; i++) {
    print('Square of $i is ${i*i}');
  }

  // for-in loop: square root of number in list numbers = [1,2,4,7]
  print('For-in Loop:');
  const numbers = [1, 2, 4, 7];
  for (var number in numbers) {
    print('The square root of $number is ${sqrt(number)}');
  }

  // for-each loop: square root of number in list numbers = [1,2,4,7]
  print('For-each Loop:');
  numbers.forEach((number) => print('The square root of $number is ${sqrt(number)}'));
} 
