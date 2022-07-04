import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutChild extends StatelessWidget {
  final Widget? child;
  final double? height;
  final Alignment? alignment;

  const LayoutChild({required this.child, this.height, this.alignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 54,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: alignment ?? Alignment.centerLeft,
        child: child,
      ),
    );
  }
}
