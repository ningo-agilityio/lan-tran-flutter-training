// Your code here
String translate(String words) {
  List<String> translate = [];

  bool vowel(String word) =>
      RegExp(r"(^a)|(^e)|(^i)|(^o)|(^u)|(^xr)|(^yt)").hasMatch(word);
  bool twoConsonant(String word) =>
      RegExp(r"(^ch)|(^sh)|(^th)|(^qu)|(^rh)").hasMatch(word);
  bool threeConsonant(String word) => RegExp(r"(^sch)|(^thr)").hasMatch(word);

  words.split(' ').forEach((word) {
    if (vowel(word)) {
      translate.add(word + 'ay');
    }
    if (threeConsonant(word)) {
      if (word.startsWith('qu', 3)) {
        translate.add(word.substring(5) + word.substring(0, 5) + 'ay');
      } else {
        translate.add(word.substring(3) + word.substring(0, 3) + 'ay');
      }
    } else if (twoConsonant(word)) {
      if (word.startsWith('qu', 2)) {
        translate.add(word.substring(4) + word.substring(0, 4) + 'ay');
      } else {
        translate.add(word.substring(2) + word.substring(0, 2) + 'ay');
      }
    } else if (!vowel(word)) {
      if (word.startsWith('qu', 1)) {
        translate.add(word.substring(3) + word.substring(0, 3) + 'ay');
      } else {
        translate.add(word.substring(1) + word.substring(0, 1) + 'ay');
      }
    }
  });

  return translate.join(' ');
}
