class Bob {
  // Put your code here
  String response(String question) {
    bool inCapital(String question) =>
        RegExp(r"([a-z]+)|(\d$)|([a-z]$)|([^A-Z]\?$)")
            .allMatches(question)
            .length ==
        0;
    String formattedQuestion = question.trim();
    if (formattedQuestion.isEmpty) {
      return 'Fine. Be that way!';
    }
    if (formattedQuestion.endsWith('?') && inCapital(formattedQuestion)) {
      return 'Calm down, I know what I\'m doing!';
    }
    if (inCapital(formattedQuestion)) {
      return 'Whoa, chill out!';
    }
    if (formattedQuestion.endsWith('?')) {
      return 'Sure.';
    }
    return 'Whatever.';
  }
}
