
import 'dart:math';
void main(List<String> args) {

  // challeng 1: Teacher's grading
  num attendancePoint = 90, homeworkPoint = 80, examPoint = 94;
  var gradePoint = (attendancePoint * 20 + homeworkPoint * 30 + examPoint * 50) ~/ 100;
  print(gradePoint); // 89

  // challenge 2: Same same, but different
  const twoCountries = '🇹🇩🇷🇴';
  print(twoCountries.runes); // (127481, 127465, 127479, 127476)

  // challenge 3: How many?
  const vote = 'Thumbs up!👍';
  print(vote.length); // 12
  print(vote.codeUnits.length); // 12
  print(vote.runes.length); // 11
  
  // create a new project, open file pubspec.yaml to set dependencies (or run command 'dart pub get' interminal) and import package characters (page 116).
  // print length of Unicode grapheme clusters.

  // challenge 4: Find the error
  const name = 'Ray';
  // name += ' Wenderlich'; // name is type 'const' so cannot be changed.

  // challenge 5: What type?
  const value = 10 / 2; // type of value is double

  // challenge 6: In summary
  const number = 10;
  const multiplier = 5;
  final summary = '$number \u00D7 $multiplier = ${number * multiplier}';
  print(summary); // 10 × 5 = 50
}
