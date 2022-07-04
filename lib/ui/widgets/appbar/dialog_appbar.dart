import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/style.dart';
import '../../../ui/widgets/button/touchable_opacity.dart';

class DialogAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Color? background;
  final String? title;
  final TextStyle? style;
  final double? height;
  final Color? iconColor;

  DialogAppbar({this.title, this.style, this.background, this.height, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          TouchableOpacity(
            child: Assets.images.noImage.image(),
            onPressed: () => Get.back(),
          ),
          SizedBox(
            width: 20.w,
          )
        ],
        title: Text(
          title ?? "",
          style: style ?? text18.bold.textPrimaryColor,
        ),
        backgroundColor: background ?? transparentColor,
        elevation: 0,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight((height ?? 58).w);
}
