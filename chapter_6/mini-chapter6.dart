

void main(List<String> args) {

  // class Password
  final password = Password('12345678');
  print(password.toJson()); // {"password": "12345678"}
  print(password.toString()); // Password: 12345678
  print(password.isValid()); // false
  
}

// class Password
class Password {
  final String value; // final variable

  const Password(this.value); // constructor

  // function: check length of value is greater than 8 or not
  bool isValid() {
    if (value.length > 8) {
      return true;
    }
    return false;
  } // return true if length of value greater than 8

  String toJson() {
    return '{"password": "$value"}';
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Password: $value';
  }
}
