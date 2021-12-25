import 'package:flutter/material.dart';

class HomeTopClipper extends CustomClipper<Path> {
  final double width;
  final double height;

  HomeTopClipper({required this.width, required this.height});

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(width, 0.0)
      ..lineTo(0.0, height)
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(HomeTopClipper oldClipper) => false;
}
