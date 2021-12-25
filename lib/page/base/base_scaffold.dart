import 'package:core/res/style.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Color? background;
  final Color? backgroundChild;
  final bool isPaddingDefault;
  final EdgeInsetsGeometry? marginCustom;
  final EdgeInsetsGeometry? paddingCustom;
  final bool resizeToAvoidBottomInset;
  final PreferredSizeWidget? appbar;

  const BaseScaffold(
      {Key? key,
      required this.body,
      this.bottomSheet,
      this.bottomNavigationBar,
      this.floatingActionButton,
      this.background,
      this.backgroundChild,
      this.paddingCustom,
      this.marginCustom,
      this.isPaddingDefault = true,
      this.resizeToAvoidBottomInset = false,
      this.appbar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: backgroundColor,
      body: SafeArea(
        top: true,
        bottom: true,
        child: isPaddingDefault
            ? Container(
                color: whiteColor,
                margin: marginCustom,
                padding: paddingCustom ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.w),
                child: body,
              )
            : body,
      ),
      bottomSheet: bottomSheet,
      bottomNavigationBar: bottomNavigationBar,
      appBar: appbar,
      floatingActionButton: floatingActionButton,
    );
  }
}
