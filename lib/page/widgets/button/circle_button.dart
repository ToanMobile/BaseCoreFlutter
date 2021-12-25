import 'package:core/res/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircleButton extends StatelessWidget {
  final VoidCallback onPress;
  final String icon;
  final bool enable;

  const CircleButton({Key? key, required this.onPress, required this.icon, this.enable = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: SvgPicture.asset(
        icon,
        color: enable ? whiteColor : primaryColor,
      ),
      onPressed: onPress,
      style: ElevatedButton.styleFrom(shape: const CircleBorder(), primary: enable ? primaryColor : whiteColor, elevation: 10, minimumSize: Size(46.w, 46.w)),
    );
  }
}
