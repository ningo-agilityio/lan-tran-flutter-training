import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';

class DropDown extends StatefulWidget {
  const DropDown({
    required this.items,
    super.key,
  });

  final List<String> items;

  @override
  State<StatefulWidget> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 44,
      width: 311,
      decoration: BoxDecoration(
          color: themeData.colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: themeData.colorScheme.onSecondaryContainer,
          )),
      child: DropdownButton<String>(
        hint: const Text('Select Services'),
        onChanged: (newValue) => setState(() => selectedValue = newValue!),
        items: widget.items
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
