import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';

class ServicesPicker extends StatelessWidget {
  ServicesPicker({super.key, required this.services});

  List<String> services;

  List<String> selectedServices = [];

  @override
  Widget build(BuildContext context) {
    return DropDownMultiSelect(
      options: services,
      selectedValues: selectedServices,
      onChanged: (value) {},
    );
    ;
  }
}
