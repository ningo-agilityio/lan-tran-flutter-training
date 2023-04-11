import 'package:flutter/material.dart';
import 'package:salon_appointment/core/theme/theme.dart';

class SAButton extends StatelessWidget {
  const SAButton({
    required this.child,
    this.onPressed,
    super.key,
  });

  const factory SAButton.floating({
    required Widget child,
    VoidCallback? onPressed,
    double height,
    double width,
  }) = _SAFloatingButton;

  const factory SAButton.text({
    required Widget child,
    VoidCallback? onPressed,
  }) = _SATextButton;

  const factory SAButton.icon({
    required Widget child,
    VoidCallback? onPressed,
  }) = _SAIconButton;

  const factory SAButton.outlined({
    required Widget child,
    VoidCallback? onPressed,
    Size size,
  }) = _SAOutlinedButton;

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}

class _SAOutlinedButton extends SAButton {
  const _SAOutlinedButton({
    required super.child,
    super.onPressed,
    this.size = const Size(311, 44),
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        fixedSize: size,
        side: BorderSide(
          width: 2,
          color: themeData.colorScheme.onPrimary,
        ),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: child,
    );
  }
}

class _SATextButton extends SAButton {
  const _SATextButton({
    required super.child,
    super.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: child,
    );
  }
}

class _SAIconButton extends SAButton {
  const _SAIconButton({
    required super.child,
    super.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: child,
    );
  }
}

class _SAFloatingButton extends SAButton {
  const _SAFloatingButton({
    required super.child,
    super.onPressed,
    this.height = 56,
    this.width = 56,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              themeData.colorScheme.primary,
              themeData.colorScheme.onSurface,
            ],
          ),
          shape: BoxShape.circle,
        ),
        child: child,
      ),
    );
  }
}
