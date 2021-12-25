import 'package:flutter/material.dart';
import 'package:shared/res/style_core.dart';

class DividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 0.1,
      thickness: 5,
      color: dividerColor,
    );
  }
}