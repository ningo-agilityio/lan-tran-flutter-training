import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';

class DropDown extends StatefulWidget {
  final List<String> items;
  const DropDown({Key? key, required this.items}) : super(key: key);

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
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 44,
      width: 311,
      decoration: BoxDecoration(
          color: SATheme.lightTheme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: SATheme.lightTheme.colorScheme.onSecondary,
          )),
      child: DropdownButton<String>(
        hint: Text('Select Services'),
        onChanged: (String? newValue) =>
            setState(() => selectedValue = newValue!),
        items: widget.items
            .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ))
            .toList(),
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        underline: SizedBox(),
        isExpanded: true,
      ),
    );
  }
}
