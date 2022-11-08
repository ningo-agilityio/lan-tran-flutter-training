class Luhn {
  // Put your code here
  bool valid(String digits) {
    if (digits.length == 0 || digits.length == 1 || digits == ' 0') {
      return false;
    }
    if (double.tryParse(digits.replaceAll(r' ', '')) == null) {
      return false;
    }
    List<String> digitStringList = digits.replaceAll(r' ', '').split('');
    List<int> digitsList = [];
    for (var digit in digitStringList) {
      digitsList.insert(0, int.parse(digit));
    }
    int sum = 0;
    for (int i = 0; i < digitsList.length; i++) {
      int duplicateDigit = digitsList[i] * 2;
      if (i.isOdd) {
        sum += (duplicateDigit > 9) ? duplicateDigit - 9 : duplicateDigit;
      } else {
        sum += digitsList[i];
      }
    }
    return (sum % 10 == 0);
  }
}
