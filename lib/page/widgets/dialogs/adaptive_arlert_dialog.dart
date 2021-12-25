import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveAlertDialog extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final List<Widget> actions;

  const AdaptiveAlertDialog({
    Key? key,
    this.title,
    this.content,
    this.actions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? AlertDialog(
            title: title,
            content: content,
            actions: actions,
          )
        : CupertinoAlertDialog(
            title: title,
            content: content,
            actions: actions,
          );
  }
}
