class MatchingBrackets {
  // Put your code here
  bool isPaired(String brackets) {
    if (brackets.length == 0) {
      return true;
    }

    var exp = RegExp(r'[^\(\)\{\}\[\]]');
    List<String> bracketsList = [];

    for (String bracket in brackets.replaceAll(exp, '').split('')) {
      if (['[', '(', '{'].contains(bracket)) {
        bracketsList.add(bracket);
      } else {
        if (bracketsList.length == 0) {
          return false;
        }
        String current_bracket = bracketsList.last;
        bracketsList.removeAt(bracketsList.length - 1);
        if (current_bracket == '(') {
          if (bracket != ')') {
            return false;
          }
        }
        if (current_bracket == '{') {
          if (bracket != '}') {
            return false;
          }
        }
        if (current_bracket == '[') {
          if (bracket != ']') {
            return false;
          }
        }
      }
    }
    return (bracketsList.length == 0);
  }
}
