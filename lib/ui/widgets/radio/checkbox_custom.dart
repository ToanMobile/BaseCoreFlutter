import 'package:flutter/material.dart';

import '../../../res/style.dart';

class CheckBoxCustom extends StatelessWidget {
  final String title;
  final bool? isSelected;
  final Function(bool?) changeValue;
  final TextStyle? textStyle;

  const CheckBoxCustom({required this.title, required this.isSelected, required this.changeValue, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(title, style: textStyle),
      value: isSelected,
      onChanged: changeValue,
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: primaryColor,
    );
  }
}
