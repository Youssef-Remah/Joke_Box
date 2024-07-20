import 'package:flutter/material.dart';

Widget buildDropDownList({
  required List<String> items,
  required String selectedItem,
  required void Function(String) changeDropDownValue,
  String hintText = '',
})
{
  return DropdownButton<String>(
    value: selectedItem,

    hint: Text(hintText),

    onChanged: (String? newValue)
    {
      if(newValue != null)
      {
        changeDropDownValue(newValue);
      }
    },

    items: items.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
  );
}