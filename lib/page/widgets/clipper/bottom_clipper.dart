import 'package:flutter/material.dart';

class BottomClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(size.width, 0.0)
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(BottomClipper oldClipper) => false;
}
