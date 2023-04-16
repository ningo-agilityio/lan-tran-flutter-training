import 'package:flutter/material.dart';

class SAIcons extends StatelessWidget {
  const SAIcons({
    required this.icon,
    this.size,
    this.color,
    super.key,
  });

  final IconData icon;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Icon(
      icon,
      size: size ?? 24,
      color: color ?? colorScheme.secondaryContainer,
    );
  }
}
