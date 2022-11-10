class PhoneNumber {
  // Put your code here
  String clean(String phoneNumber) {
    phoneNumber =
        phoneNumber.replaceAll(RegExp(r"(^\+)|(\-)|(\.)|(\s)|(\()|(\))"), "");
    if (phoneNumber.isEmpty) {
      return '';
    }
    if (phoneNumber.length < 10) {
      throw FormatException("incorrect number of digits");
    }
    if (phoneNumber.length > 11) {
      throw FormatException("more than 11 digits");
    }

    if (phoneNumber.length == 11) {
      if (phoneNumber.startsWith('1')) {
        isValid(phoneNumber.substring(1));
        areaCodeNotStartAt0(phoneNumber.substring(1));
        areaCodeNotStartAt1(phoneNumber.substring(1));
        exchangeCodeNotStartAt0(phoneNumber.substring(1));
        exchangeCodeNotStartAt1(phoneNumber.substring(1));
        return phoneNumber.substring(1);
      } else {
        throw FormatException("11 digits must start with 1");
      }
    }
    isValid(phoneNumber);
    areaCodeNotStartAt0(phoneNumber);
    areaCodeNotStartAt1(phoneNumber);
    exchangeCodeNotStartAt0(phoneNumber);
    exchangeCodeNotStartAt1(phoneNumber);
    return phoneNumber;
  }

  bool isValid(String number) {
    if (RegExp(r"[a-zA-Z]").allMatches(number).length > 0) {
      throw FormatException("letters not permitted");
    } else if (RegExp(r"[\'\,\:\/\!\@\#\$\%\^\&\*\{\}\[\]\;\<\>\`\~\?\_\=\|]")
            .allMatches(number)
            .length >
        0) {
      throw FormatException("punctuations not permitted");
    } else {
      return true;
    }
  }

  bool areaCodeNotStartAt0(String number) {
    return (number.substring(0, 1) != '0')
        ? true
        : throw FormatException("area code cannot start with zero");
  }

  bool areaCodeNotStartAt1(String number) {
    return (number.substring(0, 1) != '1')
        ? true
        : throw FormatException("area code cannot start with one");
  }

  bool exchangeCodeNotStartAt0(String number) {
    return (number.substring(3, 4) != '0')
        ? true
        : throw FormatException("exchange code cannot start with zero");
  }

  bool exchangeCodeNotStartAt1(String number) {
    return (number.substring(3, 4) != '1')
        ? true
        : throw FormatException("exchange code cannot start with one");
  }
}
