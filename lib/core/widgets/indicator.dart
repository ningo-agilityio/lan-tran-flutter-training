import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
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
