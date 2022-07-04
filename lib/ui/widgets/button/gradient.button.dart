import 'package:flutter/material.dart';

import 'base.button.dart';

class GradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final double borderWidth;
  final double borderRadius;

  const GradientButton({
    Key? key,
    required this.child,
    required this.gradient,
    this.onPressed,
    this.padding,
    this.borderWidth = 1,
    this.borderRadius = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: gradient,
      ),
      child: BaseButton(
        onPressed: onPressed,
        child: child,
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(padding!),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
      ),
    );
  }
}
