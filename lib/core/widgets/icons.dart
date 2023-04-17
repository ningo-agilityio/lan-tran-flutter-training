import 'package:flutter/material.dart';

class SAIcons extends StatelessWidget {
  const SAIcons({
    required this.icon,
    this.color,
    this.size,
    super.key,
  });

  final IconData icon;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Icon(
      icon,
      color: color ?? colorScheme.secondaryContainer,
      size: size ?? 24,
    );
  }
}
