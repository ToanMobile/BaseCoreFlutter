import 'package:flutter/material.dart';

class HomeTopBottomClipper extends CustomClipper<Path> {
  final double sizeTop;
  final double sizeBottom;

  HomeTopBottomClipper({required this.sizeTop, required this.sizeBottom});

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(sizeTop, 0.0)
      ..lineTo(0.0, sizeTop)
      ..lineTo(0.0, size.height)
      ..lineTo(size.width - sizeBottom, size.height)
      ..lineTo(size.width, size.height - sizeBottom)
      ..lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(HomeTopBottomClipper oldClipper) => false;
}
