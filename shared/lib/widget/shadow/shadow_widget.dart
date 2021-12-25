library simple_shadow;

import 'dart:ui';

import 'package:flutter/material.dart';

class SimpleShadow extends StatelessWidget {
  final Widget child;
  final double opacity;
  final double sigma;
  final Color color;
  final Offset offset;

  const SimpleShadow({
    required this.child,
    this.opacity = 0.2,
    this.sigma = 0,
    this.color =Colors.black,
    this.offset = const Offset(2, 2),
  });
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Transform.translate(
          offset: offset,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaY: sigma, sigmaX: sigma),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.transparent,
                  width: 0,
                ),
              ),
              child: Opacity(
                opacity: opacity,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(color, BlendMode.srcATop),
                  child: child,
                ),
              ),
            ),
          ),
        ),
        child,
      ],
    );
    /*
    *  Stack(
      children: <Widget>[
        Transform.translate(
          offset: offset,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaY: sigma, sigmaX: sigma),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(color.withOpacity(0.2), BlendMode.srcATop),
              child: child,
            ),
          ),
        ),
        child,
      ],
    );*/
  }
}

