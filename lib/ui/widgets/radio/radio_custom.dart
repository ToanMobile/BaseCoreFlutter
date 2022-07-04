import 'package:flutter/material.dart';

import '../../../res/style.dart';

class RadioCustom extends StatelessWidget {
  final String value;
  final String title;
  final String groupValue;
  final Function(String?) changeValue;

  const RadioCustom({required this.value, required this.title, required this.groupValue, required this.changeValue});

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: Text(title),
      value: value,
      groupValue: groupValue,
      onChanged: changeValue,
      activeColor: primaryColor,
    );
  }
}
