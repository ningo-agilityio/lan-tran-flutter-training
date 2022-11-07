class Allergies {
  // Put your code here
  bool allergicTo(String item, int score) {
    if (score == 0) {
      return false;
    }
    List<String> allergyItems = list(score);
    if (allergyItems.contains(item)) {
      return true;
    } else {
      return false;
    }
  }

  List<String> list(int score) {
    List<String> base2score = score.toRadixString(2).split('');
    List<String> scoreString = [];
    for (var score in base2score) {
      scoreString.insert(0, score);
    }
    while (scoreString.length <= 7) {
      scoreString.add('0');
    }
    List<String> items = [
      'eggs',
      'peanuts',
      'shellfish',
      'strawberries',
      'tomatoes',
      'chocolates',
      'pollen',
      'cats'
    ];
    List<String> allergic = [];
    for (var i = 0; i < scoreString.length; i++) {
      if (scoreString[i] == '1') {
        allergic.add(items[i]);
      }
    }
    return allergic;
  }
}
