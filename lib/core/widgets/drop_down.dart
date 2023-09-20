import 'package:flutter/material.dart';

class DropDownMenuComponent extends StatelessWidget {
  final void Function(String? value) onChanged;
  final List<dynamic> items;
  final String hint;
  final String? value;
  const DropDownMenuComponent({
    Key? key,
    required this.onChanged,
    required this.items,
    required this.hint,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
      isExpanded: true,
      elevation: 16,
      dropdownColor: Colors.white,
      style: const TextStyle(
          color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      hint: FittedBox(
        child: Text(
          hint,
          style: const TextStyle(color: Colors.black87),
        ),
      ),
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value!.id!.toString(),
          child: Text(value.name!),
        );
      }).toList(),
    );
  }
}
