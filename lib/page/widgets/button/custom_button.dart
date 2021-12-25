import 'package:core/page/widgets/button/touchable_opacity.dart';
import 'package:core/res/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared/widget/image/image_widget.dart';
import 'package:shared/widget/shadow/shadow_widget.dart';

enum CUSTOM_BUTTON { rectangle, square, oval, ovalText, colorSetting, color }

class CustomButton extends StatelessWidget {
  final VoidCallback onPress;
  final String? icon;
  final String? title;
  final Color? color;
  final bool enable;
  final bool isSvg;
  final bool isMiniSize;
  final bool margin;
  final CUSTOM_BUTTON type;
  final Function()? onPressEdit;
  final Function()? onPressTrash;

  const CustomButton(
      {Key? key,
      this.type = CUSTOM_BUTTON.oval,
      required this.onPress,
      this.icon,
      this.title,
      this.color,
      this.onPressEdit,
      this.onPressTrash,
      this.isMiniSize = true,
      this.margin = false,
      this.enable = false,
      this.isSvg = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      child: container(),
      onPressed: onPress,
    );
  }

  Widget container() {
    switch (type) {
      case CUSTOM_BUTTON.colorSetting:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SizedBox(
            width: 80.w,
            height: 100.w,
            child: Column(
              children: [
                Row(
                  children: [
                    SimpleShadow(
                      child: Container(
                        width: isMiniSize ? 38.w: 52.w,
                        height: isMiniSize ? 38.w : 52.w,
                        decoration: styleButton(type, color),
                      ),
                    ),
                    buildWidgetColumnEdit(onPressEdit, onPressTrash),
                  ],
                ),
                SizedBox(height: 10.w),
                buildWidgetText(false)
              ],
            ),
          ),
        );
      case CUSTOM_BUTTON.color:
        return Column(
          children: [
            SimpleShadow(
              child: Container(
                width: (!enable && isMiniSize) ? 52.w : (enable && isMiniSize ? 65.w : 75.w),
                height: (!enable && isMiniSize) ? 52.w : (enable && isMiniSize ? 65.w : 75.w),
                decoration: styleButton(type, color),
              ),
            ),
            SizedBox(height: 10.h),
            buildWidgetText(false),
          ],
        );
      case CUSTOM_BUTTON.rectangle:
        return SimpleShadow(
          child: Container(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 7.w, bottom: 7.w),
            decoration: styleButton(type, enable ? primaryColor : null),
            child: buildWidgetText(true),
          ),
        );
      case CUSTOM_BUTTON.ovalText:
        return Column(
          children: [
            SimpleShadow(
              child: Container(
                width: isSvg ? 52.w : (enable ? 90.w : 75.w),
                height: isSvg || isMiniSize ? 52.w : (enable ? 90.w : 75.w),
                decoration: styleButton(type, (enable && isSvg) ? primaryColor : null),
                margin: EdgeInsets.symmetric(horizontal: margin ? 10.w : 0),
                child: Center(
                  child: icon != null
                      ? (isSvg
                          ? SvgPicture.asset(
                              icon!,
                              height: 34.w,
                              width: 34.w,
                            )
                          : CircleNetworkImage(url: icon, backgroundColor: (enable && isSvg) ? primaryColor : null, size: isMiniSize ? 50.w : 70.w))
                      : const SizedBox.shrink(),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            buildWidgetText(false),
          ],
        );
      default:
        return SimpleShadow(
          child: Container(
            width: isMiniSize ? 40.w : 52.w,
            height: isMiniSize ? 40.w : 52.w,
            decoration: styleButton(type, enable ? primaryColor : color),
            margin: EdgeInsets.symmetric(horizontal: margin ? 20.w : 0),
            child: Center(
              child: icon != null ? SvgPicture.asset(icon!) : buildWidgetText(true),
            ),
          ),
        );
    }
  }

  buildWidgetColumnEdit(Function()? onPressEdit, Function()? onPressTrash) => Container(
        width: 24.w,
        height: 50.w,
        padding: EdgeInsets.only(left: 10.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              child: SvgPicture.asset(
                DPath.itemIcEdit,
                width: 20.w,
                height: 20.w,
              ),
              onTap: onPressEdit,
            ),
            SizedBox(height: 10.w),
            InkWell(
              child: SvgPicture.asset(
                DPath.itemIcTrash,
                width: 20.w,
                height: 20.w,
              ),
              onTap: onPressTrash,
            ),
          ],
        ),
      );

  buildWidgetText(bool isTextBig) => title != null
      ? Text(
          title ?? "",
          style: isTextBig
              ? (enable ? text16.medium.textWhiteColor : text16.medium.textBrownColor)
              : (((enable && type != CUSTOM_BUTTON.color) && (enable && type != CUSTOM_BUTTON.ovalText)) ? text12.textWhiteColor : text12.textGreyColor),
          textAlign: TextAlign.center,
          maxLines: 2,
        )
      : const SizedBox.shrink();

  Decoration styleButton(CUSTOM_BUTTON type, Color? color) {
    switch (type) {
      case CUSTOM_BUTTON.rectangle:
        return BoxDecoration(
          color: (color ?? whiteColor),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(18.r),
        );
      case CUSTOM_BUTTON.square:
        return BoxDecoration(
          color: (color ?? whiteColor),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.r),
        );
      default:
        return BoxDecoration(
          color: (color ?? whiteColor),
          shape: BoxShape.circle,
        );
    }
  }
}
