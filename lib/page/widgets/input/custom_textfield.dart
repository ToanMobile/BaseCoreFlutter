import 'package:core/res/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final String? labelText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final int maxLines;
  final ValueNotifier<bool>? validNotifier;
  final int? maxLength;
  final ValueNotifier<String>? stringNotifier;
  final bool isEnable;
  final bool isBlueColor;
  final double? width;
  final double? height;

  const CustomTextField({
    this.focusNode,
    this.nextFocusNode,
    this.labelText,
    this.controller,
    this.validator,
    this.maxLines = 1,
    this.validNotifier,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.maxLength,
    this.stringNotifier,
    this.isEnable = true,
    this.isBlueColor = false,
    this.width,
    this.height,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isValid = false;

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(() {
      if (widget.validator != null && mounted) {
        setState(() {
          isValid = !(widget.validator!(widget.controller?.text)?.isNotEmpty == true);
          if (widget.validNotifier != null) widget.validNotifier!.value = isValid;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width != null ? (widget.width ?? screenWidth) : screenWidth,
      height: widget.height != null ? (widget.height ?? 30.w) : 30.w,
      child: TextFormField(
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        maxLines: widget.maxLines,
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction,
        onFieldSubmitted: (v) {
          widget.focusNode?.unfocus();
          widget.nextFocusNode?.requestFocus();
        },
        onChanged: (value) {
          if (widget.stringNotifier != null) widget.stringNotifier!.value = value;
        },
        style: widget.isEnable ? text16.bold.textGreyColor : text16.bold.textBrownColor,
        maxLength: widget.maxLength,
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: widget.labelText,
          contentPadding: EdgeInsets.fromLTRB(10.w, 0.h, 5.w, 10.h),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: greyBorderColor, width: 1.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: greyBorderColor, width: 1.0),
          ),
        ),
      ),
    );
  }
}
