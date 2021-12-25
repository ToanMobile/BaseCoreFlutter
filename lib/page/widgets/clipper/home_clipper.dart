import 'package:flutter/material.dart';

class HomeClipper extends CustomClipper<Path> {
  final double width;
  final double height;

  HomeClipper({required this.width, required this.height});

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(width, 0.0)
      ..lineTo(0.0, height)
      ..lineTo(0.0, size.height)
      ..lineTo(size.width - height, size.height)
      ..lineTo(size.width, size.height - width)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(HomeClipper oldClipper) => false;
}
