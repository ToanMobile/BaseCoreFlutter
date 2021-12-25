import 'package:core/page/widgets/button/touchable_opacity.dart';
import 'package:core/page/widgets/clipper/home_clipper.dart';
import 'package:core/res/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared/widget/shadow/shadow_widget.dart';

class CustomInput extends StatefulWidget {
  final String hint;
  final TextStyle hintTextStyle;
  final TextStyle textTextStyle;
  final VoidCallback? onPressClick;
  final Function(String)? onTextChanged;
  final Function(String)? onFieldSubmitted;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final bool? enabled;
  final bool obscureText;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final String icon;
  final String? Function(String?)? validator;

  const CustomInput({
    required this.hint,
    required this.hintTextStyle,
    required this.textTextStyle,
    required this.icon,
    this.onPressClick,
    this.onTextChanged,
    this.onFieldSubmitted,
    this.textEditingController,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.focusNode,
    this.nextFocusNode,
    this.enabled = true,
    this.obscureText = false,
    this.validator,
  });

  @override
  State<StatefulWidget> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  var isClearText = false;
  var isShowPassword = false;
  var hasError = false;

  @override
  void initState() {
    isShowPassword = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      child: ClipPath(
        clipper: HomeClipper(width: 25.w, height: 25.w),
        child: Container(
          color: widget.enabled == true ? whiteColor : disableColor,
          width: screenWidth,
          height: 55.w,
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: widget.onPressClick != null
              ? TouchableOpacity(
                  child: Row(
                    children: [
                      buildWidgetIconLeft(),
                      Expanded(
                        child: AbsorbPointer(
                          child: buildWidgetEditText(),
                        ),
                      ),
                      buildIconRight(),
                    ],
                  ),
                  onPressed: widget.onPressClick,
                )
              : Row(
                  children: [
                    buildWidgetIconLeft(),
                    Expanded(
                      child: buildWidgetEditText(),
                    ),
                    buildIconRight()
                  ],
                ),
        ),
      ),
    );
  }

  buildWidgetIconLeft() => SvgPicture.asset(
        widget.icon,
        width: 36.w,
        height: 36.w,
      );

  buildWidgetEditText() => TextFormField(
        enabled: widget.enabled!,
        controller: widget.textEditingController,
        keyboardType: widget.keyboardType,
        style: widget.textTextStyle,
        maxLines: 1,
        obscureText: widget.obscureText ? isShowPassword : false,
        decoration: InputDecoration(
          counterText: "",
          isDense: true,
          filled: true,
          hintStyle: widget.hintTextStyle,
          hintText: widget.hint,
          border: InputBorder.none,
          fillColor: transparentColor,
          errorStyle: const TextStyle(height: 0),
        ),
        textAlign: TextAlign.start,
        onChanged: (text) {
          if (widget.onTextChanged != null) widget.onTextChanged!(text);
          onShowClearText(text);
        },
        onFieldSubmitted: (value) {
          if (widget.textInputAction == TextInputAction.next) {
            widget.nextFocusNode?.requestFocus();
          }
          widget.onFieldSubmitted?.call(value);
        },
        validator: (value) {
          final errorText = widget.validator?.call(value);
          hasError = errorText == null;
          return errorText;
        },
        focusNode: widget.focusNode,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      );

  buildIconRight() => Row(
        children: [
          if (widget.obscureText)
            TouchableOpacity(
              onPressed: () {
                setState(() {
                  isShowPassword = !isShowPassword;
                });
              },
              child: SvgPicture.asset(
                isShowPassword ? DPath.loginIcVisible : DPath.loginIcInvisible,
                width: 15.w,
                height: 15.w,
              ),
            ),
          if (isClearText)
            TouchableOpacity(
              child: Image.asset(
                DPath.imagesImgTextClose,
                width: 20.w,
                height: 20.w,
              ),
              onPressed: () {
                widget.textEditingController?.text = "";
                if (widget.onTextChanged != null) widget.onTextChanged!("");
                onShowClearText("");
              },
            ),
        ],
      );

  onShowClearText(String text) {
    setState(() {
      isClearText = text != "" ? true : false;
    });
  }
}
