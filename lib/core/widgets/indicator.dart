import 'package:flutter/material.dart';
import 'package:salon_appointment/core/theme/theme.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    this.height,
    super.key,
  });

  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: CircularProgressIndicator(
          color: themeData.colorScheme.onSurface,
        ),
      ),
    );
  }
}
