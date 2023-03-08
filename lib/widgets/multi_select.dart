import 'package:flutter/material.dart';
import 'package:salon_appointment/theme/theme.dart';

class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  final List<String> _selectedItems = [];

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Services'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map(
                (item) => CheckboxListTile(
                  activeColor: SATheme.lightTheme.colorScheme.primary,
                  value: _selectedItems.contains(item),
                  title: Text(item),
                  controlAffinity: ListTileControlAffinity.trailing,
                  onChanged: (isChecked) => _itemChange(item, isChecked!),
                ),
              )
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: Text(
            'Submit',
            style: TextStyle(
              color: SATheme.lightTheme.colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
