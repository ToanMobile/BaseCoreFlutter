import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../gen/colors.gen.dart';
import '../../../res/style.dart';
import '../../../share/widget/shadow/shadow_widget.dart';

enum BORDER_RADIUS { ALL, TOP, BOTTOM, NONE }

class LayoutShadow extends StatelessWidget {
  final double? width;
  final double? height;
  final BORDER_RADIUS? radius;
  final Widget? child;
  final Color? colorLeft;
  final bool? isOverlay;

  const LayoutShadow({this.width, this.height, required this.child, this.radius = BORDER_RADIUS.NONE, this.colorLeft, this.isOverlay = false});

  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 110.h,
        decoration: BoxDecoration(
          borderRadius: buildBorder(),
          color: whiteColor,
        ),
        child: colorLeft == null
            ? Center(child: child)
            : Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(100), bottomLeft: Radius.circular(100)),
                      color: colorLeft ?? ColorName.yellowColor,
                    ),
                    width: 5,
                  ),
                  child!,
                  isOverlay == true ? Container(color: whiteColor.withOpacity(0.4)) : const SizedBox.shrink(),
                ],
              ),
      ),
    );
  }

  buildBorder() {
    switch (radius) {
      case BORDER_RADIUS.ALL:
        return BorderRadius.circular(8);
      case BORDER_RADIUS.TOP:
        return const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8));
      case BORDER_RADIUS.BOTTOM:
        return const BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8));
      case BORDER_RADIUS.NONE:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(8);
    }
  }
}
