import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../res/style.dart';

class LayoutBottom extends StatelessWidget {
  final double? height;
  final Widget? child;

  const LayoutBottom({this.height, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 84,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
        color: primaryColor,
      ),
      child: child,
    );
  }
}
