class BeerSong {
  // Put your code here
  List<String> recite(int bottles, int verse) {
    List<String> recite = [];
    do {
      if (bottles == 2) {
        recite.add('2 bottles of beer on the wall, 2 bottles of beer.');
        recite.add(
            'Take one down and pass it around, 1 bottle of beer on the wall.');
      } else if (bottles == 1) {
        recite.add('1 bottle of beer on the wall, 1 bottle of beer.');
        recite.add(
            'Take it down and pass it around, no more bottles of beer on the wall.');
      } else if (bottles == 0) {
        recite.add(
            'No more bottles of beer on the wall, no more bottles of beer.');
        recite.add(
            'Go to the store and buy some more, 99 bottles of beer on the wall.');
      } else {
        recite.add(
            '$bottles bottles of beer on the wall, $bottles bottles of beer.');
        recite.add(
            'Take one down and pass it around, ${bottles - 1} bottles of beer on the wall.');
      }
      if (verse > 1) {
        recite.add('');
      }
      bottles--;
      verse--;
    } while (verse > 0);
    return recite;
  }
}
