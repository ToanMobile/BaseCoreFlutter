import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../res/style.dart';
import '../../../ui/widgets/button/touchable_opacity.dart';

Widget buildRowImageTextIcon(SvgPicture svgPicture, String label, {TextStyle? textStyle, bool? isExpanded}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      svgPicture,
      const Padding(padding: EdgeInsets.all(5)),
      isExpanded == true
          ? Expanded(
              child: Text(
                label,
                style: textStyle ?? text16.textWhiteColor,
                overflow: TextOverflow.ellipsis,
              ),
            )
          : Text(label, style: textStyle ?? text16.textWhiteColor),
    ],
  );
}

Widget buildRowTextImageIcon(SvgPicture svgPicture, String label, {TextStyle? textStyle, MainAxisAlignment? mainAxisAlignment, VoidCallback? onPress, bool? isExpanded}) {
  return Row(
    mainAxisSize: mainAxisAlignment != null ? MainAxisSize.max : MainAxisSize.min,
    mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
    children: <Widget>[
      isExpanded == true
          ? Expanded(
              child: Text(
                label,
                style: textStyle ?? text16.textWhiteColor,
                overflow: TextOverflow.ellipsis,
              ),
            )
          : Text(label, style: textStyle ?? text16.textWhiteColor),
      const Padding(padding: EdgeInsets.all(5)),
      onPress != null ? TouchableOpacity(child: svgPicture, onPressed: onPress) : svgPicture,
    ],
  );
}

Widget buildColumnImageTextIcon(SvgPicture svgPicture, String label, {TextStyle? textStyle}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      svgPicture,
      const Padding(padding: EdgeInsets.all(5)),
      Text(
        label,
        style: textStyle ?? text16.textWhiteColor,
        overflow: TextOverflow.ellipsis,
      ),
    ],
  );
}

Widget buildColumnTextImageIcon(SvgPicture svgPicture, String label, {TextStyle? textStyle}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Text(
        label,
        style: textStyle ?? text16.textWhiteColor,
        overflow: TextOverflow.ellipsis,
      ),
      const Padding(padding: EdgeInsets.all(5)),
      svgPicture,
    ],
  );
}
