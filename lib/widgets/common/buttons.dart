import 'package:flutter/material.dart';

class SAButton extends StatelessWidget {
  const SAButton({
    super.key,
    required this.onPress,
    this.child,
  });

  final Widget? child;
  final VoidCallback onPress;

  const factory SAButton.outlined({
    required VoidCallback onPress,
    required Widget? child,
  }) = _SAOutlinedButton;

  const factory SAButton.icon({
    required VoidCallback onPress,
    required Icon icon,
  }) = _SAIconButton;

  const factory SAButton.text({
    required VoidCallback onPress,
    required Widget? child,
  }) = _SATextButton;

  const factory SAButton.floating({
    required VoidCallback onPress,
    required Widget? child,
  }) = _SAFloatingButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}

class _SAOutlinedButton extends SAButton {
  const _SAOutlinedButton({
    required super.onPress,
    required super.child,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPress,
      style: OutlinedButton.styleFrom(
        fixedSize: const Size(311, 44),
        side: const BorderSide(
          width: 2,
          color: Color(0xFFFFFFFF),
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

class _SAIconButton extends SAButton {
  const _SAIconButton({
    required super.onPress,
    required this.icon,
  });

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      color: Color(0xFFBFC8DC),
      iconSize: 24,
      onPressed: onPress,
    );
  }
}

class _SATextButton extends SAButton {
  const _SATextButton({
    required super.onPress,
    required super.child,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: child!,
    );
  }
}

class _SAFloatingButton extends SAButton {
  const _SAFloatingButton({
    required super.onPress,
    required super.child,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPress,
      child: Container(
        height: 56.0,
        width: 56.0,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF553BA3),
              Color(0xFF8A39BF),
            ],
          ),
          shape: BoxShape.circle,
        ),
        child: child,
      ),
    );
  }
}
