import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_pages.dart';
import '../../../data/storage/key_constant.dart';
import '../../../res/style.dart';
import '../../../share/util/common_utils.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Color? color;
  final String? title;
  final TextStyle? style;
  final String? leading;
  final Color? leadingColor;
  final List<Widget>? actions;
  final double? height;
  final bool isMargin;
  final VoidCallback? onPressBack;
  final PreferredSizeWidget? tabBar;

  const DefaultAppbar({this.leading, this.title, this.style, this.color, this.actions, this.height, this.leadingColor, this.isMargin = false, this.onPressBack, this.tabBar});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Padding(
        padding: isMargin ? const EdgeInsets.only(left: 10, right: 10, top: 10) : const EdgeInsets.all(0),
        child: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: actions,
          leading: leading != null
              ? IconButton(
                  icon: Image.asset(
                    leading!,
                    fit: BoxFit.cover,
                    color: leadingColor,
                    width: 36.w,
                    height: 36.w,
                    filterQuality: FilterQuality.high,
                  ),
                  onPressed: onPressBack ?? actionBack,
                )
              : IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: whiteColor,
                    size: 30,
                  ),
                  onPressed: onPressBack ?? actionBack,
                ),
          title: Text(
            title ?? "",
            style: style ?? text18.bold.textBrownColor,
          ),
          backgroundColor: color ?? transparentColor,
          elevation: 0,
          bottom: tabBar,
        ),
      ),
    );
  }

  Future<void> actionBack() {
    if (isDetailsFromEstimation) {
      Get.back();
    } else {
      isCameraCapture = false;
      orientation();
      Get.offAllNamed(AppRoutes.HOME);
    }
    isDetailsFromEstimation = false;
    return Future.value(true);
  }

  @override
  Size get preferredSize => Size.fromHeight((height ?? 60.h));
}
