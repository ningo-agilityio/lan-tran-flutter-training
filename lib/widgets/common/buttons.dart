import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';

class SAButton extends StatelessWidget {
  const SAButton({
    required this.child,
    this.onPress,
    super.key,
  });

  const factory SAButton.floating({
    required Widget child,
    VoidCallback? onPress,
    double height,
    double width,
  }) = _SAFloatingButton;

  const factory SAButton.text({
    required Widget child,
    VoidCallback? onPress,
  }) = _SATextButton;

  const factory SAButton.icon({
    required Widget child,
    VoidCallback? onPress,
  }) = _SAIconButton;

  const factory SAButton.outlined({
    required Widget child,
    VoidCallback? onPress,
    Size size,
  }) = _SAOutlinedButton;

  final Widget child;
  final VoidCallback? onPress;

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
    super.onPress,
    this.size = const Size(311, 44),
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPress,
      style: OutlinedButton.styleFrom(
        fixedSize: size,
        side: BorderSide(
          width: 2,
          color: lightTheme.colorScheme.secondary,
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
    super.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: child,
    );
  }
}

class _SAIconButton extends SAButton {
  const _SAIconButton({
    required super.child,
    super.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: child,
    );
  }
}

class _SAFloatingButton extends SAButton {
  const _SAFloatingButton({
    required super.child,
    super.onPress,
    this.height = 56,
    this.width = 56,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              lightTheme.colorScheme.primary,
              lightTheme.colorScheme.onPrimary,
            ],
          ),
          shape: BoxShape.circle,
        ),
        child: child,
      ),
    );
  }
}
