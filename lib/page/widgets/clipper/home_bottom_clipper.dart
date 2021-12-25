import 'package:flutter/material.dart';

class HomeBottomClipper extends CustomClipper<Path> {
  final double width;
  final double height;

  HomeBottomClipper({required this.width, required this.height});

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(size.width, 0.0)
      ..lineTo(size.width, size.height - width)
      ..lineTo(size.width - height, size.height)
      ..lineTo(0.0, size.height)
      ..lineTo(0.0, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(HomeBottomClipper oldClipper) => false;
}
