import 'package:flutter/material.dart';

import '../../res/style.dart';

class DividerWidget extends StatelessWidget {
  final bool isThin;
  final bool isMargin;
  final bool isMarginEnd;

  const DividerWidget({this.isThin = false, this.isMargin = false, this.isMarginEnd = false});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: isThin ? 1 : 5,
      color: borderColor,
      indent: isMarginEnd ? 0 : (isMargin ? 20 : 0),
      endIndent: isMarginEnd ? (isMargin ? 20 : 0) : 0,
    );
  }
}
