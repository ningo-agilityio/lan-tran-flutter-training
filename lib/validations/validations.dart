import 'package:flutter/material.dart';
import 'package:salon_appointment/models/user.dart';

class Validations {
  static String? isValidPhoneNumber(String? phoneNumber) {
    if (phoneNumber == '') {
      return 'Phone number is blank.';
    } else if (phoneNumber!.length != 10) {
      return 'Phone number is invalid.';
    }
    return null;
  }

  static String? isValidPassword(String? password) {
    if (password == '') {
      return 'Password is blank.';
    } else if (password!.length < 6) {
      return 'Password must be at least 6 characters.';
    }
    return null;
  }

  static String? isLoginSuccess(
    List<User> users,
    String? phoneNumber,
    String? password,
  ) {
    if (isValidPassword(password) != null ||
        isValidPhoneNumber(phoneNumber) != null) {
      return 'Phone number or Password is invalid.';
    }

    for (var user in users) {
      if (phoneNumber == user.phoneNumber && password == user.password) {
        return null;
      }
    }
    return 'Phone number or password is incorrect.';
  }
}
