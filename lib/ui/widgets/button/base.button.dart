import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final bool? isOutLine;
  final bool isLoading;

  const BaseButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.style,
    this.isOutLine = false,
    this.isLoading = false,
  }) : super(key: key);

  ButtonStyle get buttonStyle => ButtonStyle(
        padding: style?.padding,
        backgroundColor: style?.backgroundColor,
        elevation: style?.elevation,
        shape: style?.shape,
        textStyle: style?.textStyle,
      );

  @override
  Widget build(BuildContext context) {
    return isOutLine == true
        ? OutlinedButton(
            clipBehavior: Clip.none,
            autofocus: false,
            onPressed: onPressed,
            child: Center(
              child: isLoading ? buildWidgetProgress() : child,
            ),
            style: style ?? buttonStyle,
          )
        : ElevatedButton(
            clipBehavior: Clip.none,
            autofocus: false,
            onPressed: onPressed,
            child: Center(
              child: isLoading ? buildWidgetProgress() : child,
            ),
            style: style ?? buttonStyle,
          );
  }

  buildWidgetProgress() => Container(
        width: 30,
        height: 30,
        padding: const EdgeInsets.all(2.0),
        child: const CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 3,
        ),
      );
}
