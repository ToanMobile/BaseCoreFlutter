import 'package:flutter/material.dart';

import '../../res/style.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Color? background;
  final Color? backgroundChild;
  final bool isPaddingDefault;
  final bool isLandscape;
  final EdgeInsetsGeometry? marginCustom;
  final EdgeInsetsGeometry? paddingCustom;
  final bool resizeToAvoidBottomInset;
  final PreferredSizeWidget? appbar;

  const BaseScaffold({
    Key? key,
    required this.body,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.background,
    this.backgroundChild,
    this.paddingCustom,
    this.marginCustom,
    this.isPaddingDefault = true,
    this.isLandscape = false,
    this.resizeToAvoidBottomInset = false,
    this.appbar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: backgroundColor,
      body: isPaddingDefault
          ? Container(
              color: backgroundColor,
              margin: marginCustom,
              padding: paddingCustom ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: body,
            )
          : body,
      bottomSheet: bottomSheet,
      bottomNavigationBar: bottomNavigationBar,
      appBar: appbar,
      floatingActionButton: floatingActionButton,
    );
  }
}
