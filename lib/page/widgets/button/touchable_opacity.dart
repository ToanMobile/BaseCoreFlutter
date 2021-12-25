import 'package:core/res/style.dart';
import 'package:flutter/material.dart';

class TouchableOpacity extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;

  const TouchableOpacity({
    Key? key,
    required this.child,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: backgroundColor,
      hoverColor: backgroundColor,
      focusColor: backgroundColor,
      onTap: onPressed,
      child: child,
    );
  }
}
