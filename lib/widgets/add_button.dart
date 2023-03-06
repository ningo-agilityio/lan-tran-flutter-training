import 'package:flutter/material.dart';
import 'common/buttons.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.onPress,
  });

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SAButton.floating(
      onPress: onPress,
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 30.0,
      ),
    );
  }
}
