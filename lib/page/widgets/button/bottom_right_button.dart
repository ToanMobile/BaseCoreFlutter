import 'package:core/page/widgets/button/touchable_opacity.dart';
import 'package:core/page/widgets/clipper/bottom_clipper.dart';
import 'package:core/res/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared/widget/shadow/shadow_widget.dart';

class BottomRightButton extends StatelessWidget {
  final VoidCallback onPress;
  final String? pathIcon;
  final Icon? icon;
  final bool enable;

  const BottomRightButton({Key? key, required this.onPress, this.pathIcon, this.icon, this.enable = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      child: TouchableOpacity(
        onPressed: onPress, //buildBottomSheet(),
        child: ClipPath(
          clipper: BottomClipper(),
          child: Container(
            width: 90.w,
            height: 90.w,
            color: primaryColor,
            padding: EdgeInsets.only(left: 40.w, top: 40.w),
            child: pathIcon != null ? SvgPicture.asset(pathIcon!, width: 16.w, height: 16.w) : icon,
          ),
        ),
      ),
    );
  }
}
