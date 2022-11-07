class ResistorColorDuo {
  // Put your code here
  int value(List<String> colors) {
    int value = 0;
    for (int i = 0; i < 2; i++) {
      switch (colors[i]) {
        case 'black':
          value = value * 10 + 0;
          break;
        case 'brown':
          value = value * 10 + 1;
          break;
        case 'red':
          value = value * 10 + 2;
          break;
        case 'orange':
          value = value * 10 + 3;
          break;
        case 'yellow':
          value = value * 10 + 4;
          break;
        case 'green':
          value = value * 10 + 5;
          break;
        case 'blue':
          value = value * 10 + 6;
          break;
        case 'violet':
          value = value * 10 + 7;
          break;
        case 'grey':
          value = value * 10 + 8;
          break;
        case 'white':
          value = value * 10 + 9;
          break;
      }
    }
    return value;
  }
}
