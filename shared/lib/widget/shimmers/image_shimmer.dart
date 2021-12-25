import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/res/style_core.dart';
import 'package:shimmer/shimmer.dart';

class ImageShimmer extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  ImageShimmer({required this.width, required this.height, this.radius = 0});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Shimmer.fromColors(
        baseColor: getColor().colorShimmer.withOpacity(0.06),
        highlightColor: getColor().colorShimmer.withOpacity(0.04),
        child: SizedBox(
          width: width,
          height: height,
        ),
      ),
    );
  }
}
