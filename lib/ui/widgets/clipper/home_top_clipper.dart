import 'package:flutter/material.dart';

class HomeTopClipper extends CustomClipper<Path> {
  final double sizeCustom;

  HomeTopClipper({required this.sizeCustom});

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(sizeCustom, 0.0)
      ..lineTo(0.0, sizeCustom)
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(HomeTopClipper oldClipper) => false;
}
