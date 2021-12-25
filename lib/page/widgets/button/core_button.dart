import 'package:core/page/widgets/button/touchable_opacity.dart';
import 'package:core/page/widgets/clipper/home_clipper.dart';
import 'package:core/res/style.dart';
import 'package:flutter/material.dart';
import 'package:shared/widget/shadow/shadow_widget.dart';

class VestiumsButton extends StatelessWidget {
  final Function()? onPress;
  final String text;
  final Color? color;
  final TextStyle? textStyle;
  final bool enable;
  final bool isLoading;
  final double? width;

  const VestiumsButton({Key? key, this.onPress, required this.text, this.color, this.textStyle, this.width, this.enable = true, this.isLoading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onPressed: !enable ? null : onPress,
      child: SimpleShadow(
        child: ClipPath(
          clipper: HomeClipper(width: 25.w, height: 25.w),
          child: Container(
            height: 50.w,
            color: enable? primaryColor: disableColor,
            width: width ?? screenWidth,
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            alignment: Alignment.center,
            child: isLoading
                ? Container(
                    width: 24.w,
                    height: 24.w,
                    padding: const EdgeInsets.all(2.0),
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,
                    ),
                  )
                : Text(
                    text,
                    style: textStyle ?? Theme.of(context).textTheme.button!.copyWith(color: Colors.white),
                  ),
          ),
        ),
      ),
    );
  }
}
