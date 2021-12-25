import 'package:core/page/widgets/button/touchable_opacity.dart';
import 'package:core/res/style.dart';
import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final bool enable;

  const TabItem({Key? key, required this.onPress, required this.title, this.enable = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onPressed: onPress,
      child: Container(
        margin: EdgeInsets.only(right: 20.w),
        padding: EdgeInsets.only(
          bottom: 6.w, // space between underline and text
        ),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
            color: enable ? primaryColor : Colors.transparent, // Text colour here
            width: 2.0, // Underline width
          ),
        )),
        child: Text(
          title,
          style: enable ? text14.medium.textPrimaryColor : text14.medium.textBrownColor,
        ),
      ),
    );
  }
}
