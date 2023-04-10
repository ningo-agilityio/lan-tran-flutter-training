import 'package:flutter/material.dart';
import 'package:salon_appointment/core/theme/theme.dart';

class DropDown extends StatelessWidget {
  DropDown({
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    super.key,
  });

  final List<String> items;
  String? selectedValue;
  Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 44,
      width: 345,
      decoration: BoxDecoration(
          color: themeData.colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: themeData.colorScheme.onSecondaryContainer,
          )),
      child: DropdownButton<String>(
        hint: const Text('Select Services'),
        value: selectedValue,
        onChanged: onChanged,
        items: items
            .map<DropdownMenuItem<String>>((value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ))
            .toList(),
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        underline: const SizedBox(),
        isExpanded: true,
      ),
    );
  }
}
