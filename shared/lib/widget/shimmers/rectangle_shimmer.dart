import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/res/style_core.dart';
import 'package:shimmer/shimmer.dart';

class RectangleShimmer extends StatelessWidget {
  final double width;
  final double height;
  final double? radius;

  RectangleShimmer({required this.width, required this.height, this.radius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 0),
      child: Shimmer.fromColors(
        baseColor: getColor().colorShimmer.withOpacity(0.06),
        highlightColor: getColor().colorShimmer.withOpacity(0.04),
        child: Container(
          width: width,
          height: height,
          color: getColor().themeGrayColor,
        ),
      ),
    );
  }
}
