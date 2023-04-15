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
    return Icon(
      icon,
      color: color ?? Theme.of(context).colorScheme.secondaryContainer,
      size: size ?? 24,
    );
  }
}
