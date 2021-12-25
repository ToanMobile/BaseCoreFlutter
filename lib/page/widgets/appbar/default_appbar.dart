import 'package:core/res/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Color? color;
  final String? title;
  final TextStyle? style;
  final String? leading;
  final Color? leadingColor;
  final List<Widget>? actions;
  final double? height;
  final bool isMargin;
  final VoidCallback? onPress;

  const DefaultAppbar({this.leading, this.title, this.style, this.color, this.actions, this.height, this.leadingColor, this.isMargin = false, this.onPress});

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
                  onPressed: () => onPress ?? Get.back(),
                )
              : IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: brownColor,
                  ),
                  onPressed: () => onPress ?? Get.back()),
          title: Text(
            title ?? "",
            style: style ?? text18.bold.textBrownColor,
          ),
          backgroundColor: color ?? transparentColor,
          elevation: 0,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight((height ?? 58).w);
}
