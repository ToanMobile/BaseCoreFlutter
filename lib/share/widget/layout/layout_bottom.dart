import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/style.dart';
import '../../../ui/widgets/bottom/layout_bottom.dart';
import '../icon/icons_component.dart';

class LayoutMenuBottom extends StatelessWidget {
  final Widget childRight;
  final VoidCallback? onPressCenter;
  final VoidCallback onPressRight;
  final VoidCallback? onPressLeft;
  final bool? isSkip;

  const LayoutMenuBottom({required this.childRight, required this.onPressRight, this.onPressLeft, this.onPressCenter, this.isSkip = false});

  @override
  Widget build(BuildContext context) {
    return LayoutBottom(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            child: buildRowImageTextIcon(Assets.svg.iconArrowLeft.svg(), LocalString.back),
            onPressed: onPressLeft ?? () => Get.back(),
          ),
          isSkip == true
              ? TextButton(
                  child: Text(LocalString.skip, style: text16.bold.textWhiteColor),
                  onPressed: onPressCenter,
                )
              : const SizedBox.shrink(),
          TextButton(
            child: childRight,
            onPressed: onPressRight,
          ),
        ],
      ),
    );
  }
}
