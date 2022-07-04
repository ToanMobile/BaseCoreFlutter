import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../res/style.dart';

final loadWidget = Center(
  child: SizedBox.fromSize(
    size: const Size.square(30),
    child: (Platform.isIOS || Platform.isMacOS) ? const CupertinoActivityIndicator() : const CircularProgressIndicator(),
  ),
);

Widget itemLoading(double size) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[200]!,
    child: Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: primaryColor,
        shape: BoxShape.rectangle,
      ),
    ),
  );
}
