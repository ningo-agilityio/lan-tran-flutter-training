import 'package:flutter/material.dart';

class SAIndicator extends StatelessWidget {
  const SAIndicator({
    this.height,
    super.key,
  });

  final double? height;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: height,
      child: Center(
        child: CircularProgressIndicator(
          color: colorScheme.onSurface,
        ),
      ),
    );
  }
}

class LoadingIndicator {
  bool isLoading = false;
  void show({
    required BuildContext context,
    double? height,
  }) {
    if (isLoading) {
      return;
    }
    isLoading = true;
    showDialog(
      context: context,
      barrierColor: Theme.of(context).colorScheme.onBackground,
      builder: (context) => SAIndicator(
        height: height,
      ),
    );
  }

  void hide(BuildContext context) {
    if (!isLoading) {
      return;
    }
    isLoading = false;
    Navigator.of(context).pop();
  }
}

LoadingIndicator loadingIndicator = LoadingIndicator();
