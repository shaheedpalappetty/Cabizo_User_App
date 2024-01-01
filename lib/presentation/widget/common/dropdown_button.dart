import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton(
      {super.key, required this.item, required this.onChanged});
  final List<String> item;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 15),
      child: DropdownButton<String>(
          isDense: true,
          icon: const Icon(Icons.arrow_drop_down),
          items: item.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged),
    );
  }
}
