import 'package:flutter/material.dart';

import '../theme/theme.dart';

class CustomSnackBar {
  static void show({
    required BuildContext context,
    required String message,
  }) {
    final snackBar = SnackBar(
      elevation: 5,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1),
      backgroundColor: themeData.colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Text(message),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
